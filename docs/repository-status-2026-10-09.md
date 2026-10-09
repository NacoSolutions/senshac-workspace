# Cross-repository status — 2026-10-09

Snapshot of `senshac-workspace` and the five focused repositories. Local main branches were reconciled with `origin/main`; content and runner were fast-forwarded. The status/Seed refresh merged as workspace PR #45 (`5bbca21`). The workspace table records the main and Seeds state after that merge; PR #46 later changed only the report text. Web main advanced through PR #154 (production workflow) and PR #155 (Seeds closure), now at `4b8dc8b`.

## Repository state

| Repository | Main SHA | Seeds total (open / active / closed / blocked) | Ready | Mulch doctor (pass / warn / fail) | Actionable `mulch stale` |
| --- | --- | ---: | ---: | ---: | ---: |
| `senshac-workspace` | `5bbca21` | 22 (5 / 1 / 16 / 2) | 3 | 16 / 1 / 0 | 0 |
| `senshac-web` | `4b8dc8b` | 22 (7 / 0 / 15 / 1) | 6 | 16 / 1 / 0 | 3 |
| `senshac-content` | `7bb01de` | 6 (3 / 0 / 3 / 0) | 3 | 16 / 1 / 0 | 0 |
| `senshac-infra` | `a99fc81` | 3 (1 / 0 / 2 / 0) | 1 | 16 / 1 / 0 | 0 |
| `senshac-runner` | `8545ebb` | 30 (3 / 0 / 27 / 0) | 3 | 16 / 1 / 0 | 1 |
| `senshac-media-runner` | `edbc7a5` | 3 (2 / 0 / 1 / 0) | 2 | 16 / 1 / 0 | 0 |

Counts are from each main checkout's Seeds and Mulch commands. `Blocked` is an overlapping subset of open issues, not a separate status bucket. All six Seeds doctors pass (12 checks, no warnings). Each Mulch doctor reports 16 passes, one age-only warning, and no failures; age warnings do not imply an actionable stale candidate. Workspace main now has 22 Seeds (5 open, 1 in progress, 16 closed, 2 blocked) with the coordination updates merged.

## Completed and verified

- Web PR #152 fixed production canonical/hreflang/Open Graph/LocalBusiness origins. PR #154 (`669bc5f`) added main-push deployments through the explicit GitHub Actions Pages workflow. Checks passed and production run [#37929125856](https://github.com/NacoSolutions/senshac-web/actions/runs/37929125856) succeeded. Cloudflare direct Git production deployments remain disabled; the workflow supplies `PUBLIC_SITE_URL` and the immutable content revision.
- Live `/es/`, `/ca/`, and `/en/` routes return 200. Inspected canonical, hreflang, Open Graph, and LocalBusiness URLs use `https://cutover.senshac.com`; inspected metadata contains no `preview.invalid`. DNS was unchanged.
- Workspace Seed `senshac-workspace-36a7` records PR #152, successful deployment, and live metadata verification; it is closed on the workspace report branch.
- Workspace Seed `senshac-workspace-c9f9` records the eight visible Tina collections, successful content edit/deploy evidence, and Warren run reference `run_cr3b17f8hmzr` from merged web PR #48. It is closed on the report branch. The stale dependency edges from that closed Seed were removed; `seeds doctor` now reports 12 passes and no warnings.
- Workspace Seed `senshac-workspace-83d8` is in progress and unblocked. Read-only inspection confirmed the custom domain, explicit-workflow deployment, unchanged DNS, legacy-root HTTP 200 fallback, and HTTP 200 public image/font/HLS objects. Content main (`7bb01de`) passed `devenv shell -- bun run quality:content`: block/inquiry validators and 40 tests (135 expectations). Runner main (`8545ebb`) passed the devenv lock check, 19 Python unit tests, and shell syntax checks for every script. Both match `origin/main` and are clean.
- Web Seed `senshac-web-2fdb` closed with verified PR #154 and deployment evidence. Seeds-only PR #155 merged as `4b8dc8b`; it did not trigger another production deployment, confirming tracker-only changes remain filtered.

## Remaining cutover risks and decisions

- R2 production CORS does not include `https://cutover.senshac.com`: a public media GET returns 200 without `Access-Control-Allow-Origin` for that origin. The policy does allow `https://www.senshac.com`. No R2 policy or DNS change was made; owner approval is requested for adding the cutover origin.
- Cloudflare Pages production config contains `CLOUDFLARE_API_TOKEN`; repository search found no application/runtime reference, while GitHub Actions has its own deployment secret. Removal or documented runtime use requires owner confirmation. No secret value was displayed.
- Live redirect check: `/admin`, `/admin/`, and `/es/admin/` redirect to `/admin/index.html`; `/es/admin` without the trailing slash returns the Tina admin HTML with HTTP 200 instead of redirecting as the generated `_redirects` contract specifies. The admin still loads, but deployed behavior differs from the local contract.
- `senshac.com` remains routed to the legacy provider and returns HTTP 200, but a rollback rehearsal has not been performed. Keep the legacy site until final acceptance and an approved rollback test.
- `senshac-workspace-c714` final localized-route, Tina edit-flow, media/font, SEO/accessibility/performance, secret-boundary, production-smoke, and rollback acceptance remains blocked by `83d8`.

## Checkpoint and Mulch triage

The six `wip/pre-main-cleanup-20261008` checkpoints remain preserved and are 1–3 commits ahead of the current main branches. The audit in [checkpoint-reconciliation-2026-10-08.md](checkpoint-reconciliation-2026-10-08.md) found stale tracker snapshots and unreviewed Warren/governance changes; do not merge them wholesale. The content checkpoint's FAQ patch has the same stable patch ID as canonical content PR #36, so that code is already represented in main. Keep checkpoints until owners disposition any remaining work.

Web has three age-only stale Mulch candidates (live Tina chrome/fresh queries, legacy block parity, and the quality-parity gate); runner has one (Nix `dockerTools` CI image decision). Current code/tests and successful quality verification support retaining them; no stale record was mass-pruned. Constitution/mandate work already has open Seeds: web `senshac-web-0fc7`, content `senshac-content-4d42`, infra `senshac-infra-3e90`, runner `senshac-runner-9ae7` and `senshac-runner-c206`, and media-runner `senshac-media-runner-83ab`. Other ready follow-ups include checkpoint disposition (`senshac-workspace-3f03`) and web coverage floors (`senshac-web-16e0`).

## Engram

All six repositories have local `.engram/config.json` project names. The local Engram database currently contains only the `senshac-workspace` project. The host runtime has not registered an authoritative session identity, so agent-attributed memory writes and the required session summary are unavailable. Do not create a substitute identity or write under another project.

## Next steps

1. Review and merge the workspace report/Seeds branch after final validation.
2. Resolve the requested R2 CORS and Pages-token owner decisions; only then make approved infrastructure changes.
3. Complete `83d8` headers/redirect/secret-boundary checks and a documented rollback rehearsal, then run `c714` final acceptance.
4. Get owner disposition for the preserved checkpoints; progress the existing Constitution/mandate, coverage, gatewatch, and runner trigger Seeds.
5. Restore host Engram runtime registration, then decide whether to register the five focused-repository projects before recording cross-repo memory.

No DNS or WordPress changes were made.
