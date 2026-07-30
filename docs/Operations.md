# Operations

## Core Commands

- Install or start the stack: `./scripts/install.sh`
- Check runtime health: `./scripts/healthcheck.sh`
- Create a database backup: `./scripts/backup.sh`
- Restore a backup: `RESTORE_CONFIRM=YES ./scripts/restore.sh /path/to/backup.sql`
- Pull refreshed images and restart: `./scripts/update.sh`

## LLM Runtime Modes

- Host mode keeps Ollama outside the Compose stack and points repository-side automation to `HOST_OLLAMA_BASE_URL`, which defaults to `http://127.0.0.1:11434`.
- Container mode runs `ollama/ollama` in Docker and pulls the selected model if missing. The service remains internal to the Compose network so it does not collide with a host Ollama daemon already bound to `127.0.0.1:11434`.
- If neither mode variable is set, container mode defaults to `llama3:8b`.

## Operational Principle

Containers are replaceable.

Persistent data, documentation, release movement, and backup artifacts are what must remain durable.

## Restore Caution

The current restore workflow is a controlled destructive restore:

- the target application services are stopped
- the target database is dropped and recreated
- the backup is loaded into the recreated database
- the application services are started again

This behavior is appropriate for controlled recovery validation and disaster-recovery workflows, but it should not be treated as a casual utility command.
