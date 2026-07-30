# Backup

## Scope

Backup coverage for MVP focuses on:

- PostgreSQL database contents
- OpenProject persistent assets

## Script Path

Use `./scripts/backup.sh` to create a timestamped SQL backup in `backups/`.

## Restore Path

Use `./scripts/restore.sh <backup.sql>` to restore the PostgreSQL database after confirming operator intent.

## Validation Goal

At alpha readiness, backup and restore guidance should match an actually exercised workflow rather than remaining theoretical.
