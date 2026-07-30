# OpenProject Docker Stack

NickLinney.Software reference repository for a local-first, Docker-based OpenProject deployment with governed operations and persistent PostgreSQL storage.

The current `pre-alpha-2` goal is the lean OpenProject baseline for `NLSW000003`. The earlier Ollama subset remains preserved only as historical `pre-alpha-1` learning evidence.

## Status

- Lifecycle phase: Pre-Alpha
- Current release vehicle: `pre-alpha-2`
- Current working branch: `feature/pre-alpha-2-lean-baseline`
- Target milestone in this planning horizon: `pre-alpha-2`

## Objectives

- Provide a reproducible OpenProject stack using Docker Compose.
- Preserve PostgreSQL data and OpenProject assets outside disposable containers.
- Maintain truthful operational documentation and governed release evidence.

## Repository Layout

- `compose/` - Compose definitions for the stack
- `config/` - Environment, proxy, and future service configuration
- `scripts/` - Install, backup, restore, update, and health workflows
- `docs/` - Deployment and operations documentation
- `backups/` - Local backup output
- `volumes/` - Placeholder for operator-managed local bind mounts if needed

## Quick Start

1. Copy `.env.example` to `.env`.
2. Set a real `SECRET_KEY_BASE`.
3. Start the stack with `./scripts/install.sh`.
4. Validate the deployment with `./scripts/healthcheck.sh`.

If `8080` is already in use on the host, set `PORT=127.0.0.1:<alternate-port>` in `.env` before starting the stack, and update `OPENPROJECT_HOST__NAME` plus `COLLABORATIVE_SERVER_URL` to the same public host and port.

## Notes

- OpenProject is configured for local-first access by default.
- The default web endpoint is `http://127.0.0.1:8080`.
- `pre-alpha-1` learning-artifact evidence remains in the repository for historical traceability, but the active product baseline is OpenProject-only.
- Branch-contained validation evidence is recorded in `docs/ValidationEvidence.md`.
- The optional proxy profile is documented but not required for first local bring-up.
- The project lifecycle tracker is maintained outside the repository on purpose.
