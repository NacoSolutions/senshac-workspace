# Senshac Workspace

This meta-repository coordinates the Senshac focused repositories. It does not
contain application code or plaintext secrets.

Run `./scripts/workspace-bootstrap` before cross-repository work and
`./scripts/workspace-test` after changing registry or wrapper behavior. Use the
active `senshac-web` repository for the canonical Seeds/Terrarium graph until
an explicit tracker migration changes ownership.

Use `./scripts/wx <wt-command> --repo <name> [wt args...]` to select a
repository and delegate directly to native `wt`, for example
`./scripts/wx switch --repo senshac-web --create feature/name`.

Routine task selection is `dx tr triage` in the active repository. Use `sd`
for tracker mutation and integrity debugging. Use `wt` inside the repository
that owns the selected seed.

## Agent guidance

Use [Bounded Warren Task](.agents/skills/bounded-warren-task/SKILL.md) for focused changes. State the desired outcome with positive, specific instructions; work on the named files and inspect the smallest relevant surface first. Apply defense in depth through repository guidance, focused validation, and a clean commit, while using gentle coding to preserve adjacent behavior. Execute directly with Seeds, Mulch, Canopy, Worktrunk, and the workspace tools when they apply. Keep the change economical in tokens and scope, and report the files, commit, gate result, and follow-up.

This repository coordinates workspace integration, Worktrunk delegation, and local development. Keep coordination changes here, and make application changes in the focused repository selected by the seed.
