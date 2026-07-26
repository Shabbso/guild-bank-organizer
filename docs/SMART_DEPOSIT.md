# Smart Deposit

## Goal

Let a player create a deposit profile for each guild-bank tab, assign multiple
item categories to that profile, scan their bags when the guild bank opens, and
offer an explicit deposit plan.

Example:

> 46 items can be deposited into Tab 2 — Tailoring & Enchanting.
> 28 cloth and 18 enchanting materials in 7 bag stacks.
> Estimated time: about 9 seconds.

Nothing moves until the player clicks **Deposit**.

## Recommended user experience

### Assignments

Add a **Smart Deposits** section to the Advanced panel. Configuration should
be tab-first: select a destination tab, then enable every category that belongs
in that tab's profile.

- destination tab number and current guild-bank tab name;
- optional profile label, such as "Tailoring & Enchanting";
- a multi-select category list;
- profile enabled checkbox;
- optional item-specific include and exclude rules.

One profile can contain any number of categories. For example:

- **Tab 2 — Tailoring & Enchanting:** Cloth + Enchanting;
- **Tab 3 — Mining & Blacksmithing:** Metal & Stone + Elemental;
- **Tab 4 — Alchemy & Inscription:** Herbs + Pigments + Inks.

A category and expansion pair has one destination so an item never has two
possible routes. For example, Mists Herbs and Classic-through-Cataclysm Herbs
may use separate tabs, but two enabled profiles cannot both claim Mists Herbs.

The public categories are:

- Armor, Weapons, Trinkets, Battle Pets, Lockboxes, and Bags;
- Cloth, Leather, Herbs, Elemental, Enchanting, Jewels, Ore/Bars/Stone, and
  Inscription;
- Food, Fish & Raw Cooking, and Alchemy;
- Blacksmithing exact-item rules for non-armor items.

Rules use item class, subclass, equipment slot, and expansion ID returned by
`C_Item.GetItemInfoInstant` and `C_Item.GetItemInfo`. A short rule description
is shown in the category tooltip. Known lockboxes use an inspectable item-ID
list, which can be supplemented with exact IDs in the profile.

Two distinctions cannot be inferred perfectly from universal MoP item
metadata:

- raw fish, meat, and cooking ingredients share one Trade Goods subclass, so
  the UI labels it **Fish & Raw Cooking**;
- the API does not expose a universal “crafted by Blacksmithing” field, so
  non-armor Blacksmithing products use exact item IDs.

### Bank-open prompt

After `GUILDBANKFRAME_OPENED`:

1. Wait for bag and guild-bank data to settle.
2. Scan unlocked character-bag slots.
3. Exclude bound items and anything without loaded item information.
4. Match eligible items against the enabled tab profiles.
5. Group matches by destination tab and category.
6. Query each assigned destination tab.
7. Validate that the tab is viewable and allows deposits.
8. Plan matching partial-stack space first, then empty slots.
9. Show the total and per-category item counts, bag-stack count, deposit count,
   destination tab, and ETA.

Show one prompt row per destination tab, not one row per category:

> Tab 2 — Tailoring & Enchanting
> 28 cloth + 18 enchanting materials • 7 deposits • about 9s

Each destination row gets one **Deposit** button, plus an optional
**Deposit All Planned** action when several tabs have matches.

### Item routing precedence

Each bag item must resolve to exactly one destination:

1. explicit item exclusion;
2. explicit item-to-tab override;
3. matching category plus expansion in an enabled tab profile;
4. otherwise, leave the item in the player's bags.

This prevents overlapping category or custom-item rules from sending the same
stack to two tabs.

## Safe movement model

Smart Deposit should share the existing operation coordinator with sorting so
only one guild-bank workflow runs at a time. It should not reuse the
1.25-second intra-bank movement cadence: live testing indicates deposits can
be accepted much faster than moves within the guild bank or withdrawals.

For each planned move:

1. Re-read the source bag slot and destination guild-bank slot.
2. Confirm the source still matches the planned item and count.
3. Confirm the destination is still the expected partial stack or empty slot.
4. Pick up the full bag stack with
   `C_Container.PickupContainerItem(bag, slot)`, or use
   `C_Container.SplitContainerItem` when only part fits.
5. Deposit with `PickupGuildBankItem(tab, slot)`.
6. Confirm both the reduced bag count and increased guild-bank count.
7. After confirmation, wait through a short 150 ms quiet period before issuing
   the next deposit so residual server processing cannot overlap the next
   cursor operation.
8. Re-read and replan after every confirmation.

The operation must stop on cursor retention, slot locks, changed inventory,
permission changes, combat, bank closure, or an unexpected destination item.
It must never swap a guild-bank item back into the player's bags.

Only one deposit may be in flight at a time. A confirmation timeout should stop
the queue instead of retrying blindly. One retry is permitted only after a
fresh guild-bank query proves that the original bag source and destination
bank slot are both unchanged.

## Progress

Reuse the compact progress bar:

> Depositing Tab 2 • 3 / 7 confirmed • 4 left • about 9s

The first ETA should use a conservative deposit estimate. After each confirmed
deposit it should use the observed average confirmation time, independently
from the guild-bank sort cadence, and include the final server refresh.

## Implementation status

### Implemented in 1.1.0

- One configurable profile for every purchased guild-bank tab.
- Any number of categories assigned to each profile, including combinations
  such as Cloth + Enchanting or Herbs + Inscription materials.
- Expansion scopes for Classic, TBC, Wrath, Cataclysm, and Mists.
- Exact item-ID overrides and overlap validation.
- Metadata-backed categories with visible rule descriptions.
- Single-view setup UI and an immediate bag-scan result.
- Bag scan and aggregate compact-panel deposit preview.
- Explicit **Deposit** action for all planned tabs.
- Optional single-tab execution through `/gbo deposit <tab>`.
- Partial-stack and empty-slot planning.
- Confirmation-driven deposit queue with one operation in flight.
- Deposit-specific adaptive ETA.
- Copyable deposit report.
- Curated item-category and expansion exceptions for unreliable Classic item
  metadata.
- Scan diagnostics for soulbound, locked, expansion-filtered, unloaded,
  unclassified, permission, and no-space conditions.

### Later expansion

- A dedicated review screen with one preview row and **Deposit** button per
  destination tab.
- Item-specific exclusion rules.
- Combined deposit plan across several tabs.
- Optional prompt suppression per character.

## Required live calibration

Before public release:

1. Deposit one ordinary herb stack into an empty slot.
2. Deposit into a matching partial stack.
3. Split a bag stack across limited partial-stack capacity.
4. Deposit into a non-selected assigned tab.
5. Test a full destination tab.
6. Test a tab without deposit permission.
7. Stop during an active deposit and confirm the cursor is empty.
8. Run at least ten consecutive confirmation-driven deposits and record the
   fastest stable observed interval.
9. Repeat under higher latency and verify the queue naturally slows down.
10. Confirm bag counts and guild-bank counts after a delayed final query.
