# 0001: Shared refresh lifecycle and deferred reference records

Status: implemented in the 1.2.1-beta.1 candidate; live acceptance pending.

## Problem

Published v1.2.0 used different refresh fallbacks across scanning, sorting,
depositing, and diagnostics. A timeout could accept cached contents; an old tab's
timer could consume the next tab's state; Stop could still allow a deposit retry.
The reference catalog also allocated thousands of records at login, and a large
single UI module repeatedly refreshed hidden panels.

## Decision

`Operations.lua` owns one pending read, identified by an owner object, request
identity, and query phase. Mutating routines keep their separate timing policies.
Queries are at least 0.5 seconds apart, preserving the published scanner's pacing.
After post-query slot activity quiets for 0.1 seconds, read the tab. Require a
matching unlocked snapshot after a second query; allow a third for a changing
first pair, then fail conservatively. Each issued query times out after 3 seconds.
Cancellation removes ownership; late callbacks cannot call the canceled owner.

WoW slot events have no tab/request ID. Two unrelated event bursts could still
satisfy the observable condition; the implementation cannot prove server receipt.
No response and unstable/locked contents produce an incomplete result. The user
can check again without issuing any item moves. This action preserves original
history and evaluates a current-session result against fresh observations.

Smart Deposit keeps a per-source ledger from the starting plan. Full link and
count comparisons constrain the run to that intent. Completed destinations are
checked again after refresh. New bag arrivals stay outside the run. A blocked
source receives a bounded wait; it remains unresolved if it cannot be processed.

Shared scheduling, bank-action guards and timeline helpers reduce duplicated
lifecycle rules without combining sort/deposit/diagnostic state machines.

UI modules share the private `GBO.UI` namespace: widgets, status, panels, reference,
profiles, and lifecycle. Saved profile routing changes queue a debounced editable
preview; explicit scans and active movement keep editing locked. Events coalesce
refreshes, while visible active operations retain a 0.25-second progress ticker.

Generated routing maps remain eager. Reference records use compact encoded text
and decode on first reference lookup, then release the packed payload. This avoids
a second addon folder and addon-loader failure modes. Opening reference still
incurs its full table cost; this is deferred allocation, not a smaller full catalog.

## Consequences

- Queries may take longer and can stop conservatively on missing events. Live
  testing must confirm that repeated same-tab queries produce the expected events.
- Stop prevents new deposit mutations but allows observation of an in-flight move.
  Diagnostic cancellation may restore the original item only while guards allow it.
- Full item links distinguish variants; ordering uses consistent keys in both
  normal and reverse directions.
- Sort mutation planning remains fresh per move. The expensive whole-plan estimate
  refreshes every eight confirmations, so displayed ETA is explicitly approximate.
- Generated CSV input hashes are recorded on future rebuilds. The inherited
  published snapshot is identified by its own hash and release commit; missing
  original CSV provenance is stated rather than invented.
- Native appearance, taint/protected actions, real throttling, and concurrent guild
  edits remain client tests. Offline simulations do not certify those behaviors.
