# Deployment

## Local-First Default

The stack is designed to start locally on `http://127.0.0.1:8080` without requiring a public ingress layer.

## Basic Flow

1. Copy `.env.example` to `.env`.
2. Replace `SECRET_KEY_BASE` and `POSTGRES_PASSWORD`.
3. Run `./scripts/install.sh`.
4. Run `./scripts/healthcheck.sh`.

If host port `8080` is already occupied, change `PORT` in `.env` to another loopback binding such as `127.0.0.1:18080`, and update `OPENPROJECT_HOST__NAME` plus `COLLABORATIVE_SERVER_URL` to the same public host and port.

## Profiles

- base stack: OpenProject, PostgreSQL, cache, seeder, worker, cron, hocuspocus
- `proxy`: optional Caddy reverse proxy profile

## Notes

- The initial local-first path binds OpenProject directly to loopback.
- The proxy profile is available for future hardened routing experiments.
- Official OpenProject documentation currently recommends the multi-service Compose approach and documents separate persistence for PostgreSQL and assets.
