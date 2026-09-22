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

## Current release: 1.2.1

- **Project:** https://www.curseforge.com/wow/addons/guild-bank-organizer
- **Project ID:** 1626833
- **File:** `dist/GuildBankOrganizer-1.2.1.zip`
- **Display name:** Guild Bank Organizer 1.2.1
- **Release options:** Release when approved
- **Release type:** Release
- **Supported version:** Mists of Pandaria Classic 5.5.4 only
- **Related projects:** None
- **Changelog:** Copy [the 1.2.1 release notes](releases/1.2.1.md).
- **Description:** Copy [the updated project description](CURSEFORGE_DESCRIPTION.md).

The existing project summary, categories, license, logo, source link and gallery
can remain as configured. This update uses the same verified ZIP as GitHub.
The description and changelog are separate fields; do not paste this release
kit or the entire historical changelog into either field.

## Previous publication metadata

The sections below record earlier uploads. Use the current release fields above
for 1.2.1.

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
