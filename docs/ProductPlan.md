# Product Plan

## Product Identity

- Product: OpenProject Docker Stack
- Project SID: NLSW-000003
- Plan Date: Thursday, July 30, 2026
- Current Lifecycle Phase: Pre-Alpha
- Current Release Target: `pre-alpha-1`

## Product Intent

Deliver a lean, security-conscious, fully dockerized OpenProject deployment that provides a usable local-first work management application with persistent PostgreSQL-backed storage and clear operator guidance.

## Product Boundary Decision

The project has now established that the Ollama-based AI integration path was successfully implemented and validated, but is not necessary for the correct end-state product boundary of `NLSW000003`.

This means:

- the AI feature path is treated as validated institutional learning
- the AI feature path is not treated as part of the intended lean product baseline
- the lean OpenProject product remains the correct target product for this project

## Release Strategy

### `pre-alpha-1`

`pre-alpha-1` is the intentional learning-artifact release target.

Its purpose is to preserve:

- the working macOS ARM64 implementation
- the validated OpenProject Docker Compose runtime
- the validated Ollama integration feature path
- the testing and documentation necessary to retain the feature path as a reusable learning artifact

`pre-alpha-1` should be treated as the release cutoff for the `Ollama Container AI with Local Host Fallback Feature Set` in this project context.

### `pre-alpha-2`

`pre-alpha-2` is the planned product realignment release.

Its purpose is to:

- remove all Ollama and AI-related components from this project
- preserve a full and complete dockerized OpenProject application
- re-test the lean product after removal
- confirm the cleaned product boundary before Alpha

### Alpha

Alpha should begin only after `pre-alpha-2` confirms that:

- the unneeded AI-related components are fully removed
- the lean OpenProject stack remains complete and usable
- the product documentation and testing reflect the corrected scope truthfully

## Product Scope by Release

### Scope for `pre-alpha-1`

- fully dockerized OpenProject stack
- persistent PostgreSQL-backed storage
- current validated documentation and governed sprint artifacts
- validated Ollama feature path retained as learning artifact
- MacBook Pro Apple Silicon local testing completion

### Scope for `pre-alpha-2`

- fully dockerized OpenProject stack
- persistent PostgreSQL-backed storage
- no Ollama, no AI feature paths, and no related components
- refreshed testing and documentation for the lean product

## Product Rules

- `pre-alpha-1` may contain validated AI-related feature work as a retained learning artifact.
- `pre-alpha-1` must not be misrepresented as the intended long-term product baseline for this project.
- `pre-alpha-2` is the release where the lean product boundary is re-established in code, documentation, and testing.
- Alpha hardening should proceed from the `pre-alpha-2` baseline, not from the AI-augmented `pre-alpha-1` learning artifact.

## Knowledge Export Rule

The `pre-alpha-1` code and supporting documentation may be packaged as a `.zip` learning artifact for reuse elsewhere. That package is intended to preserve validated knowledge without requiring all organization-level records to be moved into the code repository.
