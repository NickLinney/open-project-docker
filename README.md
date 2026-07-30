# OpenProject Docker Stack

NickLinney.Software reference repository for a local-first, Docker-based OpenProject deployment with governed operations, persistent PostgreSQL storage, and optional local Ollama support for repository-side automation.

For `pre-alpha-1`, the optional Ollama subset is preserved as a validated learning artifact. It is not the intended long-term product baseline for `NLSW000003`; `pre-alpha-2` is planned to remove AI-related components and re-establish the lean OpenProject baseline.

## Status

- Lifecycle phase: Pre-Alpha
- Current release vehicle: `pre-alpha-1`
- Current working branch: `feature/release-bootstrap`
- Target milestone in this planning horizon: `pre-alpha-1`

## Objectives

- Provide a reproducible OpenProject stack using Docker Compose.
- Preserve PostgreSQL data and OpenProject assets outside disposable containers.
- Default repository-side LLM execution to `llama3:8b`.
- Support host Ollama via `LOCAL_MODEL`.
- Support in-container Ollama via `CONTAINER_MODEL`.
- Keep cloud-model dependencies out of MVP scope.

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
3. Choose one LLM mode:
   - set `LOCAL_MODEL=<model>` to use host Ollama
   - set `CONTAINER_MODEL=<model>` to run Ollama in Docker
   - set neither to default to in-container `llama3:8b`
4. Start the stack with `./scripts/install.sh`.
5. Validate the deployment with `./scripts/healthcheck.sh`.

If `8080` is already in use on the host, set `PORT=127.0.0.1:<alternate-port>` in `.env` before starting the stack, and update `OPENPROJECT_HOST__NAME` plus `COLLABORATIVE_SERVER_URL` to the same public host and port.

## Notes

- OpenProject is configured for local-first access by default.
- The default web endpoint is `http://127.0.0.1:8080`.
- The optional container Ollama runtime stays on the internal Compose network so it can coexist with a host Ollama daemon already using `127.0.0.1:11434`.
- `pre-alpha-1` preserves the validated Ollama feature path as a learning artifact and export-package input; it should not be mistaken for the long-term baseline scope of this project.
- Branch-contained validation evidence is recorded in `docs/ValidationEvidence.md`.
- The optional proxy profile is documented but not required for first local bring-up.
- The project lifecycle tracker is maintained outside the repository on purpose.
