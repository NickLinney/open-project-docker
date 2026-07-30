# Validation Evidence

## Context

This document records the branch-contained validation evidence for `pre-alpha-1` on Thursday, July 30, 2026.

Validation host:

- local MacBook Pro Apple Silicon workstation
- macOS ARM64
- Docker Desktop runtime

Evidence boundary notes:

- The primary stack was validated on `127.0.0.1:18080` because host port `127.0.0.1:8080` was already occupied on this device by Docker Desktop.
- A separate documentation-path validation stack was run on `127.0.0.1:18081` to avoid disturbing the main working stack.
- Linux and AMD64 validation remain deferred and are tracked separately as later-phase work.

## Validated Items

### 1. Base Stack Runtime

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Public endpoint: `http://127.0.0.1:18080`
- Result: passed

Validation notes:

- OpenProject services reached healthy state.
- Admin sign-in and usable application runtime were previously confirmed on the primary stack.

### 2. Host Port Exception Handling

- Date: Thursday, July 30, 2026
- Condition: host port `8080` unavailable on the validation workstation
- Result: passed with bounded exception

Validation notes:

- Alternate binding on `127.0.0.1:18080` worked successfully.
- Healthcheck logic was corrected to follow `PORT`, not the documented host-name variable.
- Documentation now requires `PORT`, `OPENPROJECT_HOST__NAME`, and `COLLABORATIVE_SERVER_URL` to remain aligned when the public port changes.

### 3. Host Ollama Mode

- Date: Thursday, July 30, 2026
- Mode: `LOCAL_MODEL=llama3:8b`
- Result: passed

Validation notes:

- Host Ollama endpoint responded successfully.
- The repository-side health workflow validated host-model availability.

### 4. Container Ollama Mode

- Date: Thursday, July 30, 2026
- Mode: `CONTAINER_MODEL=llama3:8b`
- Result: passed

Validation notes:

- The optional `ollama` service successfully ran the requested model internally.
- The Compose design was corrected so container Ollama stays on the internal network and does not bind host port `11434`.

### 5. Conflicting LLM Mode Guardrail

- Date: Thursday, July 30, 2026
- Condition: both `LOCAL_MODEL` and `CONTAINER_MODEL` set
- Result: passed

Validation notes:

- The scripts refused the invalid state and emitted the expected configuration error.

### 6. Controlled Database Backup and Restore

- Date: Thursday, July 30, 2026
- Environment: primary local stack and isolated documentation-path stack
- Result: passed

Validation notes:

- Timestamped PostgreSQL backup creation succeeded.
- Controlled restore with `RESTORE_CONFIRM=YES` succeeded.
- Post-restore health validation succeeded after normal service warm-up.
- Current validated backup scope for `pre-alpha-1` is database-only.

### 7. Update Workflow

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Result: passed

Validation notes:

- `bash scripts/update.sh` completed successfully on the validated stack.

### 8. Documentation-Path Install and Recovery Drill

- Date: Thursday, July 30, 2026
- Environment: isolated stack on `127.0.0.1:18081`
- Result: passed

Validation notes:

- `bash scripts/install.sh` completed successfully with host-Ollama mode.
- `bash scripts/healthcheck.sh` passed after warm-up.
- Backup and restore drill succeeded on the isolated stack without disturbing the main stack.

### 9. Git Remote Readiness

- Date: Thursday, July 30, 2026
- Result: passed

Validation notes:

- Repository SSH deploy-key authentication succeeded.
- Branch topology and active development history were pushed to GitHub on Thursday, July 30, 2026.

## Not Yet Validated for `pre-alpha-1`

- Default public binding on `127.0.0.1:8080` on this specific workstation
- Linux host runtime
- AMD64 host runtime
- Asset-export backup and restore beyond Docker volume persistence

## Evidence Interpretation

`pre-alpha-1` should be interpreted as a validated macOS ARM64 learning-artifact release with bounded host-environment exceptions, not as a fully cross-platform release candidate.
