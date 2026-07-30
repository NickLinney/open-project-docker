# Backup

## Scope

Backup coverage for MVP focuses on:

- PostgreSQL database contents
- OpenProject persistent assets

## Script Path

Use `./scripts/backup.sh` to create a timestamped SQL backup in `backups/`.

## Restore Path

Use `RESTORE_CONFIRM=YES ./scripts/restore.sh <backup.sql>` to restore the PostgreSQL database.

Current restore behavior:

- stops the application services before restore
- drops and recreates the target database
- loads the selected SQL backup
- starts the application services again after restore

This is intentionally destructive to the target database and should be used only for controlled recovery workflows.

## Validation Goal

At alpha readiness, backup and restore guidance should match an actually exercised workflow rather than remaining theoretical.
