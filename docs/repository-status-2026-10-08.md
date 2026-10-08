# Cross-repository status — 2026-10-08

Snapshot of `senshac-workspace` and its five focused repositories, checked against fetched `origin/main` on 2026-10-08 and refreshed after workspace PRs #33–#37, web #149, content #52–#54, infra #25–#27, runner #94–#95, and media-runner #28–#29 merged, then rechecked on 2026-10-08 (workspace baseline before this report-only PR: `0b916e6`). Each local `main` is clean and exactly aligned with `origin/main`. No repo had open PRs at the initial audit; all listed follow-up PRs are now merged. Local checkpoint branches remain unpushed.

## Current Seeds, plans, and Mulch

| Repository | Seeds totals | Open items | Plans on synced `main` | Mulch records | Mulch health |
| --- | ---: | --- | --- | ---: | --- |
| `senshac-workspace` | 21: 9 open, 12 closed | `senshac-workspace-c714`, `senshac-workspace-83d8`, `senshac-workspace-c9f9`, `main-f86f`, `senshac-workspace-74f5`, `senshac-workspace-a51d`, `senshac-workspace-e238`, `senshac-workspace-0f80`, `senshac-workspace-3f03` | `pl-535f` approved | 2 | 16 checks pass; 2 stale records |
| `senshac-web` | 20: 6 open, 14 closed | `0fc7`, `16e0`, `cc1c`, `3466`, `8012` (blocked), `7174` | `pl-4c11`, `pl-7e2a` approved | 37 | 16 checks pass; 28 stale records |
| `senshac-content` | 5: 2 open, 3 closed | `4d42`, `6158` | none | 2 | 16 checks pass; 1 stale record |
| `senshac-infra` | 3: 1 open, 2 closed | `3e90` | none | 1 | 16 checks pass; 1 stale record |
| `senshac-runner` | 29: 2 open, 27 closed | `9ae7`, `ratchetwatch-1791090224` | `nightwatch-2026-10-04-001` open | 63 | 16 checks pass; 13 stale records |
| `senshac-media-runner` | 3: 2 open, 1 closed | `83ab`, `b59d` | none | 2 | 16 checks pass; 1 stale record |

Open Seeds are summarized below. Use `seeds show <id>` in the owning repo for full acceptance and dependency details.

- Workspace: `c714` cutover acceptance; `83d8` platform cutover; `c9f9` editorial migration; `f86f` legacy cutover; `74f5` portable agent skills; `a51d` archived monitoring; `e238` documentationwatch; `0f80` deferred Buzz/Warren bridge; `3f03` checkpoint/Tracker reconciliation.
- Web: `0fc7` missing constitution; `16e0` coverage floors; `cc1c` content-config size exception; `3466` gatewatch PR-title finding; `8012` blocked coverage slack; `7174` tastewatch digest.
- Content: `4d42` missing constitution; `6158` tastewatch digest.
- Infra: `3e90` missing constitution.
- Runner: `9ae7` missing constitution; `ratchetwatch-1791090224` missing ratchets.
- Media-runner: `83ab` missing constitution; `b59d` tastewatch digest.

Mulch doctor passed in all six repositories (16 checks each); warnings are stale-record lifecycle findings summarized above, not validation failures. Runner doctor now reports 15 stale records, up from 9 in the earlier snapshot; two additional tactical records crossed their 14-day shelf life during this review. Web doctor reports 28 stale records; `mulch stale` lists 29 candidates because it also flags a changed anchor on the foundational workflow convention. Focused successful confirmation outcomes were added for content `mx-1949d9` (PR #54; 5 contract tests), infra `mx-46418d` (PR #27; repository contract check), media-runner `mx-e2e93a` (PR #29; contract test), and runner `mx-c24e67`/`mx-458677` (PR #95; 7 runner contract tests). `mulch stale` now returns no candidates in those three repos, but `mulch doctor` still warns 1 stale record in each; workspace shows the same mismatch (two successful outcomes, no stale candidates, two doctor warnings). Treat doctor stale totals as age/lifecycle warnings, not as proof every listed record remains unverified; web still has 29 stale candidates; runner has 13 remaining candidates after two successful confirmations, though its doctor counts all 15 age-expired records. Workspace Engram stats showed 286 observations at this audit; project listing showed the aggregate `senshac` project but no per-child-repository projects. Agent-attributed Engram writes remain blocked until the host registers its runtime identity. Independent CLI/manual observations (including #1577, #1583, and #1584) do not register the runtime.

## Local branch and checkpoint state

All six `main` branches are clean and match their current `origin/main` tips. A local-only branch, `wip/pre-main-cleanup-20261008`, preserves each pre-sync checkout and its dirty files:

| Repository | Synced `main` | Local checkpoint | Notes |
| --- | --- | --- | --- |
| Workspace | `0b916e6` | `48ffed3` | Retain for owner review: stale Seeds snapshot, unreviewed Warren triggers/config, and a Constitution draft with external provenance. Its `.devenv/`/`.engram/` ignore additions and report link are now canonical. |
| Web | `7d7928c` | `6a6a959` | Retain for owner review of a historical Seeds metadata update; ignore rules and tracked `devenv.lock` are now canonical via PR #149. |
| Content | `bd16ca5` | `171cf83` | Retain for review of historical Seeds close-reason evidence and Warren default-provider/model removal; `.engram/` ignore and tracked `devenv.lock` are now canonical via PRs #52 and #53. |
| Infra | `bef9298` | `3a05e36` | Retain for owner review: Warren config/trigger changes and a Constitution draft with unverifiable external provenance; `.engram/` ignore and tracked lock are now canonical via PRs #25 and #26. |
| Runner | `f8d2c4a` | `2fd2a8b` | Retain for owner review of Warren provider/model configuration changes; `.engram/` ignore is canonical via PR #94, which also ensures `.gitignore` changes trigger CI validation. |
| Media-runner | `b6ea571` | `d5393cb` | Retain for owner review of Warren provider/model configuration changes; `.engram/` ignore is now canonical via PR #28. |

The Constitution draft carries provenance and metrics from outside these repositories; verify or replace that material before proposing it. Two web branches also remain because they contain an extra unmerged Warren config commit beyond their merged PRs. Active Tina worktrees remain preserved. Sixteen merged local branch refs and stale remote-tracking refs were cleaned during the initial sync. The verified stale-dist fix from `bug/e2e-fresh-dist-20261008` was merged by web PR #149; `senshac-web/main` now contains squash commit `7d7928c`. Seed `senshac-web-4828` is closed with 5/5 E2E evidence, and its Mulch record has a success outcome. Both follow-up PR branches were removed after merge; the six pre-sync checkpoint branches remain local and unpushed.

WEB-1 implementation appears substantially delivered after the local plan was authored: web PR #138 (`feat(inquiry): add adaptive situation and service flow`) and content PR #45 (`feat(content): add adaptive service inquiry routing`) are merged. GitHub reports PR #138 contract/readiness checks successful. Local verification on synced `main`: web inquiry/contact tests 9/9, content inquiry/localization/CTA tests 8/8, and inquiry/expansion Playwright E2E 5/5 after rebuilding current `dist`. Current web code renders both editable selectors in `src/components/ContactForm.astro` and validates situation/service pairs in `src/utils/inquiry-contract.mjs`; current content carries localized home/service preselection links and routing tests. The first E2E attempt used a Sep 27 `dist`; `playwright.config.ts` only checks `test -d dist`, so it skipped rebuild and produced 4 false failures. The defect is fixed on `bug/e2e-fresh-dist-20261008` (commit `d6faa80`): the Playwright web server now always runs `bun run build`. The same focused suite passed 5/5 with automatic build; Seed `senshac-web-4828` is closed and its Mulch failure record has a success outcome. PR #149 merged after all GitHub checks passed; synced `main` includes the fix at `7d7928c`. Historical WEB-1 plan `pl-41ea` and its parent/children remain on the local checkpoint as source history. Its acceptance was validated against merged PRs #138 and #45 plus current tests; canonical disposition is closed Seed `senshac-workspace-1022`. Avoid reimporting the stale child issue snapshot or reimplementing merged work.

`.devenv/` and `.engram/` are now in tracked `.gitignore` files across all six repositories. `devenv.lock` is tracked in all five repositories with devenv manifests; workspace has no devenv manifest. All synced `main` worktrees remain clean.

## Coordination and next work

Coordination Seed `senshac-workspace-3f03` and this status report became canonical when workspace PR #33 merged (squash commit `0392101`). The issue remains open for checkpoint reconciliation, Mulch refresh, and Engram writes after runtime registration. Each checkpoint is retained pending owner review; the unreviewed Warren config/Constitution changes and stale Seeds snapshots are not merged wholesale. WEB-1 plan disposition is recorded by closed Seed `senshac-workspace-1022`.

1. Review each preserved checkpoint branch against current main; merge only owner-approved, still-valid changes. The ignore/lockfile work is already canonical; avoid merging stale Seeds or broad Warren/Constitution snapshots.
2. ✅ Supersede checkpoint-only WEB-1 plan `pl-41ea` with closed canonical Seed `senshac-workspace-1022`; its historical plan and child issues remain preserved on the WIP checkpoint.
3. ✅ Merge web PR #149 (`7d7928c`); stale-dist fix and Seeds/Mulch evidence now live on canonical `main`.
4. Triage the open constitution/coverage/ratchet/tastewatch Seeds in their owning repos; update Mulch only after verifying stale records against current docs and code.
5. Register the runtime via the host startup/resume hook, then write cross-repo Engram observations with valid session attribution.
6. Keep deployments, DNS, and WordPress out of scope; the WEB-1 acceptance plan requires local verification only.


## Post-audit follow-through

- Workspace PR #33 merged the report, README link, coordination Seed, and Mulch updates; synced workspace `main` was `0392101` immediately after that merge. PR #36 later recorded WEB-1 disposition and checkpoint review boundaries; PR #37 refreshed the status report. The later audit merged content #54, infra #27, media-runner #29, and runner #95 confirmation outcomes.
- Web PR #149 merged the Playwright rebuild fix, closed Seed `senshac-web-4828`, recorded its Mulch success outcome, added `.devenv/` and `.engram/` ignore rules, and tracked `devenv.lock`; synced web `main` is `7d7928c`.
- All status, ignore, lockfile, E2E, and Mulch confirmation PRs passed required checks. Their merged worktrees and branch refs were removed; only the six pre-sync checkpoints and active Tina/Warren worktrees remain.
- WEB-1 plan `pl-41ea` was validated against the merged implementation and explicitly superseded on canonical Seeds by closed issue `senshac-workspace-1022`; the stale plan snapshot remains on the local checkpoint for history. PR #36 updated this report and coordination Seed; the later Mulch audit counted 15 runner records as age-expired (earlier report: 9); two records now have successful review outcomes, leaving 13 CLI candidates, while the doctor warning count remains 15.
- Ignore rules were standardized across all six repos; tracked devenv locks now exist in web, content, infra, runner, and media-runner. Runner PR #94 also includes `.gitignore` in CI path filters so the required `validate` check runs for ignore-only edits. Content #54, infra #27, media-runner #29, and runner #95 recorded evidence-backed confirmation outcomes; no stale Mulch records were deleted or reclassified. The merged ignore-only branches/worktrees in runner and media-runner were also removed after confirming their PR changes were canonical.
