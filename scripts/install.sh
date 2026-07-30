#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

require_env_file
set -a
source "$ENV_FILE"
set +a
compose_cmd up -d db cache seeder web worker cron hocuspocus

echo "Install flow completed."
