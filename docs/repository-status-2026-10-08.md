# Cross-repository status — 2026-10-08

Snapshot of `senshac-workspace` and its five focused repositories, checked against fetched `origin/main` on 2026-10-08. Each local `main` is clean and exactly aligned with `origin/main`. The remote repositories had no open PRs at audit time. Local checkpoint branches remain unpushed.

## Current Seeds, plans, and Mulch

| Repository | Seeds totals | Open items | Plans on synced `main` | Mulch records | Mulch health |
| --- | ---: | --- | --- | ---: | --- |
| `senshac-workspace` | 20: 9 open, 11 closed | `senshac-workspace-c714`, `senshac-workspace-83d8`, `senshac-workspace-c9f9`, `main-f86f`, `senshac-workspace-74f5`, `senshac-workspace-a51d`, `senshac-workspace-e238`, `senshac-workspace-0f80`, `senshac-workspace-3f03` | `pl-535f` approved | 2 | 16 checks pass; 0 stale records after confirming 2 outcomes |
| `senshac-web` | 20: 7 open, 13 closed | `0fc7`, `4828`, `16e0`, `cc1c`, `3466`, `8012` (blocked), `7174` | `pl-4c11`, `pl-7e2a` approved | 37 | 16 checks pass; 29 stale records |
| `senshac-content` | 5: 2 open, 3 closed | `4d42`, `6158` | none | 2 | 16 checks pass; 1 stale record |
| `senshac-infra` | 3: 1 open, 2 closed | `3e90` | none | 1 | 16 checks pass; 1 stale record |
| `senshac-runner` | 29: 2 open, 27 closed | `9ae7`, `ratchetwatch-1791090224` | `nightwatch-2026-10-04-001` open | 63 | 16 checks pass; 9 stale records |
| `senshac-media-runner` | 3: 2 open, 1 closed | `83ab`, `b59d` | none | 2 | 16 checks pass; 1 stale record |

Open Seeds are summarized below. Use `seeds show <id>` in the owning repo for full acceptance and dependency details.

- Workspace: `c714` cutover acceptance; `83d8` platform cutover; `c9f9` editorial migration; `f86f` legacy cutover; `74f5` portable agent skills; `a51d` archived monitoring; `e238` documentationwatch; `0f80` deferred Buzz/Warren bridge; `3f03` checkpoint/Tracker reconciliation.
- Web: `0fc7` missing constitution; `4828` stale `dist` can mislead Playwright E2E; `16e0` coverage floors; `cc1c` content-config size exception; `3466` gatewatch PR-title finding; `8012` blocked coverage slack; `7174` tastewatch digest.
- Content: `4d42` missing constitution; `6158` tastewatch digest.
- Infra: `3e90` missing constitution.
- Runner: `9ae7` missing constitution; `ratchetwatch-1791090224` missing ratchets.
- Media-runner: `83ab` missing constitution; `b59d` tastewatch digest.

Mulch validation passed in all six repositories, with stale-record warnings summarized above. Workspace Engram's last available audit showed 281 observations; no child-repository Engram project data was registered then. Agent-attributed Engram writes remain blocked until the host registers its runtime identity. One explicit CLI/manual project observation (`#1577`) records this cleanup snapshot without session attribution; it does not register the runtime.

## Local branch and checkpoint state

All six `main` branches are clean and match their current `origin/main` tips. A local-only branch, `wip/pre-main-cleanup-20261008`, preserves each pre-sync checkout and its dirty files:

| Repository | Synced `main` | Local checkpoint | Notes |
| --- | --- | --- | --- |
| Workspace | `d927bf5` | `48ffed3` | Contains local WEB-1 plan `pl-41ea` and children; these are absent from synced `main`. Also contains a prior status draft and Warren governance changes. |
| Web | `c66124d` | `6a6a959` | Contains `.engram/`/`.devenv/` ignore changes, tracked `devenv.lock`, and a local Seeds metadata edit. |
| Content | `9ae2fe2` | `171cf83` | Checkpoint includes merged PR #36 commit `327c05c`; review its diff against current main before reusing any content. |
| Infra | `dae52fb` | `3a05e36` | Contains local Warren config, triggers, and a Constitution draft. |
| Runner | `f790211` | `2fd2a8b` | Contains local Warren config, triggers, and a Constitution draft. |
| Media-runner | `20937e0` | `d5393cb` | Contains local Warren config, triggers, and a Constitution draft. |

The Constitution draft carries provenance and metrics from outside these repositories; verify or replace that material before proposing it. Two web branches also remain because they contain an extra unmerged Warren config commit beyond their merged PRs. Active Tina worktrees remain preserved. Sixteen merged local branch refs and stale remote-tracking refs were cleaned; no remote branches were changed.

WEB-1 implementation appears substantially delivered after the local plan was authored: web PR #138 (`feat(inquiry): add adaptive situation and service flow`) and content PR #45 (`feat(content): add adaptive service inquiry routing`) are merged. GitHub reports PR #138 contract/readiness checks successful. Local verification on synced `main`: web inquiry/contact tests 9/9, content inquiry/localization/CTA tests 8/8, and inquiry/expansion Playwright E2E 5/5 after rebuilding current `dist`. Current web code renders both editable selectors in `src/components/ContactForm.astro` and validates situation/service pairs in `src/utils/inquiry-contract.mjs`; current content carries localized home/service preselection links and routing tests. The first E2E attempt used a Sep 27 `dist`; `playwright.config.ts` only checks `test -d dist`, so it skipped rebuild and produced 4 false failures. Follow-up Seed `senshac-web-4828` and Mulch failure record track this test setup defect. The old workspace plan is still only on the local checkpoint. Restore it to canonical Seeds with test/PR evidence or close it as superseded; avoid reimplementing already-merged work.

`.engram/` is locally excluded in each repository. Ignore rules and the web lockfile are preserved on the checkpoint branches for review; the synced `main` branches remain clean.

## Coordination and next work

Tracking issue created on this local report branch: `senshac-workspace-3f03` — reconcile checkpoint branches, restore/replace WEB-1 tracker state, refresh Mulch, and write Engram records after runtime registration. It becomes canonical only when this branch is reviewed and merged.

1. Reconcile local checkpoint changes against the synced bases; split useful changes into focused PR branches and leave superseded state archived.
2. Restore or revalidate workspace WEB-1 plan `pl-41ea` and its child issues from the local checkpoint before treating the old plan as canonical.
3. Fix the stale-dist E2E setup tracked by `senshac-web-4828`; validate its change with the same focused Playwright suite.
4. Triage the open constitution/coverage/ratchet/tastewatch Seeds in their owning repos; update Mulch only after verifying stale records against current docs and code.
5. Register the runtime via the host startup/resume hook, then write cross-repo Engram observations with valid session attribution.
6. Keep deployments, DNS, and WordPress out of scope; the WEB-1 acceptance plan requires local verification only.
