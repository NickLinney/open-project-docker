# Project Plan

## Project Metadata

- Project Title: OpenProject Docker Stack
- Project SID: NLSW-000003
- Plan Date: 2026-07-29
- Current Lifecycle Phase: Pre-Alpha
- Current Release Vehicle: `pre-alpha-2`
- Current Release Target: `pre-alpha-2`
- Current Top-Level Feature Vehicle: `feature/pre-alpha-2-lean-baseline`
- Repository Intent: Canonical, Docker-first, self-hosted OpenProject deployment reference

## Executive Objective

Deliver a production-quality, fully dockerized OpenProject deployment repository that is portable, deterministic, security-conscious, and suitable as the NickLinney.Software reference implementation for self-hosted work management infrastructure.

## Planning Reset

On Thursday, July 30, 2026, the project determined that the Ollama integration path, while successfully implemented and validated, is not necessary for the correct end-state scope of `NLSW000003`.

The planning response is:

- complete `pre-alpha-1` as the governed learning-artifact release for the macOS ARM64 implementation
- preserve the validated AI feature path for export and reuse elsewhere
- plan `pre-alpha-2` as the cleanup release that removes all AI-related components and re-establishes the lean OpenProject-only product baseline
- begin Alpha only after `pre-alpha-2` confirms the corrected product scope in code, testing, and documentation

## Success Criteria

- A clean repository bootstrap exists with governed branch topology.
- The stack launches through Docker-first workflows without host-side app installation requirements.
- OpenProject state is externalized from containers and survives container replacement.
- Documentation covers deployment, operations, backup, restore, and security expectations.
- The active product baseline remains OpenProject-only and excludes AI-related runtime components.

## Scope

### In Scope

- Docker Compose based deployment architecture
- OpenProject application service
- PostgreSQL persistence layer
- Reverse proxy strategy suitable for local-first and hardened internal deployment
- Environment-driven configuration
- Backup and restore workflow design
- Multi-architecture support planning for AMD64 and ARM64
- Repository documentation and governance scaffolding

### Out of Scope for MVP

- Cloud LLM providers
- AI-related runtime integrations in the active product baseline
- Enterprise SSO and directory integrations
- Production Kubernetes orchestration
- Advanced observability stack beyond basic health and operational guidance

## Working Assumptions

- The repository is being created greenfield on 2026-07-29.
- Docker-first isolation is the preferred development and validation mode.
- The Git remote will be `NickLinney/open-project-docker`.
- Dedicated repository SSH keys will be used for Git operations when pushing.
- Early work should favor legible structure and reproducible bootstrap over rapid feature sprawl.

## Source Control Evidence Rule

- Dev work must be committed and pushed at each completed task boundary.
- Local commits are implementation tooling; the GitHub repository is the auditable evidence record.
- Every merge must be reviewed by another Dev when available, otherwise by the Release Manager, otherwise by the PM.
- Release progression must pause if commit, push, or review discipline falls out of compliance until the evidence trail is corrected.

## Deliverables

### Repository Foundation

- Governed Git initialization
- Baseline branch topology
- Repo structure for compose, config, scripts, docs, volumes, and backups
- Ignore rules that protect local secrets and operator files

### Runtime Foundation

- Compose stack for OpenProject and PostgreSQL
- Reverse proxy design and local-only default posture
- Volume and network layout
- Environment templates and configuration reference

### Operations Foundation

- Install procedure
- Update procedure
- Backup and restore procedures
- Health-check and validation approach
- Disaster recovery notes

### Historical Learning Artifact Foundation for `pre-alpha-1`

- Retained historical evidence for the discontinued Ollama subset
- Historical exportability of the `pre-alpha-1` learning artifact

## Delivery Model

The project now operates with two parallel sprint cadences rendered as temporally simultaneous:

- Development Team Sprint Cadence
- Testing Team Sprint Cadence

These cadences may be processed sequentially in practice, but they are governed as parallel sprint cycles sharing the same overall project timeline and release objective.

The PM and Scrum Master participate across both cadences as the same project persons. This is intentional and acceptable. Development and Testing should remain deliberately lean to preserve signal quality, role clarity, and meeting efficiency.

## Team Rosters

### Shared Cross-Team Leadership

- Project Sponsor: User / Project Owner
- Project Manager and Meeting Chair: PM
- Scrum Master: Scrum Master
- Release Manager: Release Manager

### Development Team Official Members

- PM
- Dev
- Scrum Master
- Release Manager

### Testing Team Official Members

- PM
- QA / Validation Lead
- Dev
- Scrum Master
- Release Manager

### Testing Team Role Intent

- PM
  - owns test scope approval, milestone alignment, and exception review
- QA / Validation Lead
  - owns the test registry, test evidence completeness, pass/fail accounting, and test report discipline
- Dev
  - supports environment setup, defect diagnosis, retest execution, and technical remediation
- Scrum Master
  - owns testing cadence discipline, blocker surfacing, and stop-work enforcement where test governance is skipped
- Release Manager
  - owns release-gating interpretation, evidence sufficiency, and progression control toward `pre-alpha-1`

## Milestones

### Milestone 1: Governance Bootstrap

- Create the initial project plan
- Initialize Git on `main`
- Seed `dev`, `test`, `staging`, `pre-alpha-1`, and `feature/release-bootstrap`
- Protect secrets from accidental commit

### Milestone 2: Repository Skeleton

- Establish canonical directory structure
- Add base documentation set
- Add environment templates and manifest scaffolding

### Milestone 3: Container Architecture

- Define compose services, networks, and persistent volumes
- Select OpenProject image strategy
- Define reverse proxy approach and security defaults

### Milestone 4: Historical Learning Artifact Preservation

- Preserve validated `pre-alpha-1` learning evidence without treating it as the active baseline
- Export or reference discontinued feature-path learning truthfully

### Milestone 5: Operations Readiness

- Add backup, restore, and health scripts
- Document upgrade and disaster recovery flow
- Validate stack behavior against intended bootstrap paths

### Milestone 6: Pre-Alpha 1 Evidence Closure and Learning Artifact Cutoff

- Run a governed Development Team sprint cadence
- Run a governed Testing Team sprint cadence
- Validate restore, Git auth/push, and the historical learning-artifact subset
- Produce release-readiness evidence for `pre-alpha-1`

### Milestone 7: Pre-Alpha 2 Lean Product Realignment

- Remove Ollama and AI-related components from the product baseline
- Preserve and re-test the full dockerized OpenProject application
- Refresh documentation and release language to reflect the lean scope truthfully

## Initial Risks

- OpenProject image behavior and architecture support may impose constraints on ARM64 portability.
- Reverse proxy and TLS choices should avoid accidental over-design during MVP bootstrap.

## Immediate Next Actions

1. Bootstrap the Git repository and branch topology.
2. Create the initial repository skeleton and core docs.
3. Define the Compose architecture and environment contract.
4. Remove AI-related components from the active product baseline for `pre-alpha-2`.
5. Revalidate the lean operational baseline and release evidence.

## Current Planning Horizon

The current planning horizon is the next governed sprint cycle and the sprint cycle immediately following it.

These sprint cycles should prioritize:

- alpha-entry evidence closure
- governed testing discipline
- release-readiness visibility

Feature expansion not required for `pre-alpha-1` evidence closure or `pre-alpha-2` cleanup should remain out of scope until the current validation and evidence gaps are closed.

## Development Team Parallel Sprint Cadence

### Development Team Sprint 1

#### Sprint Objective

Close the engineering-side alpha-entry evidence gaps and support the Testing Team’s validation program without broadening scope.

#### Tasks and Subtasks

- Task 1: Conduct Development Team Sprint Planning Meeting
  - Subtask: PM chairs the meeting under Robert’s Rules and checked gates.
  - Subtask: PM reviews the current body of project artifacts with Development Team members.
  - Subtask: Scrum Master records the planning meeting artifacts.
  - Subtask: Release Manager confirms branch target and merge-intent constraints.
  - Subtask: Dev confirms readiness to execute the bounded sprint scope.

- Task 2: Prepare the sprint-scoped technical readiness checkpoint
  - Subtask: Dev lists all remaining alpha-entry technical evidence gaps.
  - Subtask: Release Manager maps those gaps to release significance.
  - Subtask: PM approves the sprint scope as evidence-closure only.
  - Subtask: Scrum Master records blockers, dependencies, and stop-work criteria.

- Task 3: Execute and document the database restore drill
  - Subtask: Dev selects the backup artifact or creates a fresh controlled backup if needed.
  - Subtask: Dev defines the restore target conditions and validation criteria.
  - Subtask: Dev executes the restore workflow.
  - Subtask: Dev validates that the post-restore system returns to expected usable state.
  - Subtask: Dev records restore evidence and notes any defects or documentation mismatches.

- Task 4: Remove active AI runtime components from the product baseline
  - Subtask: Dev removes Compose, script, and environment-variable surfaces tied to the discontinued AI subset.
  - Subtask: Dev confirms no active operator path still depends on Ollama-specific behavior.
  - Subtask: Dev records the exact removed surfaces in a sprint-scoped artifact.
  - Subtask: Release Manager confirms the change aligns with the current release target.

- Task 5: Revalidate the lean operational baseline after removal
  - Subtask: Dev runs the relevant install and health paths after removal.
  - Subtask: Dev confirms the stack remains usable without AI-related runtime components.
  - Subtask: Dev records any regressions, timing observations, and corrective actions if present.

- Task 6: Validate remote Git push/auth path
  - Subtask: Release Manager confirms the intended remote and auth method.
  - Subtask: Dev uses the project-specific deploy key path for controlled Git auth validation.
  - Subtask: Dev validates remote connectivity and push path according to approved scope.
  - Subtask: Release Manager records whether the Git path is sufficient for release movement.

- Task 7: Correct defects revealed by Development Team validation
  - Subtask: Dev triages failures by severity and dependency order.
  - Subtask: PM decides whether any defect requires sprint scope reprioritization.
  - Subtask: Dev fixes high-priority blocking defects only.
  - Subtask: Dev re-runs invalidated technical checks.
  - Subtask: Scrum Master records any stop-work or scope-adjustment decisions.

- Task 8: Close Development Team Sprint 1
  - Subtask: PM prepares the Development Team PM Statement of Work Report for the sprint outcome.
  - Subtask: PM, Dev, Scrum Master, and Release Manager each prepare individual sprint retrospective reports.
  - Subtask: PM chairs the Development Team Sprint Retrospective Meeting.
  - Subtask: PM prepares the Sprint Retrospective Meeting Findings and Conclusions Report.

### Development Team Sprint 2

#### Sprint Objective

Convert validated technical evidence into release-ready operational and documentation alignment for `pre-alpha-2` decision support.

#### Tasks and Subtasks

- Task 1: Conduct Development Team Sprint 2 Planning Meeting
  - Subtask: PM reviews Sprint 1 findings and unresolved items.
  - Subtask: Release Manager presents the current release-readiness gaps.
  - Subtask: Scrum Master records conditions to proceed.
  - Subtask: Dev confirms technical follow-up scope.

- Task 2: Align repository documentation with validated behavior
  - Subtask: Dev updates deployment documentation for proven runtime paths.
  - Subtask: Dev updates operations documentation for backup/restore/update realities.
  - Subtask: Dev updates architecture documentation for the lean OpenProject-only baseline.
  - Subtask: PM reviews documentation changes for operator clarity.

- Task 3: Support creation of the `pre-alpha-2` Release Readiness Checklist
  - Subtask: Release Manager drafts the checklist criteria.
  - Subtask: Dev maps technical validation evidence to checklist items.
  - Subtask: PM reviews missing evidence and unresolved risks.
  - Subtask: Scrum Master records any tabled matters or sponsor-escalation needs.

- Task 4: Execute limited hardening or remediation tasks required by evidence gaps
  - Subtask: Dev fixes only release-blocking issues revealed by Sprint 1 and Testing Team findings.
  - Subtask: Dev re-runs affected validation paths.
  - Subtask: Release Manager confirms whether the fixes are sufficient for checklist closure.

- Task 5: Close Development Team Sprint 2
  - Subtask: PM prepares the Development Team PM Statement of Work Report.
  - Subtask: Each Development Team role prepares its sprint retrospective report.
  - Subtask: PM chairs the Development Team Sprint Retrospective Meeting.
  - Subtask: PM prepares the Sprint Retrospective Meeting Findings and Conclusions Report.

## Testing Team Parallel Sprint Cadence

### Testing Team Sprint 1

#### Sprint Objective

Execute the first formal evidence-building testing cycle against the current OpenProject stack using the project testing standard.

#### Tasks and Subtasks

- Task 1: Conduct Testing Team Sprint Planning Meeting
  - Subtask: PM chairs the meeting under Robert’s Rules and checked gates.
  - Subtask: PM reviews the full artifact body, including the testing strategy and recent retrospective outputs.
  - Subtask: QA / Validation Lead presents the in-scope test registry items for the sprint.
  - Subtask: Release Manager identifies which registry items are release-gating.
  - Subtask: Scrum Master records meeting outputs, blockers, and stop-work criteria.

- Task 2: Baseline the Testing Team test execution matrix
  - Subtask: QA / Validation Lead selects the Sprint 1 in-scope test registry entries.
  - Subtask: QA / Validation Lead maps each test to owner, environment, and evidence type.
  - Subtask: PM approves the test scope.
  - Subtask: Release Manager confirms which tests are required before release progression.

- Task 3: Execute foundational and operational critical-path tests
  - Subtask: QA / Validation Lead validates fresh compose render behavior.
  - Subtask: QA / Validation Lead validates stack bring-up and service-state expectations.
  - Subtask: QA / Validation Lead validates login reachability and operator usability checks.
  - Subtask: QA / Validation Lead validates persistence across restart and recreation.
  - Subtask: QA / Validation Lead validates backup workflow success.

- Task 4: Execute recovery-path tests
  - Subtask: QA / Validation Lead coordinates the restore drill with Dev support.
  - Subtask: QA / Validation Lead validates post-restore usability and data expectations.
  - Subtask: QA / Validation Lead records all recovery evidence and any failures.
  - Subtask: Dev supports defect diagnosis where test failures occur.

- Task 5: Execute configuration-path tests
  - Subtask: QA / Validation Lead validates default local-first path behavior.
  - Subtask: QA / Validation Lead validates alternate port override behavior.
  - Subtask: QA / Validation Lead validates conflicting model-variable failure behavior.
  - Subtask: QA / Validation Lead records mode and port-path evidence.

- Task 6: Close Testing Team Sprint 1
  - Subtask: QA / Validation Lead prepares the test execution summary for the sprint.
  - Subtask: PM, QA / Validation Lead, Dev, Scrum Master, and Release Manager each prepare individual sprint retrospective reports.
  - Subtask: PM chairs the Testing Team Sprint Retrospective Meeting.
  - Subtask: PM prepares the Sprint Retrospective Meeting Findings and Conclusions Report.

### Testing Team Sprint 2

#### Sprint Objective

Complete release-gating validation, documentation-path testing, and final evidence traceability for `pre-alpha-2` readiness review.

#### Tasks and Subtasks

- Task 1: Conduct Testing Team Sprint 2 Planning Meeting
  - Subtask: PM reviews Testing Team Sprint 1 findings and unresolved failures.
  - Subtask: QA / Validation Lead presents the remaining release-gating registry items.
  - Subtask: Release Manager confirms the minimum test evidence needed for readiness review.
  - Subtask: Scrum Master records conditions to proceed.

- Task 2: Execute lean-baseline regression tests
  - Subtask: QA / Validation Lead validates that active deployment guidance no longer depends on AI-specific configuration.
  - Subtask: QA / Validation Lead validates that removed AI runtime surfaces do not remain in active operator paths.
  - Subtask: Dev supports diagnosis of residual configuration or runtime failures.

- Task 3: Execute Git/release-path tests
  - Subtask: QA / Validation Lead validates the Git remote push/auth path using approved workflow.
  - Subtask: Release Manager confirms that the path is acceptable for release progression.
  - Subtask: QA / Validation Lead records evidence and any unresolved risks.

- Task 4: Execute documentation-path validation
  - Subtask: QA / Validation Lead follows deployment documentation literally in the approved environment.
  - Subtask: QA / Validation Lead follows recovery documentation literally in the approved environment.
  - Subtask: QA / Validation Lead records mismatches between docs and actual operator experience.
  - Subtask: PM classifies any documentation mismatches as release-blocking or non-blocking.

- Task 5: Build release-evidence traceability package
  - Subtask: QA / Validation Lead maps executed tests to release-readiness criteria.
  - Subtask: Release Manager confirms that each release claim has evidence or explicit exception.
  - Subtask: PM reviews open risks, deferrals, and unresolved test failures.
  - Subtask: Scrum Master records any required sponsor escalations or tabled matters.

- Task 6: Close Testing Team Sprint 2
  - Subtask: QA / Validation Lead prepares the sprint test evidence summary.
  - Subtask: Each Testing Team role prepares its sprint retrospective report.
  - Subtask: PM chairs the Testing Team Sprint Retrospective Meeting.
  - Subtask: PM prepares the Sprint Retrospective Meeting Findings and Conclusions Report.

## Tracking Note

Project lifecycle notes may be maintained in a local text file outside the repository and later imported into Wiki.js to satisfy end-to-end documentation requirements.
