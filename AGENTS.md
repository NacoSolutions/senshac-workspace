# Senshac Workspace

This local-only meta-repo coordinates the Senshac focused repositories. It
does not contain application code or plaintext secrets.

Use `./scripts/workspace-status` to inspect registered repositories. Use the
active `senshac-web` repository for the canonical Seeds/Terrarium graph until
a promoted workspace repository owns cross-repo tracking.

Routine task selection is `dx tr triage` in the active repository. Use `sd`
for tracker mutation and integrity debugging. Use `wt` inside the repository
that owns the selected seed.
