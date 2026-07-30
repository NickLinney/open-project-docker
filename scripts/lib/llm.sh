#!/usr/bin/env bash

set -euo pipefail

resolve_llm_mode() {
  local local_model="${LOCAL_MODEL:-}"
  local container_model="${CONTAINER_MODEL:-}"
  local default_model="${DEFAULT_LOCAL_MODEL:-llama3:8b}"
  local host_base_url="${HOST_OLLAMA_BASE_URL:-http://host.docker.internal:11434}"

  if [[ -n "$local_model" && -n "$container_model" ]]; then
    echo "Set either LOCAL_MODEL or CONTAINER_MODEL, not both." >&2
    return 1
  fi

  if [[ -n "$local_model" ]]; then
    export LLM_MODE="host"
    export LLM_MODEL="$local_model"
    export OLLAMA_BASE_URL="$host_base_url"
    return 0
  fi

  if [[ -n "$container_model" ]]; then
    export LLM_MODE="container"
    export LLM_MODEL="$container_model"
    export OLLAMA_BASE_URL="http://ollama:11434"
    return 0
  fi

  export LLM_MODE="container"
  export LLM_MODEL="$default_model"
  export OLLAMA_BASE_URL="http://ollama:11434"
}

print_llm_summary() {
  echo "LLM mode: $LLM_MODE"
  echo "LLM model: $LLM_MODEL"
  echo "LLM endpoint: $OLLAMA_BASE_URL"
}
