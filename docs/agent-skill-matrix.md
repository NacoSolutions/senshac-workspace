# Senshac agent skill matrix

`senshac-workspace` is the canonical catalog. Focused repositories copy only
the rows they own; Warren sandboxes receive the copied files from the target
repository. This keeps runs self-contained and avoids a runtime dependency on
the workspace checkout.

## Portable baseline — every active repository

| Skill | Purpose |
| --- | --- |
| `senshac-agent-principles` | Direct, specific, positive, defensive, gentle, economical work. |
| `bounded-warren-task` | One bounded objective, one gate, one committed result. |
| `seeds-cli` | `seeds prime/ready/show/update/doctor` lifecycle. |
| `mulch-cli` | `mulch prime/record/validate` expertise lifecycle. |
| `terrarium-triage` | Graph triage and one owned ready item. |
| `warren-operations` | Run scope, cost cap, tracker evidence, and delivery. |
| `git-workflow` | Focused branches, diffs, commits, and handoff. |
| `verification-before-completion` | Final gate and evidence contract. |

The portable rule files live in `.agents/rules/`: Caveman ultra, positive
phrasing, direct execution, defense in depth, gentle coding, token economy, and
llm-shorthand. This makes the guidance available in Warren sandboxes and CI
without depending on `/home/rona/.llm/`. `instruction-specificity` is an
authoring skill for maintaining AGENTS.md, SKILL.md, and rule files; it is
loaded when those files are being authored.

## Role bundles

| Repository | Additional skills |
| --- | --- |
| `senshac-workspace` | `trellis-readiness-drift`, `modular-cutover`, workspace contracts. |
| `senshac-web` | Bun/web toolchain, Tina/Astro/Cloudflare, web performance, dependency hygiene, security. |
| `senshac-content` | Tina content migration, Bun/content validation, writing docs, security. |
| `senshac-infra` | Cloudflare/Wrangler, Warren deployment, Podman/Caddy/Tailscale, security. |
| `senshac-runner` | Bun, Flox, rootless Podman, Act, image publication, dependency hygiene. |
| `senshac-media-runner` | Bun, media/container contract, R2 transfer, image publication, security. |

## Tool ownership

| Tool | Canonical invocation | Owner |
| --- | --- | --- |
| Seeds | `seeds` (help may say `sd`) | Each repository's `.seeds/`; workspace routes cross-repo work. |
| Mulch | `mulch` (provider shorthand may say `ml`) | Each repository's `.mulch/`. |
| Terrarium | `terrarium` (help may say `tr`) | The active tracker graph selected by the Seed. |
| Warren | Registered project API/UI | Background runs, schedules, and delivery evidence. |
| Trellis | Repository-pinned Jayminwest revision | Readiness and drift checks only. |
| Bun | `bun install --frozen-lockfile` | JavaScript and TypeScript repos. |
| Wrangler | `wrangler` with checked-in config | Cloudflare-owned repositories. |
| GitHub CLI | `gh` with Warren/App auth | GitHub inspection and delivery operations. |

## Wrapper policy

| Wrapper | Scope | Warren use |
| --- | --- | --- |
| `scripts/wx` | Workspace operator: routes `wt` to a registered sibling repository. | Use only for cross-repository coordination from `senshac-workspace`; focused runs use their target checkout directly. |
| `fx` | Local convenience wrapper for Flox activation and package mutation. | Optional; use explicit `flox activate -- <command>` in portable run instructions. |
| `dx` | Local convenience wrapper for `direnv exec` and repository helper scripts. | Optional; use explicit `direnv exec <repo> <command>` or the repository script. |

Wrappers remain useful for supervised local work. They are convenience
surfaces, not Warren runtime dependencies. Portable skills name the underlying
commands so a sandbox with only the declared toolchain behaves predictably.

## Rollout contract

1. Merge this catalog and canonical skills in the workspace.
2. Copy the baseline plus each repository's role bundle into that repository.
3. Run that repository's gate and `seeds doctor`/`mulch validate` where its
   tracker files exist.
4. Keep the copies synchronized through a reviewable update or drift check;
   never symlink them in CI and never copy local secrets or session state.
