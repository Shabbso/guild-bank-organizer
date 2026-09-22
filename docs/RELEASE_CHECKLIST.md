# MoP maintenance release checklist

The current package is a local beta candidate. Do not label it live-validated or
publish it as stable until the native checks below pass.

## Automated candidate checks

- Lua 5.1 parsing, original smoke suite and targeted asynchronous regressions.
- Python taxonomy tests and field-by-field parity with the v1.2.0 catalog snapshot.
- Generated outputs match the pinned input snapshot and its SHA-256.
- ZIP contains every TOC module, expected documentation/license/media, and no
  development files; archive CRC and per-file SHA-256 manifest validate.
- Repeated package builds produce identical bytes.

## Live MoP acceptance (pending)

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
