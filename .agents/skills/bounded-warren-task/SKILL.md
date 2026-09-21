# Bounded Warren Task

Use this skill for focused autonomous changes.

## Contract
- Work on the named objective and explicitly named files.
- Inspect the smallest relevant surface before editing.
- Follow repository-local instructions and use Seeds, Mulch, Canopy, and project tools when present.
- Use positive, specific instructions and state the desired outcome.
- Keep edits within the stated objective and preserve adjacent behavior.
- Run one relevant, bounded quality gate after editing. Repeat a gate only when its result provides an actionable repair.
- Commit the completed change; Warren delivers the branch and pull request.
- After a clean commit and bounded verification, stop and report the commit, checks, and follow-up.
- Respect the task cost/time cap and escalate a blocker instead of extending the task.

## Commands and acceptance

Run the applicable repository quality gate, then verify `git diff --check`,
`git status --short`, and `git log -1 --oneline`. Acceptance is a focused
change, a zero-exit gate, a clean diff, and a committed result.

## Completion report
State files changed, commit, gate command/result, and remaining follow-up.
