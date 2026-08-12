# Smart Deposit Scope Selection Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the ambiguous Smart Deposit action with explicit current-tab and all-configured-tabs actions whose counts, progress, and reports reflect the selected scope.

**Architecture:** Keep `Depositor.lua` as the source of truth for planned and selected deposit scopes, exposing a small read-only `GetDepositPlanScope(tab)` summary for the UI. Keep layout, copy, enabled states, and click routing in `UI.lua`; both actions continue through the existing `StartDeposit(tab, refreshed)` preflight and confirmation queue. Extend the mocked WoW smoke test to cover the scope data, button dispatch, changing tabs, disabled states, and actual single-tab isolation.

**Tech Stack:** World of Warcraft MoP Classic Lua 5.1 API, code-created WoW frames, Fengari smoke tests, `luaparse`, POSIX shell packaging, ZIP release archive.

## Global Constraints

- `Deposit This Tab` is always the gold primary action and calls `StartDeposit(currentTab())`.
- `Deposit All Tabs` is always a separate secondary action and calls `StartDeposit()`.
- Never save, remember, or infer an all-tabs preference.
- Never redirect a disabled current-tab action to all tabs.
- Keep category routing, profile-conflict rules, deposit cadence, retries, and slash commands unchanged.
- Keep the compact organizer width at `430`; increase height only enough to make both summaries and buttons readable.
- During any mutually exclusive operation, hide the two scope buttons and expose one full-width `Stop` button in the same action row.
- Preserve the existing bank-open, combat, cursor, item-lock, retry, and final-verification safeguards.
- Do not publish to GitHub or CurseForge as part of this plan.

---

### Task 1: Checkpoint the Verified Profession-Catalog Beta

**Files:**
- Verify: `GuildBankOrganizer/Categories.lua`
- Verify: `GuildBankOrganizer/Depositor.lua`
- Verify: `GuildBankOrganizer/GuildBankOrganizer.toc`
- Verify: `GuildBankOrganizer/ProfessionData.lua`
- Verify: `GuildBankOrganizer/UI.lua`
- Verify: `tests/smoke.lua`
- Verify: `scripts/generate_profession_data.py`
- Verify: `README.md`
- Verify: `CHANGELOG.md`
- Verify: `ACKNOWLEDGMENTS.md`
- Verify: `docs/CATEGORY_RULES.md`
- Verify: `docs/PROFESSION_COVERAGE.md`

**Interfaces:**
- Consumes: the user-verified `1.2.0-beta.1` profession categorization currently present as intentional uncommitted work.
- Produces: a clean, tested Git baseline so the scope feature can be reviewed and committed independently.

- [ ] **Step 1: Confirm the dirty worktree contains only the expected beta files**

Run:

```bash
git status --short
git diff --check
git diff --stat
```

Expected: the files listed above are the only intentional addon changes; `.superpowers/` is ignored; no unrelated project directory is staged or modified.

- [ ] **Step 2: Regenerate the profession catalog and verify reproducibility**

Run:

```bash
python3 scripts/generate_profession_data.py
git diff --check
```

Expected: the generator reports 8,576 statically bank-eligible candidates and zero uncovered records, and running it does not introduce an unexplained diff.

- [ ] **Step 3: Run the complete beta validation suite**

Run:

```bash
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: every Lua file parses and the final line is `smoke test passed`.

- [ ] **Step 4: Commit the already-approved beta baseline**

Run:

```bash
git add ACKNOWLEDGMENTS.md CHANGELOG.md README.md \
  GuildBankOrganizer/Categories.lua GuildBankOrganizer/Depositor.lua \
  GuildBankOrganizer/GuildBankOrganizer.toc GuildBankOrganizer/ProfessionData.lua \
  GuildBankOrganizer/UI.lua docs/CATEGORY_RULES.md docs/PROFESSION_COVERAGE.md \
  scripts/generate_profession_data.py tests/smoke.lua
git diff --cached --check
git commit -m "Expand MoP profession item coverage"
```

Expected: only the verified profession-catalog beta is committed; no distribution archive, installed addon, or unrelated directory is included.

---

### Task 2: Make Deposit Planning and Reports Scope-Aware

**Files:**
- Modify: `GuildBankOrganizer/Depositor.lua:640-705`
- Modify: `GuildBankOrganizer/Depositor.lua:1074-1103`
- Modify: `GuildBankOrganizer/Depositor.lua:1220-1274`
- Test: `tests/smoke.lua:814-910`

**Interfaces:**
- Consumes: `depositor.plan`, whose tab entries expose `moves`, `itemCount`, `sourceStacks`, and `skippedItems`.
- Produces: `GBO:GetDepositPlanScope(tab)` returning either `nil` when no plan exists or `{ totalMoves: number, totalItems: number, destinationCount: number }`; an omitted `tab` returns all configured destinations with planned moves.
- Produces: `StartDeposit(tab)` initializes timeline, progress, saved report, and printed totals from only the selected tab; `StartDeposit()` retains complete-plan totals.

- [ ] **Step 1: Add failing scope-summary and single-tab-report assertions**

Create a two-tab plan in the Smart Deposit smoke section: tab 1 accepts Cloth, tab 2 accepts Enchanting, bag slot `0/1` contains 15 Windwool Cloth, and bag slot `0/2` contains 7 Test Dust. Add these assertions after `RefreshDepositPlan()` finishes:

```lua
local tabScope = assert(addon:GetDepositPlanScope(1))
assert(tabScope.totalItems == 15)
assert(tabScope.totalMoves == 2)
assert(tabScope.destinationCount == 1)

local allScope = assert(addon:GetDepositPlanScope())
assert(allScope.totalItems == 22)
assert(allScope.totalMoves == 3)
assert(allScope.destinationCount == 2)

assert(addon:StartDeposit(1))
runTimers()
assert(bags[0][1] == nil)
assert(bags[0][2] and bags[0][2].itemID == 500)
assert(string.find(addon.lastReport, "planned=2", 1, true))
assert(string.find(addon.lastReport, "items=15", 1, true))
```

Reset the mock slots, bags, profiles, bank-tab count, and current tab before the following legacy assertions so the rest of the smoke lifecycle remains deterministic.

- [ ] **Step 2: Run the smoke test and verify the new contract fails**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because `GetDepositPlanScope` is not defined; after that method exists but before selected totals are corrected, the current-tab report assertion must still fail with the all-tabs plan totals.

- [ ] **Step 3: Extract one plan-filtering helper and expose read-only scope totals**

In `Depositor.lua`, add one local helper used by both the public summary method and the active deposit queue:

```lua
local function filterDepositPlan(plan, selectedTabs)
    local filtered = {
        builtAt = plan and plan.builtAt,
        tabs = {},
        order = {},
        totalMoves = 0,
        totalItems = 0,
        totalStacks = 0,
        skippedItems = 0,
    }
    if not plan then
        return filtered
    end
    for _, plannedTab in ipairs(plan.order) do
        if not selectedTabs or selectedTabs[plannedTab] then
            local tabPlan = plan.tabs[plannedTab]
            filtered.tabs[plannedTab] = tabPlan
            table.insert(filtered.order, plannedTab)
            filtered.totalMoves = filtered.totalMoves + tabPlan.moves
            filtered.totalItems = filtered.totalItems + tabPlan.itemCount
            filtered.totalStacks = filtered.totalStacks + tabPlan.sourceStacks
            filtered.skippedItems = filtered.skippedItems + tabPlan.skippedItems
        end
    end
    return filtered
end
```

Expose the UI-facing data without exposing mutable operations:

```lua
function GBO:GetDepositPlanScope(tab)
    local plan = depositor.plan
    if not plan then
        return nil
    end
    local selectedTabs
    if tab then
        selectedTabs = { [tonumber(tab)] = true }
    end
    local scoped = filterDepositPlan(plan, selectedTabs)
    local destinationCount = 0
    for _, plannedTab in ipairs(scoped.order) do
        if scoped.tabs[plannedTab].moves > 0 then
            destinationCount = destinationCount + 1
        end
    end
    return {
        totalMoves = scoped.totalMoves,
        totalItems = scoped.totalItems,
        destinationCount = destinationCount,
    }
end
```

Replace the duplicate filtering body in `selectedPlan()` with `filterDepositPlan(buildDepositPlan(), depositor.selectedTabs)`.

- [ ] **Step 4: Initialize a deposit from the selected scope**

Immediately after constructing `selectedTabs` in `StartDeposit`, derive:

```lua
local scopedPlan = filterDepositPlan(plan, selectedTabs)
```

Use `scopedPlan.totalMoves`, `scopedPlan.totalItems`, and `scopedPlan.skippedItems` for `estimatedTotal`, `estimatedRemaining`, the opening timeline entry, and the printed start message. Do not change how `PlanNextDeposit()` replans after each confirmed move.

- [ ] **Step 5: Run parser and smoke tests**

Run:

```bash
npx --yes luaparse GuildBankOrganizer/Depositor.lua >/dev/null
npx --yes luaparse tests/smoke.lua >/dev/null
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: PASS; the current-tab operation leaves tab 2's bag item untouched and reports exactly two planned deposits for 15 items.

- [ ] **Step 6: Commit the scope-aware depositor**

Run:

```bash
git add GuildBankOrganizer/Depositor.lua tests/smoke.lua
git diff --cached --check
git commit -m "Make Smart Deposit totals scope-aware"
```

---

### Task 3: Add Explicit Scope Actions to the Compact Organizer

**Files:**
- Modify: `GuildBankOrganizer/UI.lua:260-285`
- Modify: `GuildBankOrganizer/UI.lua:460-590`
- Modify: `GuildBankOrganizer/UI.lua:680-750`
- Test: `tests/smoke.lua:700-735`
- Test: `tests/smoke.lua:814-935`

**Interfaces:**
- Consumes: `GBO:GetDepositPlanScope(tab)`, `GBO:StartDeposit(tab)`, `currentTab()`, and the existing `isBusy()`/`stopCurrentOperation()` helpers.
- Produces: `GuildBankOrganizerFrame.DepositCurrentButton`, `.DepositAllButton`, and `.DepositStopButton` for explicit organizer actions and smoke-test visibility.
- Produces: two-line `SmartHint` copy derived from current-tab and all-tabs scope totals.

- [ ] **Step 1: Add failing organizer structure and click-dispatch assertions**

After the organizer first opens in `tests/smoke.lua`, assert the public widget contract:

```lua
local organizer = GuildBankOrganizerFrame
assert(organizer.DepositCurrentButton:GetText() == "Deposit This Tab")
assert(organizer.DepositAllButton:GetText() == "Deposit All Tabs")
assert(not organizer.DepositStopButton:IsShown())
```

After the two-tab plan from Task 2 is ready, temporarily replace only the public method to capture click scope:

```lua
local originalStartDeposit = addon.StartDeposit
local requestedScopes = {}
addon.StartDeposit = function(_, tab)
    table.insert(requestedScopes, tab or "all")
    return true
end
organizer.DepositCurrentButton.scripts.OnClick()
organizer.DepositAllButton.scripts.OnClick()
addon.StartDeposit = originalStartDeposit
assert(requestedScopes[1] == currentGuildBankTab)
assert(requestedScopes[2] == "all")
```

Also assert the exact normal-state summary:

```lua
assert(string.find(organizer.SmartHint:GetText(), "This tab: 15 items in 2 deposits", 1, true))
assert(string.find(organizer.SmartHint:GetText(), "All configured tabs: 22 items in 3 deposits across 2 tabs", 1, true))
```

- [ ] **Step 2: Add failing disabled-state, tab-switch, and busy-state assertions**

Switch `currentGuildBankTab` to a configured tab with zero planned moves, call `addon:RefreshOrganizerUI()`, and assert:

```lua
assert(not organizer.DepositCurrentButton:IsEnabled())
assert(organizer.DepositAllButton:IsEnabled())
assert(string.find(organizer.SmartHint:GetText(), "This tab: No matching items", 1, true))
```

Switch to the tab containing planned moves and assert that the current action enables. Start a deposit without draining timers, refresh the organizer, and assert:

```lua
assert(not organizer.DepositCurrentButton:IsShown())
assert(not organizer.DepositAllButton:IsShown())
assert(organizer.DepositStopButton:IsShown())
```

Run timers, refresh again, and assert the two scope buttons are restored and `DepositStopButton` is hidden. Verify no field is added under `GuildBankOrganizerDB.settings` to remember a deposit scope.

- [ ] **Step 3: Run the smoke test and verify UI assertions fail**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because the three organizer buttons and the two-line scope summary do not exist yet.

- [ ] **Step 4: Replace the ambiguous callback with two explicit callbacks**

Remove `runCompactDepositOrStop`. Add callbacks that resolve the current tab only when clicked:

```lua
local function depositCurrentTab()
    local tab = currentTab()
    if tab then
        GBO:StartDeposit(tab)
    end
end

local function depositAllTabs()
    GBO:StartDeposit()
end
```

The callbacks must not assign a scope to addon settings or module state.

- [ ] **Step 5: Build the scope-summary formatter and organizer state transitions**

Add UI-local pluralization and summary helpers:

```lua
local function formatDepositCount(scope)
    return string.format(
        "%d item%s in %d deposit%s",
        scope.totalItems,
        scope.totalItems == 1 and "" or "s",
        scope.totalMoves,
        scope.totalMoves == 1 and "" or "s"
    )
end

local function formatAllDepositCount(scope)
    return string.format(
        "%s across %d tab%s",
        formatDepositCount(scope),
        scope.destinationCount,
        scope.destinationCount == 1 and "" or "s"
    )
end
```

In `RefreshOrganizerUI()`:

- read `currentScope = tab and self:GetDepositPlanScope(tab)`;
- read `allScope = self:GetDepositPlanScope()`;
- enable the current button only when `tab`, `not busy`, and `currentScope.totalMoves > 0`;
- enable the all button only when `tab`, `not busy`, and `allScope.totalMoves > 0`;
- never substitute one action for the other;
- show the two scope buttons only when `not busy`;
- show the full-width Stop button only when `busy` and enable it so the existing stop routing remains available;
- use `This tab: No matching items` when the current scope is zero;
- use `No matching bag items are ready right now.` when the all-tabs scope is zero;
- retain the existing scanning, active progress, outcome, setup, and footer copy.

- [ ] **Step 6: Rebuild the compact panel without increasing its width**

Change `createOrganizerFrame()` to height `280`. Keep the progress bar at `TOPLEFT, 16, -84`. Make `Sort This Tab` full width (`398`) at `TOPLEFT, 16, -112`. Move the Smart Deposit card below it, give `SmartHint` enough vertical space for two lines, and create:

```lua
frame.DepositCurrentButton = createButton(frame, "Deposit This Tab", 182, 30, depositCurrentTab)
frame.DepositAllButton = createButton(frame, "Deposit All Tabs", 182, 30, depositAllTabs)
frame.DepositStopButton = createButton(frame, "Stop", 372, 30, stopCurrentOperation)
```

Anchor the two scope buttons side-by-side with an 8-pixel gap and anchor the Stop button to the same row. Give `DepositCurrentButton` a persistent gold border and darker gold surface in its normal and hover states; leave `DepositAllButton` in the existing neutral surface style. Hide `DepositStopButton` initially. Keep `Set Up`/`Edit`, Settings, version, and cadence visible without overlap.

Add and apply this exact primary treatment so the style survives every widget
state transition:

```lua
local function stylePrimaryButton(button)
    local function setBorder(red, green, blue, alpha)
        button.Top:SetColorTexture(red, green, blue, alpha)
        button.Bottom:SetColorTexture(red, green, blue, alpha)
        button.Left:SetColorTexture(red, green, blue, alpha)
        button.Right:SetColorTexture(red, green, blue, alpha)
    end
    local function applyEnabledStyle(self)
        self.Background:SetColorTexture(0.15, 0.105, 0.020, 1)
        setBorder(unpack(COLORS.gold))
    end
    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self.Background:SetColorTexture(0.22, 0.16, 0.035, 1)
        end
    end)
    button:SetScript("OnLeave", function(self)
        if self:IsEnabled() then
            applyEnabledStyle(self)
        end
    end)
    button:SetScript("OnDisable", function(self)
        self.Background:SetColorTexture(0.035, 0.040, 0.043, 1)
        setBorder(unpack(COLORS.border))
    end)
    button:SetScript("OnEnable", applyEnabledStyle)
    applyEnabledStyle(button)
end
```

- [ ] **Step 7: Run the complete parser and smoke suite**

Run:

```bash
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: PASS, including exact button dispatch, disabled states, busy Stop state, and tab-switch refresh behavior.

- [ ] **Step 8: Commit the organizer UX**

Run:

```bash
git add GuildBankOrganizer/UI.lua tests/smoke.lua
git diff --cached --check
git commit -m "Clarify Smart Deposit scope actions"
```

---

### Task 4: Document, Package, and Install `1.2.0-beta.2`

**Files:**
- Modify: `GuildBankOrganizer/GuildBankOrganizer.toc:4`
- Modify: `CHANGELOG.md:1-18`
- Modify: `README.md:68-94`
- Create: `dist/GuildBankOrganizer-1.2.0-beta.2.zip` through `scripts/package.sh` (ignored by Git)
- Install: `/Applications/World of Warcraft/_classic_/Interface/AddOns/GuildBankOrganizer`

**Interfaces:**
- Consumes: the verified scope-aware depositor and compact organizer.
- Produces: one exact beta archive and an installed addon tree identical to that archive.

- [ ] **Step 1: Update public copy and the beta version**

Set the TOC version to:

```text
## Version: 1.2.0-beta.2
```

Add a `1.2.0-beta.2 - 2026-08-12` changelog section that states:

- Smart Deposit now exposes `Deposit This Tab` and `Deposit All Tabs` separately.
- The current tab is always the primary action and all-tabs is never remembered.
- The organizer previews counts for both scopes and explains when only other tabs match.
- Selected-tab progress and reports now exclude unselected tabs.

Update the README Smart Deposit instructions to tell users that `Deposit This Tab` affects only the bank tab they are viewing, while `Deposit All Tabs` routes eligible bag items to every enabled profile.

- [ ] **Step 2: Run reproducibility, parser, smoke, and whitespace checks**

Run:

```bash
python3 scripts/generate_profession_data.py
git diff --check
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: the catalog remains fully covered, every Lua file parses, and the smoke test passes.

- [ ] **Step 3: Build and inspect the release archive**

Run:

```bash
./scripts/package.sh
unzip -tq dist/GuildBankOrganizer-1.2.0-beta.2.zip
unzip -p dist/GuildBankOrganizer-1.2.0-beta.2.zip \
  GuildBankOrganizer/GuildBankOrganizer.toc | rg '^## Version: 1.2.0-beta.2$'
shasum -a 256 dist/GuildBankOrganizer-1.2.0-beta.2.zip
```

Expected: ZIP integrity passes, the packaged TOC reports `1.2.0-beta.2`, and a SHA-256 checksum is recorded for handoff.

- [ ] **Step 4: Back up the currently installed beta and install the exact archive**

Resolve these explicit paths before moving anything:

```bash
install_root="/Applications/World of Warcraft/_classic_/Interface/AddOns"
installed_addon="$install_root/GuildBankOrganizer"
backup_root="/Users/ericbeane/Documents/WoW Addon Backups"
backup_addon="$backup_root/GuildBankOrganizer-1.2.0-beta.1-20260812-scope"
test -d "$installed_addon"
test ! -e "$backup_addon"
mkdir -p "$backup_root"
mv "$installed_addon" "$backup_addon"
unzip -q dist/GuildBankOrganizer-1.2.0-beta.2.zip -d "$install_root"
```

Expected: the previous installed tree remains recoverable at the explicit backup path and the new installed tree comes only from the verified archive.

- [ ] **Step 5: Prove the installed tree matches the archive**

Run:

```bash
verify_dir=$(mktemp -d "${TMPDIR:-/tmp}/gbo-install-verify.XXXXXX")
unzip -q dist/GuildBankOrganizer-1.2.0-beta.2.zip -d "$verify_dir"
diff -rq "$verify_dir/GuildBankOrganizer" \
  "/Applications/World of Warcraft/_classic_/Interface/AddOns/GuildBankOrganizer"
rm -rf "$verify_dir"
```

Expected: `diff -rq` produces no output. The cleanup target is the explicit directory returned by `mktemp -d`, never a broad or unresolved path.

- [ ] **Step 6: Commit versioned source and documentation**

Run:

```bash
git add GuildBankOrganizer/GuildBankOrganizer.toc CHANGELOG.md README.md
git diff --cached --check
git commit -m "Prepare Smart Deposit scope beta"
git status --short
```

Expected: source and documentation are committed, `dist/` remains ignored, and the worktree has no unexplained changes.

- [ ] **Step 7: Perform the in-client acceptance test**

In MoP Classic:

1. Run `/reload` and open the guild bank.
2. Confirm the panel opens beside the bank without overlapping it.
3. Confirm the current-tab and all-tabs summaries are readable at the active UI scale.
4. Put matching items for at least two configured tabs in character bags.
5. Click `Deposit This Tab`; confirm only items routed to the open tab move and the report totals describe only that tab.
6. Refill or retain items for at least two tabs, then click `Deposit All Tabs`; confirm both destinations receive their assigned items.
7. Open a tab with no matching bag items; confirm its button is disabled while `Deposit All Tabs` remains enabled when another profile matches.
8. Start a deposit and confirm the two scope actions become one `Stop` control until the operation finishes.
9. Run `/reload` again and confirm `Deposit This Tab` remains the primary action with no remembered all-tabs default.

Expected: both explicit scopes work, all counts and reports match the chosen scope, and no items route to an unselected tab during the current-tab operation.
