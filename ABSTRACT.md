# Abstract

The OpenProject Docker Stack is the canonical NickLinney.Software deployment repository for running OpenProject as a portable, reproducible, and security-conscious self-hosted service.

This repository is intended to function as both:

- a reusable deployment artifact
- a reference architecture for future self-hosted enterprise services

The stack favors:

- Docker-first isolation
- local-first operation
- externalized configuration
- replaceable containers
- persistent database storage
- governed release movement
- documentation as code

The MVP scope focuses on delivering a usable local OpenProject deployment with persistent PostgreSQL storage, operational scaffolding, and an optional Ollama runtime path for repository-side automation where LLM behavior is needed.
