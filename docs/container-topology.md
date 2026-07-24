# Senshac Container Topology

Seed: `senshac-8d1f`

Container-producing repositories own their image source, Flox environment,
security updates, publication workflow, and release evidence. Application
repositories consume verified immutable digests in GitHub Actions and local
rootless Act.

## Producers

| Repository | Image | Duty | State |
| --- | --- | --- | --- |
| `NacoSolutions/senshac-runner` | `ghcr.io/nacosolutions/senshac-runner` | Bun, Astro, Flox, Act, checks, and general CI runtime. | Active |
| `NacoSolutions/senshac-media-runner` | `ghcr.io/nacosolutions/senshac-media-processor` | Sharp, ffmpeg, font processing, R2 transfer, and media verification. | Active |

Repository and package names should stay aligned when ownership permits it. The
media package uses `senshac-media-processor` because the legacy web repository
owns the historical `senshac-media-runner` package and GitHub does not allow
the focused workflow token to transfer its administration. A producer must not
take over a package first published by another repository. Images should include
`org.opencontainers.image.source` pointing to their owning GitHub repository.

## Publication

Each producer follows this order:

1. Build `ghcr.io/nacosolutions/<repo>:sha-<full-commit>`.
2. Push only that immutable tag.
3. Remove the local tag, pull the registry artifact, and smoke-test it.
4. Record its `repo@sha256:<digest>` reference.
5. Tag that verified artifact as `latest`, push it, and confirm both tags have
   the same digest.
6. Record the previous `latest` digest as the rollback target.

`latest` is a convenience pointer for human inspection. CI and checked-in
consumer defaults must never use it.

The publishing workflow requires:

```yaml
permissions:
  contents: read
  packages: write
```

It logs in to `ghcr.io` with the repository `GITHUB_TOKEN`. No registry token,
R2 credential, Cloudflare token, or application secret is copied into an image
layer.

## General Runner Consumer

The web repository pins its validated runner:

```text
ghcr.io/nacosolutions/senshac-runner@sha256:e090a4d4aabe4573839584394f501c73a87ed36172690ca56a9a6f9edafa3f63
```

Local Act uses the same reference:

```bash
SENSHAC_RUNNER_IMAGE='ghcr.io/nacosolutions/senshac-runner@sha256:<digest>' \
  dx bun run test:workflow:ci
```

An uncommitted local candidate may be selected explicitly:

```bash
SENSHAC_RUNNER_IMAGE=localhost/senshac-runner:candidate \
  dx bun run test:workflow:ci
```

Candidate overrides are acceptance inputs, not checked-in CI defaults.

## Media Runner Contract

The media image accepts one operation at a time through its command:

```text
images   Read source images and write responsive AVIF/WebP variants.
video    Read source MP4 files and write HLS playlists and segments.
font     Read source font files and write language-subset WOFF2 files.
verify   Validate generated image, HLS, and font outputs.
download Download one explicit raw R2 object.
upload   Upload one generated output tree to production R2.
verify-r2 Compare generated output with production R2.
```

Local file operations use these mounts:

| Path | Mode | Purpose |
| --- | --- | --- |
| `/work/input` | read-only | Raw images, videos, or fonts selected by the caller. |
| `/work/output` | read-write | Generated artifacts; the caller owns cleanup and upload. |
| `/work/config` | read-only, optional | Non-secret batch manifest or processing policy. |

The container runs as the invoking rootless Podman user. Generated files must
remain writable by that user. Commands may not scan a repository implicitly or
write outside `/work/output`.

R2 commands receive credentials only at runtime:

```text
CLOUDFLARE_ACCOUNT_ID
R2_ACCESS_KEY_ID
R2_SECRET_ACCESS_KEY
R2_RAW_BUCKET
R2_PROD_BUCKET
```

Callers pass only the variables required by the selected operation. Logs must
not print credential values. The image contains no `.env` files.

The verified media digest is:

```text
ghcr.io/nacosolutions/senshac-media-processor@sha256:d070c3f6f98acb99d9f6f05060ffd69463c71e2ae1e422acafe0294580083dfe
```

GitHub workflows and local Act pin that reference directly. Local commands may
override it explicitly with `MEDIA_RUNNER_IMAGE`:

```bash
MEDIA_RUNNER_IMAGE='ghcr.io/nacosolutions/senshac-media-processor@sha256:<digest>' \
  dx bun run test:workflow:media
```

A direct local smoke test uses explicit mounts:

```bash
podman run --rm --userns=keep-id \
  -v "$PWD/input:/work/input:ro" \
  -v "$PWD/output:/work/output" \
  'ghcr.io/nacosolutions/senshac-media-processor@sha256:<digest>' verify
```

## Ownership Boundaries

- Producers do not contain website content, Astro components, Tina schemas, or
  route policy.
- Consumers own workflow triggers, repository-specific acceptance, and the
  exact digest they trust.
- Media processing algorithms, CLI routing, and R2 transfer/verification belong
  to `senshac-media-runner`.
- Layout `sizes`, eager/lazy behavior, content references, and UI rendering stay
  in `senshac-web`.
- Instagram fetching is a separate scheduled ingestion concern; it may consume
  media tooling but is not hidden in an image entrypoint.

## Failure And Rollback

- A build, push, pull-back, or smoke-test failure stops before `latest` moves.
- A consumer failure reverts its pinned digest to the prior verified digest.
- Producers never delete the current and rollback digests in the same cleanup
  cycle.
- GHCR retention cleanup preserves every digest referenced by a tracked
  consumer.
- Changing a command, mount, output naming rule, or required variable is a
  contract change and requires coordinated producer and consumer seeds.
