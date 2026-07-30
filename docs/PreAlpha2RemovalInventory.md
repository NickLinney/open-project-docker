# Pre-Alpha 2 Removal Inventory

## Purpose

This document tracks the AI-related surfaces being removed as part of the `pre-alpha-2` lean-baseline correction.

It exists to support:

- implementation accountability
- review clarity
- regression traceability
- testing-team handoff

## Baseline

- Starting branch: `feature/pre-alpha-2-lean-baseline`
- Baseline release reference: `0.0.0-pre-alpha-1`
- Removal objective: remove Ollama and AI-related runtime, script, configuration, metadata, and current-state documentation surfaces while preserving a complete dockerized OpenProject stack

## Planned Removal Set

### Runtime and Compose

- `compose/docker-compose.yml`
  - remove `ollama` volume
  - remove `ollama` service
  - remove `ollama-container` profile usage

### Environment and Metadata

- `.env.example`
  - remove `OLLAMA_DATA`
  - remove `LOCAL_MODEL`
  - remove `CONTAINER_MODEL`
  - remove `DEFAULT_LOCAL_MODEL`
  - remove `HOST_OLLAMA_BASE_URL`
  - remove `HOST_OLLAMA_HEALTH_PATH`

- `manifest.json`
  - remove `ollama` component metadata
  - remove `ollama_volume`
  - remove LLM defaults
  - update current release target and vehicle to `pre-alpha-2`

### Scripts

- `scripts/lib/llm.sh`
  - remove file entirely

- `scripts/install.sh`
  - remove LLM mode resolution and container-model bootstrap path

- `scripts/update.sh`
  - remove LLM mode resolution and container-model refresh path

- `scripts/healthcheck.sh`
  - remove host/container Ollama validation logic

### Current-State Documentation

- `README.md`
- `ABSTRACT.md`
- `ARCHITECTURE.md`
- `docs/Deployment.md`
- `docs/Operations.md`
- `docs/ProductPlan.md`
- `docs/ProjectPlan.md`
- `docs/TestingStrategy.md`

These documents will be updated so they describe the lean OpenProject baseline truthfully. Historical pre-`pre-alpha-2` evidence artifacts may retain references to the discontinued feature subset when needed for truthful recordkeeping.

## Historical Surfaces to Preserve

The following artifact categories may retain historical references to Ollama or AI-related work because they describe completed `pre-alpha-1` learning-artifact evidence rather than current product behavior:

- `CHANGELOG.md`
- `VERSION.md`
- `docs/ValidationEvidence.md`
- `docs/PreAlpha1MergeReview.md`
- `docs/Project Release Retrospective - Development Lessons Learned.md`

## Testing Handoff Expectation

Testing Team Sprint 2 should use this inventory to:

- classify discontinued AI-related tests
- identify stale claims
- confirm the exact lean baseline being validated
