# Senshac Container Topology

Container-producing repositories own their image build, toolchain, security
updates, and release tags. Application repositories consume those images for
the same CI and local Act paths.

## Producers

| Repository | Image | Duty |
| --- | --- | --- |
| `senshac-runner` | `ghcr.io/nacosolutions/senshac-ci-runner` | Bun, Astro, Flox, Act, checks, and general CI runtime |
| `senshac-media-runner` | `ghcr.io/nacosolutions/senshac-media-runner` | Sharp, ffmpeg, font processing, and media verification |

## Consumer contract

Consumers must select an image through an explicit environment variable or
workflow input. CI defaults must be immutable tags or digests, never
`latest`. Local development may use `latest` only when explicitly requested.

```bash
CI_RUNNER_IMAGE=ghcr.io/nacosolutions/senshac-ci-runner:sha-<commit> \
  act pull_request \
  --platform ubuntu-latest="$CI_RUNNER_IMAGE"
```

The GitHub workflow and local Act invocation must use the same image reference
for a verification run. A producer publishes a commit tag first, verifies it,
then advances a convenience tag such as `latest`.

## Boundaries

- Producers do not contain website content or application routes.
- Consumers own workflow policy and repository-specific commands.
- A media producer transforms inputs from R2 or a mounted input directory and
  writes only to an explicit output directory or configured R2 destination.
- Credentials remain in GitHub/Act secrets or local ignored files; images never
  contain credentials.

## Rollback

Consumers can revert the image reference to the previous verified digest
without changing application code. A failed producer release must not advance
the convenience tag.
