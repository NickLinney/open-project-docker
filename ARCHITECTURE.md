# Architecture

## Overview

This repository wraps the current OpenProject Compose guidance in a local-first, governed project structure tailored for NickLinneyDev standards.

The runtime is split into:

- PostgreSQL for durable relational state
- OpenProject application services for web, worker, cron, and seeding
- Memcached for Rails cache support
- Hocuspocus for collaborative editing compatibility

## Local-First Network Model

- OpenProject binds to `127.0.0.1:8080` by default.
- The stack runs on an internal Docker network for service-to-service traffic.
- A proxy profile is prepared for future hardened entrypoint work, but direct local access remains the MVP default.

## Persistence Model

Persistent data is external to the application containers:

- PostgreSQL data persists in `pgdata`
- OpenProject assets persist in `opdata`

Containers are intended to be replaceable runtime components.

## Upstream Alignment

This repository follows current official OpenProject guidance that recommends the Compose-based, multi-service deployment model and documents support for both `amd64` and `arm64` architectures.
