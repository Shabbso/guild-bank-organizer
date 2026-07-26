# Changelog

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
