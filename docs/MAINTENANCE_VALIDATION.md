# 1.2.1-beta.1 maintenance validation

Base: published v1.2.0, commit `0f32a4bdd9521c2302a642ec82d41754265c143e`.
Candidate date: 2026-09-22. Scope: MoP Classic only. The installed addon and
published release remain unchanged. Native acceptance is pending.

## Audit coverage

| Finding | Candidate change | Evidence |
| --- | --- | --- |
| Stop still allowed a rejected deposit retry | Stop checked before retry/mutation; in-flight settlement remains observational | `stop_before_retry`, `stop_operation_phases` |
| Missing refresh accepted cached success | Shared paced read owner/request/phase; stable snapshots, bounded timeout; read-only recheck | `sort_no_final_reply`, `deposit_no_query_replies`, `read_only_recheck` |
| Locked remaining items disappeared from completion | Per-source original-intent ledger; bounded wait; unresolved counts | `deposit_locked_remaining`, `deposit_transient_lock` |
| Earlier tab timeout consumed later tab | Per-query timeout ownership | `scanner_old_timeout`, `canceled_read_callback` |
| Diagnostic movement lacked changing-state guards | Combat, selected tab, cursor, permission and slot guards also apply to corrections | `diagnostic_combat`, `diagnostic_guard_changes`, `diagnostic_tab_changed` |
| Every Save scanned and locked editing | Equality/routing checks; editable debounced previews | `save_triggers_editor_lock`, `profile_preview_editable` |
| Recovery report required an earlier diagnostic | Current configuration/recovery appendix for any report, including before first run | `idle_ui_and_report`, original recovery smoke assertions |
| Leatherworking tooltip conflicted with armor-kit routing | Clarified the description; routing data unchanged | Catalog parity tests |
| Reference allocated large tables at login | Compact encoded text, decode only on reference lookup | `reference_lazy`, catalog parity, heap measurement below |
| Large UI module and idle updates | Six UI modules; coalesced events; active-operation ticker only | Original UI smoke coverage, `idle_ui_and_report` |
| Duplicated scheduling and safety rules | Shared Operations.lua and Reports.lua; separate mutation cadence policies | Lifecycle regression suite |
| Whole-sort estimate recalculated every move | Recalculate every eight confirmations; fresh mutation snapshots retained | Original sorting/ETA smoke coverage |
| Comparator variant cycle | Consistent ordering key; full link identity in expected states | `same_id_variant_order`, `sort_total_order` |
| Tests shared an optimistic cache/server state | Added delayed reads, separate server rollback, locks, permission changes, cancellation and unrelated events | `separate_server_cache` and targeted scenarios |
| Weak release/data reproducibility | Lua 5.1 CI; pinned catalog snapshot/provenance; deterministic ZIP and manifest | Python artifact tests, `check_catalog.py`, packaged simulations |

## Automated evidence

- Original smoke suite passes under Lua 5.1 through Lupa 2.8.
- 24 targeted scenarios pass in isolated runtimes, including cancellation at
  multiple operation phases and comparator properties in both directions.
- 13 Python tests pass, including field-by-field parity for every published
  reference record and routing lookup.
- Catalog artifacts match the pinned generated source snapshot and SHA-256.
- Packaged addon runs the same Lua simulations using its actual TOC load order.
- ZIP CRC/per-file manifest checks pass; repeated builds are byte-identical.
- `git diff --check` passes.

GitHub Actions is configured but has not run remotely for this local candidate.
Checks above run locally; the workflow uses read-only repository permissions and
has no publication step.

## Memory measurement

`python scripts/benchmark_catalog.py`, Lupa Lua 5.1, garbage collection before each
measurement, profession modules only:

| State | v1.2.0 | Candidate |
| --- | ---: | ---: |
| Retained heap after loading | 4,422.91 KiB | 640.47 KiB |
| After first reference lookup | 4,422.91 KiB | 4,425.20 KiB |

This is an **85.5% reduction in login-time profession-module heap** in the offline
runtime. The full reference costs approximately the same once opened. These
numbers do not measure total addon memory, game FPS, or native-client allocation.

## Practical limits

Untyped slot events cannot identify the responding tab or query. The tests show
that one unrelated event and absent responses do not pass; they do not establish
that arbitrary repeated unrelated events can never look like a response. The
stable-snapshot check is deliberately described as client-observable evidence.

The original CSV inputs are unavailable. The snapshot preserves the published
5.5.4.68806 catalog and records its hash; future regeneration records raw CSV
hashes. There is no claim of a new live taxonomy audit.

Visual layout, real query throttling, protected actions/taint, concurrent guild
members, and native memory measurements require the steps in RELEASE_CHECKLIST.md.
The candidate is ready for those tests, not a stable/public release declaration.
