# Architecture

## Overview

This repository wraps the current OpenProject Compose guidance in a local-first, governed project structure tailored for NickLinneyDev standards.

The runtime is split into:

- PostgreSQL for durable relational state
- OpenProject application services for web, worker, cron, and seeding
- Memcached for Rails cache support
- Hocuspocus for collaborative editing compatibility
- Optional Ollama for in-container local model execution

## LLM Scope Boundary

OpenProject itself is not being modified here to become an LLM-native application.

The LLM contract in this repository applies to repository-side automation and future support services that may need local model execution. Those surfaces default to `llama3:8b` and can run in one of two modes:

- `LOCAL_MODEL=<model>` routes to a host Ollama instance
- `CONTAINER_MODEL=<model>` runs Ollama in Docker and ensures the named model is present without publishing a host port

If neither variable is set, the repository defaults to in-container `llama3:8b`.

## Local-First Network Model

- OpenProject binds to `127.0.0.1:8080` by default.
- The stack runs on an internal Docker network for service-to-service traffic.
- Host Ollama access for repository-side scripts defaults to `127.0.0.1:11434` on the operator host.
- If a future container-side consumer needs to reach host Ollama directly, `host.docker.internal` remains the expected bridge target.
- A proxy profile is prepared for future hardened entrypoint work, but direct local access remains the MVP default.

## Persistence Model

Persistent data is external to the application containers:

- PostgreSQL data persists in `pgdata`
- OpenProject assets persist in `opdata`
- Optional Ollama models persist in `ollama`

Containers are intended to be replaceable runtime components.

## Upstream Alignment

This repository follows current official OpenProject guidance that recommends the Compose-based, multi-service deployment model and documents support for both `amd64` and `arm64` architectures.
