# Cross-repository status — 2026-10-09

Snapshot of `senshac-workspace` and its five focused repositories, based on workspace main `54f76e9`, web main `c140dc3`, and runner main `e1ff6da`. Content remains at its audited head. The runner worktree has a local `devenv.lock` edit; it is preserved and not included in this report.

## Repository state

| Repository | Main SHA | Seeds (open / active / closed / blocked) | Ready | Mulch doctor (pass / warn / fail) | Actionable `mulch stale` |
| --- | --- | ---: | ---: | ---: | ---: |
| `senshac-workspace` | `54f76e9` | 22 (5 / 1 / 16 / 2) | 3 | 16 / 1 / 0 | 0 |
| `senshac-web` | `c140dc3` | 23 (7 / 0 / 16 / 1) | 6 | 16 / 1 / 0 | 0 |
| `senshac-content` | `7bb01de` | 6 (3 / 0 / 3 / 0) | 3 | 16 / 1 / 0 | 0 |
| `senshac-infra` | `a99fc81` | 3 (1 / 0 / 2 / 0) | 1 | 16 / 1 / 0 | 0 |
| `senshac-runner` | `e1ff6da` | 30 (3 / 0 / 27 / 0) | 3 | 16 / 1 / 0 | 0 |
| `senshac-media-runner` | `edbc7a5` | 3 (2 / 0 / 1 / 0) | 2 | 16 / 1 / 0 | 0 |

Counts come from each repository's main worktree. Blocked is an overlapping subset of open issues. All six Seeds doctors pass (12 checks, no warnings); all six Mulch doctors pass with one age-related warning and no failures. `mulch stale` now reports no candidates in any repository.

## Completed and verified

- Web PR #152 corrected production canonical, hreflang, Open Graph, and LocalBusiness origins. PR #154 added explicit GitHub Actions Pages deployment on main pushes; production run [#37929125856](https://github.com/NacoSolutions/senshac-web/actions/runs/37929125856) succeeded. Cloudflare Pages direct Git production deployments remain disabled.
- Web PR #156 fixed localized Tina admin redirects and deployed through the explicit workflow (run #37933779118). Web Seed `senshac-web-8410` closed in PR #157. Live localized routes and admin redirects were verified; DNS was unchanged.
- Workspace PRs #49–#52 updated production deployment evidence and Cloudflare access notes. PR #52 documented earlier R2 API failures and a missing R2 scope in the then-active Wrangler profile.
- Owner created separate `estercobles` and `rogernavelsaker` Wrangler and `cf` profiles. `wrangler auth list` now lists both; both `cf` profiles validate with R2 read/write scopes. From `/home/rona`, Wrangler can read `senshac-media-prod` using `--profile estercobles`. The other account's R2 bucket-list request returns API 10042 (R2 not enabled for that account), not an authentication failure. Running these CLIs from the workspace root currently fails because `node_modules/.cache/wrangler` or `node_modules/.cache/cloudflare` is absent; invoking from `/home/rona` works. The completed R2 CORS update remains live and verified.
- Updated the existing `senshac-media-prod` CORS rule by adding only `https://cutover.senshac.com`; preserved existing origins, GET/HEAD methods, headers, exposed headers, and 86400-second max age. After propagation, fresh GET probes returned HTTP 200 and the matching `Access-Control-Allow-Origin` for both cutover and legacy `www` origins.
- Content and runner were re-audited: content quality checks passed; runner lock checks, 19 unit tests, and script syntax checks passed. The runner's uncommitted `devenv.lock` change remains preserved.
- Web quality gate passed again (`bun run quality`); the targeted Tina island, page chrome, and legacy parity tests passed (12/12). Web PR #158 recorded successful outcomes for the three reviewed Mulch records. Runner's 19 Python tests passed; PR #99 recorded a successful outcome for its runner-image decision. All four records were retained, not deleted.
- Cross-repository Seeds/Mulch health and preserved cleanup checkpoints were reviewed. The six `wip/pre-main-cleanup-20261008` checkpoints remain preserved; their small diffs were reviewed and not merged wholesale.

## Remaining cutover risks and decisions

- **R2 CORS:** Resolved on 2026-10-09. The only policy change added `https://cutover.senshac.com` to the existing `senshac-media-prod` allowlist; post-change GET probes return CORS for both cutover and legacy origins. Use the explicit `estercobles` profile for Senshac production R2. For account CLI calls, run from `/home/rona` to avoid the missing per-repository CLI cache directory. No DNS change was made.
- **Pages token:** Pages production configuration contains `CLOUDFLARE_API_TOKEN`; repository search found no application/runtime reference, while GitHub Actions has a separate deployment secret. Keep the disposition pending owner decision; no secret value was displayed or changed.
- **Rollback:** `senshac.com` still serves the legacy provider and returns HTTP 200. No rollback rehearsal has been performed; keep the legacy site until final acceptance and owner-approved rehearsal.
- Workspace Seed `senshac-workspace-83d8` remains in progress. Pages-token disposition and rollback rehearsal remain open. Seed `senshac-workspace-c714` is final localized-route, Tina edit-flow, media/font, SEO/accessibility/performance, secret-boundary, production-smoke, and rollback acceptance; it remains blocked by `83d8`.
- Cloudflare DNS was not changed. No WordPress changes were made.

## Seeds, Mulch, checkpoints, and Engram

- Open governance follow-ups include web `senshac-web-0fc7`, content `senshac-content-4d42`, infra `senshac-infra-3e90`, runner `senshac-runner-9ae7` and `senshac-runner-c206`, and media-runner `senshac-media-runner-83ab`. Other ready work includes web coverage floors `senshac-web-16e0`.
- The age-stale web and runner Mulch records were revalidated against current source/tests and given success outcomes in PRs #158 and #99. `mulch stale` now reports no candidates; records remain available as expertise.
- The six cleanup checkpoints were reviewed under workspace Seed `senshac-workspace-3f03`; no merge was warranted. The content checkpoint's FAQ block and test match canonical main. Checkpoints remain preserved pending a separate archive decision.
- All six repositories have local `.engram/config.json` project names, while the local Engram database lists only `senshac-workspace`. Runtime registration is not authoritatively available; do not make agent-attributed memory writes until the host registers the runtime identity. Do not substitute another session identity.

## Next steps

1. Resolve the Pages token's purpose with the owner; do not remove it without approval.
2. Complete `83d8` and owner-approved rollback rehearsal, then run `c714` final acceptance.
3. Decide separately whether to archive the preserved checkpoint refs; their review is complete and no branch-only change was merged.
4. Restore authoritative host Engram runtime registration before recording agent-attributed cross-repository memory.

## Checkpoint review addendum (2026-10-09)

Owner-authorized review is complete. All six remotes were fetched; each `main` matched `origin/main`, and no PR was open at review time. No checkpoint-branch merge was warranted: the content checkpoint's FAQ block and test match canonical `main`; safe ignore/lockfile state is already on `main`; and the Workerd compatibility-date update was merged in PR #113 then reverted in PR #114 after Tina testing. Warren patrol/healer/fixer changes were not merged because their triggers lack explicit Seed and cost bounds; the Constitution snapshot also needs correction before it can govern them. All six checkpoints remain preserved. The uncommitted `senshac-runner/main` `devenv.lock` change was not touched.
