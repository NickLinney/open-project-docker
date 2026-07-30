# Changelog

All notable changes to this repository will be documented here.

## [Unreleased]

### Added

- Initial repository bootstrap
- Project plan
- Repository scaffolding
- Compose architecture scaffold
- Operational script scaffold

## [0.0.0-pre-alpha.1] - 2026-07-30

### Added

- Local-first OpenProject Docker Compose stack with PostgreSQL, memcached, worker, cron, hocuspocus, and governed operations scaffolding
- Persistent data handling for PostgreSQL and OpenProject assets
- Install, backup, restore, update, and healthcheck scripts
- Project and product planning documentation for `pre-alpha-1` and planned `pre-alpha-2` cleanup
- Testing strategy and governed sprint artifact structure
- Optional Ollama learning subset with host mode via `LOCAL_MODEL=` and container mode via `CONTAINER_MODEL=`

### Changed

- Container Ollama mode was corrected to remain internal to the Compose network after a real host-port `11434` collision was discovered during validation
- Release direction was clarified so `pre-alpha-1` preserves the Ollama subset as a learning artifact and `pre-alpha-2` removes AI-related components from the product baseline

### Validated

- macOS ARM64 local runtime usability
- controlled backup and restore behavior
- host and container Ollama mode behavior
- Git remote and deploy-key authentication readiness
- release evidence recorded in `docs/ValidationEvidence.md`
