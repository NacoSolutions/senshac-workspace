# Portable agent toolkit rollout plan

## Goal
Bring the six-repository agent toolkit into alignment with the accepted portable baseline, and make workspace validation detect missing baseline skills or portable rules when all repository worktrees are available.

## Non-goals
- Do not rewrite existing repository-specific versions of shared skills; the matrix explicitly allows tailored copies.
- Do not install skills globally, create symlinks, or copy credentials, runtime state, or application code.
- Do not change the owner of the canonical Seeds/Terrarium graph.
- Add only the role skills the current matrix already claims but the audit found missing; keep all other role bundles unchanged.

## Context and evidence
- `docs/agent-skill-matrix.md` defines eight skills and seven portable rules for every active repository.
- All six repositories already contain the seven portable rule files.
- `terrarium-triage/SKILL.md` is missing in web, content, infra, runner, and media-runner; it is present in workspace.
- `git-workflow/SKILL.md` is missing in infra; it is present in the other four focused repositories.
- Shared principles, bounded-task, Warren, Git, and verification skills are repository-tailored, so byte-for-byte equality is not a valid drift condition. Seeds and Mulch CLI skills currently match the canonical workspace copies.
- `scripts/check-agent-toolkit` validates only the canonical workspace copies today. The active repository registry is `.config/workspace.toml`; local wrappers expose each repo's `main/` worktree.
- Role-bundle audit found `modular-cutover` missing from workspace, `security-review` missing from content, and media processing/R2/publication guidance missing as a dedicated media-runner skill. These are named in the current matrix and therefore need focused repository-local skill files and AGENTS links.

## Blast radius
Workspace toolkit checker/tests and documentation; AGENTS.md plus portable skill files in five focused repositories; one reviewable PR per repository. No runtime or application behavior changes.

## Steps
1. Add `terrarium-triage` to all five focused repositories and link it in AGENTS.md. Add a focused `git-workflow` skill to infra, plus workspace `modular-cutover`, content `security-review`, and media-runner operations skills already declared by the role matrix; link each in AGENTS.md.
2. Extend `scripts/check-agent-toolkit` to validate every active repo's eight baseline skills, seven portable rules, and declared role skills when repository wrappers are available; keep canonical-only CI behavior when wrappers are absent and provide strict mode for complete validation.
3. Extend `scripts/workspace-test` with temporary registered repositories containing baseline and role skills; prove strict validation passes when complete and fails on a missing baseline skill, portable rule, role skill/link, or incomplete active registry.
4. Update the matrix role rows to use actual skill IDs and document required presence and checker behavior without requiring byte-identical repository-tailored skill content.
5. Run workspace and focused repo gates, submit/merge focused PRs, update `senshac-workspace-74f5` through Seeds CLI with merged evidence, and verify all six `main` worktrees are clean.

## Verification
- `scripts/check-agent-toolkit` canonical-only and strict multi-repo test fixtures.
- `scripts/workspace-test` (including failure-path assertions).
- `scripts/workspace-check`, `seeds doctor`, and `mulch validate` in the workspace.
- For each focused repo: `git diff --check`, `seeds doctor`, `mulch validate`, its documented repository gate where available, and all matrix-declared skill links.
- Final audit: all six repos' AGENTS links resolve; baseline skill/rule files exist; all six `main` worktrees are clean and match `origin/main`.

## Rollback
Revert only the toolkit checker/tests/matrix commit and each focused repo's toolkit PR if validation exposes a false-positive or an incompatible canonical instruction. Preserve any unrelated repository state.

## Open questions
None for the acceptance gaps identified. Keep repository-specific wording in local skill copies; the checker validates presence, not identical content.

### For Executor
Read order: this plan, workspace `AGENTS.md`, `docs/agent-skill-matrix.md`, workspace checker/tests, then each focused repo `AGENTS.md` and existing role skills.
Assumed working state: clean `main` worktrees; use Worktrunk worktrees for persistent changes.
Owned files: workspace toolkit docs/scripts/tests; focused repo `AGENTS.md` and `.agents/skills/{terrarium-triage,git-workflow}/SKILL.md` only where missing.
Verification commands: as listed above; run them in each owning repository.
