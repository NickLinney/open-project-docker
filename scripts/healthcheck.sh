#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

require_env_file
set -a
source "$ENV_FILE"
set +a
compose_cmd ps

openproject_url="http://${PORT:-127.0.0.1:8080}"
echo "Checking OpenProject health at $openproject_url/health_checks/default"
curl -fsS "$openproject_url/health_checks/default" >/dev/null

echo "Healthcheck completed successfully."
