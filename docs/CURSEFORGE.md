# CurseForge release kit

This file contains copy-ready metadata for CurseForge publication and updates.

## Project fields

- **Game:** World of Warcraft
- **Project name:** Guild Bank Organizer
- **Summary:** Safe one-click guild-bank sorting and profile-based material deposits for MoP Classic.
- **Class:** Addons
- **Main category:** Bags & Inventory
- **Additional categories:** Guild; Professions
- **Allow comments:** On
- **Experimental:** Off
- **License:** All Rights Reserved
- **Logo:** `assets/guild-bank-organizer-logo.png`
- **Source:** https://github.com/Shabbso/guild-bank-organizer
- **Issues:** https://github.com/Shabbso/guild-bank-organizer/issues

Choose CurseForge's built-in **All Rights Reserved** option. If CurseForge
instead presents a custom-license text box, paste the complete repository
`LICENSE` into it.

The project name intentionally omits the game and version. CurseForge's current
moderation policy asks authors to put technical compatibility information in
the description and file tags instead of the project name.

## Description

Copy everything below this line into the CurseForge description editor.

---

# Keep your guild bank organized—without outrunning the server

Guild Bank Organizer adds a compact control panel beside the guild bank in
**World of Warcraft: Mists of Pandaria Classic**. It safely stacks, compacts,
and sorts the selected bank tab, then helps route profession materials from
your bags into the tabs you assign.

It is designed around the guild bank's server-side movement limits. Every
sorting move is confirmed before the next begins, progress is shown in real
time, and the operation stops if the observed bank state becomes unsafe or
unexpected.

## One-click tab sorting

Select a guild-bank tab and click **Sort This Tab**. The addon will:

- consolidate matching partial stacks;
- compact items into the earliest available slots;
- arrange items using familiar bag-style priorities;
- show the estimated moves, moves remaining, and a live ETA;
- verify every move and replan from fresh bank state;
- perform a delayed server refresh before declaring success.

Sorting uses a live-tested 1.25-second minimum cadence for MoP Classic guild
banks. Busy tabs can take a minute or two, but the progress display always
shows what remains.

## Smart Deposit

Create a profile for each guild-bank tab, choose what belongs there, and let
the addon scan your bags for eligible items.

A single tab can accept multiple categories—for example:

- Cloth + Enchanting;
- Herbs + Alchemy + Inscription;
- Ore, Bars & Stone + Elemental;
- Food + Fish & Raw Cooking;
- Leather + Armor.

Profiles can also be filtered by expansion:

- Classic;
- The Burning Crusade;
- Wrath of the Lich King;
- Cataclysm;
- Mists of Pandaria.

Optional exact item IDs handle unusual items that Blizzard's general item
metadata cannot categorize reliably. Bound items are never included in a
deposit plan.

When eligible materials are found, the compact panel shows separate counts for
the open tab and all configured tabs. Nothing moves until you explicitly click
**Deposit This Tab** or **Deposit All Tabs**.

Valid profile edits save automatically and survive `/reload`; **Save Now** is
available when you want explicit confirmation. Exact item-ID routes override
category routes, specific-expansion routes override **All Expansions**, and
equal-priority conflicts leave the affected item in your bags while naming
both destination tabs.

Advanced settings also includes a searchable **Category Reference**. It shows
the addon's actual classification, expansion, routing evidence, exact-ID
diagnostics, category examples, and the complete Shared Crafting Reagents list.

## Safety and useful diagnostics

Guild Bank Organizer:

- runs only one bank operation at a time;
- checks view and deposit permissions;
- confirms the source and destination of every operation;
- stops on unexpected cursor, lock, combat, tab, bag, or bank changes;
- waits for temporarily locked bag items and rescans automatically;
- retries a rejected deposit only after proving both endpoints are unchanged;
- creates copyable diagnostic reports for troubleshooting.

If an item cannot be deposited, setup explains whether it is soulbound,
temporarily locked, filtered by expansion, not yet loaded, unclassified, or
blocked by tab access or available space.

## Getting started

### Sort a tab

1. Open the guild bank.
2. Select the tab you want to organize.
3. Click **Sort This Tab**.
4. Leave the bank and selected tab alone until verification finishes.

### Configure Smart Deposit

1. Open the guild bank and click **Set Up** or **Edit** under Smart Deposit.
2. Choose the destination tab.
3. Select every item category that belongs there.
4. Choose **All** expansions or select specific eras.
5. Enable the profile; valid changes save automatically.
6. Click **Scan Bags Now**, return to the organizer, and choose **Deposit This
   Tab** or **Deposit All Tabs**.

## Commands

- `/gbo` — open the organizer
- `/gbo sort` — sort the selected tab
- `/gbo deposits` — open Smart Deposit setup
- `/gbo scan` — refresh the bank and deposit plan
- `/gbo stop` — stop the active operation
- `/gbo report` — open the latest copyable report
- `/gbo help` — show every command

## Compatibility

- World of Warcraft: Mists of Pandaria Classic
- Interface: 50504
- Tested client: 5.5.4
- No required dependencies
- ElvUI is supported but not required

Retail, Classic Era, Cataclysm Classic, and other clients are not currently
supported.

Guild Bank Organizer is an independent addon and is not affiliated with or
endorsed by Blizzard Entertainment, ElvUI, Overwolf, or CurseForge.

---

## First file upload

- **File:** `dist/GuildBankOrganizer-1.1.0.zip`
- **Display name:** Guild Bank Organizer 1.1.0
- **Release options:** Release when approved
- **Release type:** Release
- **Supported version:** Mists of Pandaria Classic 5.5.4
- **Related projects:** None

Use **Release**, not Beta or Alpha. CurseForge requires at least one Release
file before a project normally appears in the CurseForge App.

## File changelog

Copy the following into the upload's Changelog field:

### Guild Bank Organizer 1.1.0

- Safely stacks, compacts, and sorts the currently selected guild-bank tab.
- Shows estimated moves, confirmed moves, moves left, and an adaptive ETA.
- Adds Smart Deposit profiles with multiple categories per bank tab.
- Adds Classic-through-Mists expansion filters and exact item-ID overrides.
- Confirms every sort and deposit operation against fresh game state.
- Adds conservative retry and final verification for Smart Deposits.
- Opens a compact organizer panel automatically with the guild bank.
- Includes modern separate views for organizer, setup, settings, and reports.
- Provides clear diagnostics and copyable troubleshooting reports.
- Requires no external libraries.

## Recommended gallery images

Upload genuine in-game screenshots rather than design mockups:

1. **Organizer panel** — clean bank tab with the compact panel open.
2. **Sorting in progress** — progress bar, moves left, and ETA visible.
3. **Smart Deposit setup** — a profile with multiple categories selected.
4. **Smart Deposit ready** — eligible item and deposit counts visible.
5. **Before and after** — the same tab before and after sorting.

Crop out chat, character names, guild names, auction pricing overlays, and
unrelated UI where practical. Do not use `assets/ui-concept-smart-deposit.png`
as an in-game screenshot; it is a design concept rather than gameplay evidence.

Suggested gallery captions:

- **Safe one-tab sorting** — Stack, compact, and organize the selected tab with
  confirmed moves and a live ETA.
- **Flexible Smart Deposit profiles** — Assign multiple professions and
  expansion eras to each guild-bank tab.
- **Know what will move** — Preview eligible items and deposits before
  authorizing any bag movement.

## Submission checklist

1. Create a World of Warcraft project in the CurseForge author dashboard.
2. Paste the project fields and description above.
3. Select **All Rights Reserved**. If only a custom editor is offered, paste
   the complete `LICENSE`.
4. Upload the 512×512 PNG project logo.
5. Upload the stable ZIP as a **Release** file.
6. Select only the supported MoP Classic 5.5.4 game version.
7. Paste the file changelog above.
8. Leave dependencies empty.
9. Add at least one clean, genuine in-game screenshot to the gallery.
10. Confirm the archive contains
    `GuildBankOrganizer/GuildBankOrganizer.toc`.

For the CurseForge **Source** tab, choose GitHub, enter
`https://github.com/Shabbso/guild-bank-organizer`, and leave **Automatic
Packaging** set to **No automatic packaging** for the initial release.

## Version 1.1.1 update

- **File:** `dist/GuildBankOrganizer-1.1.1.zip`
- **Display name:** Guild Bank Organizer 1.1.1
- **Release options:** Release when approved
- **Release type:** Release
- **Supported version:** Mists of Pandaria Classic 5.5.4
- **Related projects:** None

Copy the following into the upload's Changelog field:

### Guild Bank Organizer 1.1.1

- Fixed Smart Deposit expansion filtering for cloth and every other supported
  category when MoP Classic reports the unusable expansion value `254`.
- Added reliable Classic-through-Mists item-era data for expansion profiles.
- Added Enchanting Vellum to the Enchanting category.
- Improved profile-conflict guidance when **All expansions** overlaps another
  assigned tab.
- Added regression coverage for expansion-era boundaries and affected item
  categories.

## Version 1.2.0 update

- **File:** `dist/GuildBankOrganizer-1.2.0.zip`
- **Display name:** Guild Bank Organizer 1.2.0
- **Release options:** Release when approved
- **Release type:** Release
- **Supported version:** Mists of Pandaria Classic 5.5.4
- **Related projects:** None

Copy the following into the upload's Changelog field:

### Guild Bank Organizer 1.2.0

This release substantially expands Smart Deposit while preserving the
server-safe sorting and move confirmation introduced in earlier versions.

#### Smarter deposit controls

- Added separate **Deposit This Tab** and **Deposit All Tabs** actions so the
  scope is always explicit.
- Added scope-specific item totals, deposit counts, progress, reports, and one
  clear **Stop** control.
- Kept deposits confirmation-driven with adaptive timing, conservative retry
  handling, and final server refresh verification.

#### Complete profession categorization

- Added a generated MoP Classic profession catalog covering 8,377 public,
  bank-eligible profession records with zero uncovered items or unreviewed
  multi-profession assignments.
- Added Engineering, Tailoring, Leatherworking, First Aid, Archaeology, and
  **Shared Crafting Reagents** categories.
- Assigned obvious parchment, vellum, dyes, vials, pigments, inks, scrolls,
  schematics, bandages, keystones, and other supplies to intuitive categories.
- Removed reviewed deprecated, obsolete, unused, test, placeholder, and
  programmer-only records from public routing and search suggestions.

#### Profiles that reliably persist

- Made valid Smart Deposit profile changes save automatically and survive
  `/reload`; **Save Now** remains available as explicit confirmation.
- Added migration and recovery diagnostics for malformed legacy profile data
  instead of silently discarding it.
- Locked profile editing while a scan or deposit is active so destinations
  cannot change during an authorized operation.

#### Predictable routing and clearer conflicts

- Made exact item-ID routes override categories.
- Made specific-expansion category routes override **All Expansions**.
- Added equal-priority conflict warnings that identify both destination tabs
  and leave the conflicted item safely in the player's bags.
- Added strict exact-ID validation; invalid entries no longer overwrite the
  last valid profile.

#### Category Reference and UI polish

- Added **Advanced → Category Reference**, with searchable classifications,
  expansion labels, category explanations, examples, exact-ID diagnostics,
  and the complete Shared Crafting Reagents list.
- Added visible outlines to unchecked expansion filters and clearer selected
  states.
- Expanded automated regression coverage across categorization, persistence,
  migration, routing precedence, conflicts, deposit scope, and active-run
  safety.
