# Project Plan

## Project Metadata

- Project Title: OpenProject Docker Stack
- Project SID: NLSW-000003
- Plan Date: 2026-07-29
- Current Lifecycle Phase: Pre-Alpha
- Current Release Vehicle: `pre-alpha-1`
- Current Top-Level Feature Vehicle: `feature/release-bootstrap`
- Repository Intent: Canonical, Docker-first, self-hosted OpenProject deployment reference

## Executive Objective

Deliver a production-quality, fully dockerized OpenProject deployment repository that is portable, deterministic, security-conscious, and suitable as the NickLinney.Software reference implementation for self-hosted work management infrastructure.

## Success Criteria

- A clean repository bootstrap exists with governed branch topology.
- The stack launches through Docker-first workflows without host-side app installation requirements.
- OpenProject state is externalized from containers and survives container replacement.
- Documentation covers deployment, operations, backup, restore, and security expectations.
- LLM-dependent automation defaults to `llama3:8b`.
- The runtime supports either:
  - host Ollama access when `LOCAL_MODEL=` is provided
  - in-container Ollama execution when `CONTAINER_MODEL=` is provided
- MVP avoids cloud-model dependencies and avoids LLM toolchains that are incompatible with Ollama.

## Scope

### In Scope

- Docker Compose based deployment architecture
- OpenProject application service
- PostgreSQL persistence layer
- Reverse proxy strategy suitable for local-first and hardened internal deployment
- Environment-driven configuration
- Backup and restore workflow design
- Multi-architecture support planning for AMD64 and ARM64
- Repository documentation and governance scaffolding
- Ollama integration pattern for local or in-container inference

### Out of Scope for MVP

- Cloud LLM providers
- Non-Ollama LLM tool integrations
- Enterprise SSO and directory integrations
- Production Kubernetes orchestration
- Advanced observability stack beyond basic health and operational guidance

## Working Assumptions

- The repository is being created greenfield on 2026-07-29.
- Docker-first isolation is the preferred development and validation mode.
- The Git remote will be `NickLinney/open-project-docker`.
- Dedicated repository SSH keys will be used for Git operations when pushing.
- Early work should favor legible structure and reproducible bootstrap over rapid feature sprawl.

## Deliverables

### Repository Foundation

- Governed Git initialization
- Baseline branch topology
- Repo structure for compose, config, scripts, docs, volumes, and backups
- Ignore rules that protect local secrets and operator files

### Runtime Foundation

- Compose stack for OpenProject and PostgreSQL
- Reverse proxy design and local-only default posture
- Volume and network layout
- Environment templates and configuration reference

### Operations Foundation

- Install procedure
- Update procedure
- Backup and restore procedures
- Health-check and validation approach
- Disaster recovery notes

### LLM Runtime Foundation

- Default `llama3:8b` model behavior
- Host Ollama wiring via `LOCAL_MODEL=`
- In-container Ollama wiring via `CONTAINER_MODEL=`
- Clear operator guidance for model selection and startup behavior

## Milestones

### Milestone 1: Governance Bootstrap

- Create the initial project plan
- Initialize Git on `main`
- Seed `dev`, `test`, `staging`, `pre-alpha-1`, and `feature/release-bootstrap`
- Protect secrets from accidental commit

### Milestone 2: Repository Skeleton

- Establish canonical directory structure
- Add base documentation set
- Add environment templates and manifest scaffolding

### Milestone 3: Container Architecture

- Define compose services, networks, and persistent volumes
- Select OpenProject image strategy
- Define reverse proxy approach and security defaults

### Milestone 4: LLM Integration Pattern

- Specify the Ollama service interaction model
- Implement host-vs-container model selection logic
- Document operator-facing environment variables

### Milestone 5: Operations Readiness

- Add backup, restore, and health scripts
- Document upgrade and disaster recovery flow
- Validate stack behavior against intended bootstrap paths

## Initial Risks

- OpenProject image behavior and architecture support may impose constraints on ARM64 portability.
- Running Ollama in-container may materially increase startup time and resource expectations when large models are pulled.
- Host Ollama integration needs careful network and endpoint handling to remain portable across Linux and macOS.
- Reverse proxy and TLS choices should avoid accidental over-design during MVP bootstrap.

## Immediate Next Actions

1. Bootstrap the Git repository and branch topology.
2. Create the initial repository skeleton and core docs.
3. Define the Compose architecture and environment contract.
4. Implement the Ollama configuration path for `LOCAL_MODEL` and `CONTAINER_MODEL`.
5. Add operational scripts and validation guidance.

## Tracking Note

Project lifecycle notes may be maintained in a local text file outside the repository and later imported into Wiki.js to satisfy end-to-end documentation requirements.
