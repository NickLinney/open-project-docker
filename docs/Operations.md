# Operations

## Core Commands

- Install or start the stack: `./scripts/install.sh`
- Check runtime health: `./scripts/healthcheck.sh`
- Create a database backup: `./scripts/backup.sh`
- Restore a backup: `./scripts/restore.sh /path/to/backup.sql`
- Pull refreshed images and restart: `./scripts/update.sh`

## LLM Runtime Modes

- Host mode keeps Ollama outside the Compose stack and points repository-side automation to `HOST_OLLAMA_BASE_URL`.
- Container mode runs `ollama/ollama` in Docker and pulls the selected model if missing.
- If neither mode variable is set, container mode defaults to `llama3:8b`.

## Operational Principle

Containers are replaceable.

Persistent data, documentation, release movement, and backup artifacts are what must remain durable.
