# Operations

## Core Commands

- Install or start the stack: `./scripts/install.sh`
- Check runtime health: `./scripts/healthcheck.sh`
- Create a database backup: `./scripts/backup.sh`
- Restore a backup: `RESTORE_CONFIRM=YES ./scripts/restore.sh /path/to/backup.sql`
- Pull refreshed images and restart: `./scripts/update.sh`

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
