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
`.gitattributes` uses `merge=union` only for append-oriented Seeds JSONL files:
`issues.jsonl`, `plans.jsonl`, and `templates.jsonl`. This reduces avoidable
conflicts when independent agents append records. YAML configuration and other
structured files use ordinary reviewable merges; union merging is not a general
purpose conflict resolver.

## Seeds and merge behavior

The tracker was initialized with the pinned repository command `sd init`.
`.gitattributes` uses `merge=union` only for append-oriented Seeds JSONL files:
`issues.jsonl`, `plans.jsonl`, and `templates.jsonl`. This reduces avoidable
conflicts when independent agents append records. YAML configuration and other
structured files use ordinary reviewable merges; union merging is not a general
purpose conflict resolver.
