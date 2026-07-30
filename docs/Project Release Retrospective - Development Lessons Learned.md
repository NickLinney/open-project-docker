# Project Release Retrospective - Development Lessons Learned

**Project:** NLSW000003 - OpenProject Docker Stack  
**Prepared By:** PM  
**Document Class:** Project Retrospective  
**Status:** Active  
**Date:** Thursday, July 30, 2026  
**Release:** `0.0.0-pre-alpha-1`

## Purpose

This document records the development lessons learned from the `pre-alpha-1` release cycle.

It is intended to preserve:

- practical delivery lessons
- workflow corrections introduced by the sponsor
- release-execution lessons
- future improvement opportunities for Dev, PM, Release Manager, and supporting agents

## Release Summary

The project successfully produced a working local-first Docker Compose OpenProject deployment, validated the macOS ARM64 implementation, preserved persistent PostgreSQL-backed storage, and completed an official release path ending with `main` tagged as `0.0.0-pre-alpha-1`.

The release was successful, but the route to that success exposed several development-process weaknesses that required sponsor correction.

## Major Development Lessons Learned

### 1. Assumptions About Workflow Completion Must Not Substitute for Declared Organizational Practice

Several workflow expectations were not safe to infer from general software practice because the organization had specific preferences that materially altered the correct execution path.

Examples included:

- expecting local commits to be sufficient evidence before push
- treating release-branch progression as complete before `main` received the official release merge
- assuming retrospective or implicit coordination could stand in for authentic governed collaboration

Lesson:

When the project contains organization-specific governance expectations, the team must stop relying on industry-default assumptions and instead execute the workflow exactly as defined by the sponsor or organizational standards.

### 2. GitHub Is the Audit Record, Not Merely a Replication Target

The project initially accumulated meaningful local progress without corresponding remote pushes.

That was a process failure even though the technical work itself was real.

Lesson:

- local commits are implementation tools
- GitHub is the evidentiary system of record
- work that remains local for too long weakens traceability, release legitimacy, and audit readiness

### 3. A Release Is Not Complete Until `main` Reflects the Released State

The initial release movement ended at the `pre-alpha-1` branch and tag, but that did not satisfy the actual organizational release model.

The sponsor clarified that:

- release branches remain as historical artifacts
- `main` must represent the latest good released state
- `main` should only be updated by official releases

Lesson:

Release-management completion criteria must be stated explicitly and checked before declaring a release event complete.

### 4. Authentic Agentic Meetings Are Governance Artifacts, Not Stylistic Enhancements

Earlier sprint artifacts included retrospective reconstructions rather than records of meetings that actually occurred.

The sponsor correctly identified that this did not satisfy the governance standard for authentic collaboration.

Lesson:

- real agentic meetings must actually occur
- real inter-agent I/O must influence decisions
- primary records must be preserved as evidence
- retrospective reconstruction may supplement the record but may not replace it

### 5. Project Management Artifacts Must Exist Even When the Intended Work Management Platform Is the Product Being Built

This project could not depend on the target work-management application because the application itself was the delivery objective.

The sponsor required file-based lifecycle tracking, which proved appropriate and effective.

Lesson:

When the target management platform is unavailable, the PM must immediately establish a file-based fallback operating system for:

- lifecycle tracking
- sprint tracking
- testing tracking
- governance records
- release artifacts

### 6. Product-Scope Drift Can Still Produce Valuable Learning if It Is Properly Bounded

Ollama-related capabilities were implemented and validated even though they were later recognized as unnecessary for the correct end-state scope of NLSW000003.

This did not make the work useless.

Lesson:

If scope drift is discovered early enough, the team should:

- name the drift honestly
- bound it to a release or artifact set
- preserve the learning
- export the useful subset for other projects
- prevent contamination of the long-term product baseline

### 7. Documentation Must Reflect the Exact Validated Scope, Not the Aspirational Scope

During review, documentation overstated backup coverage and under-described the implications of alternate port binding.

Those issues were corrected before final release.

Lesson:

Documentation should never imply more validation, portability, or recovery coverage than has actually been demonstrated.

### 8. Peer Review Adds Real Value Late in the Cycle

The peer review found real blockers:

- invalid container hostname usage
- inconsistent alternate-port expectations
- overstated backup scope
- missing branch-contained evidence

Lesson:

Late-cycle review is still worth doing even when the product appears to work, because release-readiness errors often hide in surrounding configuration, documentation, and evidence quality.

## Sponsor Corrections That Materially Improved the Outcome

The sponsor introduced corrections that should be treated as positive delivery interventions, not exceptions.

These included:

- requiring file-based lifecycle tracking outside the repo
- requiring authentic agentic meetings and real meeting artifacts
- clarifying release-branch and `main` responsibilities
- requiring commit-and-push discipline as auditable evidence
- requiring leaner team-specific sprint cadences
- directing the preservation and export of the discontinued Ollama feature subset as institutional learning

## Recommended Development Process Changes for Future Projects

- Confirm the expected branch model and release-completion semantics during kickoff.
- Confirm whether `main` is a development branch, integration branch, or release-only branch before any work begins.
- Push completed work to the remote repository at each task boundary when the repo is the audit record.
- Establish evidence artifacts inside the repo before late-cycle review begins.
- Treat sponsor corrections as governing inputs that must update the working process immediately.
- When a feature subset becomes non-core, decide promptly whether it is being removed, retained temporarily, or exported as knowledge.

## Closing Assessment

The `pre-alpha-1` release should be considered successful both technically and organizationally.

Its value is not limited to the shipped code. It also produced clearer organizational understanding around:

- release completion semantics
- authentic agentic governance
- auditable Git discipline
- documentation truthfulness
- controlled preservation of discontinued feature work

Those lessons should be reused directly in future NickLinneyDev projects.
