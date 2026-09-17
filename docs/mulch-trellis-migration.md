# Mulch and legacy Trellis migration

Seed: `senshac-5b4e`

This is the migration manifest for the modular Senshac workspace. It preserves
historical references without treating the archived monorepo as an active
worktree. The workspace registry in [`.config/workspace.toml`](../.config/workspace.toml)
is the current ownership source of truth.

## Source audit and traceability

The archived `NacoSolutions/senshac` repository was inspected at commit
`b46b93362d944dac324797ef8a2c9ca71f9e5173` (its `main` tip at the time of this
migration). It contains a `.mulch/` directory with ten domain files and no
`.trellis/` directory, Trellis plan, or Trellis spec. Therefore this document
does not invent or silently convert historical Trellis state. The archived
knowledge sources are:

- `docs/workspace-split-topology.md` (`senshac-6af9`) — the staged workspace
  plan and ownership boundaries.
- `docs/workspace-seed-routing.md` (`senshac-d2ed`) — the seed-to-repository
  routing map and deferred decisions.
- `docs/workspace-agent-onboarding.md` (`senshac-3a64`) — operator workflow,
  tracker commands, and cutover rules.
- `docs/infra-inventory.md` (`senshac-a63e`) — read-only Cloudflare inventory
  and the proposed infrastructure boundary.
- `docs/workspace-focused-repo-prototype.md` — the runner prototype and Tina
  content-repository constraints.
- `docs/secrets-sops-age.md` and `docs/containment-plan.md` — security and
  containment constraints.
- `.mulch/mulch.config.yaml`, `.mulch/README.md`, and
  `.mulch/expertise/*.jsonl` — durable expertise (31 records across the
  archived domains); these are historical input, not files to copy wholesale.
- `.seeds/issues.jsonl` — historical task state. It remains traceable by seed
  ID and is not re-created as duplicate issues in focused repositories.

The absence of `.trellis` is itself a finding: Trellis readiness for this
repository is a check of the current agent guidance, not a migration of an
archived Trellis corpus. If an archived ref, tag, or export later supplies a
Trellis artifact, add its immutable ref and disposition here before importing
anything.

## Classification manifest

Every source category has one positive destination. **Seed** means executable,
acceptance-testable work with one owning repository. **Mulch** means a durable
convention, architecture decision, boundary, discovery, or verified lesson.
Historical source links stay in the Seed description or Mulch record metadata;
source prose is not duplicated merely for convenience.

| Legacy item | Classification | Destination and disposition |
| --- | --- | --- |
| Workspace split topology and phase gates | Mulch | `senshac-workspace`: architecture record for the five-repository topology, staged cutover, rollback, and the rule that the archived repo remains read-only. Follow-up implementation is a Seed only when it has an owner and acceptance evidence. |
| Seed routing table and open-seed backlog | Seed | Keep each actionable ID in the canonical workspace Seeds graph and route it to exactly one owner: `senshac-web`, `senshac-content`, `senshac-infra`, `senshac-runner`, `senshac-media-runner`, or this workspace. Cross-repository work is one parent Seed with linked child work, never duplicate IDs. |
| Agent onboarding, `dx`/`fx`/Worktrunk command contract | Mulch | `senshac-workspace`: operator convention. A broken or missing wrapper is a separate workspace or runner Seed with a reproducible gate. |
| Astro/Tina application, route, visual, PageSpeed, and generated API work | Seed | `senshac-web` (currently the live implementation). Preserve the legacy Seed ID in the new record/link; do not put implementation tasks in Mulch. |
| Editorial JSON/MDX, translations, owner decisions, and Tina content | Seed | `senshac-content` when its TinaCloud binding is ready; until then keep production-impacting work in the live web repository. Owner-input blockers remain Seeds, not expertise. |
| Cloudflare Pages/R2/Workers/DNS/email/IaC changes | Seed | `senshac-infra`, one reversible resource surface per Seed. The inventory, least-privilege gaps, no-second-deploy-path rule, and rollback constraints are Mulch. |
| Flox, CI runner image, Act/rootless Podman, and workflow-runtime changes | Seed | `senshac-runner`; immutable image consumer updates may link a web Seed. Verified image digest and producer/consumer boundary are Mulch. |
| Sharp/ffmpeg, R2 media processing, and Instagram/Novedades ingestion | Seed | `senshac-media-runner`; layout `sizes` and rendering remain web Seeds. Media mount, command, credential, and output contracts are Mulch. |
| SOPS/age, plaintext-secret, and containment rules | Mulch | Record the no-plaintext-in-Git rule, key ownership, decrypt/rotation/recovery preconditions, and the boundary between workspace and focused repos. A missing or failing secret flow is a Seed linked to this convention. |
| Existing Mulch expertise records | Mulch | Re-home only records whose scope is clear and still true. Preserve the archived source path and commit in each record; rewrite repository-specific paths to the owning repo. Expired/tactical observations are not migrated. |
| Historical `.seeds` rows, closed plans, and deferred decisions | Seed | Preserve through the canonical Seeds history and links. Reopen or create a focused follow-up only for currently actionable work; deferred decisions stay referenced in this manifest until an owner Seed exists. |
| Legacy `.trellis` plans/specs | Seed or Mulch by content | None were found. If later discovered, classify executable acceptance criteria as owning-repo Seeds and conventions/discoveries as Mulch, retaining the immutable source ref. Never restore old plans to active Trellis state automatically. |

## Repository-local Mulch bootstrap

The smallest safe bootstrap is deliberately non-invasive: each modular repo
owns its own `.mulch/`, while this workspace owns only cross-repository
conventions and the migration index. Do not make a focused repository depend
on this repository at runtime.

For each of `senshac-web`, `senshac-content`, `senshac-infra`,
`senshac-runner`, and `senshac-media-runner`:

1. Initialize `.mulch/` with the pinned/local Mulch CLI (`ml init`), or create
   the equivalent tracked `mulch.config.yaml`, `README.md`, and `expertise/`
   directory when the CLI is unavailable.
2. Start with the config and README only. Add a domain JSONL file only when a
   verified record needs it; do not copy the archive's 31 records wholesale.
3. Use the smallest domain set matching ownership: `architecture` and
   `operations` for every repo; add `content` for content, `deployment` for
   infra, `environment`/`technical` for runner, and `media` for media-runner.
   The web repo may add `frontend` and `tina`.
4. Record a source reference (`senshac-5b4e`, archived path, and immutable
   commit) for migrated lessons. Add the owning Seed ID for actionable
   consequences. Never record credentials, local paths, transient logs, or
   unverified workarounds.
5. Validate with `ml validate` and prime before the first repository-local
   migration. If `ml` is unavailable, leave the bootstrap staged and document
   the missing tool; do not fabricate records.

The workspace `.mulch/` (if introduced later) should contain only graph-level
routing, shared security policy, repository registry conventions, and this
historical migration. Repository-local implementation details belong in the
focused repository. A cross-reference should use this form:

> Source: `senshac-workspace` Seed `senshac-5b4e`; archived
> `docs/<path>` at `<immutable-commit>`. Implementation: `<repo>` Seed
> `<id>`; durable rule: `<repo>/.mulch/expertise/<domain>.jsonl`.

## Staged rollout and gates

1. **Manifest (this change):** land the classification and immutable source
   references in `senshac-workspace`; do not move application files or tracker
   ownership.
2. **Bootstrap:** initialize `.mulch/` in one focused repository at a time,
   beginning with `senshac-runner` or `senshac-media-runner`. Prime, validate,
   and review the first records before adding another repo.
3. **Seed routing:** route implementation work using the registry and canonical
   graph. Keep `senshac-web` as the current Seeds/Terrarium graph until an
   explicit tracker migration changes ownership.
4. **Cutover:** only a focused repository's own Seed, gate, and deployment
   evidence can authorize application or infrastructure ownership transfer.
   The archived repository remains available for historical lookup and is
   never edited as part of this migration.

For this manifest, the workspace gate is `./scripts/workspace-test`. Trellis
readiness is the pinned workflow equivalent:

```bash
./scripts/workspace-test
bun "$RUNNER_TEMP/trellis/src/cli/main.ts" audit . --no-persist --no-output --fail-on none
bun "$RUNNER_TEMP/trellis/src/cli/main.ts" drift . --fail-on none
```

The last two commands require the pinned Trellis checkout and install described
in `.github/workflows/trellis-readiness.yml`; they must not fetch an unpinned
revision. Record command results in the linked PR, not in Mulch.
