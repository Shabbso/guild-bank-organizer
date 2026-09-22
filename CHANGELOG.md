# Changelog

## 1.2.1 - 2026-09-22

A smoother Smart Deposit experience, clearer progress, and more reliable handling
of interrupted guild-bank operations for **Mists of Pandaria Classic**.

### Faster, clearer Smart Deposit

- Bag scanning is shown as soon as the guild bank opens, with destination
  progress while the addon prepares your deposit preview.
- Scans check only destinations needed by eligible items in your bags.
  **Deposit This Tab** prepares only the selected destination.
- Clicking Deposit can reuse a recent, unchanged verified preview, removing
  an unnecessary repeat scan. Checks before each move and final verification
  still run.
- Moving a planned stack in your bags now shows a prompt stop explanation.
  An already-issued deposit is allowed to settle before the queue ends.
- Temporary locks or unavailable space show a waiting status, and background
  previews no longer hide the reason an operation stopped.

### More reliable operations

- Fixed a rejected deposit being retried after **Stop**.
- Runs keep track of the items originally selected for deposit. Items that
  become unavailable remain counted as unfinished; new bag arrivals wait
  for a later run.
- Missing bank refresh responses now report incomplete verification instead
  of accepting cached contents as a successful finish.
- Improved handling of canceled scans, delayed callbacks, item variants,
  and permission or bank-state changes during diagnostics.
- Added **Check Again** and `/gbo verify` to recheck the last operation from
  the current login session without moving items or replacing its original report.

### Setup, performance, and reports

- Automatic previews keep profile editing responsive. Unchanged saves and
  profile-name-only edits no longer trigger a bank scan.
- Fixed the clipped **Destination tab** label and crowded expansion labels.
- **Copy Report** works before the first operation and includes current
  configuration and recovery information. Deposit reports include preparation timing.
- Reduced idle UI updates and repeated sort-estimate work.
- The detailed Category Reference now loads its records when first needed,
  reducing startup memory use while preserving existing categories and routing.
- Added automated regression checks and reproducible release packages.

**Compatibility:** MoP Classic 5.5.4 (Interface 50504). No required dependencies.
Existing saved profiles are preserved. Fully restart WoW after updating so the
new addon files load.

## 1.2.1-beta.2 — in-game feedback fixes (2026-09-22)

- Show automatic bag scanning immediately when the bank opens, with destination
  progress instead of an empty/no-matching-items message during the scan.
- Query only destinations with eligible bag items. Deposit This Tab preflight
  queries only its chosen destination.
- Reuse a recent verified preview on Deposit instead of scanning every tab again.
  Reuse requires the same bank session, no intervening bank slot event, unchanged
  unlocked tab contents, no competing read, and per-tab verification within 15
  seconds. Every mutation still validates its endpoints; final verification stays.
- Stop promptly when a planned bag source changes, while allowing an in-flight
  deposit to settle. Temporary locks/space waits show an explicit waiting status.
- Keep the stop reason visible while an automatic preview refreshes. Show recheck
  results instead of replacing them with a ready-to-deposit message.
- Place Destination tab on its own label row and tighten expansion label bounds
  to prevent overlap with adjacent controls.
- Include preflight duration, queried-tab count and preview reuse in reports.

The author subsequently reported successful in-game use and authorized promotion
to 1.2.1. Manual test 18 remains not reproduced because the client prevented
withdrawing an item during deposits; its automated scenario remains covered.


## 1.2.1-beta.1 — maintenance candidate (2026-09-22)

- Prevent Smart Deposit retries after Stop. Track originally intended items and
  report partial completion when remaining items become locked or change.
- Serialize and pace refreshes; require event activity and stable snapshots.
  Missing refreshes no longer produce cached-state success. Add read-only
  **Check Again** / `/gbo verify`, preserving the original run report.
- Guard diagnostics and corrective moves against combat, tab changes, cursor
  contents, and lost permissions. Cancel stale scan callbacks by request/phase.
- Debounce editable profile previews; skip scans for unchanged/label-only saves.
- Make recovery/configuration reports available without a previous operation.
- Split UI modules and use coalesced events plus a timer only during active work.
- Defer reference record allocation until first use, preserving every catalog
  record and category. Clarify that armor kits use Enchanting classification.
- Make sorting comparisons consistent for variants and check full item links.
  Refresh the full move-count estimate every eight confirmed moves while still
  taking a fresh snapshot before every actual move.
- Add Lua 5.1 regression simulations, catalog parity/provenance checks, CI, and
  deterministic ZIP packaging with SHA-256 manifests.

At this candidate stage, live MoP acceptance was pending. Move cadences
were unchanged. Slot events remain untagged; refreshed state is not an independent
server acknowledgement. The catalog still uses build 5.5.4.68806.


## 1.2.0 - 2026-08-13

This release substantially expands Smart Deposit while preserving the
server-safe sorting and confirmation behavior from 1.1.1.

- Added separate **Deposit This Tab** and **Deposit All Tabs** actions, with
  scope-specific item counts, deposit counts, progress, reports, and a shared
  **Stop** control.
- Added a generated MoP Classic profession catalog covering 8,377 public,
  bank-eligible profession records with zero uncovered items or unreviewed
  multi-profession assignments.
- Added Engineering, Tailoring, Leatherworking, First Aid, Archaeology, and
  **Shared Crafting Reagents** categories, plus more intuitive ownership for
  parchment, vellum, dyes, vials, pigments, inks, and similar supplies.
- Added a searchable **Category Reference** in Advanced settings with category
  definitions, examples, expansion information, exact item-ID diagnostics,
  and the complete Shared Crafting Reagents list.
- Made valid Smart Deposit profile edits save automatically and persist across
  `/reload`; **Save Now** remains available for explicit confirmation.
- Added safe schema migration and recovery diagnostics for malformed legacy
  profile data instead of silently discarding it.
- Made exact item-ID routes override category routes, and specific-expansion
  routes override **All Expansions** fallbacks.
- Added actionable equal-priority conflict reporting that names both tabs and
  leaves only the conflicted item in the player's bags.
- Added strict exact item-ID validation. Invalid, negative, decimal, zero, or
  alphanumeric entries leave the last valid saved profile unchanged.
- Locked profile setup while a scan or deposit is active so an authorized
  operation cannot change destinations mid-run.
- Removed reviewed deprecated, obsolete, unused, test, placeholder, and
  programmer-only records from public routing and text suggestions while
  retaining exact numeric diagnostics.
- Added visible outlines to unchecked expansion filters while preserving clear
  selected-state contrast.
- Expanded automated coverage for classification, expansion eras, migration,
  autosave, route precedence, conflicts, current-tab/all-tabs scope, reference
  search, exact-ID validation, and active-operation safety.

## 1.2.0-beta.3 - 2026-08-12

- Made valid Smart Deposit profile edits save automatically and survive
  `/reload`; **Save Now** remains available as an explicit confirmation.
- Locked profile editing while a Smart Deposit scan or move queue is active,
  and reject in-flight profile saves without changing the running route plan.
- Made exact item-ID input accept only comma- or whitespace-separated positive
  whole numbers; malformed entries leave the last valid profile unchanged.
- Made exact item routes override category routes and specific-expansion
  category routes override **All Expansions** fallbacks.
- Changed equal-priority routing conflicts to identify both destination tabs
  and leave the conflicted item in the player's bags.
- Replaced broad **Shared Profession Supplies** assignment with the smaller,
  reviewed **Shared Crafting Reagents** set.
- Assigned obvious parchment, vellum, dye, vial, and similar profession
  supplies to intuitive player-facing categories.
- Added a searchable **Category Reference** to Advanced settings, including
  exact item-ID lookup and the complete Shared Crafting Reagents list.
- Removed reviewed deprecated, obsolete, unused, test, placeholder, and
  programmer-only records from public routing and text suggestions while
  retaining exact numeric diagnostics.
- Preserved malformed top-level profile SavedVariables in recovery diagnostics
  before replacing them with a safe profile container.
- Added checkbox outlines so unchecked expansion filters remain visible while
  selected filters retain clear contrast.

## 1.2.0-beta.2 - 2026-08-12

- Replaced the ambiguous Smart Deposit action with separate **Deposit This
  Tab** and **Deposit All Tabs** buttons.
- Made the currently open tab the permanent primary action; the addon never
  remembers or silently defaults to an all-tabs deposit.
- Added current-tab and all-configured-tabs item and deposit counts directly
  to the compact organizer.
- Added clear feedback when the open tab has no matching items but another
  configured tab does.
- Corrected current-tab progress, opening messages, timelines, and reports so
  they exclude items and moves assigned to unselected tabs.
- Replaced both scope actions with one clear **Stop** control while an organizer
  operation is active.

## 1.2.0-beta.1 - 2026-08-12

- Replaced the small Smart Deposit exception list with a generated profession
  catalog derived from the MoP Classic item, profession, reagent, created-item,
  and specialized-bag client data.
- Fixed Shadow Pigment, Misty Pigment, Ink of Dreams, Starlight Ink, and the
  full generated set of Inscription pigments, inks, scrolls, and supplies.
- Added public Engineering, Tailoring, Leatherworking, First Aid, Archaeology,
  and Shared Profession Supplies categories.
- Added deterministic coverage for profession recipes and non-equipment
  products while preserving Armor, Weapons, Cloth, Ore, Leather, Herbs, and
  Elemental as their own categories.
- Added a neutral category for genuinely multi-profession materials so one bag
  item cannot overlap several tab routes.
- Added Archaeology's 13 bankable keystone items; Archaeology fragment
  currencies remain outside Smart Deposit because they are not bag items.
- Added a conservative specialized-bag fallback for future unknown item IDs.
- Added a reproducible coverage report: 8,576 statically bank-eligible MoP
  profession candidates categorized, with zero uncovered records.
- Added regression coverage for Shadow Pigment, Ink of Dreams, Engineering
  parts and schematics, First Aid bandages, Archaeology keystones, shared
  supplies, generated coverage, and live bag-family reads.
- Expanded the Smart Deposit setup panel to fit the new categories cleanly.

## 1.1.1 - 2026-08-11

- Fixed Smart Deposit expansion filtering on MoP Classic clients that report
  `expansionID=254`, including Silk Cloth, Frostweave Cloth, and other
  expansion-filtered categories.
- Added a compact generated correction table derived from Blizzard Item DB2
  presence across Classic, TBC, Wrath, Cataclysm, and MoP Classic clients.
- Extended the item-era fallback to Armor, Weapons, Trinkets, Bags, Battle
  Pets, Food, and every other supported category instead of materials alone.
- Added Enchanting Vellum (`38682`) to the Enchanting category.
- Clarified that **All expansions** includes Mists when a profile overlaps a
  category already assigned to another tab.
- Added regression coverage for `expansionID=254`, overlapping item-ID eras,
  Enchanting Vellum, and actionable profile-conflict feedback.

## 1.1.0 - 2026-07-26

Public release of Smart Deposit and the redesigned organizer interface.

- Added per-guild Smart Deposit profiles for every purchased bank tab.
- Added support for multiple item categories and expansion filters in one tab.
- Added exact item-ID overrides for unusual or ambiguous materials.
- Added confirmation-driven deposits with live progress, adaptive ETA,
  conservative retry behavior, and final server verification.
- Added a compact interface that opens with the guild bank and keeps sorting,
  deposit setup, settings, and reports in separate non-overlapping views.
- Added clearer diagnostics for locked, soulbound, expansion-filtered,
  unclassified, unloaded, permission, and no-space conditions.
- Added curated MoP Classic handling for Spirit Dust, other core enchanting
  materials, Snow Lily Petal, and Spinefish.
- Retained safe one-tab sorting with stack consolidation, a validated
  1.25-second cadence, move counts, and adaptive ETA.
- Published the project under an All Rights Reserved license.

## 1.1.0-beta.7 - 2026-07-26

- Added a curated **Fish & Raw Cooking** rule for Spinefish (item 83064),
  whose Alchemy-oriented item metadata does not use WoW's normal Cooking
  trade-goods subclass.
- Excluded the soulbound Timeless Isle combat buff Singing Crystal (item
  103641) from the broad Food category so it cannot mask useful scan results.
- Smart Deposit setup now names the first unclassified trade material and its
  item ID instead of reporting a generic no-match result.
- Added regression coverage for curated routing, curated exclusions, and
  unclassified-material inspection.

## 1.1.0-beta.6 - 2026-07-26

- Split Smart Deposit diagnostics into distinct soulbound, temporarily locked,
  expansion-filtered, unloaded, and no-space states.
- **Scan Bags Now** waits up to three seconds for matching locked items and
  automatically retries the scan.
- Added idle plan refreshes for `ITEM_UNLOCKED` and settled bag updates while
  the guild bank is open.
- Setup scans now report results for the selected destination tab instead of
  treating deposits planned for another profile as success.
- Added locked-versus-bound regression coverage.

## 1.1.0-beta.5 - 2026-07-26

- Fixed MoP Classic 5.5.4 returning `expacID=0` for post-Classic materials,
  including Snow Lily Petal and Spirit Dust.
- Curated expansion IDs now take precedence over the unreliable API value.
- Added a material-class item-era fallback for TBC, Wrath, Cataclysm, and MoP
  when the Classic client incorrectly labels a material as expansion 0.
- Added regression coverage for Spirit Dust and Snow Lily Petal resolving to
  Mists while the mocked client reports both as Classic.

## 1.1.0-beta.4 - 2026-07-26

- Fixed custom checkbox persistence by keeping checkbox state in an
  addon-owned boolean instead of relying on template toggle timing.
- Added a one-time schema-5 repair for configured beta profiles that were
  incorrectly saved as disabled.
- Added a MoP expansion fallback for Spirit Dust, Mysterious Essence, Ethereal
  Shards, and Sha Crystals when Classic item-cache data omits `expacID`.
- Reworked Smart Deposit scan feedback to distinguish paused profiles,
  expansion mismatches, bound or locked items, and unavailable bank space.
- The post-save message now confirms whether the profile was saved active or
  paused, and the checkbox is immediately re-read from saved profile state.

## 1.1.0-beta.3 - 2026-07-26

- Added a 150 ms quiet period after each confirmed Smart Deposit operation to
  avoid issuing the next command during residual server processing.
- Added one conservative retry for silently rejected deposits. A retry occurs
  only after a server refresh confirms that the original bag source and bank
  destination are both unchanged.
- Added retry counts and the configured quiet period to deposit reports.
- New tab profiles are enabled by default, and selecting a category or entering
  an exact item ID enables the profile automatically.
- Added prominent **Back to Organizer** actions in both subview headers and the
  Smart Deposit footer.
- Smart Deposit setup now follows the selected guild-bank tab automatically.
- Strengthened the post-save message so the next action is unmistakable.

## 1.1.0-beta.2 - 2026-07-26

- Replaced the Blizzard-template organizer windows with one flat, code-native
  visual system designed to sit cleanly beside ElvUI.
- Fixed automatic opening on MoP Classic by supporting guild-bank
  `PLAYER_INTERACTION_MANAGER_FRAME_SHOW` and hide events.
- Prevented Compact, Settings, Smart Deposit, and Report views from stacking on
  top of one another.
- Reworked Smart Deposit setup into a three-step, tab-first flow with category
  tooltips and an immediate bag-scan result.
- Added eighteen public category rules backed by item class, subclass,
  equipment slot, or curated item IDs.
- Added per-profile expansion filters for Classic, TBC, Wrath, Cataclysm, and
  Mists of Pandaria.
- Added exact item-ID overrides for ambiguous or profession-specific items.

## 1.1.0-beta.1 - 2026-07-26

- Added per-guild Smart Deposit profiles for every purchased guild-bank tab.
- Added support for assigning multiple trade-good categories to the same tab.
- Added bag scanning and a compact-panel deposit prompt.
- Added partial-stack and empty-slot deposit planning across assigned tabs.
- Added a confirmation-driven queue with one deposit in flight at a time.
- Added deposit progress, adaptive ETA, final verification, and copyable
  reports.
- Added explicit safety stops for changed bags, changed destinations, locks,
  cursor retention, combat, and bank closure.

## 1.0.0 - 2026-07-26

Initial public release for Mists of Pandaria Classic 5.5.4.

- Added one-button sorting for the currently selected guild-bank tab.
- Added automatic consolidation of matching partial stacks.
- Added familiar bag-style ordering by quality, class, subclass, equipment
  slot, item level, vendor value, and name.
- Added normal and reverse sort directions.
- Added a compact organizer that can open automatically with the guild bank.
- Added an adaptive progress display with total moves, confirmed moves, moves
  left, and approximate time remaining.
- Added a bespoke gold-and-teal organizer icon and directional progress texture.
- Added an Advanced panel for cadence settings, scanning, diagnostics, and
  copyable reports.
- Added a validated 1.25-second minimum movement cadence.
- Added expected-state confirmation and replanning after every move.
- Added cursor, lock, permission, tab-change, combat, and bank-close safeguards.
- Added four-second failure backoff and delayed server-truth verification.
- Added persisted settings and the first public icon.
- Established the initial project copyright and visual identity.

Validation included a live 75-slot guild-bank tab sorted successfully in 72
confirmed moves without retries, lock stalls, cursor failures, or UI errors.
