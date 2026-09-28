# Flox Removal Closeout

## Goal

Align active Senshac tooling guidance with the completed Flox-to-devenv migration.

## Non-goals

- Change application code, production deployment configuration, or runtime secrets.
- Add devenv or Flox to OCI runtime images.
- Erase historical migration records or negative tests proving image closures exclude Flox.
- Modify local `.flox` runtime/cache state until its owning process and value are verified.

## Context

- Current `origin/main` for `senshac-content`, `senshac-infra`, `senshac-media-runner`, `senshac-runner`, and `senshac-web` already uses devenv or has no Flox environment.
- `senshac-runner` builds its rootless/distroless OCI image with Nix flakes and `dockerTools`; its developer shell is separate.
- Active stale guidance remains in infra and workspace docs/config. Workspace Seed `senshac-workspace-74f5` still names Flox/Podman.
- Historical audit docs and runner negative assertions intentionally mention Flox.

## Blast radius

Documentation and tracker records in `senshac-infra` and `senshac-workspace`; local ignored `.flox` residue in infra, media-runner, and stale runner worktrees is a separate cleanup check.

## Steps

1. Update infra IaC guidance to source OpenTofu from its existing devenv/Nixpkgs environment and update runner operations docs. Verify `rg -in 'flox|floxhub' docs` returns no active references.
2. Update workspace role/toolkit/topology/routing docs to describe devenv developer shells and Nix `dockerTools` OCI builds; revise Seed `senshac-workspace-74f5` to match. Preserve the archival audit entry. Verify active-file search and `./scripts/workspace-test`.
3. Inspect local `.flox` residual paths and process use; remove only if they are confirmed disposable generated state. Verify repo status afterward.
4. Run Seeds/Mulch validation and devenv-backed gates; commit and PR each owning repository independently.

## Tests and verification

- `./scripts/workspace-test`
- `devenv test` and `devenv shell -- tofu --version` in infra when supported by current devenv CLI.
- `seeds doctor` and `mulch validate` in tracker-owning repositories.
- Active-reference grep, reviewing historical and negative test exceptions individually.

## Rollback

Revert only the documentation/tracker commit in the owning repository. Preserve image and deployment state.

## Open questions

The current local `.flox` paths contain small runtime logs/cache and may include user-local state; inspect live processes and exact directory contents before cleanup.

### For Executor

Read order: this plan, owning repository instructions, target docs, current `origin/main`.
Assumed working state: clean isolated worktrees based on current `origin/main`.
Owned files: infra `docs/iac-decision.md`, `docs/warren-podman-operations.md`; workspace `.config/workspace.toml`, `docs/agent-skill-matrix.md`, `docs/agent-toolkit.md`, `docs/container-topology.md`, `docs/mulch-trellis-migration.md`, and Seed `senshac-workspace-74f5`.
Verification commands: listed above.
