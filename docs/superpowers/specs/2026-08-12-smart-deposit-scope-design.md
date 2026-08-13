# Smart Deposit Scope Selection Design

Date: 2026-08-12
Status: Approved

## Background

The compact Guild Bank Organizer panel currently exposes one button labeled
`Smart Deposit`. That button starts the existing all-tabs workflow, but the
label does not reveal its scope. Because the panel is displayed beside the
currently open guild-bank tab, a player can reasonably assume the action only
deposits items assigned to that tab.

The deposit engine already supports both behaviors:

- `StartDeposit(tab)` limits the operation to one configured destination tab.
- `StartDeposit()` deposits eligible items across every enabled tab profile.

This change makes that existing distinction explicit before any items move.

## Goals

- Make the destination scope obvious without requiring explanatory text or a
  confirmation dialog.
- Treat the currently open tab as the safe, primary action.
- Preserve the efficient all-configured-tabs workflow as an explicit action.
- Show enough plan information for the player to understand the consequence of
  either action before clicking.
- Keep the compact organizer panel usable beside the guild-bank window.

## Non-goals

- Do not change category routing, profile conflict rules, deposit cadence, or
  the confirmation-driven deposit queue.
- Do not add a remembered scope preference.
- Do not add a modal confirmation to every deposit.
- Do not change slash-command behavior.

## Interaction Design

The Smart Deposit card contains two adjacent actions:

1. `Deposit This Tab` is the gold primary action. It passes the currently open
   guild-bank tab to `StartDeposit(tab)`.
2. `Deposit All Tabs` is the secondary action. It calls `StartDeposit()` with
   no tab restriction.

The addon never remembers an all-tabs choice. Opening the bank, changing tabs,
finishing a deposit, or reloading the UI always leaves `Deposit This Tab` as
the visually primary action.

The card displays a concise two-line plan summary above the buttons:

```text
This tab: 20 items in 1 deposit
All configured tabs: 87 items in 6 deposits across 3 tabs
```

Counts come from the current deposit plan. They update when the plan refreshes
and when the player changes the open guild-bank tab. Singular and plural copy
must be grammatically correct.

The existing `Edit` or `Set Up` action remains available for managing tab
profiles.

## States

### Profiles are not configured

- Show the existing setup guidance.
- Disable both deposit actions.
- Keep `Set Up` available.

### Scanning

- Show `Checking bags and assigned tabs...`.
- Disable both deposit actions to prevent a second operation.
- Preserve the existing scan progress presentation.

### Items match the current tab and possibly other tabs

- Show current-tab and all-tabs counts.
- Enable `Deposit This Tab` when the current tab has at least one planned move.
- Enable `Deposit All Tabs` when the complete plan has at least one planned
  move.
- Keep `Deposit This Tab` visually primary even when both actions are enabled.

### Items only match other configured tabs

- Show `This tab: No matching items`.
- Show the available all-tabs count beneath it.
- Disable `Deposit This Tab`.
- Enable `Deposit All Tabs`.
- Do not automatically start or redirect to the all-tabs action.

### No items match any configured tab

- Show `No matching bag items are ready right now.`
- Disable both deposit actions.
- Keep `Edit` available.

### Sorting, diagnostics, or another mutually exclusive operation is active

- Disable both deposit actions.
- Preserve the existing operation status and stop behavior.

### A Smart Deposit is active

- Hide the two scope actions and show one full-width `Stop` control in their
  place. Restore both scope actions after the operation finishes.
- Preserve the existing confirmed-move count, remaining moves, and ETA.
- Status and progress must describe the selected operation only. A current-tab
  run must not report totals from unselected tabs.

## Data and Control Flow

The existing full deposit plan remains the source of truth. The organizer UI
derives a current-tab view from `plan.tabs[currentTab]` and obtains the
all-tabs view from `plan.totalItems`, `plan.totalMoves`, and the number of tab
plans containing at least one move.

Clicking `Deposit This Tab` captures the currently open tab at click time and
passes it to `StartDeposit(tab)`. Clicking `Deposit All Tabs` passes no tab.
Both paths retain the depositor's existing preflight refresh, which rebuilds
the plan immediately before moving items. If the selected scope no longer has
eligible moves after that refresh, the depositor exits with its existing safe
message and moves nothing.

Changing the guild-bank tab triggers the existing organizer refresh path. The
current-tab counts and enabled state must therefore follow the newly open tab;
the all-tabs totals remain based on the same complete plan.

## Layout

The compact panel keeps its current width. `Sort This Tab` occupies its own
full-width row. The Smart Deposit card grows vertically enough to fit the
two-line summary and two adjacent scope buttons without overlap. Button labels
must remain fully readable at the supported UI scale. The buttons use the
addon's existing bespoke visual components and color system rather than default
Blizzard button templates.

## Error Handling and Safety

- Never infer an all-tabs request from the current-tab button being disabled.
- Never persist or silently reuse an all-tabs scope.
- Re-check the current tab when the button is clicked; do not rely on a stale
  tab captured when the panel was first shown.
- Keep all existing combat, bank-open, profile, lock, retry, and server-state
  safeguards in the depositor.
- If the bank closes or the tab changes during the preflight refresh, rely on
  existing validation and abort safely rather than broadening the scope.

## Verification

Automated smoke coverage will verify:

- `Deposit This Tab` calls `StartDeposit` with the open tab number.
- `Deposit All Tabs` calls `StartDeposit` without a tab restriction.
- The current-tab action never mutates a remembered default or all-tabs state.
- Both summaries use the correct item, move, destination-tab, and pluralized
  counts.
- The current-tab action disables when only another tab has eligible items,
  while the all-tabs action remains enabled.
- Both actions disable while scanning or while another operation is active.
- Switching the open bank tab refreshes current-tab counts and button state.
- A current-tab deposit moves only items routed to that tab; an all-tabs
  deposit retains the existing multi-tab behavior.

Manual in-client verification will cover layout readability, tab switching,
the disabled-state copy, both deposit scopes, Stop behavior, and a `/reload`
check confirming that all-tabs is not remembered as a default.
