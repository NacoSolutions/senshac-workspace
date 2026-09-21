# Local consolidation audit — 2026-09-21

## Verified state

- Inspected all 122 Warren runs: all terminal; no competing run launched.
- GitHub: no open PRs in the six modular repositories at audit time.
- Focused repositories have clean main worktrees fast-forwarded to origin/main.
- Restored missing fetch refspecs for web/content and tracking upstreams for all focused main branches.
- Removed 19 local merged/patch-equivalent branches through Worktrunk; verified actual branch removal.
- Preserved completed workspace Seeds records and migrated the deferred Buzz plan here.
- Local repositories remain separate from Warren-managed project clones.

## Remaining historical work

- Legacy senshac is archived on GitHub. Its 15 monitoring issues need reconciliation (senshac-workspace-a51d).
- Reviewed and discarded both legacy stashes on 2026-09-21: the obsolete monorepo CI-runner prototype (`senshac-50a2-container-switch-wip`) and the Flox/Burrow/Plot trial. Current runner implementation lives in senshac-runner; the Plot trial contained an empty draft and generated index.
- The discarded trial also contained eight historical tracker additions: six closed migration tasks and two stale open tasks (senshac-1bc7 Seeds initialization and senshac-5b4e knowledge migration). Current web Seeds/Mulch stores and workspace docs/mulch-trellis-migration.md preserve the delivered implementation and migration guidance. These historical additions are not active work queues.
- Legacy docs/buzz-warren-integration-plan commit remains recoverable; its document now lives here.
- Legacy worktrees and remote closed/unmerged Warren branches remain for evidence review; they were not treated as merged solely because their PR was closed.

## Removed local branches

- `senshac-workspace`: `chore/track-seeds-ignore`
- `senshac-workspace`: `docs/activate-modular-registry`
- `senshac-workspace`: `fix/track-seeds-ignore`
- `senshac-web`: `chore/enable-warren-automerge`
- `senshac-content`: `chore/pin-warren-agent`
- `senshac-infra`: `docs/warren-podman-operations`
- `senshac-runner`: `chore/pin-warren-agent-image`
- `senshac-runner`: `docs/clarify-bun-node-boundary`
- `senshac-runner`: `docs/warren-agent-runtime`
- `senshac-runner`: `docs/warren-podman-runtime-runbook`
- `senshac-runner`: `feat/publish-warren-agent`
- `senshac-runner`: `fix/warren-runtime-docs`
- `senshac-media-runner`: `chore/pin-warren-agent`
- `senshac-media-runner`: `ci/pull-request-validation`
- `senshac-workspace`: `chore/initialize-workspace-seeds`
- `senshac-runner`: `ci/pull-request-validation`
- `senshac-runner`: `feat/minimal-warren-agent`
- `senshac-runner`: `fix/qualified-agent-base`
- `senshac-infra`: `chore/pin-warren-agent`

## Operating sequence

1. Start in senshac-workspace/main and run scripts/workspace-bootstrap.
2. Fetch the owning repository and confirm branch/status before classifying work.
3. Use repository-local sd ready and ml prime; use workspace Seeds for cross-repository coordination.
4. Use scripts/wx switch --repo <name> --create <branch> for supervised implementation.
5. Check Warren /runs and GitHub PRs before delegating the same seed.
6. Test, commit, PR, review CI, merge, then remove verified merged worktrees.
