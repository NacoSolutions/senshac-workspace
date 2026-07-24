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
