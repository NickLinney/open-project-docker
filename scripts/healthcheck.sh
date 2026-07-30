#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/lib/llm.sh"

require_env_file
set -a
source "$ENV_FILE"
set +a
resolve_llm_mode

profiles=()
if [[ "$LLM_MODE" == "container" ]]; then
  profiles+=(--profile ollama-container)
fi

compose_cmd "${profiles[@]}" ps

openproject_url="http://${PORT:-127.0.0.1:8080}"
echo "Checking OpenProject health at $openproject_url/health_checks/default"
curl -fsS "$openproject_url/health_checks/default" >/dev/null

if [[ "$LLM_MODE" == "container" ]]; then
  echo "Checking in-container Ollama model availability"
  compose_cmd "${profiles[@]}" exec -T ollama ollama list | grep -F "$LLM_MODEL" >/dev/null
else
  host_health_path="${HOST_OLLAMA_HEALTH_PATH:-/api/tags}"
  echo "Checking host Ollama availability at ${OLLAMA_BASE_URL}${host_health_path}"
  curl -fsS "${OLLAMA_BASE_URL}${host_health_path}" >/dev/null
fi

echo "Healthcheck completed successfully."
