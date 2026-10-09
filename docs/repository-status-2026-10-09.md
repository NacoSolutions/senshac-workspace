# Cross-repository status — 2026-10-09

Snapshot of `senshac-workspace` and its five focused repositories, based on workspace main `4ec0f6a` and web main `6a0e6dd`. Content and runner remain at their audited heads. The runner worktree has a local `devenv.lock` edit; it is preserved and not included in this report.

## Repository state

| Repository | Main SHA | Seeds (open / active / closed / blocked) | Ready | Mulch doctor (pass / warn / fail) | Actionable `mulch stale` |
| --- | --- | ---: | ---: | ---: | ---: |
| `senshac-workspace` | `4ec0f6a` | 22 (5 / 1 / 16 / 2) | 3 | 16 / 1 / 0 | 0 |
| `senshac-web` | `6a0e6dd` | 23 (7 / 0 / 16 / 1) | 6 | 16 / 1 / 0 | 3 |
| `senshac-content` | `7bb01de` | 6 (3 / 0 / 3 / 0) | 3 | 16 / 1 / 0 | 0 |
| `senshac-infra` | `a99fc81` | 3 (1 / 0 / 2 / 0) | 1 | 16 / 1 / 0 | 0 |
| `senshac-runner` | `8545ebb` | 30 (3 / 0 / 27 / 0) | 3 | 16 / 1 / 0 | 1 |
| `senshac-media-runner` | `edbc7a5` | 3 (2 / 0 / 1 / 0) | 2 | 16 / 1 / 0 | 0 |

Counts come from each repository's main worktree. Blocked is an overlapping subset of open issues. All six Seeds doctors pass (12 checks, no warnings); all six Mulch doctors pass with one age-related warning and no failures. The web's three and runner's one stale Mulch entries are candidates for review, not automatically deletable records.

## Completed and verified

- Web PR #152 corrected production canonical, hreflang, Open Graph, and LocalBusiness origins. PR #154 added explicit GitHub Actions Pages deployment on main pushes; production run [#37929125856](https://github.com/NacoSolutions/senshac-web/actions/runs/37929125856) succeeded. Cloudflare Pages direct Git production deployments remain disabled.
- Web PR #156 fixed localized Tina admin redirects and deployed through the explicit workflow (run #37933779118). Web Seed `senshac-web-8410` closed in PR #157. Live localized routes and admin redirects were verified; DNS was unchanged.
- Workspace PRs #49–#52 updated production deployment evidence and Cloudflare access notes. PR #52 records that Wrangler OAuth has Pages access but no R2 permission.
- Read-only R2 access was recovered by selecting the confirmed `estercobles` account with `CLOUDFLARE_ACCOUNT_ID`; Wrangler's bucket-list and CORS-list calls succeeded even though `wrangler whoami` does not enumerate an R2 scope.
- Updated the existing `senshac-media-prod` CORS rule by adding only `https://cutover.senshac.com`; preserved existing origins, GET/HEAD methods, headers, exposed headers, and 86400-second max age. After propagation, fresh GET probes returned HTTP 200 and the matching `Access-Control-Allow-Origin` for both cutover and legacy `www` origins.
- Content and runner were re-audited: content quality checks passed; runner lock checks, 19 unit tests, and script syntax checks passed. The runner's uncommitted `devenv.lock` change remains preserved.
- Cross-repository Seeds/Mulch health and preserved cleanup checkpoints were reviewed. The six `wip/pre-main-cleanup-20261008` checkpoints remain preserved; their small diffs were reviewed and not merged wholesale.

## Remaining cutover risks and decisions

- **R2 CORS:** Resolved on 2026-10-09. The only policy change added `https://cutover.senshac.com` to the existing `senshac-media-prod` allowlist; the post-change GET probe verified CORS for both cutover and legacy origins. Use `CLOUDFLARE_ACCOUNT_ID=41d4ea19fb0990f630257332c927aedb` for Wrangler R2 commands in this multi-account profile. No DNS change was made.
- **Pages token:** Pages production configuration contains `CLOUDFLARE_API_TOKEN`; repository search found no application/runtime reference, while GitHub Actions has a separate deployment secret. Keep the disposition pending owner decision; no secret value was displayed or changed.
- **Rollback:** `senshac.com` still serves the legacy provider and returns HTTP 200. No rollback rehearsal has been performed; keep the legacy site until final acceptance and owner-approved rehearsal.
- Workspace Seed `senshac-workspace-83d8` remains in progress. Pages-token disposition and rollback rehearsal remain open. Seed `senshac-workspace-c714` is final localized-route, Tina edit-flow, media/font, SEO/accessibility/performance, secret-boundary, production-smoke, and rollback acceptance; it remains blocked by `83d8`.
- Cloudflare DNS was not changed. No WordPress changes were made.

## Seeds, Mulch, checkpoints, and Engram

- Open governance follow-ups include web `senshac-web-0fc7`, content `senshac-content-4d42`, infra `senshac-infra-3e90`, runner `senshac-runner-9ae7` and `senshac-runner-c206`, and media-runner `senshac-media-runner-83ab`. Other ready work includes workspace checkpoint disposition `senshac-workspace-3f03` and web coverage floors `senshac-web-16e0`.
- Web has three age-only stale Mulch candidates; runner has one. Preserve them until their owners confirm whether to refresh, replace, or retire them. Do not bulk-prune.
- The six cleanup checkpoints remain preserved pending owner disposition. The content checkpoint's FAQ change has the same patch ID as the canonical content PR #36, so that code is already represented on main.
- All six repositories have local `.engram/config.json` project names, while the local Engram database lists only `senshac-workspace`. Runtime registration is not authoritatively available; do not make agent-attributed memory writes until the host registers the runtime identity. Do not substitute another session identity.

## Next steps

1. Resolve the Pages token's purpose with the owner; do not remove it without approval.
2. Complete `83d8` and owner-approved rollback rehearsal, then run `c714` final acceptance.
3. Obtain owner disposition for preserved checkpoints; continue the listed governance and coverage Seeds, and review rather than automatically prune stale Mulch candidates.
4. Restore authoritative host Engram runtime registration before recording agent-attributed cross-repository memory.
