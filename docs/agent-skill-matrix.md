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
| `senshac-workspace` | `trellis-readiness-drift`, `modular-cutover`, `seeds-issue-lifecycle`, `mulch-prime-record`, `warren-run-pr-delivery`, `toolchain-bun-web`. |
| `senshac-web` | `toolchain-bun-web` (Bun, Astro, HTMX, Alpine, UnoCSS), `tina-astro-cloudflare`, `web-performance`, `dependency-hygiene`, `security-review`. |
| `senshac-content` | `tina-content-migration`, `toolchain-bun-web` (content validation), `writing-docs`, `security-review`. |
| `senshac-infra` | `cloudflare-operations` (Cloudflare/Wrangler, R2, Podman/Caddy/Tailscale), `security-review`. |
| `senshac-runner` | `managing-environments` (devenv, Nix/dockerTools, rootless Podman, Act, image contract), `dependency-hygiene`. |
| `senshac-media-runner` | `media-runner-operations` (rootless media/container contract, R2 transfer, image publication), `dependency-hygiene`, `security-review`. |

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
| `devenv` | Project developer shell declared by `devenv.nix` and pinned by its Nix inputs. | Run commands with `devenv shell -- <command>`; use Nix flakes and `dockerTools` for OCI images. |
| `dx` | Local convenience wrapper for `direnv exec` and repository helper scripts. | Optional; use explicit `direnv exec <repo> <command>` or the repository script. |

Wrappers remain useful for supervised local work. They are convenience
surfaces, not Warren runtime dependencies. Portable skills name the underlying
commands so a sandbox with only the declared toolchain behaves predictably.

## Rollout contract

1. Merge this catalog and canonical skills in the workspace.
2. Copy the baseline plus each repository's role bundle into that repository.
3. Run that repository's gate and `seeds doctor`/`mulch validate` where its
   tracker files exist.
4. Run `scripts/check-agent-toolkit` to verify the selected baseline and role
   skills plus portable rules exist as regular files in all available active
   repository worktrees. Use `--strict` for complete multi-repository checks;
   workspace CI without sibling worktrees verifies the canonical catalog, while
   `scripts/workspace-test` exercises strict success and failure cases.
5. Keep repository-tailored skill copies reviewable; validation checks presence,
   not byte identity. Never symlink toolkit files in CI or copy local secrets
   and session state.
