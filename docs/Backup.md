# Backup

## Scope

Backup coverage for `pre-alpha-1` focuses on:

- PostgreSQL database contents

OpenProject assets are still persisted in the Docker volume mounted at `/var/openproject/assets`, but the current backup and restore scripts do not export or re-import that volume snapshot yet.

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

For `pre-alpha-1`, the validated backup path is database-only. Asset-export backup coverage remains future work and should not be assumed from the current scripts.
