#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

require_env_file
set -a
source "$ENV_FILE"
set +a

mkdir -p "$ROOT_DIR/backups"
timestamp="$(date +%Y%m%d_%H%M%S)"
target="$ROOT_DIR/backups/openproject_${timestamp}.sql"

compose_cmd exec -T db pg_dump -U "${POSTGRES_USER:-postgres}" "${POSTGRES_DB:-openproject}" > "$target"

echo "Backup created at $target"
