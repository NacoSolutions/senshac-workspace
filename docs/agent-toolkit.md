# Senshac agent toolkit

This repository carries a small, repository-local set of reusable workflows in
`.agents/skills/`. They describe positive operating patterns rather than
application implementation. An agent may load the relevant skill by name:

| Skill | Use it for |
| --- | --- |
| `seeds-issue-lifecycle` | Auditing, advancing, evidencing, and closing a Seeds issue. |
| `mulch-prime-record` | Priming durable expertise before work and recording a verified lesson after it. |
| `terrarium-triage` | Selecting one bounded seed from the canonical Terrarium graph. |
| `trellis-readiness-drift` | Running pinned Jayminwest Trellis readiness and drift checks. |
| `warren-run-pr-delivery` | Turning one bounded Warren run into a tested, committed, linked PR. |
| `seeds-cli` | Using the installed `seeds` executable for issue lifecycle and evidence. |
| `mulch-cli` | Using the installed `mulch` executable for expertise lifecycle and validation. |
| `warren-operations` | Scoping, dispatching, and reviewing Warren runs. |
| `toolchain-bun-web` | Bun, Tina, Astro, HTMX, Alpine, UnoCSS, and Pages build boundaries. |

## Repository consumption

The focused repositories consume these workflows according to ownership; they
keep their own commands, gates, and implementation details:

- **`senshac-content`** uses issue lifecycle and Mulch guidance for Tina content
  work. Content changes stay in this repository.
- **`senshac-web`** is the current canonical Seeds/Terrarium graph during the
  modular transition. It uses triage, issue lifecycle, Trellis checks, and
  Warren delivery for the web implementation.
- **`senshac-infra`** uses issue lifecycle and Warren delivery for Cloudflare
  infrastructure, with its own infrastructure gate and ownership boundaries.
- **`senshac-runner`** uses Mulch and Warren delivery for Flox/CI runner images;
  image publication and digest evidence remain its responsibility.
- **`senshac-media-runner`** uses Mulch and Warren delivery for media processing
  and its container contract; credentials and R2 operations remain runtime
  concerns of that repository.
- **`senshac-workspace`** owns this toolkit, the registry, cross-repository
  routing, and workspace contracts. Its gate is `./scripts/workspace-test`.

This is guidance, not a shared runtime dependency: a focused repository may
copy or reference the applicable skill when adopting it, but must not require
this workspace at runtime. Always follow the target repository's local
instructions and quality gate. Use the issue identifier to connect work across
repositories rather than duplicating tracker records.
