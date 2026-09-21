# Buzz Deployment, Warren Bridge, and Operations Plan

> Deferred integration plan. The active delivery priority remains Warren execution and GitHub delivery across the modular Senshac repositories.

## Purpose

Define the future integration between Buzz and Warren without changing the current Warren/GitHub delivery path. Buzz will provide a collaboration, notification, signed-audit, and supervised-control surface. Warren will continue to execute agents, manage sandboxes, stream run events, create GitHub pull requests, and perform policy-controlled merges.

## Scope

This document covers:

- Buzz deployment and community setup
- Warren-to-Buzz event delivery
- Buzz-to-Warren supervised commands
- identity, authentication, and key custody
- a stable event schema
- service operations, recovery, and observability
- a later, separately evaluated Buzz Forge migration

This document does not change repository topology, Warren agent images, GitHub branch protection, or the current GitHub App delivery contract.

## Target architecture

```text
Human / agent in Buzz
        │
        │ signed message or command
        ▼
Buzz relay and community
        │
        │ bridge API
        ▼
Warren–Buzz bridge (host-side service)
        │                 │
        │ Warren API       │ Warren event stream
        ▼                 ▼
Warren instances ───────► run / plan-run lifecycle
        │
        │ GitHub App delivery
        ▼
GitHub modular repositories
```

### Authority model

| Capability | System of record |
|---|---|
| Collaboration and signed conversation | Buzz |
| Run execution and sandboxing | Warren |
| Agent image and project configuration | Warren project plus repository configuration |
| GitHub authentication and PR delivery | Warren GitHub App |
| GitHub branch protection and merge policy | GitHub |
| Run history and execution events | Warren, mirrored into Buzz |
| Human commands | Buzz, validated by the bridge before Warren submission |

A single action has one authoritative executor. Buzz records and presents the action; Warren executes it; GitHub remains authoritative for repository state and merge result.

## Deployment plan

### Community foundation

1. Deploy one private Buzz community for Senshac.
2. Place Buzz behind the existing Caddy and Tailscale access boundary.
3. Assign a stable community hostname and TLS certificate.
4. Use a dedicated Postgres and Redis data store with backups.
5. Create separate identities for the human operator, Warren bridge, and optional review agents.
6. Store Nostr private keys in a host-protected secret location with a documented backup.

### Bridge service

Run the bridge as a separate host-side service next to the Warren instances. It should have:

- Warren base URL and operator token as secrets
- Buzz relay URL and bridge identity key as secrets
- an allowlist of Warren project IDs
- an allowlist of accepted command types
- persistent correlation state for active runs
- outbound-only connections where practical
- a health endpoint bound to the private management interface

The bridge must not require the Warren agent image. It is an integration service, not an agent execution environment.

## Bridge API contract

### Warren to Buzz

The bridge subscribes to:

- `GET /runs/:id/events?follow=1`
- `GET /plan-runs/:id/events`

It publishes normalized Buzz messages for run start, progress, tool milestones, waiting states, PR delivery, CI/review status, completion, cancellation, and failure.

### Buzz to Warren

The first command set is intentionally small:

```text
run start       Start one bounded Warren run
plan start      Start a Warren plan-run
run status      Show correlated Warren state
run steer       Send an operator steering message
run cancel      Cancel an active run
```

Every command includes:

- community ID
- Buzz event ID
- operator identity
- Warren project ID
- optional run or plan-run ID
- idempotency key
- timestamp

The bridge validates identity, project allowlists, command permissions, and active-run state before calling Warren.

## Event schema

Use a stable envelope for messages mirrored into Buzz:

```json
{
  "schema": "senshac.warren.v1",
  "event_id": "warren-event-id",
  "event_type": "run.completed",
  "occurred_at": "2026-09-17T12:00:00Z",
  "source": "warren.naco.solutions",
  "community": "senshac",
  "project_id": "prj_example",
  "repository": "NacoSolutions/senshac-web",
  "run_id": "run_example",
  "plan_run_id": null,
  "commit": "abc123",
  "branch": "warren/task-example",
  "pull_request": {
    "number": 42,
    "url": "https://github.com/NacoSolutions/senshac-web/pull/42"
  },
  "status": "succeeded",
  "summary": "Quality gates passed and a pull request is ready.",
  "links": [],
  "dedupe_key": "run_example:run.completed"
}
```

Initial event types:

- `run.created`
- `run.started`
- `run.progress`
- `run.waiting`
- `run.pr_created`
- `run.checks_updated`
- `run.completed`
- `run.failed`
- `run.cancelled`
- `plan.started`
- `plan.step_completed`
- `plan.completed`
- `plan.failed`

The bridge must preserve the original Warren event ID and use `dedupe_key` so reconnects and replay do not create duplicate Buzz messages.

## Channel and thread model

Suggested Buzz structure:

```text
#senshac
#senshac-web
#senshac-web/run-<run-id>
#senshac-web/pr-<number>
```

- Repository channels contain current work summaries.
- Run threads contain detailed progress.
- PR threads contain delivery, CI, review, and merge events.
- Plan-run summaries link each child run and its final outcome.

## Security model

- Warren operator tokens remain host-only.
- Buzz commands require a signed identity recognized by the private community.
- The bridge maps Buzz identities to command roles.
- Run creation and steering are permitted for operators and explicitly delegated agents.
- Cancellation is available to operators and designated supervisors.
- Merge remains governed by GitHub protection and Warren's delivery policy.
- Secrets are never copied into Buzz messages, event payloads, or repository files.
- All bridge actions include an audit link to the originating Buzz event and Warren run.

## Reliability and operations

### Service management

- Run the bridge with a systemd user service or equivalent rootless container.
- Restart automatically on failure.
- Keep the bridge stateless where possible; persist only correlation and deduplication state.
- Expose `/healthz` and `/readyz` on the private interface.
- Use structured JSON logs with `event_id`, `run_id`, `project_id`, and `repository`.

### Recovery

- Reconnect to Warren event streams with backoff.
- Resume from the last acknowledged event where the Warren API supports replay.
- Reconcile active Warren runs after bridge restart.
- Reconcile Buzz delivery using the dedupe key.
- Mark delivery uncertainty explicitly and provide a resync command.

### Monitoring

Track:

- active runs by repository
- event delivery latency
- event delivery failures
- bridge reconnect count
- command acceptance and rejection counts
- stale correlation records
- Warren and Buzz health state

## Delivery milestones

### M0 — Design and credentials

- Choose Buzz hostname and community boundary.
- Confirm identity and key custody.
- Confirm Postgres, Redis, backup, and Tailscale placement.
- Write the bridge API contract and command roles.

### M1 — Read-only bridge

- Deploy the bridge with Warren event subscriptions.
- Publish run and PR status into Buzz.
- Add health, structured logs, deduplication, and replay handling.
- Pilot with `senshac-web`.

### M2 — Supervised commands

- Add `status`, `start`, `plan`, `steer`, and `cancel`.
- Require signed Buzz identity and project allowlists.
- Exercise one bounded run and one plan-run.

### M3 — Modular-repository rollout

- Add infra, runner, media-runner, workspace, and content.
- Add nightly-run summaries and Seeds links.
- Add operator dashboards and alerting.

### M4 — Forge evaluation

Evaluate Buzz Git hosting and merge coordination separately using a disposable repository or branch. Compare identity, branch protection, CI integration, approvals, rollback, and GitHub interoperability before selecting a migration path.

## Relationship to the active modular-repository plan

The active plan continues independently:

1. Keep the six modular repositories as the delivery units.
2. Keep Warren projects registered for each repository.
3. Keep the verified Warren agent image with Seeds, Mulch, Terrarium, Trellis, Bun, and Node tooling.
4. Keep agents focused on edits, quality gates, and commits.
5. Keep Warren/GitHub App responsible for branch push, PR creation, review automation, and merge delivery.
6. Continue the Astro/Tina/Cloudflare cutover through `senshac-web` when its migration seeds are ready.

Buzz integration begins after the current Warren/GitHub delivery path remains stable and does not block the modular changeover.
