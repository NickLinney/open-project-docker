#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /path/to/backup.sql" >&2
  exit 1
fi

backup_file="$1"

if [[ ! -f "$backup_file" ]]; then
  echo "Backup file not found: $backup_file" >&2
  exit 1
fi

require_env_file
set -a
source "$ENV_FILE"
set +a

confirm_token="${RESTORE_CONFIRM:-}"

if [[ "$confirm_token" != "YES" ]]; then
  echo "Refusing restore without RESTORE_CONFIRM=YES." >&2
  echo "This workflow drops and recreates the target database before loading the backup." >&2
  exit 1
fi

db_name="${POSTGRES_DB:-openproject}"
db_user="${POSTGRES_USER:-postgres}"

echo "Stopping application services before restore"
compose_cmd stop web worker cron hocuspocus >/dev/null || true

echo "Dropping and recreating database $db_name"
compose_cmd exec -T db psql -U "$db_user" postgres <<SQL
DROP DATABASE IF EXISTS "$db_name" WITH (FORCE);
CREATE DATABASE "$db_name";
SQL

echo "Restoring database $db_name from $backup_file"
cat "$backup_file" | compose_cmd exec -T db psql -U "$db_user" "$db_name"

echo "Starting application services after restore"
compose_cmd up -d web worker cron hocuspocus >/dev/null

echo "Restore completed."
