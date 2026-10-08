# Local WIP checkpoint reconciliation — 2026-10-08

This audit compares the six preserved local `wip/pre-main-cleanup-20261008`
branches with the current local `main` refs, which were aligned with
`origin/main`. It is a review aid, **not owner approval**. No checkpoint was
merged, rewritten, pushed, or deleted.

## Snapshot

| Repository | Current `main` | Preserved checkpoint | Commits ahead of `main` | Review summary |
| --- | --- | --- | ---: | --- |
| `senshac-workspace` | `b17ce66` | `48ffed3` | 3 | Contains stale Seeds/status snapshots, new `devenv.nix`/`devenv.yaml`, an unreviewed Warren automation/config change, and a Warren Constitution draft with unverified external provenance. Keep for owner review; do not merge as a snapshot. |
| `senshac-web` | `f300d4b` | `55e855a` | 2 | Precedes the merged inquiry/page-chrome implementation and hardening (PRs #138–#142); ignore rules and tracked `devenv.lock` are already canonical. It also has a superseded per-repo pinned image override and removes the old documentationwatch trigger. Recommend archive only after owner confirms no unique work remains. |
| `senshac-content` | `e75bfd7` | `171cf83` | 2 | FAQ commit `327c05c` has the same stable patch ID as canonical `c1d3dc5` (PR #36); current main has subsequent WEB4/localization work. It also has a superseded per-repo image override and removes the documentationwatch trigger. Recommend archive after owner confirms. |
| `senshac-infra` | `a99fc81` | `3a05e36` | 1 | Adds Warren repair settings, scheduled triggers, and the unreviewed Constitution draft; its `latest` per-repo image override is contrary to current main's centralized defaults. Keep for explicit governance review; do not merge. |
| `senshac-runner` | `31e88a7` | `2fd2a8b` | 3 | Adds repair settings, scheduled triggers, a `latest` per-repo image override, and the Constitution draft; it also carries older Warren runtime guidance/Mulch/Seeds state. Keep for review; do not merge wholesale. |
| `senshac-media-runner` | `edbc7a5` | `d5393cb` | 3 | Adds repair settings, scheduled triggers, a `latest` per-repo image override, and the Constitution draft, plus older Mulch/Seeds state. Keep for review; do not merge wholesale. |

All six checkpoint refs are local-only; no corresponding
`origin/wip/pre-main-cleanup-20261008` ref exists. Current `main` worktrees are
clean. Other active Tina or lockfile worktrees/branches were not part of this
audit and were left untouched.

## Evidence and proposed disposition

- **Workspace:** The checkpoint adds `docs/CONSTITUTION.md`, scheduled
  `nightwatch`/`bugwatch`/`gatewatch`/`ratchetwatch`/`tastewatch` triggers,
  CI-fixer/healer settings, and devenv manifests. The Constitution itself
  requires human review for changes to its mandate and trigger population.
  Existing canonical workspace policy also requires each scheduled job to have
  an owner, bounded Seed, cost cap, and acceptance contract. Review those
  proposals individually. Its status report and Seed graph are older than the
  current canonical report and tracker; do not copy those snapshots back.
- **Web:** The WIP tree is an earlier snapshot, not a forward patch to apply
  over current main. Main contains the merged adaptive inquiry work and later
  Tina/page-chrome/contact hardening (#138–#142), as well as the fresh-dist
  E2E fix (#149). The checkpoint reintroduces a per-repo pinned Warren image
  override, removes the documentationwatch trigger, and has an old Seeds
  close-reason version. Proposed disposition: retain until owner confirms it
  can be archived; do not merge or cherry-pick the snapshot.
- **Content:** The FAQ implementation is already present on main with an
  identical stable patch ID. Current main has later localized WEB4 content and
  validation. The checkpoint also reintroduces a per-repo Warren image override,
  removes the documentationwatch trigger, and carries historical tracker
  metadata. Proposed disposition: retain until owner confirms archival.
- **Infra, runner, and media-runner:** The distinguishing shared additions are
  automated Warren patrol/repair configuration and the Constitution draft;
  runner and media-runner also add per-repo `latest` image overrides. These are
  operational/governance changes, not harmless state cleanup. Current main has
  no per-repo Warren image override. Keep the checkpoints intact pending an
  explicit owner decision; do not enable the scheduled triggers, repair
  automation, or repo-level image overrides from these snapshots.
- **Shared local-state hygiene:** `.devenv/` and `.engram/` ignores, and tracked
  `devenv.lock` files where the repositories use devenv, are already present
  on current main. Do not reapply them from the checkpoints.

## Owner decisions needed

1. Approve archival/removal of the web and content checkpoint branches, whose
   identified implementation is superseded or already present on main.
2. Decide whether to archive or retain the workspace, infra, runner, and
   media-runner checkpoints as historical records, and whether any individual
   Warren/governance proposal should become a separately scoped, reviewed Seed.
3. Decide whether the workspace-only `devenv.nix`/`devenv.yaml` environment
   proposal has an owner and a maintained use case.

Until those decisions are recorded, leave all six local checkpoint refs intact.
