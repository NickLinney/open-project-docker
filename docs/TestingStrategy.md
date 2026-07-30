# NLSW000003 - Testing Strategy and Validation Plan

**Project:** OpenProject Docker Stack  
**SID:** NLSW-000003  
**Document Class:** Project Document  
**Status:** Active  
**Version:** 0.1.0-alpha  
**Effective Date:** Thursday, July 30, 2026  
**Authority:** This document is a project-specific testing standard for NLSW-000003 and should be followed unless new evidence justifies a documented exception.

---

## 1. Purpose

This document defines the testing strategy, validation model, and test registry for the OpenProject Docker Stack project.

Its purpose is to ensure the project is tested as:

- a Dockerized application stack
- an operational deployment artifact
- a recoverable system
- a governed release candidate
- a documented local-first product

This plan is intentionally proactive.

It does not wait for defects to reveal the required test surface.

Instead, it uses scenario and state modeling to identify critical paths, transition points, operator actions, and failure modes before release promotion decisions are made.

---

## 2. Testing Philosophy

The testing philosophy for this project is:

- verify the stack as it will actually be used
- prioritize critical-path and state-transition confidence first
- treat recovery and governance evidence as part of quality
- prefer evidence from real execution over purely theoretical compliance
- separate "works once" from "works repeatably"

This project is not only shipping code.

It is shipping a reusable self-hosted deployment standard.

Therefore the testing scope must include:

- runtime behavior
- infrastructure behavior
- operational behavior
- recovery behavior
- configuration behavior
- release evidence behavior

---

## 3. Testing Objectives

This testing strategy is designed to answer the following questions:

1. Does the stack start reliably from documented inputs?
2. Is OpenProject usable after deployment?
3. Is PostgreSQL persistence real and durable across lifecycle events?
4. Are install, backup, restore, update, and health workflows correct?
5. Does the system behave correctly across configuration states?
6. Do local LLM mode paths behave as designed?
7. Can the system be recovered after expected operational events?
8. Is the release evidence strong enough to support progression toward `0.1.0-alpha`?

---

## 4. Scope of Testing

### In Scope

- Docker Compose rendering and runtime behavior
- Service startup and dependency ordering
- OpenProject login and basic usability
- PostgreSQL persistence and recreation durability
- Backup workflow
- Restore workflow
- Update workflow
- Healthcheck workflow
- Local port override behavior
- Host Ollama mode via `LOCAL_MODEL=`
- In-container Ollama mode via `CONTAINER_MODEL=`
- Git remote push/auth path using the project deploy key
- Documentation-path validation for the operator workflow

### Out of Scope For Current Horizon

- Cloud LLM providers
- Non-Ollama-compatible toolchains
- Enterprise SSO integrations
- Performance benchmarking at scale
- Penetration testing beyond baseline security validation
- HA/distributed deployment scenarios
- Kubernetes orchestration

---

## 5. Test Model

Testing should be organized using three complementary lenses:

### 5.1 Scenario Modeling

Test the meaningful operator and system stories.

Examples:

- first local deployment
- restart after successful use
- recovery after teardown
- backup then restore
- switch to alternate port
- switch between LLM modes

### 5.2 State Modeling

Test the system across meaningful system states and transitions.

Examples:

- no stack -> fresh deploy
- running -> restart
- running -> down -> recreate
- configured for host Ollama -> validated host mode
- configured for container Ollama -> validated container mode
- backup available -> restore executed

### 5.3 Risk Modeling

Test where failure would most damage trust, recoverability, or release confidence.

Examples:

- data loss
- broken restore path
- invalid configuration precedence
- misleading documentation
- release evidence gaps

---

## 6. Test Environments

### E1 - Operator Local Validation Environment

Purpose:

- reproduce realistic local operator usage

Characteristics:

- actual Docker runtime
- actual host OS behavior
- real local ports
- real local filesystem persistence

### E2 - Clean Rebuild Environment

Purpose:

- verify reproducibility from repository contents and documented steps

Characteristics:

- fresh checkout or isolated worktree
- no reliance on hidden state

### E3 - Host Ollama Environment

Purpose:

- validate `LOCAL_MODEL=...`

Characteristics:

- host Ollama service running
- known model availability
- reachable host bridge endpoint

### E4 - Container Ollama Environment

Purpose:

- validate `CONTAINER_MODEL=...`

Characteristics:

- in-container Ollama profile enabled
- model pull executed if needed

---

## 7. Release Gates And Test Levels

### Level A - Foundational Validation

Required before claiming the stack is meaningfully alive:

- compose renders successfully
- services start
- OpenProject is reachable
- admin or login path is usable

### Level B - Operational Validation

Required before claiming the stack is operationally credible:

- backup succeeds
- restore succeeds
- update path succeeds
- healthcheck behavior is correct

### Level C - Configuration Validation

Required before claiming the stack honors its documented contract:

- default local-first configuration works
- alternate host port override works
- `LOCAL_MODEL=...` path works
- `CONTAINER_MODEL=...` path works
- invalid or conflicting mode configuration fails clearly

### Level D - Release Validation

Required before claiming readiness for `0.1.0-alpha`:

- remote push/auth path validated
- release checklist completed
- testing evidence mapped to claims
- unresolved high-risk gaps either closed or explicitly deferred

---

## 8. Evidence Standard

Every meaningful test should preserve evidence.

Acceptable evidence includes:

- command output summaries
- logs
- screenshots or browser checks
- HTTP response checks
- file artifacts
- backup files
- restore confirmation notes
- Git push evidence
- issue or defect notes

The goal is not theatrical paperwork.

The goal is to ensure that a later reviewer can tell what was tested, what passed, what failed, and what remains open.

---

## 9. Exception Handling

If a test cannot be run as written:

- record why
- record whether the cause is environmental, tooling-related, risk-based, or scope-based
- identify whether the test is blocked, deferred, or replaced
- record who approved the exception

No unrun critical-path test should silently disappear.

---

## 10. Agentic Workforce Staffing Plan

Testing should be staffed as though this were a disciplined human team with bounded roles and review responsibilities.

### 10.1 PM / Project Lead

Responsibilities:

- approve test scope
- approve test priorities
- track test completion at milestone level
- review exceptions and deferrals
- ensure testing results feed sprint and release decisions

Equivalent human analogue:

- Project Manager
- Project Lead
- Technical Program Manager

### 10.2 Dev

Responsibilities:

- execute technical setup and runtime tests
- inspect logs and failure states
- fix defects
- re-run affected test paths

Equivalent human analogue:

- Software Engineer
- Platform Engineer
- DevOps Engineer

### 10.3 Scrum Master

Responsibilities:

- ensure planned tests are included in sprint scope
- ensure test blockers are surfaced
- ensure retrospective reports capture testing reality
- stop work if critical testing governance is skipped

Equivalent human analogue:

- Scrum Master
- Delivery Manager

### 10.4 Release Manager

Responsibilities:

- decide which tests are release-gating
- verify evidence sufficiency for promotion
- ensure release-readiness checklist is mapped to actual tests
- refuse promotion if evidence is incomplete

Equivalent human analogue:

- Release Manager
- Release Coordinator
- Change Manager

### 10.5 QA / Validation Lead

Responsibilities:

- maintain the test registry
- verify scenario coverage
- confirm evidence completeness
- cross-check that documented pass claims match actual results

Equivalent human analogue:

- QA Lead
- Test Lead
- Validation Lead

Note:

In smaller agentic or human teams, the QA / Validation Lead may be a distinct role or may be assigned to a secondary worker under PM oversight. The role should still be explicit even if staffing is lean.

### 10.6 Optional Specialist Roles

Use when justified:

- Security Reviewer
- Documentation Reviewer
- Recovery/DR Reviewer
- Infrastructure Reviewer
- LLM Integration Reviewer

---

## 11. Staffing Constraints

The staffing model should follow reasonable real-world constraints.

That means:

- one worker should not self-approve critical release evidence without review
- a role may wear multiple hats only when that overlap is acknowledged
- high-risk validations should be reviewable by another role
- testing should not assume infinite staff or infinite parallelism

For this project, a practical minimum staffing model is:

- PM / Project Lead
- Dev
- Scrum Master
- Release Manager
- QA / Validation Lead

Where staffing is lean, the PM may coordinate QA discipline while keeping final release evidence review separate through the Release Manager.

---

## 12. Test Registry

The following registry defines the proactive test inventory required for this project.

### Legend

- Priority:
  - `P0` release-blocking critical path
  - `P1` high importance
  - `P2` important but non-blocking for current horizon
- Type:
  - `SMK` smoke
  - `OPS` operational
  - `CFG` configuration
  - `REC` recovery
  - `REL` release
  - `DOC` documentation-path

### TR-001 Fresh Compose Render

- Priority: `P0`
- Type: `SMK`
- Scenario:
  - Operator renders the compose file from documented repository inputs.
- Start State:
  - repository present
  - env file available
- Action:
  - run compose config/render command
- Expected Result:
  - compose renders without syntax or interpolation failure
- Evidence:
  - rendered config success output

### TR-002 Fresh Stack Bring-Up

- Priority: `P0`
- Type: `SMK`
- Scenario:
  - Operator starts the base stack from documented inputs.
- Start State:
  - clean stopped state
- Action:
  - run install/start path
- Expected Result:
  - db, cache, seeder, web, worker, cron, and hocuspocus reach intended running states
- Evidence:
  - compose ps summary
  - relevant logs

### TR-003 OpenProject Login Reachability

- Priority: `P0`
- Type: `SMK`
- Scenario:
  - Operator reaches the login path successfully.
- Start State:
  - stack running
- Action:
  - request root URL and login path
- Expected Result:
  - login surface is reachable and usable
- Evidence:
  - HTTP response summary
  - operator confirmation

### TR-004 Admin Sign-In Validation

- Priority: `P0`
- Type: `SMK`
- Scenario:
  - Operator signs in successfully.
- Start State:
  - stack running
- Action:
  - authenticate with admin credentials
- Expected Result:
  - authenticated session works as intended
- Evidence:
  - operator confirmation

### TR-005 Database Persistence Across Restart

- Priority: `P0`
- Type: `REC`
- Scenario:
  - Stack is restarted without destroying volumes.
- Start State:
  - running stack with known application state
- Action:
  - restart stack or affected services
- Expected Result:
  - application state remains intact
- Evidence:
  - restart notes
  - post-restart login confirmation

### TR-006 Database Persistence Across Recreation

- Priority: `P0`
- Type: `REC`
- Scenario:
  - Stack is brought down and recreated.
- Start State:
  - running stack with persistent data
- Action:
  - `docker compose down`
  - `docker compose up`
- Expected Result:
  - PostgreSQL-backed state persists
- Evidence:
  - compose cycle summary
  - post-recreation login confirmation

### TR-007 Backup Creation

- Priority: `P0`
- Type: `OPS`
- Scenario:
  - Operator runs the backup script.
- Start State:
  - running stack
- Action:
  - execute `./scripts/backup.sh`
- Expected Result:
  - backup artifact is created successfully
- Evidence:
  - backup output
  - created file path

### TR-008 Restore Drill

- Priority: `P0`
- Type: `REC`
- Scenario:
  - Operator restores the database from a backup artifact.
- Start State:
  - backup available
- Action:
  - execute restore path in a controlled test flow
- Expected Result:
  - restored system returns to expected usable state
- Evidence:
  - restore output
  - post-restore validation notes

### TR-009 Healthcheck Workflow

- Priority: `P1`
- Type: `OPS`
- Scenario:
  - Operator runs the healthcheck script.
- Start State:
  - stack running
- Action:
  - execute `./scripts/healthcheck.sh`
- Expected Result:
  - healthcheck passes for intended services and mode
- Evidence:
  - healthcheck output summary

### TR-010 Update Workflow

- Priority: `P1`
- Type: `OPS`
- Scenario:
  - Operator runs the update script.
- Start State:
  - stack present
- Action:
  - execute `./scripts/update.sh`
- Expected Result:
  - update path completes cleanly or fails clearly with actionable cause
- Evidence:
  - update output summary

### TR-011 Default Local-First Port

- Priority: `P1`
- Type: `CFG`
- Scenario:
  - Operator uses default local-first binding.
- Start State:
  - clean env using defaults
- Action:
  - start stack with default port configuration
- Expected Result:
  - service binds as documented
- Evidence:
  - compose ps port summary

### TR-012 Alternate Port Override

- Priority: `P1`
- Type: `CFG`
- Scenario:
  - Operator overrides host port because the default is occupied.
- Start State:
  - env modified with alternate `PORT=...`
- Action:
  - start stack using alternate port
- Expected Result:
  - service binds to alternate loopback port successfully
- Evidence:
  - compose ps port summary
  - reachable login path on alternate port

### TR-013 LOCAL_MODEL Host Mode

- Priority: `P0`
- Type: `CFG`
- Scenario:
  - Operator sets `LOCAL_MODEL=...` and uses host Ollama.
- Start State:
  - host Ollama running
  - model available or pullable by host workflow
- Action:
  - configure host mode
  - execute install/health path
- Expected Result:
  - scripts resolve host mode correctly
  - host endpoint check succeeds
- Evidence:
  - script output
  - host Ollama health evidence

### TR-014 CONTAINER_MODEL Container Mode

- Priority: `P0`
- Type: `CFG`
- Scenario:
  - Operator sets `CONTAINER_MODEL=...` and uses in-container Ollama.
- Start State:
  - container mode chosen
- Action:
  - start stack including Ollama profile
  - perform model pull if missing
- Expected Result:
  - scripts resolve container mode correctly
  - model is available in container
- Evidence:
  - install output
  - `ollama list` evidence

### TR-015 Neither Model Variable Set

- Priority: `P1`
- Type: `CFG`
- Scenario:
  - Operator sets neither `LOCAL_MODEL` nor `CONTAINER_MODEL`.
- Start State:
  - unset model variables
- Action:
  - execute install/health path
- Expected Result:
  - system defaults to container `llama3:8b` mode as documented
- Evidence:
  - script mode summary

### TR-016 Conflicting Model Variables

- Priority: `P1`
- Type: `CFG`
- Scenario:
  - Operator sets both `LOCAL_MODEL` and `CONTAINER_MODEL`.
- Start State:
  - conflicting env configuration
- Action:
  - execute mode resolution path
- Expected Result:
  - system fails clearly and does not continue ambiguously
- Evidence:
  - script error output

### TR-017 Git Remote Push/Auth Path

- Priority: `P0`
- Type: `REL`
- Scenario:
  - Project validates the configured Git push path using the project deploy key.
- Start State:
  - remote configured
  - key available outside repo
- Action:
  - perform controlled auth/push validation
- Expected Result:
  - remote path works as intended
- Evidence:
  - git auth/push summary

### TR-018 Documentation-Path Install Walkthrough

- Priority: `P1`
- Type: `DOC`
- Scenario:
  - Operator follows deployment documentation literally.
- Start State:
  - documentation only
- Action:
  - execute steps in order
- Expected Result:
  - documented path matches reality without hidden assumptions
- Evidence:
  - step verification notes

### TR-019 Documentation-Path Recovery Walkthrough

- Priority: `P1`
- Type: `DOC`
- Scenario:
  - Operator follows backup and recovery docs.
- Start State:
  - backup available
- Action:
  - follow documented restore and recovery guidance
- Expected Result:
  - documentation aligns with actual recovery behavior
- Evidence:
  - walkthrough notes

### TR-020 Release Checklist Traceability

- Priority: `P0`
- Type: `REL`
- Scenario:
  - Release Manager maps release-readiness claims to actual test evidence.
- Start State:
  - release checklist drafted
- Action:
  - compare checklist to executed tests and evidence
- Expected Result:
  - every release claim has supporting evidence or explicit exception
- Evidence:
  - checklist review output

---

## 13. Test Execution Order

Testing should normally proceed in this order:

1. Foundational smoke validation
2. Persistence validation
3. Backup and restore validation
4. Configuration-path validation
5. Documentation-path validation
6. Git/release validation
7. Final release-readiness traceability review

This order reduces wasted effort by proving core viability before deeper branch or release work.

---

## 14. Defect Handling

When a critical test fails:

- record the failure
- classify severity
- stop any dependent higher-level test
- fix the defect
- re-run the failed test
- re-run any invalidated downstream tests

Critical-path failures should not be waved through with narrative optimism.

---

## 15. Sprint Integration

Testing is not a separate afterthought phase.

For this project, testing should be planned into sprint work as explicit tasks with:

- ownership
- evidence requirements
- gating status
- close conditions

The Sprint Planning Meeting should review:

- which registry items are in scope
- which environments are needed
- which tests are blockers for progression

The Sprint Retrospective Meeting should review:

- which tests passed
- which tests failed
- which tests were blocked or deferred
- what evidence is still missing

---

## 16. Recommendation

This testing strategy should be treated as the active project testing standard for NLSW-000003.

It is intentionally comprehensive because the product being produced is more than a code sample. It is an infrastructure artifact that must be trusted to start, run, persist, recover, and be released with evidence.

The next sprint cycles should use this document directly to:

- plan test execution
- assign testing roles
- gate release readiness
- ensure no critical-path validation is forgotten

