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

compose_cmd "${profiles[@]}" pull
compose_cmd "${profiles[@]}" up -d

if [[ "$LLM_MODE" == "container" ]]; then
  compose_cmd "${profiles[@]}" exec -T ollama ollama pull "$LLM_MODEL"
fi

echo "Update flow completed."
