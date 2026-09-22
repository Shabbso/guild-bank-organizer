# 1.2.1 maintenance validation

Base: published v1.2.0, commit `0f32a4bdd9521c2302a642ec82d41754265c143e`.
Release date: 2026-09-22. Scope: MoP Classic only. This promotes the beta.1
maintenance work and beta.2 feedback fixes with no further Lua behavior changes.
After the installed beta.2 retest, the author reported that it works very well
and authorized the official 1.2.1 release. This is a general in-game acceptance
report, not a claim that every manual edge case below passed individually.

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
- 33 targeted scenarios pass in isolated runtimes, including cancellation at
  multiple operation phases and comparator properties in both directions.
- 13 Python tests pass, including field-by-field parity for every published
  reference record and routing lookup.
- Catalog artifacts match the pinned generated source snapshot and SHA-256.
- Packaged addon runs the same Lua simulations using its actual TOC load order.
- ZIP CRC/per-file manifest checks pass; repeated builds are byte-identical.
- `git diff --check` passes.

The same correctness checks run in GitHub Actions before release. The workflow
uses read-only repository permissions and has no automatic publication step;
release artifacts are verified and published separately.

## Beta.2: native feedback and response

The user reported that opening the bank showed no eligible bag items while a
scan actually ran for approximately 10–12 seconds. Deposit repeated a lengthy
preflight, and relocating a planned linen stack stopped the operation with a
late screen update. The screenshot showed Destination tab behind its input and
crowded expansion labels. Attempting test 18 was blocked by the client; record
that manual case as not reproduced, while retaining the automated new-item test.

New scenarios cover immediate scan indicators; relevant-tab and selected-tab
query scope; reuse of an unchanged verified preview; invalidation by event, age,
changed contents or bank close; competing read ownership; a destination added
during preflight; prompt bag-change stopping; visible lock waits; and recheck
result visibility. The original editing-lock test explicitly invalidates the
preview so it continues to exercise preparation locking.

`python scripts/benchmark_deposit_start.py` compares the beta.1 commit `bc57905`
with the working candidate under identical simulated, immediate query responses:

| Eight enabled profiles, matching bag items for one tab | Beta.1 | Beta.2 |
| --- | ---: | ---: |
| Opening preview queries | 16 | 2 |
| Preview readiness | 7.6 seconds | 0.6 seconds |
| Additional queries after clicking Deposit | 16 | 0 |
| Click to first deposit with that unchanged preview | 8 seconds | 0 seconds |

These are deterministic simulation timings, not measured live MoP timings.
Native response latency and whether the preview remains valid affect actual
results. Mutation pacing and final verification remain unchanged.

The new preflight report fields (`preflightSeconds`, `preflightTabs`,
`reusedPreview`) make the remaining live delay measurable. Source and packaged
addon both pass the same regression suite.

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

The author accepted general in-game behavior after the beta.2 retest. Individual
results for every font/scale, protected-action/taint condition, concurrent guild
edit, and native memory measurement were not supplied. Those remain explicit
limits of the release evidence; RELEASE_CHECKLIST.md retains the test procedure.
Manual test 18 remains not reproduced because the client prevented withdrawal
during an active deposit. Automated coverage does not replace that missing
native observation.
