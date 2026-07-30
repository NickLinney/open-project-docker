# Pre-Alpha 2 Release Readiness Checklist

## Context

- Release target: `pre-alpha-2`
- Source branch: `feature/pre-alpha-2-lean-baseline`
- Checklist date: Thursday, July 30, 2026
- Purpose: decision-support checklist for promotion review, not a release declaration by itself

## Checklist

- [x] Active product scope realigned to the lean OpenProject-only baseline
- [x] Active Ollama runtime surfaces removed from Compose, scripts, and tracked environment contract
- [x] Historical `pre-alpha-1` AI-subset evidence preserved as learning-artifact context
- [x] Repository documentation updated to describe the `pre-alpha-2` active baseline truthfully
- [x] Clean runtime validation executed after orphan removal
- [x] `./scripts/install.sh` completed successfully on macOS ARM64
- [x] `./scripts/healthcheck.sh` completed successfully on macOS ARM64
- [x] Direct `/login` probe succeeded on the validated local endpoint
- [x] Database backup workflow completed successfully
- [x] Database restore workflow completed successfully
- [x] Update workflow completed successfully
- [x] Final runtime state confirmed without an active Ollama service
- [x] Sprint-scoped removal inventory recorded
- [ ] PR review, approval, and merge for `pre-alpha-2` completed
- [ ] Release branch promotion and tag event completed
- [ ] Linux runtime validation completed
- [ ] AMD64 runtime validation completed

## Current Interpretation

The branch is technically ready for governed review as a macOS ARM64 `pre-alpha-2` lean-baseline candidate.

It is not yet a completed release event because PR review, official promotion, and broader platform validation remain outstanding.
