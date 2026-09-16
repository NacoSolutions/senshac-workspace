# Senshac Workspace

This meta-repository is the registry and operator entry point for the focused
Senshac repositories. It contains coordination scripts and documentation, not
application code or plaintext secrets.

## Bootstrap

Clone the meta-repository beside the focused bare-repository wrappers:

```text
NacoSolutions/
├── senshac-workspace/
├── senshac/
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
this repository; application-specific tracker ownership can move into a
focused repository once its gates are ready.

## Seeds and merge behavior

The tracker was initialized with the pinned repository command `sd init`.
`.gitattributes` uses the id-aware `merge=seeds-jsonl` driver for Seeds JSONL
files. Unlike `merge=union`, it performs a three-way merge of rewritten rows
and leaves genuine field conflicts for review. `workspace-bootstrap` registers
the driver locally. YAML configuration and other structured files use ordinary
reviewable merges.

## Warren model policy

The default Warren model is `openai/gpt-5.6-luna`, selected for routine
maintenance, triage, and high-volume work. Kimi K3 is an escalation option for
large refactors, difficult debugging, and long-horizon tasks. Escalation must
be explicit, tied to a Seeds record, and use a cost cap; it is not the default
for scheduled runs.
