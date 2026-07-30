# Validation Evidence

## Pre-Alpha 2 Context

This section records the branch-contained validation evidence for `pre-alpha-2` on Thursday, July 30, 2026.

Validation host:

- local MacBook Pro Apple Silicon workstation
- macOS ARM64
- Docker Desktop runtime

Evidence boundary notes:

- Validation was executed on `feature/pre-alpha-2-lean-baseline`.
- The active validation endpoint remained `http://127.0.0.1:18080` because host port `127.0.0.1:8080` was already occupied on this device.
- The local operator `.env` file still contained historical AI-related variables from `pre-alpha-1`, but the active tracked contract no longer depends on them and the runtime scripts ignored them during validation.
- Linux and AMD64 validation remain deferred and are tracked separately as later-phase work.

## Pre-Alpha 2 Validated Items

### 1. Lean Runtime Surface Realignment

- Date: Thursday, July 30, 2026
- Environment: repository worktree and active Compose contract
- Result: passed

Validation notes:

- Active Compose, script, and environment-contract surfaces tied to the discontinued Ollama subset were removed.
- Historical AI-subset material remains preserved only as `pre-alpha-1` evidence and learning-artifact context.
- No active operator guidance now presents Ollama as current product scope.

### 2. Clean Runtime Bring-Up Without Orphans

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Result: passed

Validation notes:

- A leftover `compose-ollama-1` container from the earlier phase was detected before validation.
- The stack was cycled with orphan removal so `pre-alpha-2` validation would run against a clean runtime.
- The rebuilt stack started successfully without any active Ollama service.

### 3. Base Stack Runtime

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Public endpoint: `http://127.0.0.1:18080`
- Result: passed

Validation notes:

- OpenProject services reached healthy state.
- `bash scripts/healthcheck.sh` completed successfully on the lean baseline.
- A direct `/login` probe returned `HTTP/1.1 200 OK` once the stack completed normal warm-up.

### 4. Controlled Database Backup and Restore

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Result: passed

Validation notes:

- Timestamped PostgreSQL backup creation succeeded.
- Controlled restore with `RESTORE_CONFIRM=YES` succeeded using the fresh backup artifact created during validation.
- Post-restore health validation succeeded after normal service warm-up.
- Current validated backup scope for `pre-alpha-2` remains database-only.

### 5. Update Workflow

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Result: passed

Validation notes:

- `bash scripts/update.sh` completed successfully on the lean baseline after the removal work.

### 6. Final Runtime State Snapshot

- Date: Thursday, July 30, 2026
- Environment: primary local stack
- Result: passed

Validation notes:

- Running services at evidence capture: `db`, `cache`, `web`, `worker`, `cron`, `hocuspocus`
- No active Ollama service remained in the Compose runtime.
- Web remained bound to `127.0.0.1:18080->8080/tcp`.

## Not Yet Validated for `pre-alpha-2`

- Default public binding on `127.0.0.1:8080` on this specific workstation
- Linux host runtime
- AMD64 host runtime
- Asset-export backup and restore beyond Docker volume persistence
- Release promotion via PR review and merge for the `pre-alpha-2` branch

## Pre-Alpha 2 Evidence Interpretation

`pre-alpha-2` currently reads as a validated macOS ARM64 lean-baseline branch candidate with real operational evidence and with cross-platform work still deferred.

---

## Pre-Alpha 1 Context

This section records the branch-contained validation evidence for `pre-alpha-1` on Thursday, July 30, 2026.

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
