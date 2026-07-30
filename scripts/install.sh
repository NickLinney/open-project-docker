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

print_llm_summary

profiles=()
if [[ "$LLM_MODE" == "container" ]]; then
  profiles+=(--profile ollama-container)
fi

compose_cmd "${profiles[@]}" up -d db cache seeder web worker cron hocuspocus

if [[ "$LLM_MODE" == "container" ]]; then
  compose_cmd "${profiles[@]}" up -d ollama
  echo "Pulling container model: $LLM_MODEL"
  compose_cmd "${profiles[@]}" exec -T ollama ollama pull "$LLM_MODEL"
else
  echo "Host Ollama mode selected. Ensure the host service is reachable at $OLLAMA_BASE_URL."
fi

echo "Install flow completed."
