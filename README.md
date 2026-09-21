# Senshac Workspace

This meta-repository is the registry and operator entry point for the focused
Senshac repositories. It contains coordination scripts and documentation, not
application code or plaintext secrets.

## Bootstrap

Clone the meta-repository beside the focused bare-repository wrappers:

```text
NacoSolutions/
├── senshac-workspace/
├── senshac-web/
├── senshac-runner/
└── senshac-media-runner/
```

Each wrapper must have a clean `main/` integration worktree and the GitHub
origin declared in `.config/workspace.toml`. Then verify the workspace:

```bash
./scripts/workspace-bootstrap
./scripts/workspace-test
```

Use `./scripts/wx <wt-command> --repo <name> [arguments]` only for selecting a
registered repository before passing arguments directly to Worktrunk. Run
repository commands through that repository's `dx` or `fx` wrapper.

The archived `senshac` monorepo is no longer a workspace member. During the
modular transition, workspace-level Seeds/Terrarium coordination is owned by
this repository; application tasks live in each focused repository’s Seeds store.

## Seeds and merge behavior

The tracker was initialized with the pinned repository command `sd init`.
`.gitattributes` uses Git's canonical `merge=union` driver for `.seeds/*.jsonl`
and `.mulch/expertise/*.jsonl` files. YAML configuration and other structured
files use ordinary reviewable merges.

## Warren model policy

The default Warren model is `openai/gpt-5.6-luna`, selected for routine
maintenance, triage, and high-volume work. Kimi K3 is an escalation option for
large refactors, difficult debugging, and long-horizon tasks. Escalation must
be explicit, tied to a Seeds record, and use a cost cap; it is not the default
for scheduled runs.

## Local repository layout

The workspace uses `repos/` as a local-only checkout boundary. Each entry is a
symlink to an independently tracked repository wrapper beside this workspace;
the directory is ignored by Git and never becomes a nested monorepo. Populate
it with sibling wrappers, for example:

```bash
mkdir -p repos
ln -sfn ../../../senshac-web repos/senshac-web
ln -sfn ../../../senshac-content repos/senshac-content
```

Use `./scripts/workspace-check` before coordination and
`./scripts/wx <command> --repo <name>` to dispatch Worktrunk commands to a
registered repository.


`workspace-bootstrap` also creates the local-only `senshac-web/main/senshac-content`
link when both web and content checkouts are present. This enables local Tina
editing while keeping the content repository independently tracked; the link is
recorded in the web worktree's Git exclude file and is absent from commits.
