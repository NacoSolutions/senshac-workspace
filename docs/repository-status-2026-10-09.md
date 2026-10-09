# Cross-repository status — 2026-10-09

Snapshot of `senshac-workspace` and the five focused repositories. All local mains match `origin/main`; content and runner remain at their audited heads. Workspace report evidence merged through PR #49 (`de37c1f`). Web PR #156 (`178b545`) fixed localized Tina admin routing and deployed successfully; tracker-only PR #157 closed its Seed as `6a0e6dd`.

## Repository state

| Repository | Main SHA | Seeds total (open / active / closed / blocked) | Ready | Mulch doctor (pass / warn / fail) | Actionable `mulch stale` |
| --- | --- | ---: | ---: | ---: | ---: |
| `senshac-workspace` | `de37c1f` | 22 (5 / 1 / 16 / 2) | 3 | 16 / 1 / 0 | 0 |
| `senshac-web` | `6a0e6dd` | 23 (7 / 0 / 16 / 1) | 6 | 16 / 1 / 0 | 3 |
| `senshac-content` | `7bb01de` | 6 (3 / 0 / 3 / 0) | 3 | 16 / 1 / 0 | 0 |
| `senshac-infra` | `a99fc81` | 3 (1 / 0 / 2 / 0) | 1 | 16 / 1 / 0 | 0 |
| `senshac-runner` | `8545ebb` | 30 (3 / 0 / 27 / 0) | 3 | 16 / 1 / 0 | 1 |
| `senshac-media-runner` | `edbc7a5` | 3 (2 / 0 / 1 / 0) | 2 | 16 / 1 / 0 | 0 |

Counts are from each main checkout's Seeds and Mulch commands. `Blocked` is an overlapping subset of open issues, not a separate status bucket. All six Seeds doctors pass (12 checks, no warnings). Each Mulch doctor reports 16 passes, one age-only warning, and no failures; age warnings do not imply an actionable stale candidate. Workspace main now has 22 Seeds (5 open, 1 in progress, 16 closed, 2 blocked) with the coordination updates merged.

## Completed and verified

- Web PR #152 fixed production canonical/hreflang/Open Graph/LocalBusiness origins. PR #154 (`669bc5f`) added main-push deployments through the explicit GitHub Actions Pages workflow. Checks passed and production run [#37929125856](https://github.com/NacoSolutions/senshac-web/actions/runs/37929125856) succeeded. Cloudflare direct Git production deployments remain disabled; the workflow supplies `PUBLIC_SITE_URL` and the immutable content revision.
- Read-only Cloudflare project inspection confirmed `production_deployments_enabled=false`. GitHub `main` push at `4b8dc8b` has an idle/queued Pages Git record (`36d66c67`), while canonical deployment `9b018f9c` has a successful deploy stage and alias `cutover.senshac.com`, matching workflow run #37929125856. PR #156 deployed web main `178b545` through the explicit Pages workflow (run #37933779118); direct Git source builds remain disabled.
- Live `/es/`, `/ca/`, and `/en/` routes return 200. Inspected canonical, hreflang, Open Graph, and LocalBusiness URLs use `https://cutover.senshac.com`; inspected metadata contains no `preview.invalid`. DNS was unchanged.
- Workspace Seed `senshac-workspace-36a7` records PR #152, successful deployment, and live metadata verification; it is closed on the workspace report branch.
- Workspace Seed `senshac-workspace-c9f9` records the eight visible Tina collections, successful content edit/deploy evidence, and Warren run reference `run_cr3b17f8hmzr` from merged web PR #48. It is closed on the report branch. The stale dependency edges from that closed Seed were removed; `seeds doctor` now reports 12 passes and no warnings.
- Workspace Seed `senshac-workspace-83d8` remains in progress and unblocked. Read-only checks confirm the active custom domain, explicit-workflow deployment, unchanged DNS, legacy-root HTTP 200 fallback, and public image/font/HLS objects. Web PR #156 (run #37933779118) resolved the localized admin redirect as detailed below. Remaining `83d8` items: R2 CORS, Pages-token disposition, and rollback rehearsal, all awaiting owner approval where applicable. Content main (`7bb01de`) passed `bun run quality:content` (40 tests, 135 expectations); runner main (`8545ebb`) passed lock check, 19 Python tests, and shell syntax checks. Both commits match `origin/main`; runner has an uncommitted local `devenv.lock` edit, preserved.
- Web Seed `senshac-web-2fdb` closed with verified PR #154 and deployment evidence. Seeds-only PR #155 merged as `4b8dc8b`; it did not trigger another production deployment, confirming tracker-only changes remain filtered.

## Remaining cutover risks and decisions

- R2 production CORS does not include `https://cutover.senshac.com`: a public media GET returns 200 without `Access-Control-Allow-Origin` for that origin. The policy does allow `https://www.senshac.com`. No R2 policy or DNS change was made; owner approval is requested for adding the cutover origin.
- Cloudflare Pages production config contains `CLOUDFLARE_API_TOKEN`; repository search found no application/runtime reference, while GitHub Actions has its own deployment secret. Removal or documented runtime use requires owner confirmation. No secret value was displayed.
- Live redirect check after PR #156: `/admin`, `/admin/`, `/es/admin`, `/es/admin/`, `/ca/admin`, and `/en/admin` return HTTP 302 to `/admin/index.html`; the canonical bundle returns 200. The Pages-runtime regression check passed; web Seed `senshac-web-8410` closed in PR #157 (`6a0e6dd`).
- `senshac.com` remains routed to the legacy provider and returns HTTP 200, but a rollback rehearsal has not been performed. Keep the legacy site until final acceptance and an approved rollback test.
- `senshac-workspace-c714` final localized-route, Tina edit-flow, media/font, SEO/accessibility/performance, secret-boundary, production-smoke, and rollback acceptance remains blocked by `83d8`.

## Checkpoint and Mulch triage

The six `wip/pre-main-cleanup-20261008` checkpoints remain preserved and are 1–3 commits ahead of the current main branches. The audit in [checkpoint-reconciliation-2026-10-08.md](checkpoint-reconciliation-2026-10-08.md) found stale tracker snapshots and unreviewed Warren/governance changes; do not merge them wholesale. The content checkpoint's FAQ patch has the same stable patch ID as canonical content PR #36, so that code is already represented in main. Keep checkpoints until owners disposition any remaining work.

Web has three age-only stale Mulch candidates (live Tina chrome/fresh queries, legacy block parity, and the quality-parity gate); runner has one (Nix `dockerTools` CI image decision). Current code/tests and successful quality verification support retaining them; no stale record was mass-pruned. Constitution/mandate work already has open Seeds: web `senshac-web-0fc7`, content `senshac-content-4d42`, infra `senshac-infra-3e90`, runner `senshac-runner-9ae7` and `senshac-runner-c206`, and media-runner `senshac-media-runner-83ab`. Other ready follow-ups include checkpoint disposition (`senshac-workspace-3f03`) and web coverage floors (`senshac-web-16e0`).

## Engram

All six repositories have local `.engram/config.json` project names. The local Engram database currently contains only the `senshac-workspace` project. The host runtime has not registered an authoritative session identity, so agent-attributed memory writes and the required session summary are unavailable. Do not create a substitute identity or write under another project.

## Next steps
1. Review and merge this workspace report/Seed PR after checks pass.
2. Resolve the requested R2 CORS and Pages-token owner decisions; only then make approved infrastructure changes.
3. Complete `83d8` headers/redirect/secret-boundary checks and a documented rollback rehearsal, then run `c714` final acceptance.
4. Get owner disposition for the preserved checkpoints; progress the existing Constitution/mandate, coverage, gatewatch, and runner trigger Seeds.
5. Restore host Engram runtime registration, then decide whether to register the five focused-repository projects before recording cross-repo memory.

No DNS or WordPress changes were made.
