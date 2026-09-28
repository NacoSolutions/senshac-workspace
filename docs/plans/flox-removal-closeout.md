# Flox Removal Closeout

Status: complete, verified 2026-09-28.

## Goal

Remove Flox from active Senshac developer and image workflows while keeping
historical audit evidence, negative leak checks, and the archived legacy repo
intact.

## Architecture

- Active project repositories use devenv for developer shells.
- `senshac-runner` and `senshac-media-runner` build OCI images directly with
  Nix flakes and `dockerTools`; runtime images contain neither Flox nor devenv.
- Act dogfooding uses those produced images. Local verification uses rootless
  Podman and does not pass host credentials into the image.
- `senshac-workspace` is a tracker/operator metadata repository, not a project
  shell or image producer.
- The archived `senshac` repository remains read-only. Historical migration
  records and negative assertions are retained as history/defense in depth.

## Completion evidence

- The six active repositories (`senshac-content`, `senshac-infra`,
  `senshac-media-runner`, `senshac-runner`, `senshac-web`, and
  `senshac-workspace`) have no tracked `.flox` directory. No active workflow or
  image builder invokes Flox. The only active-code search hit is the runner's
  negative image-closure guard and its regression test; historical audits,
  topology notes, and closed Seeds retain their original context.
- All project repos have a tracked `devenv.nix`. Content, infra, web, runner,
  and media-runner developer shells were entered and verified. The workspace
  has no application shell or runtime image to migrate.
- Content passed its devenv-backed tests (11), export validation, lint, and
  typecheck, including a bubblewrap-isolated test run. Web passed its devenv-
  backed tests (17) and lint, including a bubblewrap-isolated test run with a
  local sibling content checkout. Infra resolved OpenTofu, Wrangler,
  Betterleaks, and SOPS in devenv.
- Runner PR #80 published and verified its rootless Nix image; exact published
  runner-image dogfooding passed through Act. Runner PR #81 archived 22 stale
  Flox expertise entries and refreshed 8 current records; its CI and readiness
  checks passed.
- Media-runner PR #19 merged the flake/dockerTools builder and publisher; main
  publication run `36463049915` succeeded and verified
  `ghcr.io/nacosolutions/senshac-media-processor@sha256:05add67cd6142da4f765d2beb8a7bd8de89aafc0c17159c409accee2a04a2156`.
  PR #20 pins the processing workflow to that digest. The local Nix image
  passed rootless Podman smoke and an Act dry-run that produced and verified 14
  files. The exact registry artifact was also pulled and smoke-tested by the
  publisher workflow. A later exact-image GitHub workflow dispatch (`36467036659`)
  exposed that UID 1000 could not write the runner-managed `$GITHUB_ENV` file.
  PR #21 (`b2a54201`) removed the redundant dry-run override; dispatch
  `36467475795` then passed fixture creation, object processing, and verification
  of all 14 outputs against the pinned GHCR digest, with R2 steps skipped.
- `senshac-workspace` guidance and its portable-toolkit Seed already state the
  devenv/Nix/dockerTools model. The Seed remains open because it covers the
  broader cross-repository toolkit acceptance, not only this migration.
  `./scripts/workspace-test`, `seeds doctor` (12 passed), and `mulch validate`
  (2 records, 0 errors) pass.
- A filesystem/process audit found no local `.flox` directories under the six
  active repositories and no running Flox process. No local Flox state was
  deleted.
- GitHub branch audit: each active repository has only `main`, with no open
  PRs. Verified merged and terminal Warren-run branches were deleted after
  checking ancestry or run state; user-owned local model worktrees, dirty
  project worktrees, and tracker files were preserved.

## Historical references intentionally retained

- `docs/local-consolidation-audit.md` and this closeout record the migration
  history.
- The runner OCI closure check mentions Flox only to reject its presence.
- Closed Seeds and archived Mulch entries remain historical evidence.
- The archived `senshac` repository was not modified; its historical `.flox`
  tree remains intact. The migration scope covers the six active `senshac-*`
  repos, not the frozen legacy monorepo.

## Verification commands

- `./scripts/workspace-test`
- `seeds doctor`
- `mulch validate`
- In each project shell, the repository's focused checks; image producer PR
  checks and publication runs; rootless Podman and Act dry-runs for the
  produced images.

## Residual notes

- This host's GitHub token lacks GHCR package-read access, so direct local pulls
  of the private media image are unavailable. The publisher's authenticated
  registry pull and smoke test passed; the same merged-main Nix image was
  dogfooded locally via Act.
- `mulch doctor` on the runner currently errors while resolving its installed
  CLI version from `/package.json`; `mulch validate`, Seeds Doctor, runner PR
  CI, and readiness all pass.
