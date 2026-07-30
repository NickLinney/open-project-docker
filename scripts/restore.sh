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

echo "Restoring database ${POSTGRES_DB:-openproject} from $backup_file"
cat "$backup_file" | compose_cmd exec -T db psql -U "${POSTGRES_USER:-postgres}" "${POSTGRES_DB:-openproject}"

echo "Restore completed."
