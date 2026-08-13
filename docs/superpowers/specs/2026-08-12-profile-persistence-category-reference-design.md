# Smart Deposit Profile Persistence and Category Reference Design

Date: 2026-08-12
Status: Approved

## Background

Guild Bank Organizer currently saves a Smart Deposit profile only when the
player presses `Save Tab Profile`. Category checkboxes, expansion filters, the
enabled state, the profile name, and exact item IDs can therefore appear
configured in the form but be lost after leaving the page or reloading the UI.
This caused a Classic herb, Mageroyal, to remain in the player's bags because
the intended Herbs route had never reached SavedVariables.

The generated profession catalog also assigns every item with multiple recipe
owners to `Shared Profession Supplies`. That produces complete coverage, but it
does not match how players commonly organize a bank. Obvious supplies such as
parchment, vellum, dyes, and vials are mixed with genuinely neutral raid
crafting reagents and with inaccessible test records. The category name and
contents consequently provide little guidance.

Finally, the custom checkboxes use an almost-black unchecked texture on the
addon's black panel. Expansion selections are difficult to distinguish at a
glance.

## Goals

- Persist every valid profile edit without requiring a separate Save action.
- Make saved, saving, and invalid states visible.
- Route overlapping profiles deterministically, favoring an exact or
  expansion-specific choice over a broader choice.
- Present profession materials using the category a player is most likely to
  expect.
- Restrict `Shared Crafting Reagents` to an explicit, reviewable set of truly
  cross-profession items.
- Let players inspect category definitions, the complete Shared list, and the
  assignment for an item name or ID from inside the addon.
- Make unchecked and checked filters clearly visible against the panel.
- Preserve existing valid profiles and provide a safe migration path for
  malformed data.

## Non-goals

- Do not change guild-bank sorting cadence or Smart Deposit move cadence.
- Do not change bag, bank, cursor, soulbound, lock, retry, or server-state
  safeguards.
- Do not expose every item in broad categories such as Armor, Cloth, or Herbs
  as a browsable multi-thousand-row list.
- Do not let the reference page edit the generated or curated taxonomy.
- Do not fetch taxonomy data from the network at runtime.
- Do not infer an arbitrary single profession for an item whose purpose is
  genuinely neutral across professions.

## Player-Facing Taxonomy

### Authoritative classification

One runtime classifier remains the source of truth for Smart Deposit,
diagnostics, profile inspection, and Category Reference results. Built-in
classification uses this order:

1. A curated player-facing item-ID assignment or exclusion.
2. A dependable intrinsic item rule such as equipment slot, item class,
   subclass, recipe type, or a specific supported item family.
3. Generated profession ownership data.
4. A specialized bag-family fallback when it identifies exactly one category.
5. No automatic category.

A curated exclusion prevents a placeholder, test, or intentionally unsupported
record from falling through to a broad generated category. Players can still
use an exact item-ID profile rule for a bankable excluded item; normal
soulbound and guild-bank eligibility checks continue to apply.

Exact item IDs configured by a player are routing rules, not built-in taxonomy.
They override the category route without changing the category shown for that
item in the built-in reference. The reference result identifies both facts
when a custom exact rule applies.

### Player-first assignments

The first curated pass applies the following mental model:

- Inks, pigments, and parchment are `Inscription`.
- Enchanting vellum and ruined vellum records are `Enchanting`.
- Dyes and bleach are `Tailoring`.
- Crystal Vial and equivalent alchemy containers are `Alchemy`.
- Clearly named profession components, such as an engineering part, use that
  profession when recipe and metadata evidence support it.
- A genuinely neutral material used by several professions remains `Shared
  Crafting Reagents`.
- Test, placeholder, and broken internal records are excluded from public
  routing.

The curated assignments live in a small, human-reviewed source file that is
separate from generated profession and expansion data. Regenerating the data
cannot erase or silently replace these decisions.

### Shared Crafting Reagents

The public name changes from `Shared Profession Supplies` to `Shared Crafting
Reagents`. Its internal key remains `profession_supplies` for SavedVariables
compatibility.

Membership is allowlist-only. The initial allowlist is produced by reviewing
the existing 59-item generated Shared set and retaining only materials with no
single defensible player-facing owner. It includes cross-profession raid and
endgame reagents such as Primal Nether, Nether Vortex, Heart of Darkness,
Sunmote, Frozen Orb, Runed Orb, Crusader Orb, Primordial Saronite, Chaos Orb,
Living Ember, Essence of Destruction, Blood Spirit, Orb of Mystery, Haunting
Spirit, and Spirit of War. Other legitimately neutral legacy reagents may
remain only when their multi-profession use is confirmed during the data audit.

Generated data must never add an item to Shared implicitly. An item that has
multiple owners but is absent from the allowlist is reported by taxonomy
validation so it can be assigned, excluded, or deliberately added after
review.

### Hidden records

Known test, placeholder, and broken records are omitted from public categories
and search suggestions. Direct lookup by numeric ID returns them with the
status `Excluded internal or unavailable item` so their treatment remains
inspectable. The first audit explicitly reviews records including `Test Sapper
Charge`, `Ninja Grenade [PH]`, `Broken Engine Part`, `ZX-5103 Mechanical Suit`,
and the broken elixir records instead of relying only on a name pattern.

## Category Reference

### Entry point and layout

Advanced settings gains a secondary `Category Reference` button. It opens a
dedicated addon-styled page and does not add clutter to the organizer's normal
sorting and deposit controls.

The page contains:

- A search field accepting an exact item ID or a case-insensitive item name.
- A scrollable public category list.
- A plain-language definition and representative examples for every broad
  category.
- A `View Complete List` action for Shared Crafting Reagents.
- Expansion labels beside every item in the complete Shared list.
- A Back action that returns to Advanced settings without overlapping frames.

Only one GBO subpage is visible at a time. Opening Category Reference hides
Advanced settings, and returning hides Category Reference before restoring
Advanced settings.

### Search behavior

Numeric input performs an exact ID lookup. Text input performs a
case-insensitive contains search against the bundled supported item-name index,
with a capped, scrollable result list. Results show:

- Item name and ID.
- Built-in category, or the reason it is excluded or unsupported.
- Resolved expansion.
- Classification evidence, such as `curated item ID`, `item subclass`, or
  `generated profession data`.
- The destination tab and `custom exact item rule` when the current guild has
  an enabled exact-ID assignment for that item.

Name search uses a generated bundled index and therefore works even when WoW's
item cache has not loaded the item during the current session. Runtime item API
data may enrich a result but is not required to find it.

The Shared complete list and item lookup are generated from the same curated
and generated inputs used by runtime classification. The UI must not carry a
second hand-maintained item list.

## Profile Persistence

### Autosave triggers

The profile editor maintains a draft for the currently selected destination
tab. Valid changes save as follows:

- Enabled, category, `All Expansions`, and individual expansion checkbox
  changes save immediately.
- Profile name and exact item-ID text save when Enter is pressed or the field
  loses focus.
- `Scan Bags Now`, `Load Tab`, `Use Current`, either Back action, and hiding the
  profile page flush pending text-field edits before continuing.
- Opening another tab profile first flushes the current draft so loading a new
  profile cannot replace unsaved valid edits.

Programmatic form population sets a loading guard and never triggers autosave.
New profiles display enabled by default, as they do now, and become an enabled
saved profile as soon as they contain at least one valid category or exact-ID
rule.

### Save state

The bottom status area has three persistence states:

- `Saving...` while a draft is being validated and written.
- `Saved` after SavedVariables contains the displayed valid values.
- A specific validation message when the draft cannot replace the last valid
  profile.

The existing `Save Tab Profile` control is renamed `Save Now`. It remains as an
explicit confirmation affordance but uses the same draft flush routine as every
automatic trigger. The adjacent status area, rather than the button label,
shows `Saving...` and `Saved`.

Autosave is synchronous at the data layer. `Saving...` is shown before the
write and transitions to `Saved` after validation, profile replacement, and
deposit-plan refresh complete.

### Validation and navigation

Saving is atomic per profile. The addon builds and validates a candidate table
before replacing the last valid saved profile. A validation error leaves that
saved profile intact and keeps the invalid draft visible for correction.

Actions controlled by the editor—Scan, Load, Use Current, and Back—do not
continue when a pending draft fails validation. They display the actionable
error instead, preventing a silent loss. Closing the guild bank or reloading
the UI cannot be blocked; in that case the last valid saved profile remains and
invalid draft text is not written.

Profile names are trimmed only for validation and storage; exact item IDs are
parsed as positive integers and normalized into a set. Empty names remain
valid. A profile may be saved while disabled. An enabled profile requires at
least one category or exact item-ID rule and a valid expansion choice.

## Deterministic Routing and Conflicts

For a bag item, enabled profile routes use this precedence:

1. Exact item-ID assignment.
2. Matching category with the item's explicit expansion selected.
3. Matching category with `All Expansions` selected.

An exact rule therefore wins over every category route. A Mists-only Herbs
profile wins over an All Expansions Herbs profile for a Mists herb, while the
All Expansions profile continues to receive eras without a specific Herbs
route.

Two eligible routes at the same precedence are a conflict. The addon does not
use tab number or iteration order as a tiebreaker. Save-time validation rejects
conflicts that are knowable from profile rules:

- The same exact item ID on two enabled profiles.
- The same category and explicit expansion on two enabled profiles.
- The same category with `All Expansions` on two enabled profiles.

Runtime validation also catches conflicts exposed by migrated or malformed
data. The message names the item, its category and expansion when applicable,
and both competing destination tabs, with a direct path to edit the profiles.
No conflicted item is moved.

## SavedVariables Migration and Recovery

The database schema advances from version 5. Migration rules are idempotent:

- Existing valid profile tables, labels, enabled states, expansions, and exact
  item IDs remain intact.
- `profession_supplies` remains selected but appears under the new `Shared
  Crafting Reagents` label. Because its built-in membership becomes narrower,
  reclassified supplies subsequently follow their intuitive category routes.
- Existing profiles are not automatically given newly intuitive categories;
  the reference and profile UI explain those categories so the player retains
  control over destinations.
- Unknown or malformed fields are copied to a recovery entry before usable
  fields are normalized. Only an unusable rule is ignored. A profile is
  disabled only when it has no valid category or exact-ID rule remaining.
- A migration warning is shown in Advanced settings when recovery data was
  needed. The raw recovery entry remains available for a diagnostic report and
  is never used for routing.

The migration cannot recover form edits that were never written by an older
version. Autosave prevents that failure for subsequent edits.

## Checkbox Presentation

The shared custom checkbox component gains explicit visual states:

- Unchecked: dark fill with a visible neutral-gray one-pixel outline.
- Hover or keyboard focus: brighter outline.
- Checked: cyan fill or mark plus the visible outline.
- Disabled: muted fill, outline, label, and no hover emphasis.

Expansion filters use the same component and gain consistent spacing so `All`,
`Classic`, `TBC`, `Wrath`, `Cata`, and `Mists` remain visually distinct at
supported UI scales. The styling applies to other GBO checkboxes as well so
the UI does not introduce two checkbox languages.

## Components and Boundaries

The implementation keeps five responsibilities separate:

1. **Taxonomy data** stores curated assignments, Shared allowlist membership,
   exclusions, definitions, examples, and generated name/expansion data.
2. **Classifier** resolves one built-in category and evidence for an item.
3. **Profile store** owns draft validation, atomic profile writes, migration,
   and save status.
4. **Router** chooses a destination from exact, expansion-specific, and broad
   routes and reports ties.
5. **Reference UI** reads classifier and taxonomy query APIs without changing
   them.

The depositor consumes only resolved routes. It does not own taxonomy, editor
state, or reference-page presentation.

## Error Handling

- Invalid expansion selection preserves the previous saved profile and asks the
  player to select `All` or at least one era.
- A conflicting route identifies both tabs and does not save or move the
  conflicting rule.
- Unsupported name searches show `No bundled MoP Classic item found` rather
  than guessing from partial runtime data.
- Excluded item-ID results explain their exclusion status.
- A stale or unavailable runtime item record may omit live tooltip details but
  does not prevent bundled lookup or classification evidence.
- Malformed SavedVariables never cause the entire profile collection to be
  deleted or silently reset.

## Verification

### Automated taxonomy checks

- Every curated item ID exists in the supported Blizzard Classic client item
  dataset.
- Every public item resolves to at most one built-in category.
- Every generated multi-owner item is assigned, allowlisted as Shared, or
  explicitly excluded.
- Shared contains only explicit allowlist entries.
- Test and placeholder records do not appear in public category suggestions.
- Category Reference names, categories, expansions, and evidence match runtime
  classifier output.
- Bundled name lookup resolves representative Classic, TBC, Wrath, Cataclysm,
  and Mists items without a warm WoW item cache.

### Automated profile and routing checks

- Existing schema-5 profiles migrate without losing valid data.
- Malformed fields produce recoverable warnings while valid sibling profiles
  remain active.
- Every checkbox and text-field commit path writes the displayed valid profile.
- Scan, Load, Use Current, Back, and page hide flush pending fields.
- An invalid draft cannot replace the last valid profile or silently navigate
  away through an editor action.
- Mageroyal routes through Herbs when Classic or All Expansions is selected.
- Representative inks, pigments, parchment, vellum, dyes, and vials resolve to
  their intuitive categories.
- Representative neutral reagents from every supported expansion resolve to
  Shared Crafting Reagents.
- Exact item rules beat category routes.
- Specific expansion routes beat All Expansions routes.
- Equal-priority conflicts identify both tabs and move nothing.
- A simulated reload recreates the same saved profile state.

### UI and regression verification

- Expansion and category checkboxes remain legible in checked, unchecked,
  hover, focus, and disabled states.
- The Category Reference replaces rather than overlaps its parent subpage.
- Shared complete-list grouping and item lookup remain readable at supported UI
  scales.
- Existing sort, scan, deposit, retry, Stop, diagnostic, and scope-selection
  smoke tests continue to pass.
- In-client verification includes a real `/reload` between editing and
  reopening a profile, followed by Mageroyal and representative profession
  reagent deposit plans.
