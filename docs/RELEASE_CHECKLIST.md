# MoP maintenance release checklist

## 1.2.1 release decision (2026-09-22)

The author reported successful in-game use after the beta.2 fixes and explicitly
authorized the official release. Version 1.2.1 promotes that tested Lua code;
only the version and release documentation change. Automated checks cover the
source and packaged addon. The native checklist below remains a reusable test
procedure, not a list of individually confirmed passes. Manual test 18 was
blocked by the client and remains not reproduced.

## Automated candidate checks

- Lua 5.1 parsing, original smoke suite and targeted asynchronous regressions.
- Python taxonomy tests and field-by-field parity with the v1.2.0 catalog snapshot.
- Generated outputs match the pinned input snapshot and its SHA-256.
- ZIP contains every TOC module, expected documentation/license/media, and no
  development files; archive CRC and per-file SHA-256 manifest validate.
- Repeated package builds produce identical bytes.

## Live MoP test procedure

Use the candidate on MoP Classic with disposable test stacks, a current backup of
GuildBankOrganizerDB, and a guild tab with known permissions.

1. Reload/start the client. Confirm no Lua errors. Open organizer, profile editor,
   advanced panel, category reference and report. Check scale, docking, close/back,
   automatic save, tab switching, and category tooltip text.
2. Confirm two sequential same-tab queries reliably yield events on unchanged
   contents. Test an empty tab, a full tab, and multiple tabs. Capture reports if
   the candidate stops with refresh timeout or changing/locked state.
3. Sort partial stacks and mixed variants in both directions. Check conservation,
   final arrangement, move count/ETA, and that a second sort needs no movement.
4. Deposit into partial stacks and empty slots, this-tab and all-tabs. Confirm
   routes, partial-space reporting, bound/locked items, and no pickup of new items
   added to bags during the run.
5. Stop during preflight, an active move, between moves, retry refresh and final
   verification. Confirm no later deposit retry. Reopen and start a fresh run.
6. Close the bank, change tabs, enter combat, occupy the cursor, revoke permissions,
   and have another guild member edit a target. Confirm safe stopping and an
   unresolved/partial result where appropriate.
7. Run the two-move diagnostic. Interrupt after the first move; allow safe return.
   Repeat with changed tab/combat/permissions; confirm it stops without an unsafe
   correction and reports unresolved restoration.
8. Force/observe a delayed or rejected refresh. Use Check Again and confirm it only
   reads, retains the original report and never retries a move.
9. Copy Report before a run and after sort/deposit/diagnostic. Confirm recovery data
   appears and malformed saved profiles remain preserved rather than overwritten.
10. Check login memory before/after opening reference. Restart after rollback if
    reverting to v1.2.0; saved profiles use the existing schema.

Record client build, permissions, candidate checksum and reports. Installation,
stable version bump, merge and public release are separate subsequent actions.

## Publication checks after acceptance

- Confirm TOC/changelog versions and the All Rights Reserved license.
- Confirm normal/reverse settings survive reload in a clean installation.
- Capture the compact panel and before/after guild-bank screenshots.
- Promote the accepted beta version and attach the correct MoP Classic file
  metadata only when the stable release is authorized.

## Beta.2 focused retest

1. Open the bank with matching bag items. Expect Scanning bags immediately,
   destination progress while waiting, then enabled deposit buttons.
2. With profiles for several tabs but matching bag items for just one, confirm
   opening no longer waits through every configured tab.
3. Click Deposit soon after the preview becomes ready. Expect no repeated scan
   if it is still valid. In the report, expect `reusedPreview=true` and
   `preflightTabs=0` for that case. After expiry/changed bank contents, expect
   visible preparation for only the required destination(s).
4. Move a not-yet-deposited stack during a run. Expect a prompt stop explanation,
   with any active deposit allowed to settle. The next preview must not hide it.
5. Check that Destination tab appears fully above its input and all expansion
   labels fit between their checkboxes. The general retest was accepted; results
   at every font/UI scale were not individually recorded.
6. Manual test 18 (withdrawing a new item during depositing) was blocked by the
   client. Leave it marked not reproduced; no forced workaround is required.

## Rollback

If 1.2.1 causes a regression, close WoW and back up the current addon directory
and GuildBankOrganizerDB SavedVariables files. Replace the addon directory with
the official v1.2.0 archive from GitHub, then restart the client. The saved-profile
schema is unchanged. Retain the backup and copy the 1.2.1 report for diagnosis.
The v1.2.0 release and its asset remain available; publishing 1.2.1 does not
replace or delete that recovery artifact.
