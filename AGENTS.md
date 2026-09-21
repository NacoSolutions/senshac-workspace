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

For focused autonomous changes, follow [Bounded Warren Task](.agents/skills/bounded-warren-task/SKILL.md). Use positive phrasing, specific instructions, defense in depth, gentle coding, direct execution, and token economy. Keep changes scoped to the named objective and files, inspect the smallest relevant surface, preserve local conventions, run a bounded relevant check, and commit the completed work. For this workspace, that means integrating focused repositories, using Worktrunk through `scripts/wx`, and keeping local development coordination in this repository.
