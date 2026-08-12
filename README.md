# Guild Bank Organizer

One-button, rate-limited guild-bank sorting for World of Warcraft: Mists of
Pandaria Classic.

Guild Bank Organizer stacks, compacts, and sorts the currently selected
guild-bank tab through a small panel that opens beside the bank. It has no
required libraries and does not require ElvUI.

Before moving an item, it calculates how many operations the selected tab
needs. The compact panel then shows confirmed moves, moves left, and an
approximate completion time that adapts to the server's observed response.

## Features

- Sorts only the tab you currently have selected.
- Consolidates matching partial stacks before sorting.
- Uses familiar bag-style ordering:
  - quality;
  - item class and subclass;
  - equipment slot where applicable;
  - item level;
  - vendor value;
  - item name.
- Supports normal and reverse directions.
- Confirms every move before continuing.
- Re-reads and replans after each confirmed operation.
- Shows total moves, confirmed moves, moves left, and a live ETA.
- Uses a validated 1.25-second minimum movement cadence.
- Stops on unexpected cursor, lock, permission, combat, tab, or bank state.
- Saves copyable diagnostic reports for troubleshooting.

## Installation

Install with the CurseForge app, or extract the release ZIP into:

```text
World of Warcraft/_classic_/Interface/AddOns/
```

The installed layout should be:

```text
Interface/AddOns/GuildBankOrganizer/GuildBankOrganizer.toc
```

Restart the game or run `/reload`.

## Usage

1. Open the guild bank.
2. Select the tab you want to organize.
3. Click **Sort This Tab**.
4. Leave that tab selected and avoid moving items until the operation finishes.

A busy tab can take one or two minutes because the addon deliberately waits
between moves. After clicking **Sort Tab**, the compact panel calculates the
work before the first move and shows:

- confirmed moves out of the current estimate;
- how many moves remain;
- an approximate time remaining;
- the active preparation, sorting, or verification phase.

The plan and ETA are refined after every confirmed move. They can adjust if
stack consolidation or fresh server state changes the remaining work.

### Smart Deposit

Guild Bank Organizer can scan character bags and offer to deposit assigned categories
into guild-bank tabs:

1. Open the guild bank and click **Set Up** in the Smart Deposit card.
2. Use the currently selected bank tab, or load another destination tab.
3. Select every category that belongs there, such as Cloth and Enchanting.
4. Choose **All** expansions, or select Classic/TBC/Wrath/Cata/Mists.
5. Enable the profile, then click **Scan Bags Now** for a preview.

Valid changes save automatically. Checkboxes save as soon as they are toggled;
the profile name and exact item-ID field save on Enter or when keyboard focus
leaves the field. The editor also saves before **Scan Bags Now**, **Load Tab**,
**Use Current**, **Back to Organizer**, or closing the page. **Save Now** is an
optional explicit confirmation and uses the same validation. Invalid edits stay
visible with an explanation and never replace the last valid saved profile.
Exact item IDs must be positive whole numbers separated by commas, whitespace,
or both. Profile controls are temporarily locked during an active Smart Deposit
scan or move queue so its routing cannot change in flight; editing becomes
available again when the operation finishes or is stopped. Saved profiles are
stored per guild and survive logout and `/reload`.

Each purchased tab can have its own profile, and each profile can accept
multiple categories. The same category may be routed to different tabs when
their expansion filters differ. Optional exact item IDs handle unusual
lockboxes or crafted items whose profession is not present in item metadata.
Routing always chooses the most specific match: an exact item ID beats a
category route, and a specific-expansion category route beats an **All
Expansions** fallback. If two tabs have equally specific legacy routes, the
conflict names both tabs and the affected item stays in the player's bags;
unrelated items can still be deposited.
When matching items are found, the compact panel shows the item and deposit
counts for two explicit choices:

- **Deposit This Tab** moves only items assigned to the guild-bank tab you are
  currently viewing. This is always the primary action.
- **Deposit All Tabs** routes eligible bag items to every enabled tab profile.
  It is always a separate choice and is never remembered as a default.

If the open tab has no matching items but another configured tab does, the
current-tab action remains disabled while the all-tabs action shows the full
available count. The addon never redirects one action into the other.

Deposits use a separate confirmation-driven queue and are not held to the
1.25-second intra-bank sorting cadence. The queue waits 150 ms after each
confirmed deposit before issuing another command. If the server silently
rejects one command, the addon refreshes both endpoints and retries once only
when the bag source and bank destination are provably unchanged. Nothing moves
until the player clicks one of the two explicit deposit actions.

Category rules are based on the client item class, subclass, equipment slot,
profession recipe graph, specialized-bag metadata, source-backed item era, or
an explicit item-ID list. MoP Classic can report
the unusable expansion value `254`; GBO resolves the era from Blizzard client
item data bundled as compact correction ranges. Hover a category in setup to
see the exact rule. The generated MoP profession catalog covers pigments,
inks, Engineering parts, profession recipes, bandages, oils, dyes, and other
objects that the game's broad item class cannot identify reliably. A small,
reviewed set of materials with several defensible owners uses **Shared Crafting
Reagents**, avoiding overlapping tab routes. Obvious parchment, vellum, dyes,
vials, and similar supplies instead use their intuitive profession category.
The client combines raw fish,
meat, and other cooking ingredients, so that public category is intentionally
named **Fish & Cooking**. Armor, Weapons, Cloth, Ore, Leather, Herbs, and
Elemental materials keep their intrinsic categories even when a profession
creates or consumes them.

Archaeology profiles cover its bankable keystone items. Archaeology fragments
are currencies rather than bag items, so there is nothing for Smart Deposit to
move for those currencies.

The generated audit currently gives every statically bank-eligible item in its
MoP profession universe one organizational category. See
[`docs/PROFESSION_COVERAGE.md`](docs/PROFESSION_COVERAGE.md) for the exact
counts, sources, limitations, shared-item list, and reproduction command.

If a scan finds no deposits, the setup status explains whether the profile is
paused, an expansion filter excluded matching items, matching items are bound
or locked, a material lacks a supported category rule, or the destination tab
lacks usable space or deposit access.
Temporarily locked items are rescanned for up to three seconds and the compact
plan refreshes automatically when WoW reports that an item unlocked.

Click **Settings** for:

- automatic-open and reverse-direction settings;
- sort-cadence configuration;
- a searchable **Category Reference** with definitions, examples, exact
  numeric item-ID lookup, and the complete Shared Crafting Reagents list;
- read-only scanning;
- movement diagnostics;
- copyable operation reports.

If sorting stops, open **Advanced**, click **Copy Report**, then use Ctrl+A and
Ctrl+C to copy the timeline into a bug report.

## Slash commands

- `/gbo` or `/gbo ui`
- `/gbo sort [cadence]`
- `/gbo advanced`
- `/gbo deposits`
- `/gbo deposit [tab]`
- `/gbo scan`
- `/gbo test <tab> <source> <empty> [cadence] [moves]`
- `/gbo status`
- `/gbo stop`
- `/gbo report`
- `/gbo help`

## Safety model

Guild-bank operations are server-authoritative and rate-limited. The addon:

- issues no more than one planned operation per configured cadence;
- confirms the expected unlocked source and destination state;
- stops instead of continuing when observed state diverges;
- clears a retained cursor item and backs off before refreshing;
- performs a delayed final query before declaring success.

Do not manually interact with the guild bank while an operation is running.

## Compatibility

- World of Warcraft: Mists of Pandaria Classic
- Interface: `50504`
- Tested client: `5.5.4`

The project currently targets MoP Classic only. Retail, Classic Era, Cataclysm
Classic, and other clients should not be marked compatible without separate
testing.

## Source and support

- Source: https://github.com/Shabbso/guild-bank-organizer
- Issues: https://github.com/Shabbso/guild-bank-organizer/issues

The source is publicly viewable for transparency and issue reporting. Public
availability does not grant permission to copy, modify, redistribute, or
publish derivative versions; see the license below.

## License

Copyright (c) 2026 Eric Beane. All rights reserved. Official, unmodified
releases may be downloaded, installed, and used for personal, non-commercial
use. Copying, modification, redistribution, or derivative use requires prior
written permission. See [`LICENSE`](LICENSE) for the complete terms.

## Development

Run the off-client Lua parser and mocked WoW lifecycle test from the repository
root:

```sh
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
python3 scripts/generate_profession_data.py
```

Build a release:

```sh
./scripts/package.sh
```
