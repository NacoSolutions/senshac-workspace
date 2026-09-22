# Senshac Workspace

This meta-repository coordinates the Senshac focused repositories. It does not
contain application code or plaintext secrets.

Run `./scripts/workspace-bootstrap` before cross-repository work and
`./scripts/workspace-test` after changing registry or wrapper behavior. Use this repository’s Seeds for cross-repository coordination and each
focused repository’s Seeds for its implementation tasks. Run `sd ready` and
`ml prime` in the owning worktree before starting work.

Use `./scripts/wx <wt-command> --repo <name> [wt args...]` to select a
repository and delegate directly to native `wt`, for example
`./scripts/wx switch --repo senshac-web --create feature/name`.

Routine task selection is `dx tr triage` in the active repository. Use `sd`
for tracker mutation and integrity debugging. Use `wt` inside the repository
that owns the selected seed.

## Agent guidance

Use [Bounded Warren Task](.agents/skills/bounded-warren-task/SKILL.md) for focused changes. State the desired outcome with positive, specific instructions; work on the named files and inspect the smallest relevant surface first. Apply defense in depth through repository guidance, focused validation, and a clean commit, while using gentle coding to preserve adjacent behavior. Execute directly with Seeds, Mulch, Canopy, Worktrunk, and the workspace tools when they apply. Keep the change economical in tokens and scope, and report the files, commit, gate result, and follow-up.

## Repository-local skills

| Skill | Use when |
| --- | --- |
| [Senshac agent principles](.agents/skills/senshac-agent-principles/SKILL.md) | Every bounded task; set positive scope, preserve state, and keep evidence economical. |
| [Seeds issue lifecycle](.agents/skills/seeds-issue-lifecycle/SKILL.md) | Auditing, advancing, or closing a Seeds issue. |
| [Mulch prime record](.agents/skills/mulch-prime-record/SKILL.md) | Priming repository expertise or recording a reusable lesson. |
| [Terrarium triage](.agents/skills/terrarium-triage/SKILL.md) | Selecting the next actionable seed from the canonical graph. |
| [Trellis readiness drift](.agents/skills/trellis-readiness-drift/SKILL.md) | Checking pinned Trellis readiness or canonical drift before delivery. |
| [Warren run PR delivery](.agents/skills/warren-run-pr-delivery/SKILL.md) | Delivering a bounded run through gate, commit, and PR evidence. |
| [Git workflow](.agents/skills/git-workflow/SKILL.md) | Reviewing, staging, committing, and verifying focused changes. |

This repository coordinates workspace integration, Worktrunk delegation, and local development. Keep coordination changes here, and make application changes in the focused repository selected by the seed.

## Portable rules

Load the repository-local rules in `.agents/rules/` before work:
`caveman.md`, `gentle-coding.md`, `direct-execution.md`,
`positive-phrasing.md`, `defense-in-depth.md`, `token-economy.md`, and
`llm-shorthand.md`. Load `instruction-specificity.md` when authoring or
reviewing agent instructions, skills, or rules. These relative paths work in
Warren sandboxes and local checkouts.
