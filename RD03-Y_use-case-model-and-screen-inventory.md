# [RD03-Y] Use-Case Model and Screen Inventory

**AI Recruitment Platform · Research and Software Design Plan · Week 3 (RD03)**

| Field | Value |
|---|---|
| Task | RD03-Y — Use-case model and screen inventory (GitHub issue #16) |
| Repository · milestone | `ai-recruitment-grad-team/ai-recruitment-platform` · RD03 — Requirements baseline and scope approval [Issue #16] |
| Week · priority · estimate | Week 3 (RD03) · P0 · 6 h [Issue #16; Plan App. A, p.9] |
| Owner | Youssef Mohammed Elbasosy (Y); GitHub username pending [Issue #16] |
| Peer reviewer | Ahmed Fadlallah Abdelgwad (A), `@AhmedFadlallah1` [Issue #16; Plan §5, p.6; A-43] |
| Final reviewer | `@kareemmahmoud141224-prog` [Issue #16] |
| Support | As needed during team review [Issue #16] |
| Dependencies | RD02-Y; RD02-I [Issue #16]. Builds on RD01-Y |
| Baseline | `planning/weekly_backlog.json`, RD-9W-FINAL [Issue #16] |
| Status · date | Ready for peer review · 4 November 2026 |
| Authoring | Task owner with AI-assisted drafting; single author [A-18] |
| Boundary | Research and design only. No application coding before the supervisor approves Design Baseline v1 [Issue #16; Plan §6, p.7] |

**How to read this document.** Tags in square brackets give the source: [UC-01, p.13] (see section 2), [A-nn] a Clearly Marked Assumption, [OD-nn] an open decision, [CC-nn] a consistency check. Identifiers: `UC-CAN-nn`, `UC-REC-nn`, `UC-ADM-nn` use cases; `SCR-CAN-nn`, `SCR-REC-nn`, `SCR-ADM-nn` screens; `REQ-SYS-nnn` functional requirements; `CM-01`, `CM-02` consent modules.

## Limitation notice

This is a design document built from the Plan's diagrams, RD01-Y and RD02-Y. It is not evidence of what recruiters or candidates want.

- **No participant feedback.** The RD01-Y interviews could not be held and RD02-Y was a supervisor/heuristic substitute review [Plan §1, p.2]. The four RD02-Y findings used here are design hypotheses [A-27, A-48].
- **Provisional identifiers.** UC, SCR and REQ-SYS IDs are proposals until RD03-M adopts or maps them. This is not the SRS or the access-control matrix [A-28].
- **Diagrams.** UC-01 (p.13) and ACT-01/ST-01 (p.17) were read from page images; CL-01A, CL-01B (pp.14–15), SEQ-01 and DEP-01 from the PDF text. The editable diagram files were not available [A-16].
- **Issue #16.** Read from screenshots of the issue page. The list of earlier gaps (consent, interview selection, result review, data management) comes from the task brief, not from the issue text [A-50].
- **No legal analysis.** Consent wording, data requests ("GDPR" appears in the task brief only) and retention carry no legal claim [A-15, A-33].
- **Screens are logical units**, not wireframes [A-45]. The author is single and uses AI-assisted drafting; peer review is pending [A-18].

---

## 1. Purpose, scope and acceptance mapping

RD03-Y refines the Plan's UML UC-01 into a use-case model for the Candidate, Recruiter and Admin, and links every main and alternate or failure flow to a prioritized screen and a functional requirement ID [Plan App. A, RD03-Y, p.9]. It also closes the gaps of RD01-Y and RD02-Y named in the task brief: modular consent with withdrawal, interview selection, interview result review and candidate data management.

| Acceptance criterion (Issue #16, verbatim) | Met in |
|---|---|
| Produce UML UC-01 with candidate/recruiter/admin actors; link its main/alternate flows to prioritized screens and SRS IDs | Sections 5 (model), 6 (flows), 7 (screens), 8 (requirements), 9 (traceability) |
| Link the deliverable and primary sources or clearly marked assumptions | Section 2; source tags; section 11 |
| Check consistency with requirements and relevant diagrams | Section 10 |
| Submit a PR using `Refs #NUMBER`; request owner review | Section 13 (`Refs #16`) |
| Task brief: resolve earlier gaps (consent, interview selection, interview result review, data management) | Section 4; UC-CAN-01, UC-REC-04, UC-REC-05, UC-CAN-10, UC-ADM-02, UC-ADM-03 |

---

## 2. Source register

| Tag | Source and location |
|---|---|
| Plan | AI Recruitment Platform — Research and Software Design Plan (nine weeks, final planning baseline). Printed pages: summary p.1; §1 p.2; §2 p.3; §3 p.4; §4 p.5; §5 p.6; §6 p.7 |
| Plan App. A | Appendix A weekly tasks: Weeks 01–02 p.8; 03–04 p.9; 05–06 p.10; 07–08 p.11; 09 p.12. Task IDs such as RD03-K refer to it |
| UC-01 | Use-case model, Appendix B, p.13: three actors, seven use cases, and the note that authenticated roles and organization-scoped access apply to every use case |
| CL-01A, CL-01B | Domain models for application and evidence (p.14) and for interview (p.15) |
| SEQ-01 | CV-processing sequence, p.16 |
| ACT-01, ST-01 | Application activity model and CV-processing states, p.17 |
| DEP-01 | Deployment view and design bounds, p.18 |
| UML | Object Management Group, Unified Modeling Language 2.5.1, https://www.omg.org/spec/UML/2.5.1/About-UML [Plan ref. 18]: actors, boundary, «include», «extend» (Clause 18). The OMG site was not fetched in this session [A-53] |
| RD01-Y | [RD01-Y] User Journeys and Elicitation Guide: CJ-01 to CJ-20, RJ-01 to RJ-14, AD-01 to AD-03; A-01 to A-16; F-01 to F-08 |
| RD02-Y | [RD02-Y] Stakeholder Feedback and Priority Findings (heuristic substitute review): A-17 to A-27; F-01 mandatory ambiguity, F-02 processing states, F-03 modular consent, F-04 auto-save visibility, as listed in the task brief [A-48] |
| Issue #16 | GitHub issue #16 "[RD03-Y] Use-case model and screen inventory", opened by the repository owner: assignment, four acceptance criteria, review and completion rules, baseline [A-50] |
| Form | Graduation Project Registration Form (preliminary) |
| WCAG | W3C, Web Content Accessibility Guidelines 2.2, https://www.w3.org/TR/WCAG22/: 1.4.1 Use of Color, 2.2.1 Timing Adjustable, 3.1.2 Language of Parts |

---

## 3. Conventions and boundaries

| Item | Rule |
|---|---|
| Finding IDs | RD01-Y and RD02-Y both use F-nn. The source is always named: "RD01-Y F-02" and "RD02-Y F-02" are different findings |
| Use-case IDs | Children of the diagram UC-01; baseline names are kept in "Basis" [A-29] |
| Flow IDs | M main; W withdrawal (UC-CAN-01 only); A alternate or failure, with its branch point, "(at M3)" |
| Requirement IDs | `REQ-SYS-nnn` are provisional IDs issued here and offered to the SRS of RD03-M; none is claimed to exist there yet [A-28] |
| Priority | P0 needed for the core workflow or a Plan guarantee (evidence validity, unknown is not negative, human decision authority, consent); P1 needed for a complete product but not the first end-to-end walkthrough; P2 useful and deferrable [A-44] |
| Verification | T test, I inspection, D demonstration, A analysis |

**Boundary with parallel Week 3 tasks.** Conflicts go to RD03-I [Plan App. A, p.9]. RD03-K owns upload, correction, unknown fields and exact-source criteria (UC-CAN-02 to UC-CAN-04; REQ-SYS-015 to REQ-SYS-031). RD03-A owns rank direction, labels and missing-evidence rules (UC-REC-02; REQ-SYS-045 to REQ-SYS-048; OD-02). RD03-M owns the numbered SRS and the access-control matrix (all REQ-SYS IDs, REQ-SYS-001 to REQ-SYS-004, REQ-SYS-091). RD03-H owns consent, question selection, answer recovery, human review and decision flows (UC-CAN-01, UC-CAN-08, UC-CAN-09, UC-REC-04 to UC-REC-06; OD-01, OD-04). RD03-I is the gate (sections 10 and 12).

---

## 4. Gap resolution register

Status **Resolved** means the gap has a use case, screens and requirements in this document. **Resolved, open item** means the modeling is done and a named decision is still needed.

| Source finding | Resolution in this document | Requirements | Status and residual item (owner) |
|---|---|---|---|
| RD01-Y F-01 Consent not modeled | UC-CAN-01 with modules CM-01 and CM-02: grant, decline, withdrawal; «include»d by UC-CAN-02, UC-CAN-06, UC-CAN-08 | REQ-SYS-005 to 012 | Resolved, open item: notice wording, legal basis, non-AI alternative, OD-01 (RD03-H, supervisor) |
| RD01-Y F-02 Interview selection and result review have no use case | UC-REC-04 and UC-REC-05 | REQ-SYS-054 to 060, 072 to 075 | Resolved, open item: ACT-01 update, CC-05 (RD06-M) |
| RD01-Y F-03 Corrections versus source evidence | UC-CAN-04: "candidate-provided" label; optional span validated as new evidence | REQ-SYS-027 to 030 | Resolved, open item: storage schema (RD03-K, RD05-K) |
| RD01-Y F-04 Timing of matching | Matching starts after submission (UC-CAN-06 M5); recruiter sees a pending or failed state (UC-REC-02 A1) | REQ-SYS-043, 044 | Resolved, open item: trigger and snapshot rules, OD-08 (RD05-A) |
| RD01-Y F-05 Form versus Plan wording | Plan wording throughout [A-01] | none | Resolved |
| RD01-Y F-06 Candidate data requests | UC-CAN-10 (candidate), UC-ADM-03 (Admin) and UC-ADM-02 (retention) | REQ-SYS-079 to 086 | Resolved, open item: service target OD-03, retention defaults OD-09; no legal analysis [A-15] |
| RD01-Y F-07 Who selects interview questions | Recruiter selects one approved template per invitation (provisional) [A-34] | REQ-SYS-055 | Resolved, open item: OD-04 (RD03-H) |
| RD01-Y F-08 Alignment with RD01-M | Requirement IDs stay provisional; the SRS adopts or maps them [A-28] | all | Resolved, open item: mapping table (RD03-M, RD03-I) |
| RD02-Y F-01 Mandatory ambiguity | Flag explanation and no-evidence preview (UC-REC-01); "not assessed" shown per row; applicant kept in the default list with a "needs review" filter (UC-REC-02) | REQ-SYS-034, 035, 046, 047 | Resolved, open item: ranking basis OD-02 (RD03-A) |
| RD02-Y F-02 Processing states (ST-01) | Four candidate-visible states with messages, retry notice, failure categories and leave-and-return (UC-CAN-02) | REQ-SYS-019 to 022 | Resolved; message wording in RD04-Y |
| RD02-Y F-03 Modular consent | Per-module grant, decline and withdrawal with a stated effect (UC-CAN-01) | REQ-SYS-005, 009 to 011 | Resolved, open item: OD-01 |
| RD02-Y F-04 Auto-save visibility (CL-01B) | Autosave, visible save state, recovery and idempotent submission (UC-CAN-09) | REQ-SYS-063 to 065, 068 | Resolved, open item: interval and offline limits OD-07 (RD05-H) |

---

## 5. UC-01 model specification

### 5.1 How the model refines UC-01

UC-01 shows three actors, seven use cases and one rule: authenticated roles and organization-scoped access apply to every use case [UC-01, p.13]. This model keeps the actors, the boundary and the seven baseline names, and applies five rules. **R1 Keep:** every baseline name appears in the "Basis" of a child use case. **R2 Split:** a baseline use case with several goals becomes goal-sized children with one main flow each [A-29]. **R3 Add:** a use case is added where Plan §2, p.3 names an action UC-01 does not draw ("consent", "select interviews") or RD01-Y and RD02-Y found a gap. **R4 Support:** use cases that complete the flows without being UC-01 goals carry P1 or P2 [A-44]. **R5:** authentication, role binding and organization scope stay preconditions (REQ-SYS-001 to REQ-SYS-004 and the three sign-in screens), not use cases.

| UC-01 baseline use case | Actor | Child use cases |
|---|---|---|
| Review CV profile | Candidate | UC-CAN-02, UC-CAN-03, UC-CAN-04 |
| Submit application | Candidate | UC-CAN-06 |
| Answer interview | Candidate | UC-CAN-08, UC-CAN-09 |
| Define job requirements | Recruiter | UC-REC-01 |
| Review matching evidence | Recruiter | UC-REC-02, UC-REC-03 |
| Record hiring decision | Recruiter | UC-REC-06 |
| Manage access / retention | Admin | UC-ADM-01, UC-ADM-02 |
| New (R3, R4) | Candidate, Recruiter, Admin | UC-CAN-01, UC-CAN-05, UC-CAN-07, UC-CAN-10; UC-REC-04, UC-REC-05; UC-ADM-03, UC-ADM-04 |

**The four use cases the brief asks for.** Consent, with modularity and withdrawal: UC-CAN-01 (modules CM-01 and CM-02, flows M and W). Candidate selection for interview: UC-REC-04. Interview result review: UC-REC-05. Candidate data management, meaning data and retention requests ("GDPR" is named in the brief only, see A-33): UC-CAN-10 (candidate side), UC-ADM-03 (Admin side) and UC-ADM-02 (retention and deletion).

### 5.2 Actors and boundary

| Actor | Goals in this model | Use cases | Limits |
|---|---|---|---|
| Candidate | Give or withdraw consent; submit a reviewed CV profile and an application; answer an invited interview; follow the application; manage their own data | UC-CAN-01 to UC-CAN-10 | Sees own data only; never rankings, evidence labels or other applicants [A-09; REQ-SYS-041] |
| Recruiter | Define jobs; review ranked applicants and evidence; invite candidates; review interview results; record decisions | UC-REC-01 to UC-REC-06 | Decides; model outputs are supporting assessments, not hiring probabilities [Plan §1, p.2; ACT-01] |
| Admin | Manage membership and roles, retention and deletion, candidate data requests and the audit history | UC-ADM-01 to UC-ADM-04 | Organization-scoped; sees no candidate evidence or interview content unless the access-control matrix grants it [REQ-SYS-091; A-46] |

**Boundary and scope.** The boundary is the AI Recruitment Platform of UC-01. The AI module, worker, notification service and retention scheduler are internal and appear as "background" steps [DEP-01; A-30]. Every use case has the preconditions of an authenticated session bound to one role (REQ-SYS-001) and an organization scope (REQ-SYS-002 to REQ-SYS-004) [UC-01, p.13]. The core design uses text PDFs and text interviews; broad OCR, voice or video analysis, unrestricted agents and training from scratch are deferred [Plan §1, p.2].

### 5.3 Use-case catalogue

"Findings closed" names the earlier findings the use case resolves (section 4); flows and screens are in sections 6 and 7.

| ID | Use case | Actor | Pri | Findings closed |
|---|---|---|---|---|
| UC-CAN-01 | Manage consent | Candidate | P0 | RD01-Y F-01; RD02-Y F-03 |
| UC-CAN-02 | Upload CV and follow processing | Candidate | P0 | RD02-Y F-02 |
| UC-CAN-03 | Review CV profile | Candidate | P0 | none |
| UC-CAN-04 | Correct extracted field | Candidate | P0 | RD01-Y F-03 |
| UC-CAN-05 | Find and open a job | Candidate | P1 | none |
| UC-CAN-06 | Submit application | Candidate | P0 | none |
| UC-CAN-07 | Track application status | Candidate | P1 | none |
| UC-CAN-08 | Respond to interview invitation | Candidate | P0 | RD01-Y F-01 |
| UC-CAN-09 | Answer interview | Candidate | P0 | RD02-Y F-04 |
| UC-CAN-10 | Manage my data and requests | Candidate | P1 | RD01-Y F-06 |
| UC-REC-01 | Define job requirements | Recruiter | P0 | RD02-Y F-01 |
| UC-REC-02 | Review ranked applicants | Recruiter | P0 | RD02-Y F-01; RD01-Y F-04 |
| UC-REC-03 | Review matching evidence | Recruiter | P0 | none |
| UC-REC-04 | Select candidates for interview | Recruiter | P0 | RD01-Y F-02; RD01-Y F-07 |
| UC-REC-05 | Review interview results | Recruiter | P0 | RD01-Y F-02 |
| UC-REC-06 | Record hiring decision | Recruiter | P0 | none |
| UC-ADM-01 | Manage organization membership and roles | Admin | P0 | none |
| UC-ADM-02 | Manage retention and deletion | Admin | P0 | none |
| UC-ADM-03 | Process candidate data requests | Admin | P1 | RD01-Y F-06 |
| UC-ADM-04 | Review audit and processing history | Admin | P2 | none |

### 5.4 Relationships between use cases

| Relationship | From → To | Point | Rule |
|---|---|---|---|
| «include» | UC-CAN-02 → UC-CAN-01 | CM-01 gate | The gate is always evaluated; if CM-01 is granted for the current notice version it passes without a screen |
| «include» | UC-CAN-06 → UC-CAN-01 | CM-01 gate | Same rule at submission |
| «include» | UC-CAN-08 → UC-CAN-01 | CM-02 gate | Accepting an invitation always evaluates CM-02 |
| «include» | UC-REC-02 → UC-REC-03 | Open an applicant (M5) | Opening an application is the purpose of the list |
| «extend» | UC-CAN-04 → UC-CAN-03 | Extension point "item disputed" | Optional; UC-CAN-03 is complete without it |

UC-CAN-01 is also started from the privacy settings (flows W1 to W5), so it keeps its own actor association. «include» and «extend» follow UML 2.5.1: included behavior always runs; an extension is optional and inserted at a named extension point [UML; A-53]. The main chain is UC-ADM-01 → UC-REC-01 → UC-CAN-05 → UC-CAN-02 → UC-CAN-03 → UC-CAN-06 → UC-REC-02 → UC-REC-03 → UC-REC-04 → UC-CAN-08 → UC-CAN-09 → UC-REC-05 → UC-REC-06. The "no interview" branch goes from UC-REC-03 or UC-REC-04 straight to UC-REC-06 [ACT-01]. UC-CAN-10 and UC-ADM-03 are the two sides of one data request.

### 5.5 Diagram source

The PlantUML source below is generated from the catalogue. It follows UML use-case notation and shows the 20 use cases, their actors and the five relationships of section 5.4. GitHub does not render PlantUML; paste the source into any PlantUML renderer. It does not replace the editable UC-01 file of the Plan, which was not available [A-16].

~~~plantuml
@startuml UC-01-refined
title UC-01 refined: AI Recruitment Platform
left to right direction
skinparam shadowing false
skinparam packageStyle rectangle
actor "Candidate" as CAN
actor "Recruiter" as REC
actor "Admin" as ADM
rectangle "AI Recruitment Platform" {
  usecase "UC-CAN-01\nManage consent" as UCAN01
  usecase "UC-CAN-02\nUpload CV and follow processing" as UCAN02
  usecase "UC-CAN-03\nReview CV profile" as UCAN03
  usecase "UC-CAN-04\nCorrect extracted field" as UCAN04
  usecase "UC-CAN-05\nFind and open a job" as UCAN05
  usecase "UC-CAN-06\nSubmit application" as UCAN06
  usecase "UC-CAN-07\nTrack application status" as UCAN07
  usecase "UC-CAN-08\nRespond to interview invitation" as UCAN08
  usecase "UC-CAN-09\nAnswer interview" as UCAN09
  usecase "UC-CAN-10\nManage my data and requests" as UCAN10
  usecase "UC-REC-01\nDefine job requirements" as UREC01
  usecase "UC-REC-02\nReview ranked applicants" as UREC02
  usecase "UC-REC-03\nReview matching evidence" as UREC03
  usecase "UC-REC-04\nSelect candidates for interview" as UREC04
  usecase "UC-REC-05\nReview interview results" as UREC05
  usecase "UC-REC-06\nRecord hiring decision" as UREC06
  usecase "UC-ADM-01\nManage organization membership and roles" as UADM01
  usecase "UC-ADM-02\nManage retention and deletion" as UADM02
  usecase "UC-ADM-03\nProcess candidate data requests" as UADM03
  usecase "UC-ADM-04\nReview audit and processing history" as UADM04
}
CAN -- UCAN01
CAN -- UCAN02
CAN -- UCAN03
CAN -- UCAN04
CAN -- UCAN05
CAN -- UCAN06
CAN -- UCAN07
CAN -- UCAN08
CAN -- UCAN09
CAN -- UCAN10
REC -- UREC01
REC -- UREC02
REC -- UREC03
REC -- UREC04
REC -- UREC05
REC -- UREC06
ADM -- UADM01
ADM -- UADM02
ADM -- UADM03
ADM -- UADM04
UCAN02 ..> UCAN01 : <<include>>
UCAN06 ..> UCAN01 : <<include>>
UCAN08 ..> UCAN01 : <<include>>
UREC02 ..> UREC03 : <<include>>
UCAN04 ..> UCAN03 : <<extend>>
note as N1
  Authenticated roles and organization-scoped access apply to every use case.
end note
@enduml
~~~

### 5.6 State vocabulary and display terms (proposal)

CL-01A and CL-01B name the types ApplicationStatus and SessionStatus but list no values [CL-01A, p.14; CL-01B, p.15]. The values below are proposals so that flows, screens and requirements use one vocabulary [A-49; OD-10]. The processing states are the Plan's own [ST-01, p.17].

| Vocabulary | Values and transitions | Source |
|---|---|---|
| Consent, per candidate × organization × module | NOT ASKED → GRANTED or DECLINED. GRANTED → WITHDRAWN, or renewal when the notice version changes. DECLINED or WITHDRAWN → GRANTED with a new record | A-31, A-32 |
| CV processing | Queued → Processing → Ready. Processing → Failed. Failed → Queued once, when recoverable and attempts are below the limit; the candidate sees "retrying" as a message on Queued, not as a fifth state | ST-01; REQ-SYS-019, 021 |
| Interview session | INVITED → ACCEPTED, DECLINED or CLOSED. ACCEPTED → IN PROGRESS or CLOSED. IN PROGRESS → SUBMITTED, INTERRUPTED or CLOSED. INTERRUPTED → IN PROGRESS or CLOSED. SUBMITTED, DECLINED, CLOSED are final. CLOSED covers a cancelled invitation, a withdrawn CM-02 and a session closed by the recruiter | CL-01B; REQ-SYS-074 |
| Application status | SUBMITTED, INTERVIEW INVITED, INTERVIEW IN PROGRESS, INTERVIEW SUBMITTED, DECIDED, WITHDRAWN. The candidate sees Submitted, Interview invited, Interview in progress, Interview submitted, Decision recorded (no outcome or rationale) and Withdrawn. A declined or closed invitation returns the status to SUBMITTED | CL-01A; REQ-SYS-040 |
| Data request | Types EXPORT, CORRECTION, CONSENT WITHDRAWAL, DELETION. PENDING → IN PROGRESS → COMPLETED or REJECTED. PENDING → CANCELLED by the candidate. A partly failed deletion stays IN PROGRESS | A-33 |
| Decision outcome | Hire, Not hire, On hold, with an optional rationale. A new decision is added; earlier ones stay in the history | ACT-01; A-11; REQ-SYS-076, 077 |

**Display terms.** "Not assessed" (an Insufficient result, a failed quote check or no result yet; never a negative assessment), "needs review", "candidate-provided", "consent withdrawn" and "source removed" are defined by REQ-SYS-011, 028, 034, 046, 047 and 083 and used in the same sense throughout [Plan §2, p.3].

---

## 6. Use-case specifications

Each flow line reads `ID step — screen(s) — requirement(s)`. IDs: **M** main flow, **W** withdrawal flow (UC-CAN-01 only), **A** alternate or failure flow with its branch point, for example "(at M3)". A step marked "background" runs without a screen. Every use case starts from the preconditions of section 5.2. "Acceptance" is the measurable check; the `REQ-SYS` rows are in section 8.

**Candidate use cases**

### UC-CAN-01 — Manage consent

**Pri** P0 · **Basis** New; resolves RD01-Y F-01 and RD02-Y F-03 · **Journeys** CJ-02, CJ-03, CJ-15
**Pre** The candidate is authenticated and either a calling use case requests a module (a consent gate: if the module is already granted for the current notice version, the gate passes without a screen) or the candidate opens the privacy settings. **Post** Each decision is stored per module; processing runs only for granted modules.

**Main flows** (M = grant at the point of use, W = review and withdraw)

- M1 System shows the notice of the requested module in the candidate's preferred language. — SCR-CAN-03 — REQ-SYS-005, REQ-SYS-006
- M2 Candidate reads it and chooses Grant for that module. — SCR-CAN-03 — REQ-SYS-005
- M3 System stores the decision with module, notice version, language, organization and time. — SCR-CAN-03 — REQ-SYS-008
- M4 System returns the candidate to the calling use case, which may now process. — SCR-CAN-03 — REQ-SYS-007
- W1 Candidate opens the privacy settings and sees each module with its state and history. — SCR-CAN-15 — REQ-SYS-008
- W2 Candidate chooses Withdraw and confirms after reading the stated effect. — SCR-CAN-15 — REQ-SYS-009
- W3 System stops new processing, cancels queued or running jobs and closes any open interview session. — SCR-CAN-15 — REQ-SYS-009, REQ-SYS-010
- W4 System tells the candidate what happens to existing data and how to request deletion (UC-CAN-10). — SCR-CAN-15 — REQ-SYS-010
- W5 System hides the module's results from recruiter views and marks the application "consent withdrawn". — SCR-CAN-15, SCR-REC-06 — REQ-SYS-011

**Alternate and failure flows**

- A1 (at M2) Candidate declines: the decline is recorded, its outcome is explained (no CV upload or no interview acceptance), account access is unaffected and nothing is stored. — SCR-CAN-03 — REQ-SYS-012
- A2 (at M3) Storing the decision fails: nothing is processed and the candidate can retry. — SCR-CAN-03 — REQ-SYS-007, REQ-SYS-008
- A3 (at M1) Notice version changed since an earlier grant: renewed consent is requested before the next processing. — SCR-CAN-03 — REQ-SYS-008
- A4 (at W2) Candidate cancels the withdrawal: no change. — SCR-CAN-15 — REQ-SYS-009
- A5 (at W3) Withdrawal during an open interview: session becomes Closed, drafts stay under retention rules, the recruiter sees Closed. — SCR-CAN-15, SCR-REC-10 — REQ-SYS-010, REQ-SYS-074
- A6 (at W5) Recruiter opens a withdrawn application: sees "consent withdrawn" and no results. — SCR-REC-06, SCR-REC-07 — REQ-SYS-011

**Acceptance** A walkthrough shows each module granted, declined and withdrawn; a test shows that no job starts without a granted module (REQ-SYS-007) and that withdrawal takes effect immediately (REQ-SYS-009).

### UC-CAN-02 — Upload CV and follow processing

**Pri** P0 · **Basis** Baseline "Review CV profile", part 1; resolves RD02-Y F-02 · **Journeys** CJ-04, CJ-05, CJ-06
**Pre** An application is started for a published job (UC-CAN-05). **Post** A resume version exists in state Ready or Failed.

**Main flow**

- M1 Candidate opens the upload; if CM-01 is not granted the system runs UC-CAN-01 first. — SCR-CAN-04, SCR-CAN-03 — REQ-SYS-007
- M2 Candidate selects a text PDF. — SCR-CAN-04 — REQ-SYS-015
- M3 System checks size, pages and extracted characters and accepts the file. — SCR-CAN-04 — REQ-SYS-015, REQ-SYS-016
- M4 System stores an immutable resume version and returns a job identifier within 2 s. — SCR-CAN-05 — REQ-SYS-017, REQ-SYS-018
- M5 Candidate sees Queued, then Processing, each with its message. — SCR-CAN-05 — REQ-SYS-019
- M6 System saves the validated result, shows Ready and the action "Review profile". — SCR-CAN-05 — REQ-SYS-019

**Alternate and failure flows**

- A1 (at M3) File over a limit or not a PDF: rejected naming the limit, nothing stored, no truncation. — SCR-CAN-04 — REQ-SYS-015
- A2 (at M3) Scanned or image-only PDF: rejected as unsupported (OCR is deferred). — SCR-CAN-04 — REQ-SYS-016
- A3 (at M5) Candidate leaves and returns: the current state of the same job is shown and a notification arrives when done. — SCR-CAN-05, SCR-CAN-17 — REQ-SYS-020, REQ-SYS-092
- A4 (at M5) Transient provider failure: the job takes the ST-01 retry path back to Queued once and the candidate sees "retrying" as a message on Queued, not as a fifth state. — SCR-CAN-05 — REQ-SYS-021
- A5 (at M5) Processing ends Failed (invalid file, no readable text, retry used): category and next step shown, attempt kept in the audit history. — SCR-CAN-05 — REQ-SYS-022
- A6 (at A5) Candidate replaces the upload: a new resume version, earlier versions unchanged. — SCR-CAN-04 — REQ-SYS-023
- A7 (at M1) Candidate declines CM-01: UC-CAN-01 A1 applies and the flow ends. — SCR-CAN-03 — REQ-SYS-012

**Acceptance** The four states match ST-01; the 2 s acceptance and the 60 s Ready targets are measured as in DEP-01; one retry at most.

### UC-CAN-03 — Review CV profile

**Pri** P0 · **Basis** Baseline "Review CV profile", part 2 · **Journeys** CJ-07, CJ-08, CJ-11
**Pre** A resume version is Ready. **Post** The profile is confirmed as ready to apply, or corrections are pending.

**Main flow**

- M1 Candidate opens the profile of a Ready resume version. — SCR-CAN-06 — REQ-SYS-024
- M2 System lists each item with its source quote and page, quotes in their original language and direction. — SCR-CAN-06 — REQ-SYS-024, REQ-SYS-026
- M3 System shows items not found or failing validation as unknown or validation failure. — SCR-CAN-06 — REQ-SYS-025
- M4 Candidate corrects an item through UC-CAN-04 where needed. — SCR-CAN-06, SCR-CAN-07 — REQ-SYS-027
- M5 Candidate confirms the reviewed profile as ready to apply. — SCR-CAN-06 — REQ-SYS-031

**Alternate and failure flows**

- A1 (at M1) Resume version not Ready: the candidate is sent to the status screen. — SCR-CAN-05 — REQ-SYS-019
- A2 (at M3) Many items unknown: the count is shown with advice to correct items or upload a better text PDF. — SCR-CAN-06 — REQ-SYS-025
- A3 (at M5) Unknown items remain: the candidate is told recruiters will see them as unknown and may still confirm. — SCR-CAN-06 — REQ-SYS-025, REQ-SYS-031
- A4 (at M1) CM-01 withdrawn: the view is limited to a consent message. — SCR-CAN-06, SCR-CAN-15 — REQ-SYS-010

**Acceptance** Every item on the screen has a quote and page, or an explicit unknown or validation-failure state; a test with a mixed Arabic and English CV shows correct direction (REQ-SYS-026).

### UC-CAN-04 — Correct extracted field

**Pri** P0 · **Basis** Part of baseline "Review CV profile"; resolves RD01-Y F-03 · **Journeys** CJ-09, CJ-10
**Pre** The candidate views a Ready profile. **Post** A new profile version exists; earlier versions and results are unchanged.

**Main flow**

- M1 Candidate chooses Edit, Remove or Add on an item. — SCR-CAN-07 — REQ-SYS-027
- M2 Candidate enters the value and may select the CV span that supports it. — SCR-CAN-07 — REQ-SYS-028, REQ-SYS-029
- M3 System saves a new profile version, labelled candidate-provided unless a validated span is attached. — SCR-CAN-07 — REQ-SYS-027, REQ-SYS-028
- M4 System confirms the save with time and version and shows the original value beside it. — SCR-CAN-07, SCR-CAN-06 — REQ-SYS-030

**Alternate and failure flows**

- A1 (at M2) Selected span fails source validation: the span is rejected with a message and the value stays candidate-provided. — SCR-CAN-07 — REQ-SYS-025, REQ-SYS-029
- A2 (at M3) Save fails or the connection is lost: "Not saved" is shown, input is kept, retry is offered. — SCR-CAN-07 — REQ-SYS-030
- A3 (at M1) Candidate restores the original extracted value: saved as a new version. — SCR-CAN-07 — REQ-SYS-027
- A4 (at M2) Mixed Arabic and English input: text direction is handled per passage. — SCR-CAN-07 — REQ-SYS-026, REQ-SYS-093
- A5 (at M2) Candidate cancels: no change. — SCR-CAN-07 — REQ-SYS-027

**Acceptance** A correction never alters an earlier version or result (REQ-SYS-027) and always shows its label (REQ-SYS-028); validity of a selected span is checked against the immutable resume version.

### UC-CAN-05 — Find and open a job

**Pri** P1 · **Basis** Supporting; assumption A-04 · **Journeys** CJ-01
**Pre** A job is published and open. **Post** An application is started and bound to one job version.

**Main flow**

- M1 Candidate opens a posting or invitation link. — SCR-CAN-02 — REQ-SYS-013
- M2 System asks the candidate to sign in or register and then returns to the job. — SCR-CAN-01 — REQ-SYS-001
- M3 System shows job title, description, language and requirements. — SCR-CAN-02 — REQ-SYS-013
- M4 Candidate starts an application; the system binds it to the current published job version. — SCR-CAN-02 — REQ-SYS-014

**Alternate and failure flows**

- A1 (at M1) Job closed or unpublished: a message is shown and no application is started. — SCR-CAN-02 — REQ-SYS-013
- A2 (at M2) Sign-in fails or the session expired: error shown, the candidate returns to the job after signing in. — SCR-CAN-01 — REQ-SYS-001
- A3 (at M4) Job revised after the page loaded: the new version is shown and confirmed before the start. — SCR-CAN-02 — REQ-SYS-014
- A4 (at M2) Link outside the user's scope: access denied without detail. — SCR-CAN-01 — REQ-SYS-004

**Acceptance** An application always references exactly one published job version (REQ-SYS-014).

### UC-CAN-06 — Submit application

**Pri** P0 · **Basis** Baseline "Submit application" · **Journeys** CJ-12, CJ-13
**Pre** A Ready, confirmed resume version exists and a job version is open. **Post** A submitted application exists and matching is queued.

**Main flow**

- M1 Candidate opens the application review for the job. — SCR-CAN-08 — REQ-SYS-038
- M2 System shows the confirmed resume version, the job version and what recruiters will see. — SCR-CAN-08 — REQ-SYS-038, REQ-SYS-041
- M3 Candidate submits. — SCR-CAN-08 — REQ-SYS-038
- M4 System records the submission with time, resume version and job version and confirms it. — SCR-CAN-08 — REQ-SYS-039
- M5 System starts matching for that job and resume version. — background — REQ-SYS-043

**Alternate and failure flows**

- A1 (at M1) Resume not Ready or not confirmed: submission is blocked with a link to the profile. — SCR-CAN-08, SCR-CAN-06 — REQ-SYS-031, REQ-SYS-038
- A2 (at M3) CM-01 not granted or withdrawn: UC-CAN-01 runs; without consent the submission stays blocked. — SCR-CAN-08, SCR-CAN-03 — REQ-SYS-007, REQ-SYS-038
- A3 (at M3) Job closed or a new job version published meanwhile: the candidate must confirm against the current version. — SCR-CAN-08 — REQ-SYS-014, REQ-SYS-036
- A4 (at M4) Submission fails: no partial application is created and retry is offered. — SCR-CAN-08 — REQ-SYS-039
- A5 (at M5) Matching fails later: the application stays submitted and the recruiter sees the failed state (UC-REC-02 A1). — background — REQ-SYS-044

**Acceptance** Submission is impossible without Ready, confirmed resume, open job version and granted CM-01 (REQ-SYS-038).

### UC-CAN-07 — Track application status

**Pri** P1 · **Basis** New; assumption A-09 · **Journeys** CJ-13, CJ-20
**Pre** At least one application exists. **Post** None (read-only, plus withdrawal).

**Main flow**

- M1 Candidate opens My applications. — SCR-CAN-09 — REQ-SYS-040
- M2 System lists each application with its candidate-visible status. — SCR-CAN-09 — REQ-SYS-040, REQ-SYS-041
- M3 Candidate opens an application to see its candidate-visible events and any invitation. — SCR-CAN-09 — REQ-SYS-040, REQ-SYS-057
- M4 Candidate follows an event from the notification list. — SCR-CAN-17 — REQ-SYS-092

**Alternate and failure flows**

- A1 (at M2) Matching pending or failed: the status stays "Submitted"; ranking and labels are never shown. — SCR-CAN-09 — REQ-SYS-041
- A2 (at M3) Candidate withdraws the application: status "Withdrawn" and the recruiter list is updated. — SCR-CAN-09, SCR-REC-06 — REQ-SYS-042
- A3 (at M2) Decision recorded: status "Decision recorded" without outcome or rationale. — SCR-CAN-09 — REQ-SYS-040
- A4 (at M2) No applications: an empty state with a link to open jobs. — SCR-CAN-09 — REQ-SYS-040

**Acceptance** No candidate-visible screen shows rankings, evidence labels or other applicants (REQ-SYS-041).

### UC-CAN-08 — Respond to interview invitation

**Pri** P0 · **Basis** New; resolves RD01-Y F-01 for the interview · **Journeys** CJ-14, CJ-15
**Pre** A recruiter invited the application (UC-REC-04). **Post** The invitation is Accepted or Declined and recorded.

**Main flow**

- M1 Candidate opens the interview invitation from a notification or from the application. — SCR-CAN-10 — REQ-SYS-057
- M2 System shows what the interview involves before any choice. — SCR-CAN-10 — REQ-SYS-058
- M3 Candidate chooses Accept; the system runs UC-CAN-01 for CM-02. — SCR-CAN-10, SCR-CAN-03 — REQ-SYS-005, REQ-SYS-059
- M4 System records the acceptance and tells the recruiter. — SCR-CAN-10, SCR-REC-10 — REQ-SYS-059
- M5 Candidate continues to the interview briefing. — SCR-CAN-11 — REQ-SYS-058

**Alternate and failure flows**

- A1 (at M3) Candidate declines the invitation or CM-02: the decline is recorded, the recruiter sees Declined, application and CV evidence stay intact. — SCR-CAN-10, SCR-REC-10 — REQ-SYS-012, REQ-SYS-059, REQ-SYS-060
- A2 (at M1) Recruiter cancelled the invitation: the candidate sees it is no longer available. — SCR-CAN-10 — REQ-SYS-054
- A3 (at M1) No response: the invitation stays open until the recruiter cancels it; there is no automatic expiry. — SCR-CAN-10, SCR-REC-10 — REQ-SYS-074
- A4 (at M5) CM-02 withdrawn before the start: the session is Closed and the briefing is unavailable. — SCR-CAN-11, SCR-CAN-15 — REQ-SYS-010

**Acceptance** A decline never alters the application or CV evidence (REQ-SYS-060); acceptance always stores CM-02 (REQ-SYS-059).

### UC-CAN-09 — Answer interview

**Pri** P0 · **Basis** Baseline "Answer interview"; resolves RD02-Y F-04 · **Journeys** CJ-16, CJ-17, CJ-18, CJ-19
**Pre** The invitation is Accepted and CM-02 is granted. **Post** Answers are submitted and versioned, or the session is Interrupted or Closed.

**Main flow**

- M1 Candidate reads the briefing: language, number of questions, edit rules, scoring and review. — SCR-CAN-11 — REQ-SYS-058
- M2 Candidate starts; the system presents the first question in the session's order and language. — SCR-CAN-12 — REQ-SYS-061
- M3 Candidate types an answer; drafts save automatically and the save state is visible. — SCR-CAN-12 — REQ-SYS-062, REQ-SYS-063, REQ-SYS-064, REQ-SYS-094
- M4 Candidate moves between questions and sees progress. — SCR-CAN-12 — REQ-SYS-067
- M5 Candidate reviews all answers and confirms the submission. — SCR-CAN-13 — REQ-SYS-067
- M6 System versions the submitted answers, confirms receipt, states that a fixed rubric scores them and the recruiter reviews them, and shows no score. — SCR-CAN-13 — REQ-SYS-069, REQ-SYS-070

**Alternate and failure flows**

- A1 (at M3) Connection lost: typed text is kept, "Not saved — offline" is shown, synchronization follows on reconnection. — SCR-CAN-12 — REQ-SYS-064, REQ-SYS-066
- A2 (at M3) Candidate leaves or the page closes: the session is Interrupted; on return the resume prompt restores draft and position. — SCR-CAN-14, SCR-CAN-12 — REQ-SYS-065
- A3 (at M5) Connection lost during final submission: repeating it creates no second submission and the candidate sees whether it was received. — SCR-CAN-13 — REQ-SYS-068
- A4 (at M3) Autosave keeps failing: "Not saved" with the reason stays visible and the candidate is warned before leaving. — SCR-CAN-12 — REQ-SYS-064
- A5 (at M3) Answer text contains instructions to the system: treated as data. — SCR-CAN-12 — REQ-SYS-071
- A6 (at M2) No equivalent question version in the candidate's language: the available version is shown and labelled. — SCR-CAN-12 — REQ-SYS-061
- A7 (at M3) Recruiter closes the session or CM-02 is withdrawn: the candidate is informed and cannot edit further. — SCR-CAN-12, SCR-CAN-15 — REQ-SYS-010, REQ-SYS-054

**Acceptance** A walkthrough with a forced disconnection shows the save indicator states, the restored draft and the single receipt (REQ-SYS-064, REQ-SYS-065, REQ-SYS-068).

### UC-CAN-10 — Manage my data and requests

**Pri** P1 · **Basis** New; resolves RD01-Y F-06; data-subject requests as named in the task brief · **Journeys** CJ-20
**Pre** The candidate is authenticated. **Post** A request exists with an identifier and status.

**Main flow**

- M1 Candidate opens My data. — SCR-CAN-16 — REQ-SYS-079
- M2 System lists held data: profile versions, CV files, applications, consents, interview answers and requests. — SCR-CAN-16 — REQ-SYS-079
- M3 Candidate creates a request of type export, correction, consent withdrawal or deletion. — SCR-CAN-16 — REQ-SYS-080
- M4 System shows the request identifier and status and routes it to each organization's Admin queue. — SCR-CAN-16 — REQ-SYS-080, REQ-SYS-081
- M5 Candidate is notified when the request is completed or rejected and sees the result or reason. — SCR-CAN-16, SCR-CAN-17 — REQ-SYS-082, REQ-SYS-092

**Alternate and failure flows**

- A1 (at M3) Correction of CV-derived items: the candidate is sent to UC-CAN-04. — SCR-CAN-16, SCR-CAN-07 — REQ-SYS-027
- A2 (at M4) Data held by several organizations: one request per organization, tracked together. — SCR-CAN-16 — REQ-SYS-081
- A3 (at M3) Deletion would remove data used in an active application: consequences are shown before confirmation. — SCR-CAN-16 — REQ-SYS-083
- A4 (at M5) Request rejected: the reason is shown. — SCR-CAN-16 — REQ-SYS-082
- A5 (at M4) Candidate cancels a pending request. — SCR-CAN-16 — REQ-SYS-080

**Acceptance** Every request type can be created and tracked to a final state; legal sufficiency is not claimed (A-15).

**Recruiter use cases**

### UC-REC-01 — Define job requirements

**Pri** P0 · **Basis** Baseline "Define job requirements"; resolves RD02-Y F-01 at definition time · **Journeys** RJ-01, RJ-02, RJ-03
**Pre** The recruiter is authenticated within an organization. **Post** A published, immutable job version exists.

**Main flow**

- M1 Recruiter creates a job. — SCR-REC-03, SCR-REC-04 — REQ-SYS-032
- M2 Recruiter enters title, description and language (Arabic or English). — SCR-REC-04 — REQ-SYS-032
- M3 Recruiter adds requirements as criterion text with a mandatory flag; the flag's effect is explained next to it. — SCR-REC-04 — REQ-SYS-033, REQ-SYS-034
- M4 System previews how an applicant with no evidence for a mandatory requirement will appear. — SCR-REC-04 — REQ-SYS-035
- M5 Recruiter publishes; the system creates an immutable job version. — SCR-REC-05 — REQ-SYS-036

**Alternate and failure flows**

- A1 (at M5) No requirement or an empty criterion: publication is blocked and the field is marked. — SCR-REC-04 — REQ-SYS-032, REQ-SYS-033
- A2 (at M3) A published job is edited: a new version is created on publication, earlier applications keep theirs and the number of affected applications is shown. — SCR-REC-04, SCR-REC-05 — REQ-SYS-036, REQ-SYS-037
- A3 (at M5) Recruiter closes the job: no new applications, existing ones unchanged. — SCR-REC-03 — REQ-SYS-037
- A4 (at M1) Recruiter discards an unpublished draft. — SCR-REC-04 — REQ-SYS-032
- A5 (at M1) Recruiter lacks the role or organization scope: access denied. — SCR-REC-01 — REQ-SYS-002, REQ-SYS-004
- A6 (at M1) Recruiter with several organizations selects the organization before any job is shown. — SCR-REC-01 — REQ-SYS-003

**Acceptance** The mandatory flag help and the no-evidence preview are present on SCR-REC-04 (REQ-SYS-034, REQ-SYS-035); an edit never changes an earlier job version (REQ-SYS-036).

### UC-REC-02 — Review ranked applicants

**Pri** P0 · **Basis** Baseline "Review matching evidence", list part; resolves RD02-Y F-01 and RD01-Y F-04 · **Journeys** RJ-04
**Pre** The job has submitted applications. **Post** None (read-only).

**Main flow**

- M1 Recruiter opens the applicant list of a job from the dashboard or the job list. — SCR-REC-02, SCR-REC-06 — REQ-SYS-045
- M2 System lists applicants in rank order from the saved snapshot with the ranking basis stated, never as a probability. — SCR-REC-06 — REQ-SYS-045, REQ-SYS-048
- M3 Each row shows requirement counts per evidence state and the mandatory requirements not assessed. — SCR-REC-06 — REQ-SYS-046
- M4 Recruiter sorts or filters, including "needs review". — SCR-REC-06 — REQ-SYS-047, REQ-SYS-094
- M5 Recruiter opens an application (UC-REC-03). — SCR-REC-06, SCR-REC-07 — REQ-SYS-053

**Alternate and failure flows**

- A1 (at M2) Snapshot pending or failed: the row shows that state and the applicant stays listed. — SCR-REC-06 — REQ-SYS-044
- A2 (at M2) Mandatory evidence unassessed: the applicant stays in the default list and appears under "needs review". — SCR-REC-06 — REQ-SYS-047
- A3 (at M2) The job has several versions: applicants are grouped by the version they targeted. — SCR-REC-06 — REQ-SYS-053
- A4 (at M2) Application or consent withdrawn: the row is marked and no results are shown. — SCR-REC-06 — REQ-SYS-011, REQ-SYS-042
- A5 (at M1) No applicants: an empty state. — SCR-REC-06 — REQ-SYS-045

**Acceptance** A test with an applicant lacking mandatory evidence shows the applicant in the default list, flagged, never excluded (REQ-SYS-047); cached ranking meets the 3 s target (REQ-SYS-045).

### UC-REC-03 — Review matching evidence

**Pri** P0 · **Basis** Baseline "Review matching evidence", detail part · **Journeys** RJ-05, RJ-06, RJ-07
**Pre** An application is open. **Post** Optional notes recorded.

**Main flow**

- M1 Recruiter opens an application's evidence. — SCR-REC-07 — REQ-SYS-053
- M2 For each requirement the screen shows one label, with source validity and semantic support as separate indicators. — SCR-REC-07 — REQ-SYS-049, REQ-SYS-050
- M3 Quote, page and surrounding text are shown, in their original language and direction. — SCR-REC-07 — REQ-SYS-051, REQ-SYS-093
- M4 Recruiter opens the original CV at the quoted span. — SCR-REC-08 — REQ-SYS-051
- M5 Recruiter may add a note or a "reviewer disagrees" mark; the stored output is unchanged. — SCR-REC-07 — REQ-SYS-052
- M6 Recruiter returns to the list, invites (UC-REC-04) or decides (UC-REC-06). — SCR-REC-07 — REQ-SYS-054, REQ-SYS-076

**Alternate and failure flows**

- A1 (at M2) Source validation failed: shown as validation failure or unknown, never as Supported. — SCR-REC-07 — REQ-SYS-025, REQ-SYS-050
- A2 (at M2) Insufficient evidence: rendered neutrally with the reason where known, not by colour alone. — SCR-REC-07 — REQ-SYS-049
- A3 (at M2) Candidate-provided value: marked as such, with no quote. — SCR-REC-07 — REQ-SYS-028
- A4 (at M4) Original CV removed or unreadable: a "source removed" notice and the quote text only. — SCR-REC-08 — REQ-SYS-083
- A5 (at M1) Results belong to an older job version: the version is shown and nothing is recomputed silently. — SCR-REC-07 — REQ-SYS-053

**Acceptance** The four labels and their definitions match Plan §2 on every screen state (REQ-SYS-049); no state shows Supported when validation failed (REQ-SYS-050).

### UC-REC-04 — Select candidates for interview

**Pri** P0 · **Basis** New; resolves RD01-Y F-02 and F-07 (provisional) · **Journeys** RJ-08, RJ-09, RJ-10
**Pre** Submitted applications exist and an approved interview template exists. **Post** Invitations exist with fixed question and rubric versions, or the recruiter proceeds to a decision.

**Main flow**

- M1 Recruiter chooses Invite for one or several applicants from the list or the evidence review. — SCR-REC-09 — REQ-SYS-054
- M2 Recruiter chooses one approved interview template (question set and rubric version). — SCR-REC-09 — REQ-SYS-055
- M3 Recruiter confirms; the system fixes question versions, order and rubric version for each session. — SCR-REC-09 — REQ-SYS-055
- M4 System notifies each candidate and shows the invitation in the application status. — SCR-REC-10, SCR-CAN-09 — REQ-SYS-057

**Alternate and failure flows**

- A1 (at M1) No interview needed: the recruiter proceeds to the decision (ACT-01 [no]). — SCR-REC-09, SCR-REC-12 — REQ-SYS-056
- A2 (at M2) No approved template for the role: the invitation is blocked with a message. — SCR-REC-09 — REQ-SYS-055
- A3 (at M1) Application or consent withdrawn: the invitation is blocked. — SCR-REC-09 — REQ-SYS-011, REQ-SYS-042
- A4 (after M4) Recruiter cancels an unstarted invitation: the candidate is informed. — SCR-REC-10 — REQ-SYS-054
- A5 (at M3) A batch partly fails: the outcome is shown per applicant. — SCR-REC-09 — REQ-SYS-054

**Acceptance** A session cannot start without a fixed template (REQ-SYS-055); the "no interview" branch reaches the decision screen (REQ-SYS-056).

### UC-REC-05 — Review interview results

**Pri** P0 · **Basis** New; resolves RD01-Y F-02 · **Journeys** RJ-11, RJ-12
**Pre** An interview session is Submitted. **Post** Agreement, override or notes recorded per question.

**Main flow**

- M1 Recruiter opens the interview tracker, reached from the dashboard, and sees the status per applicant. — SCR-REC-02, SCR-REC-10 — REQ-SYS-074
- M2 Recruiter opens a submitted interview. — SCR-REC-11 — REQ-SYS-072
- M3 Per question the screen shows the question, submitted answer, rubric version, proposed whole-level score with its description and the quoted part. — SCR-REC-11 — REQ-SYS-072
- M4 Recruiter records agreement, an override score or a note per question. — SCR-REC-11 — REQ-SYS-073
- M5 Recruiter views results next to the CV evidence summary and proceeds to the decision. — SCR-REC-11, SCR-REC-12 — REQ-SYS-072, REQ-SYS-075

**Alternate and failure flows**

- A1 (at M2) Session not submitted (Invited, In progress, Interrupted): status only, no scores. — SCR-REC-10 — REQ-SYS-074
- A2 (at M3) Assessment unavailable: "not assessed" is shown and the recruiter reads answers without scores. — SCR-REC-11 — REQ-SYS-072
- A3 (at M1) Candidate declined or consent withdrawn: Declined or Closed is shown with no content. — SCR-REC-10 — REQ-SYS-011, REQ-SYS-074
- A4 (at M4) Recruiter disagrees: the override is stored separately and the original assessment is unchanged. — SCR-REC-11 — REQ-SYS-073
- A5 (at M5) Scores appear only as supporting assessments, never as a hiring recommendation. — SCR-REC-11 — REQ-SYS-075

**Acceptance** Every score shown has a rubric version, description and quoted part (REQ-SYS-072); overrides never modify the stored assessment (REQ-SYS-073).

### UC-REC-06 — Record hiring decision

**Pri** P0 · **Basis** Baseline "Record hiring decision" · **Journeys** RJ-13, RJ-14
**Pre** The application is open to the recruiter. **Post** A decision with its version references is stored.

**Main flow**

- M1 Recruiter opens the decision screen for an application. — SCR-REC-12 — REQ-SYS-076
- M2 System shows the evidence and interview summary with the versions they rest on. — SCR-REC-12 — REQ-SYS-077
- M3 Recruiter selects Hire, Not hire or On hold and may add a rationale. — SCR-REC-12 — REQ-SYS-076
- M4 Recruiter confirms; the system stores the decision with resume, job, snapshot and any interview and rubric versions. — SCR-REC-12 — REQ-SYS-077
- M5 System sets the candidate-visible status "Decision recorded" and adds the event to the timeline. — SCR-REC-13, SCR-CAN-09 — REQ-SYS-040, REQ-SYS-077

**Alternate and failure flows**

- A1 (at M1) No interview held: the decision rests on CV evidence only. — SCR-REC-12 — REQ-SYS-056
- A2 (at M3) An earlier decision exists: a new decision is recorded and the earlier one stays in the history. — SCR-REC-12, SCR-REC-13 — REQ-SYS-077
- A3 (at M4) Save fails: no duplicate decision is created and retry is offered. — SCR-REC-12 — REQ-SYS-077
- A4 (at M1) A model output proposes an outcome: it is never recorded automatically. — SCR-REC-12 — REQ-SYS-078
- A5 (at M2) Consent withdrawn: results are hidden and the decision rests on stored references. — SCR-REC-12 — REQ-SYS-011

**Acceptance** Only a recruiter can create a decision (REQ-SYS-078); every decision lists the versions it relied on (REQ-SYS-077).

**Admin use cases**

### UC-ADM-01 — Manage organization membership and roles

**Pri** P0 · **Basis** Baseline "Manage access / retention", part 1 · **Journeys** AD-01
**Pre** The Admin is authenticated within an organization. **Post** Membership and roles reflect the Admin's changes.

**Main flow**

- M1 Admin opens Members and roles. — SCR-ADM-02 — REQ-SYS-087
- M2 Admin invites a user with a role, Recruiter or Admin. — SCR-ADM-03 — REQ-SYS-087
- M3 Invitee accepts and gains access scoped to the organization. — SCR-ADM-02 — REQ-SYS-087, REQ-SYS-002
- M4 Admin changes a role or deactivates or removes a member; the effect is immediate. — SCR-ADM-02, SCR-ADM-03 — REQ-SYS-088
- M5 System records each action in the audit history. — SCR-ADM-06 — REQ-SYS-088, REQ-SYS-090

**Alternate and failure flows**

- A1 (at M2) Invalid email or expired invitation: an error is shown and resend is offered. — SCR-ADM-03 — REQ-SYS-087
- A2 (at M4) Removing or demoting the last Admin: blocked. — SCR-ADM-02 — REQ-SYS-089
- A3 (at M4) A removed member's open sessions end at once. — SCR-ADM-02 — REQ-SYS-088, REQ-SYS-001
- A4 (at M1) An Admin with several organizations selects the organization first. — SCR-ADM-01 — REQ-SYS-003
- A5 (at M1) Admin views show no candidate evidence or interview content. — SCR-ADM-02 — REQ-SYS-091

**Acceptance** Role actions follow the access-control matrix of RD03-M; a removed member loses access immediately (REQ-SYS-088).

### UC-ADM-02 — Manage retention and deletion

**Pri** P0 · **Basis** Baseline "Manage access / retention", part 2 · **Journeys** AD-02
**Pre** The Admin is authenticated. **Post** Retention periods are set and deletions run on schedule.

**Main flow**

- M1 Admin opens Retention settings. — SCR-ADM-04 — REQ-SYS-085
- M2 Admin sets a retention period for each data class. — SCR-ADM-04 — REQ-SYS-085
- M3 System deletes data whose period has expired and invalidates affected caches and derived inputs. — SCR-ADM-04 — REQ-SYS-084, REQ-SYS-086
- M4 Admin sees scheduled and completed deletions with their outcomes. — SCR-ADM-04 — REQ-SYS-086

**Alternate and failure flows**

- A1 (at M3) A deletion step fails: the job shows as failed with the remaining data and a retry. — SCR-ADM-04 — REQ-SYS-086
- A2 (at M2) Period shortened: confirmation with the number of affected items. — SCR-ADM-04 — REQ-SYS-085
- A3 (at M3) A deleted source is referenced in reports: the removal record is shown without private text. — SCR-ADM-06 — REQ-SYS-083
- A4 (at M2) A period would delete data of an active application: a warning is shown before confirmation. — SCR-ADM-04 — REQ-SYS-085

**Acceptance** Deletion covers files, extracted text, vectors and caches (REQ-SYS-083, REQ-SYS-084); failures are visible (REQ-SYS-086).

### UC-ADM-03 — Process candidate data requests

**Pri** P1 · **Basis** New; resolves RD01-Y F-06 (provisional A-12) · **Journeys** AD-03
**Pre** A candidate request exists for the organization. **Post** The request is completed, rejected or cancelled.

**Main flow**

- M1 Admin opens the request queue. — SCR-ADM-05 — REQ-SYS-081
- M2 Admin opens a request and verifies the requester. — SCR-ADM-05 — REQ-SYS-082
- M3 Admin executes the request: export, correction note, consent withdrawal or deletion. — SCR-ADM-05 — REQ-SYS-082, REQ-SYS-083
- M4 System applies deletion over files, extracted text, vectors and caches and keeps a removal record. — SCR-ADM-05, SCR-ADM-04 — REQ-SYS-083, REQ-SYS-084
- M5 Admin completes the request and the candidate is notified. — SCR-ADM-05 — REQ-SYS-082, REQ-SYS-092

**Alternate and failure flows**

- A1 (at M2) The request cannot be verified or is out of scope: rejected with a reason. — SCR-ADM-05 — REQ-SYS-082
- A2 (at M3) Data of another organization: only this organization's data is processed. — SCR-ADM-05 — REQ-SYS-002, REQ-SYS-081
- A3 (at M4) Deletion partly fails: the request stays open with the failure shown. — SCR-ADM-05 — REQ-SYS-083
- A4 (at M1) Candidate cancels before processing: the request is closed. — SCR-ADM-05 — REQ-SYS-080

**Acceptance** Every request type reaches a final state with a recorded reason or result (REQ-SYS-082).

### UC-ADM-04 — Review audit and processing history

**Pri** P2 · **Basis** Supporting; ACT-01 states that previous attempts remain in the audit history · **Journeys** none (new supporting use case)
**Pre** The Admin is authenticated. **Post** None (read-only).

**Main flow**

- M1 Admin opens the history. — SCR-ADM-06 — REQ-SYS-090
- M2 Admin filters by processing attempts, consent changes, data requests or decisions. — SCR-ADM-06 — REQ-SYS-090
- M3 Admin opens an entry and sees metadata only. — SCR-ADM-06 — REQ-SYS-091

**Alternate and failure flows**

- A1 (at M3) The entry refers to deleted data: only the removal record is shown. — SCR-ADM-06 — REQ-SYS-083
- A2 (at M2) No entries: an empty state. — SCR-ADM-06 — REQ-SYS-090
- A3 (at M1) A failed processing attempt: attempts and retries are listed as defined in ST-01. — SCR-ADM-06 — REQ-SYS-022

**Acceptance** Previous processing attempts remain visible after a retry (REQ-SYS-022).

---

## 7. Prioritized screen inventory

The inventory lists 36 logical screens: 17 for the Candidate, 13 for the Recruiter and 6 for the Admin; 28 are P0, 7 are P1 and 1 is P2 [A-44]. A screen is a purpose with content and critical states, not a wireframe, a route or a component [A-45]; RD04-Y turns the list into wireframes, P0 first [Plan App. A, RD04-Y]. The flow columns are computed from section 6 ("CAN-02 M1 M3" means that flows M1 and M3 of UC-CAN-02 use the screen); the REQ-SYS column gives requirement numbers without the prefix.

**Rules for every screen.** Arabic and English with a language choice, quotes kept in their original direction (REQ-SYS-026, REQ-SYS-093; WCAG 3.1.2); keyboard operation (REQ-SYS-094); defined loading, empty, error and access-denied states (REQ-SYS-004); no meaning by color alone (REQ-SYS-049; WCAG 1.4.1); no rankings, evidence labels or other applicants on candidate screens (REQ-SYS-041) and no candidate evidence on Admin screens (REQ-SYS-091); results name the job, resume and rubric versions they rest on (REQ-SYS-053, REQ-SYS-077).

| ID | Screen | Pri | Purpose and critical states | Main flows | Alternate and failure flows | REQ-SYS |
|---|---|---|---|---|---|---|
| SCR-CAN-01 | Candidate sign-in and registration | P0 | Authenticate and start a candidate session (precondition of UC-01). States: error, locked, language choice | CAN-05 M2 | CAN-05 A2 A4 | 001, 004 |
| SCR-CAN-02 | Job details and application start | P0 | Show job title, language, description and requirements; start an application bound to one job version. States: job closed, job revised | CAN-05 M1 M3 M4 | CAN-05 A1 A3 | 013, 014 |
| SCR-CAN-03 | Consent notice and module choice | P0 | Show the CM-01 or CM-02 notice in the preferred language; grant or decline. States: declined outcome, storage error, notice version changed | CAN-01 M1 M2 M3 M4; CAN-02 M1; CAN-08 M3 | CAN-01 A1 A2 A3; CAN-02 A7; CAN-06 A2 | 005–008, 012, 038, 059 |
| SCR-CAN-04 | CV upload | P0 | Choose a text PDF; show limit checks and rejection reasons. States: oversized, unsupported, scanned, replace upload | CAN-02 M1 M2 M3 | CAN-02 A1 A2 A6 | 007, 015, 016, 023 |
| SCR-CAN-05 | Processing status | P0 | Show Queued, Processing, Ready and Failed with messages, retry and next steps; leave and return. States: retrying, failed by category | CAN-02 M4 M5 M6 | CAN-02 A3 A4 A5; CAN-03 A1 | 017–022, 092 |
| SCR-CAN-06 | CV profile review | P0 | List extracted items with quote and page; show unknown and validation-failure items; confirm the reviewed profile. States: many unknown, mixed Arabic/English, consent withdrawn | CAN-03 M1 M2 M3 M4 M5; CAN-04 M4 | CAN-03 A2 A3 A4; CAN-06 A1 | 010, 024–027, 030, 031, 038 |
| SCR-CAN-07 | Profile item editor | P0 | Edit, remove or add an item, optionally select a source span, restore the original value; confirm saves. States: not saved, span rejected, candidate-provided label | CAN-03 M4; CAN-04 M1 M2 M3 M4 | CAN-04 A1 A2 A3 A4 A5; CAN-10 A1 | 025–030, 093 |
| SCR-CAN-08 | Application review and submit | P0 | Choose the confirmed resume version, review what will be shared, submit and confirm. States: blocked (not Ready, no consent), job version changed, submit error | CAN-06 M1 M2 M3 M4 | CAN-06 A1 A2 A3 A4 | 007, 014, 031, 036, 038, 039, 041 |
| SCR-CAN-09 | My applications and status | P1 | List applications with candidate-visible status, interview invitations and withdrawal. States: empty, withdrawn, decision recorded | CAN-07 M1 M2 M3; REC-04 M4; REC-06 M5 | CAN-07 A1 A2 A3 A4 | 040–042, 057, 077 |
| SCR-CAN-10 | Interview invitation and consent | P0 | Show the invitation and its disclosure; accept with CM-02 or decline. States: cancelled invitation, declined | CAN-08 M1 M2 M3 M4 | CAN-08 A1 A2 A3 | 005, 012, 054, 057–060, 074 |
| SCR-CAN-11 | Interview briefing | P0 | Explain language, number of questions, edit rules, scoring and review before the start. States: ready, session closed | CAN-08 M5; CAN-09 M1 | CAN-08 A4 | 010, 058 |
| SCR-CAN-12 | Interview session | P0 | Show one question, the answer editor, progress and the save indicator. States: Saving, Saved at time, Not saved with reason, offline, language fallback | CAN-09 M2 M3 M4 | CAN-09 A1 A2 A4 A5 A6 A7 | 010, 054, 061–067, 071, 094 |
| SCR-CAN-13 | Interview answer review and submit | P0 | Review all answers, confirm submission, show receipt without score. States: received, not received, already submitted | CAN-09 M5 M6 | CAN-09 A3 | 067–070 |
| SCR-CAN-14 | Interview resume prompt | P0 | Offer to resume an interrupted session at the saved draft and position. States: session closed, draft restored | – | CAN-09 A2 | 065 |
| SCR-CAN-15 | Privacy and consent settings | P0 | Show consent state and history per module; withdraw with a stated effect. States: confirm withdrawal, withdrawal applied | CAN-01 W1 W2 W3 W4 W5 | CAN-01 A4 A5; CAN-03 A4; CAN-08 A4; CAN-09 A7 | 008–011, 054, 074 |
| SCR-CAN-16 | My data and requests | P1 | View held data; create and track export, correction, withdrawal and deletion requests. States: pending, rejected with reason, completed | CAN-10 M1 M2 M3 M4 M5 | CAN-10 A1 A2 A3 A4 A5 | 027, 079–083, 092 |
| SCR-CAN-17 | Notifications | P1 | List events that need action with links. States: empty, read, unread | CAN-07 M4; CAN-10 M5 | CAN-02 A3 | 020, 082, 092 |
| SCR-REC-01 | Recruiter sign-in and organization selection | P0 | Authenticate and select the organization scope. States: several memberships, access denied | – | REC-01 A5 A6 | 002–004 |
| SCR-REC-02 | Recruiter dashboard | P1 | Show jobs, applications needing review and interviews awaiting review. States: empty | REC-02 M1; REC-05 M1 | – | 045, 074 |
| SCR-REC-03 | Job list and version history | P0 | List jobs with versions, application counts and status; close a job. States: closed, revised | REC-01 M1 | REC-01 A3 | 032, 037 |
| SCR-REC-04 | Job editor | P0 | Edit title, description, language and requirements with the mandatory flag explanation and the no-evidence preview. States: validation error, edited after publication | REC-01 M1 M2 M3 M4 | REC-01 A1 A2 A4 | 032–037 |
| SCR-REC-05 | Job publish review | P0 | Review the job and its version before publishing; show the effect on existing applications. States: new version created | REC-01 M5 | REC-01 A2 | 036, 037 |
| SCR-REC-06 | Ranked applicant list | P0 | List applicants with ranking basis, row summaries, needs-review filter, sort and filter. States: pending or failed matching, consent withdrawn, empty | CAN-01 W5; REC-02 M1 M2 M3 M4 M5 | CAN-01 A6; CAN-07 A2; REC-02 A1 A2 A3 A4 A5 | 011, 042, 044–048, 053, 094 |
| SCR-REC-07 | Application evidence review | P0 | Show per requirement the label, validity, quote, page and context, candidate-provided marks, notes. States: validation failure, Insufficient evidence with reason, older job version | REC-02 M5; REC-03 M1 M2 M3 M5 M6 | CAN-01 A6; REC-03 A1 A2 A3 A5 | 011, 025, 028, 049–054, 076, 093 |
| SCR-REC-08 | CV source viewer | P0 | Open the original CV at the quoted span. States: source removed, unreadable text | REC-03 M4 | REC-03 A4 | 051, 083 |
| SCR-REC-09 | Interview invitation | P0 | Choose applicants and an approved template; confirm; record that no interview is needed. States: no template, blocked by withdrawal | REC-04 M1 M2 M3 | REC-04 A1 A2 A3 A5 | 011, 042, 054–056 |
| SCR-REC-10 | Interview tracker | P1 | Show the interview status per applicant. States: Interrupted, Declined, Closed | CAN-08 M4; REC-04 M4; REC-05 M1 | CAN-01 A5; CAN-08 A1 A3; REC-04 A4; REC-05 A1 A3 | 010–012, 054, 057, 059, 060, 074 |
| SCR-REC-11 | Interview result review | P0 | Show answers, proposed scores with rubric descriptions and quotes; record agreement, override or note. States: not submitted, not assessed, closed | REC-05 M2 M3 M4 M5 | REC-05 A2 A4 A5 | 072, 073, 075 |
| SCR-REC-12 | Hiring decision | P0 | Show the evidence and interview summary with versions; record the outcome and rationale. States: save error, previous decisions | REC-05 M5; REC-06 M1 M2 M3 M4 | REC-04 A1; REC-06 A1 A2 A3 A4 A5 | 011, 056, 072, 075–078 |
| SCR-REC-13 | Application timeline | P1 | Show events and decisions of one application. States: removed source | REC-06 M5 | REC-06 A2 | 040, 077 |
| SCR-ADM-01 | Admin sign-in and organization selection | P0 | Authenticate and select the organization scope. States: several memberships, access denied | – | ADM-01 A4 | 003 |
| SCR-ADM-02 | Members and roles | P0 | List members with role and state; invite, change role, deactivate or remove. States: last Admin blocked, invitation expired | ADM-01 M1 M3 M4 | ADM-01 A2 A3 A5 | 001, 002, 087–089, 091 |
| SCR-ADM-03 | Invite or edit member | P0 | Enter an email and a role; confirm a change with its effect. States: invalid email, role change confirmation | ADM-01 M2 M4 | ADM-01 A1 | 087, 088 |
| SCR-ADM-04 | Retention settings and deletion jobs | P0 | Set retention per data class; list scheduled and completed deletions. States: failed deletion, shortened period confirmation | ADM-02 M1 M2 M3 M4; ADM-03 M4 | ADM-02 A1 A2 A4 | 083–086 |
| SCR-ADM-05 | Data request queue and detail | P1 | List requests; verify, process, complete or reject with a reason; provide an export. States: partial failure, rejected, cancelled | ADM-03 M1 M2 M3 M4 M5 | ADM-03 A1 A2 A3 A4 | 002, 080–084, 092 |
| SCR-ADM-06 | Audit and processing history | P2 | Filter processing attempts, consent changes, requests and decisions; metadata only. States: removed source, empty | ADM-01 M5; ADM-04 M1 M2 M3 | ADM-02 A3; ADM-04 A1 A2 A3 | 022, 083, 088, 090, 091 |

---

## 8. Functional requirements (provisional REQ-SYS IDs)

The 94 requirements are the functional requirements behind the flows of section 6. Their IDs are proposals and follow no existing SRS numbering [A-28]. Plan §2, p.3 says that SRS IDs link each action to its screen, component, data record and future test; this document supplies the screen (sections 6 and 7) and the verification method, and components and data records follow when RD03-M, RD04-M and RD05-M adopt or map the IDs [Plan App. A]. Every row reads "The system shall…". **Pri** is the priority of A-44; **Ver** is T test, I inspection, D demonstration, A analysis. Numeric targets repeat the DEP-01 design bounds (100 CVs, five concurrent users, documented hardware) as targets for later validation, not performance claims [DEP-01, p.18].

| ID | The system shall… | Pri, Ver | Source |
|---|---|---|---|
| | **Access and organization scope** | | |
| REQ-SYS-001 | authenticate every user before any use case is available and bind each session to one role. | P0 T | UC-01 caption, p.13 |
| REQ-SYS-002 | check role permission and organization scope on every operation, including reads of files, results and vectors. | P0 T | Plan §3, p.4 |
| REQ-SYS-003 | offer an organization selector to a user with several memberships and scope all data to the selected organization. | P1 T | Plan §3, p.4; A-47 |
| REQ-SYS-004 | reject an operation outside the user's role or organization without revealing data of other organizations. | P0 T | Plan §3, p.4 |
| | **Consent** | | |
| REQ-SYS-005 | present consent as separate modules, CM-01 (CV analysis and matching) and CM-02 (text interview and AI-assisted assessment), each granted or declined on its own. | P0 T | RD02-Y F-03; Plan §2, p.3; A-31 |
| REQ-SYS-006 | show each consent notice in the candidate's preferred language and state what is processed, that results are shown with source quotes, that recruiters decide, and that files, extracted text, vectors and caches can be deleted. | P0 I | RD01-Y CJ-02; Plan §1, §3 |
| REQ-SYS-007 | process a CV, run matching or start an interview only while the corresponding consent module is granted. | P0 T | SEQ-01 "upload CV + consent"; RD01-H |
| REQ-SYS-008 | store each consent decision with module, notice version, language, candidate, organization, time and status, and show the candidate the current state and history per module. | P0 T | A-31 |
| REQ-SYS-009 | let the candidate withdraw a granted module at any time from the privacy settings and stop new processing for that module immediately. | P0 T | RD02-Y F-03; A-32 |
| REQ-SYS-010 | cancel queued or running jobs of the module on withdrawal, close any open CM-02 session, and tell the candidate what happens to existing data and how to request deletion. | P0 T | A-32 |
| REQ-SYS-011 | hide a module's results from recruiter views and mark the application "consent withdrawn" after the module is withdrawn. | P0 T | A-32 |
| REQ-SYS-012 | record a candidate's decline of a module and state what the candidate cannot do as a result, without blocking account access or the other module. | P0 T | RD01-Y F-01; OD-01 |
| | **Job start and version binding** | | |
| REQ-SYS-013 | show a published, open job's title, description, language and requirements before an application is started, and offer a job by posting or invitation link only while it is published and open. | P0 D | Plan §3, p.4; A-04 |
| REQ-SYS-014 | bind each new application to exactly one published job version when the application is started. | P0 T | Plan §3, p.4 |
| | **CV upload and processing** | | |
| REQ-SYS-015 | accept only text PDFs of at most 5 MB, 5 pages and 20,000 extracted characters, and reject other input with a message naming the limit, never truncating silently. | P0 T | DEP-01, p.18; A-51 |
| REQ-SYS-016 | reject scanned or image-only PDFs as unsupported in the core release. | P0 T | Plan §1, p.2; DEP-01 |
| REQ-SYS-017 | store each upload as an immutable resume version before analysis starts. | P0 T | SEQ-01; CL-01A ResumeVersion |
| REQ-SYS-018 | return a job identifier when an upload is accepted and report job status within 2 s after the file bytes arrive. | P0 T | SEQ-01; DEP-01 |
| REQ-SYS-019 | show the candidate exactly the processing states Queued, Processing, Ready and Failed, each with its own message, and target Ready within 60 s for 95% of accepted CVs. | P0 T | ST-01; DEP-01; RD02-Y F-02 |
| REQ-SYS-020 | let the candidate leave the status screen and later see the current state of the same job. | P0 T | SEQ-01; RD02-Y F-02 |
| REQ-SYS-021 | retry at most once after a transient provider failure, show the candidate a "retrying" message on the Queued state (not a fifth state), and never retry invalid files. | P0 T | ST-01; DEP-01 |
| REQ-SYS-022 | show the failure category (unsupported or oversized file, no readable text, temporary service problem) and the next step when processing ends in Failed, and keep earlier attempts in the audit history. | P0 T | ST-01; RD02-Y F-02 |
| REQ-SYS-023 | let the candidate replace a failed or unwanted upload with a new file as a new resume version, leaving earlier versions unchanged. | P0 T | Plan §3, p.4 |
| | **Profile review and correction** | | |
| REQ-SYS-024 | show each extracted item (at least skills and experience) with its source quote and page. | P0 T | CL-01A EvidenceSpan; Plan §2 |
| REQ-SYS-025 | show an explicit unknown or validation-failure state for an item that was not found or whose quote failed source validation, and never present it as a positive result. | P0 T | Plan §2, p.3 |
| REQ-SYS-026 | display quotes in their original language and text direction, including mixed Arabic and English text. | P0 T | Plan p.1; A-24 |
| REQ-SYS-027 | let the candidate edit, remove or add an item, save every change as a new profile version leaving earlier versions and results unchanged, and let the candidate restore the original extracted value. | P0 T | Plan §3, p.4 |
| REQ-SYS-028 | label a candidate-typed value "candidate-provided" in candidate and recruiter views and attach no source quote to it unless the candidate selects a span of the CV. | P0 T | RD01-Y A-08, F-03; A-38 |
| REQ-SYS-029 | let the candidate select a span of the CV text as the source of an item and validate it as a new evidence span on the same resume version. | P1 T | CL-01A EvidenceSpan.validateQuote |
| REQ-SYS-030 | confirm each saved correction at once with the time and the new profile version. | P0 T | RD02-Y F-04 (pattern) |
| REQ-SYS-031 | require the candidate to confirm the reviewed profile before an application can be submitted. | P0 T | ACT-01 "Submit reviewed application" |
| | **Job definition** | | |
| REQ-SYS-032 | let a recruiter create a job with title, description, language (Arabic or English) and at least one requirement. | P0 T | CL-01A JobVersion |
| REQ-SYS-033 | store each requirement as criterion text with a mandatory flag. | P0 T | CL-01A Requirement |
| REQ-SYS-034 | explain next to the mandatory flag that missing evidence is shown as not assessed and never rejects an applicant automatically. | P0 I | CL-01A note; RD02-Y F-01 |
| REQ-SYS-035 | preview, before publication, how an applicant with no evidence for a mandatory requirement will appear in the applicant list and the evidence screen. | P1 D | RD02-Y F-01 |
| REQ-SYS-036 | publish a job as an immutable job version, create a new version for every later edit, and keep earlier applications linked to the version they targeted. | P0 T | Plan §3; CL-01A JobVersion.publish |
| REQ-SYS-037 | let a recruiter close a job to new applications without altering existing applications, and show a job's version history with application counts per version. | P1 T | Plan §3, p.4 |
| | **Application and status** | | |
| REQ-SYS-038 | allow submission only for a Ready, candidate-confirmed resume version, a published job version and a granted CM-01. | P0 T | Plan §3; ACT-01; REQ-SYS-007 |
| REQ-SYS-039 | record each submission with time, resume version and job version and confirm it to the candidate. | P0 T | CL-01A Application.submit() |
| REQ-SYS-040 | show candidates their applications with the status values of the state vocabulary, including "Decision recorded" without outcome or rationale. | P1 T | A-09; A-11; OD-05 |
| REQ-SYS-041 | show candidates no rankings, evidence labels or other applicants' data. | P0 T | A-09 |
| REQ-SYS-042 | let a candidate withdraw an application and show it as withdrawn in the recruiter's applicant list. | P1 T | A-12 |
| | **Matching, ranking and evidence review** | | |
| REQ-SYS-043 | run matching for the application's job version and resume version after submission and save the result as an immutable snapshot. | P0 T | CL-01A MatchSnapshot; A-35 |
| REQ-SYS-044 | show an explicit pending or failed state for an application whose snapshot is not available, and never omit the application. | P0 T | RD01-Y F-04; A-13 |
| REQ-SYS-045 | list applicants in ranked order read from the saved snapshot, state the ranking basis on the list, and serve cached ranking within 3 s for 95% of requests. | P0 T | Plan §2, p.3; DEP-01; A-36 |
| REQ-SYS-046 | show on each list row the count of requirements per evidence state and the mandatory requirements not assessed. | P0 T | RD02-Y F-01 |
| REQ-SYS-047 | keep applicants with unassessed mandatory requirements in the default list, offer a "needs review" filter, let the recruiter sort and filter without changing the saved snapshot, and never exclude or auto-reject an applicant. | P0 T | CL-01A note; RD02-Y F-01; A-36 |
| REQ-SYS-048 | never present the ranking as a hiring probability or as a single unexplained score. | P0 I | Plan §1, p.2 |
| REQ-SYS-049 | show per requirement one label of Supported, Unsupported, Contradicted or Insufficient evidence with the Plan's definitions, never rely on color alone to tell the states apart, and render Insufficient evidence neutrally with its reason where known. | P0 T | Plan §2, p.3; WCAG 1.4.1 |
| REQ-SYS-050 | show source validity and semantic support as separate indicators and never show Supported when source validation failed. | P0 T | Plan §2; CL-01A note |
| REQ-SYS-051 | show with each result the quote, page and surrounding text, and open the original CV at that location. | P0 T | CL-01A EvidenceSpan |
| REQ-SYS-052 | let a recruiter add a note or a "reviewer disagrees" mark to a result without altering the stored model output. | P1 T | A-37 |
| REQ-SYS-053 | show each application's results against the job version it targeted and never recompute them silently after a job revision. | P0 T | Plan §3, p.4 |
| | **Interview selection and invitation** | | |
| REQ-SYS-054 | let a recruiter invite one or several submitted applications of their organization's job to a text interview and cancel an invitation that has not been started. | P0 T | CL-01B requestInterview(); ACT-01 "Invite?" |
| REQ-SYS-055 | require one approved interview template (question set and rubric version) per invitation, and fix question versions, their order and the rubric version for the session. | P0 T | CL-01B; A-34 |
| REQ-SYS-056 | let a recruiter record that no interview is needed and continue to a decision. | P0 T | ACT-01 [no] branch |
| REQ-SYS-057 | notify the candidate of an invitation and show it in the application status. | P0 T | A-09 |
| REQ-SYS-058 | show the candidate, before acceptance, what the interview involves: text only, language, number of questions, whether answers can change before submission, how answers are scored and reviewed, who sees them and how long they are kept. | P0 I | RD01-Y CJ-15, QC-F2; Plan §1 |
| REQ-SYS-059 | record acceptance (with CM-02 granted) or decline of an invitation and tell the recruiter the outcome without a reason unless the candidate gives one. | P0 T | RD01-Y F-01 |
| REQ-SYS-060 | leave the application and its CV evidence intact when an invitation is declined. | P0 T | RD01-Y F-01 |
| | **Interview session** | | |
| REQ-SYS-061 | present questions in the session's fixed order and question versions, in the candidate's language where an equivalent exists. | P0 T | CL-01B; A-10 |
| REQ-SYS-062 | keep one current answer per session question and store drafts separately from the submitted answer. | P0 T | CL-01B notes |
| REQ-SYS-063 | save drafts automatically while the candidate types and on leaving a question, with no manual save needed. | P0 T | RD02-Y F-04; CL-01B saveDraft(); A-39 |
| REQ-SYS-064 | show the save state at all times (Saving, Saved with time, Not saved with reason) and warn before the candidate leaves with unsaved text. | P0 T | RD02-Y F-04 |
| REQ-SYS-065 | restore the latest saved draft and the position in the session when the candidate returns after an interruption, and mark the session Interrupted meanwhile. | P0 T | RD02-Y F-04; RD03-H "answer recovery" |
| REQ-SYS-066 | keep typed text in the page while the connection is lost, show that synchronization is pending and synchronize on reconnection. | P1 T | A-25 |
| REQ-SYS-067 | show progress, allow moving between questions before final submission, require a review of all answers and an explicit confirmation to submit. | P0 T | CL-01B; ACT-01 |
| REQ-SYS-068 | make final submission idempotent and show the candidate whether it was received after a connection loss. | P0 T | DEP-01 (idempotent writes) |
| REQ-SYS-069 | version each submitted answer and never change it after submission. | P0 T | CL-01B notes |
| REQ-SYS-070 | confirm submission, state that a fixed rubric version scores answers and that the recruiter reviews them, and show the candidate no score. | P0 I | Plan §1; A-09 |
| REQ-SYS-071 | treat answer text as data and never as instructions to the system. | P0 T | Plan §4, p.5; Plan refs 11, 16 |
| | **Interview result review** | | |
| REQ-SYS-072 | show per question the question, submitted answer, rubric version, proposed score as a whole level of the fixed 0–4 scale with its description, and the quoted part the score relied on, next to the application's CV evidence summary. | P0 T | CL-01B AnswerAssessment; Plan §4; A-52 |
| REQ-SYS-073 | let a recruiter record agreement, an override score or a note per question without altering the stored assessment. | P0 T | A-37 |
| REQ-SYS-074 | show the interview status per applicant (Invited, Accepted, In progress, Interrupted, Submitted, Declined, Closed) in a tracker. | P1 T | State vocabulary |
| REQ-SYS-075 | present interview scores as supporting assessments and carry no hiring recommendation. | P0 I | Plan §1, p.2; ACT-01 |
| | **Hiring decision** | | |
| REQ-SYS-076 | let a recruiter record a decision with the outcome Hire, Not hire or On hold and an optional rationale. | P0 T | ACT-01; A-11 |
| REQ-SYS-077 | store with each decision the resume version, job version, match snapshot and any interview session and rubric version used, change a decision only by recording a new one, and keep earlier decisions in the history. | P0 T | Plan §3, p.4; A-11 |
| REQ-SYS-078 | never record or change a hiring decision by itself. | P0 I | Plan §1, p.2; ACT-01 |
| | **Data requests, deletion and retention** | | |
| REQ-SYS-079 | let a candidate view the data held about them: profile versions, CV files, applications, consents, interview answers and requests. | P1 T | RD01-Y F-06; A-12 |
| REQ-SYS-080 | let a candidate create a data request of type export, correction, consent withdrawal or deletion, with an identifier and a status. | P1 T | RD01-Y F-06; A-33 |
| REQ-SYS-081 | route each request to the Admin queue of each organization holding the data and keep the candidate informed of its status. | P1 T | A-33 |
| REQ-SYS-082 | let an Admin verify, process, complete or reject a request with a recorded reason, provide an export as a structured readable file, and notify the candidate. | P1 T | A-33 |
| REQ-SYS-083 | execute a deletion over files, extracted text, vectors and caches of its scope and keep a removal record that shows a source was removed without keeping its private text. | P0 T | Plan §3, p.4 |
| REQ-SYS-084 | invalidate caches and derived inputs affected by edits or deletions. | P0 T | DEP-01, p.18 |
| REQ-SYS-085 | let an Admin set a retention period for each data class: files, extracted text, vectors, caches and interview answers. | P0 T | Plan §2; Plan §3 |
| REQ-SYS-086 | delete data whose retention period has expired and list scheduled and completed deletions with their outcomes. | P0 T | Plan §3, p.4 |
| | **Membership, audit and Admin boundaries** | | |
| REQ-SYS-087 | let an Admin invite a user with the role Recruiter or Admin and let the user accept. | P0 T | Plan §2, p.3 |
| REQ-SYS-088 | let an Admin change a role or deactivate or remove a member with immediate effect, recorded in the audit history. | P0 T | Plan §2, p.3 |
| REQ-SYS-089 | prevent removal or demotion of the last Admin of an organization. | P0 T | A-46 |
| REQ-SYS-090 | let an Admin view the audit history of processing attempts, consent changes, data requests and decisions of their organization. | P2 T | ACT-01 subtitle; Plan §3 Audit |
| REQ-SYS-091 | keep Admin views free of candidate evidence and interview content unless the access-control matrix grants it. | P0 I | RD03-M; Plan §3 |
| | **Notifications, language and keyboard** | | |
| REQ-SYS-092 | notify users of events that need action (CV Ready or Failed, invitation, interview submitted, request update) in the application and through one further channel. | P1 T | A-09; A-40 |
| REQ-SYS-093 | provide every screen in Arabic (right-to-left) and English (left-to-right) with a language choice, and mark the language of mixed-language passages for assistive technology. | P0 I | Plan p.1; A-42; WCAG 3.1.2 |
| REQ-SYS-094 | make every function operable by keyboard. | P0 T | RD07-Y |

---

## 9. Traceability

### 9.1 RD01-Y journey steps to use cases

Every journey step of RD01-Y (CJ-01 to CJ-20, RJ-01 to RJ-14, AD-01 to AD-03) is named in the "Journeys" field of at least one use case in section 6 [A-14].

### 9.2 Coverage statistics

Computed from the tables of sections 6 to 8 when this document was assembled.

| Measure | Value |
|---|---|
| Use cases | 20 (Candidate 10, Recruiter 6, Admin 4); P0 15, P1 4, P2 1 |
| Flows | 100 main or withdrawal (M, W) and 98 alternate or failure (A), 198 in total; each has at least one screen (or "background") and at least one requirement |
| Screens | 36 (Candidate 17, Recruiter 13, Admin 6); P0 28, P1 7, P2 1; each used by at least one flow |
| Requirements | 94; P0 79, P1 14, P2 1; test 83, inspection 9, demonstration 2, analysis 0; each cited by at least one flow |
| RD01-Y journey steps | 37 of 37 covered |
| Registers | Assumptions A-01 to A-53 (section 11); checks CC-01 to CC-19 (section 10); open decisions OD-01 to OD-11 (section 12); findings RD01-Y F-01 to F-08 and RD02-Y F-01 to F-04 (section 4) |

---

## 10. Consistency check against requirements and diagrams

The model was checked against UC-01 (p.13), CL-01A and CL-01B (pp.14–15), SEQ-01 (p.16), ACT-01 and ST-01 (p.17), DEP-01 (p.18) and Plan §1 to §3. UC-01 and ACT-01/ST-01 were read from page images, the others from the PDF text [A-16]. Results: **OK** consistent; **REF** consistent after the stated refinement; **PROP** a change to a Plan diagram or model is proposed; **OPEN** a decision is needed.

| ID | Plan element | Check against this document | Result | Action and owner |
|---|---|---|---|---|
| CC-01 | UC-01 actors, baseline names, caption | Three actors and seven baseline names kept and traceable (section 5.1); authentication and organization scope are preconditions (REQ-SYS-001 to 004; SCR-CAN-01, SCR-REC-01, SCR-ADM-01) | OK | none |
| CC-02 | UC-01 against Plan §2, p.3 | Plan §2 names consent and "select interviews"; UC-01 draws neither, nor interview result review or candidate data management | PROP | Add UC-CAN-01, UC-CAN-08, UC-REC-04, UC-REC-05, UC-CAN-10, UC-ADM-03 and the relations of section 5.4 to UC-01; Week 8 review (RD08-Y, RD08-M) |
| CC-03 | UC-01 "Manage access / retention" | Split into UC-ADM-01 and UC-ADM-02; data requests (UC-ADM-03) and audit history (UC-ADM-04) added [A-33] | REF | Confirm at RD03-I; OD-03 |
| CC-04 | ACT-01 "Invite?" [no] and "Submit reviewed application" | "No" skips the interview and reaches "Recruiter records decision" (UC-REC-04 A1, UC-REC-06 A1, REQ-SYS-056); the reviewed-profile step is enforced (REQ-SYS-031, 038) | OK | none |
| CC-05 | ACT-01 "Invite?" [yes] | ACT-01 goes straight to "Candidate answers interview"; the model adds the candidate's response (with CM-02), the recruiter's review of the result and a decline path to the decision | PROP | RD06-M: add "Candidate responds to invitation (CM-02)" with a decline branch to the merge before "Recruiter records decision", and "Recruiter reviews interview results" after the answers |
| CC-06 | ACT-01 and matching states | No node for pending or failed matching or "needs review" | PROP | RD06-M: note both on "Recruiter reviews evidence"; OD-08 |
| CC-07 | SEQ-01 "upload CV + consent" | SEQ-01 sends consent with the upload; the model records CM-01 first and refuses processing without it (REQ-SYS-007) | PROP | RD06-M with RD05-H: show the consent check and record in SEQ-01 |
| CC-08 | SEQ-01 job ID, status, separate checks | "202 + job ID" and status reads match REQ-SYS-018 to 020; quote validation and semantic support stay separate (REQ-SYS-050) | OK | none |
| CC-09 | ST-01 states, guarded retry, audit history | The candidate sees exactly Queued, Processing, Ready and Failed; a recoverable failure returns to Queued once and "retrying" is a message on Queued, so no job shows Failed and then Queued; attempts stay in the audit history (REQ-SYS-022; UC-ADM-04 A3) | REF | Wording: RD04-Y; state machine: RD05-K |
| CC-10 | CL-01A labels, validity, snapshot | Four labels, separate `sourceValid`, no automatic rejection for mandatory requirements, results shown against the targeted job version (REQ-SYS-034, 043, 047, 049, 050, 053) | OK | none |
| CC-11 | CL-01A and CL-01B entities | Not drawn (secondary history is outside the view): consent record, profile version, reviewer note or override, decision, invitation and template choice, data request, retention setting, notification, membership | PROP | RD05-M, RD05-H, RD05-K |
| CC-12 | CL-01B interview model | requestInterview(), SessionStatus, SessionQuestion freeze, saveDraft() and drafts apart from the final answer (REQ-SYS-054, 055, 061 to 065, 069) | OK | none |
| CC-13 | CL-01B AnswerAssessment `score: float` | REQ-SYS-072 shows whole levels of the fixed 0–4 rubric [A-52]; a float and a whole level differ | OPEN | RD05-H, RD06-H; OD-11 |
| CC-14 | DEP-01 input bounds | The Plan allows "rejected or referred for manual review"; REQ-SYS-015 and 016 reject [A-51] | REF | RD04-K, if a referral is wanted |
| CC-15 | DEP-01 latency goals, caches | REQ-SYS-018, 019, 045 repeat the 2 s, 60 s (p95) and 3 s (p95) targets for 100 CVs and five concurrent users as targets for later validation; REQ-SYS-084 invalidates caches on edits and deletion | OK | Measurement: RD07-I |
| CC-16 | DEP-01 one retry, idempotent writes | REQ-SYS-021, 068; REQ-SYS-068 extends idempotency to answer submission | REF | RD05-I |
| CC-17 | Plan §1 to §3 guarantees | Unknown is not negative (REQ-SYS-025, 044, 047), recruiters decide (075, 078), no hiring probability (048), organization scope, version binding and retention (002, 004, 014, 036, 053, 083 to 086) | OK | none |
| CC-18 | Form against Plan (RD01-Y F-05) | Plan wording only; no "generated questions" or "automated screening" [A-01] | OK | none |
| CC-19 | Parallel Week 3 tasks | Boundaries are in section 3; open overlaps: ranking basis (RD03-A), SRS numbering (RD03-M), consent and template rules (RD03-H) | OPEN | RD03-I: OD-01, OD-02, OD-04, A-28 |

Result of the 19 checks: 8 OK, 4 REF, 5 PROP and 2 OPEN. The PROP items are proposals to the owners of the Plan diagrams and are not applied here; the OPEN items are logged for RD03-I [Plan App. A, RD03-I].

---

## 11. Clearly Marked Assumptions

Every statement the sources do not give is an assumption and carries its number. A-01 to A-16 come from RD01-Y and A-17 to A-27 from RD02-Y and keep their numbers; A-28 to A-53 are new in RD03-Y. Each can be confirmed, changed or rejected in the peer review (section 13).

### 11.1 Carried over: A-01 to A-27

| ID | Carried over as |
|---|---|
| A-01 | Retained: the Plan governs where the Form differs [CC-18] |
| A-02 | Not used: it concerns elicitation participants; no participant input is cited |
| A-03 | Not used: it concerns the elicitation session format |
| A-04 | Retained: a job is reached by a posting or invitation link (UC-CAN-05, REQ-SYS-013) |
| A-05 | Refined: the two consent moments become modules CM-01 and CM-02 [A-31, A-32] |
| A-06 | Superseded: the steps now have their own use cases (sections 5 and 6) |
| A-07 | Retained: the profile shows at least skills and experience; fields are fixed by RD05-K |
| A-08 | Adopted as a proposal: the "candidate-provided" label [A-38]; validation with participants is open |
| A-09 | Retained: candidates see their own data and status only; channels [A-40] |
| A-10 | Retained: approved question bank, fixed order, text only; selection is provisional [A-34] |
| A-11 | Retained: a job edit creates a new version; a decision keeps version references; status values are now proposed [A-49] |
| A-12 | Refined: data requests go to an Admin [A-33] |
| A-13 | Retained: ranked list after matching, with a pending or failed state [A-35] |
| A-14 | Retained: CJ, RJ, AD, QR and QC IDs are labels; REQ, UC and SCR IDs are provisional in the same way [A-28] |
| A-15 | Retained: no legal analysis; applies to consent wording, data requests and retention |
| A-16 | Partly updated: UC-01 and ACT-01/ST-01 were also read from page images; other diagrams from text; manifest and editable files remain unavailable |
| A-17 | Retained: no wireframes exist; screens are logical units [A-45] |
| A-18 | Retained: one author with AI-assisted drafting; the peer review is the second reader |
| A-19 | Issue #16 was read from screenshots [A-50]; the text of issue #10 remains unavailable |
| A-20 | Carried: this document uses its own P0, P1, P2 rule [A-44] and no severity scale |
| A-21 | Retained: recruiters triage under time pressure; supports REQ-SYS-046 and REQ-SYS-047 |
| A-22 | Retained: tools often show one match score; the Plan differs on purpose (REQ-SYS-048) |
| A-23 | Retained, not verified: candidates may see a parsed profile as saved work or as a checking task |
| A-24 | Retained: mixed-direction CV text (REQ-SYS-026, REQ-SYS-093) |
| A-25 | Retained: phones and unstable connections (REQ-SYS-066; OD-07) |
| A-26 | Retained: Arabic and English interfaces; Arabic label wording is set in RD04-Y |
| A-27 | Retained: the team treats the heuristic review as the Plan's fallback; the supervisor and owner decide [A-48] |

### 11.2 New in RD03-Y: A-28 to A-53

| ID | Assumption | Basis; effect if wrong |
|---|---|---|
| A-28 | **Provisional requirement IDs.** REQ-SYS-001 to REQ-SYS-094 are issued here as proposals in the role of the Plan's SRS IDs; the SRS of RD03-M was not available | Plan §2, p.3; RD01-Y A-14, F-08. A mapping table replaces them; flows do not change |
| A-29 | **Use-case structure.** UC-01 stays the diagram; the 20 use cases are its children (UC-CAN, UC-REC, UC-ADM), each naming its baseline use case in "Basis" | UC-01, p.13. Merge by rule R2; flows stay |
| A-30 | **Actors.** Only Candidate, Recruiter and Admin; the AI module, worker, notification service and scheduler are internal | UC-01; DEP-01 |
| A-31 | **Consent modules.** CM-01 (CV analysis and matching) and CM-02 (text interview and AI-assisted assessment), stored per candidate, organization, module and notice version and renewed when the version changes | RD02-Y F-03; SEQ-01; Plan App. A, RD01-H. Other splits change UC-CAN-01 content, not flows (RD03-H) |
| A-32 | **Withdrawal effect.** Withdrawal stops new processing at once, cancels queued or running jobs of the module, closes open CM-02 sessions, hides the module's results from recruiters and marks "consent withdrawn". Stored data stays until deletion is requested or retention ends | RD02-Y F-03. OD-01, OD-09 |
| A-33 | **Data requests.** Export, correction, consent withdrawal and deletion, created by the candidate and processed by an Admin of each organization that holds the data. "GDPR" appears in the task brief only; the Plan does not name it and no legal analysis was made, so no statutory right, deadline or legal basis is claimed | RD01-Y A-12, F-06; A-15. OD-03, OD-09 |
| A-34 | **Template selection.** The recruiter selects one approved interview template (questions and rubric version) per invitation | RD01-Y F-07; CL-01B; Plan §3. OD-04 |
| A-35 | **Matching trigger.** Matching starts after submission for the targeted job and resume version and is saved as an immutable snapshot | RD01-Y A-13, F-04; CL-01A. OD-08 |
| A-36 | **Ranking basis.** It comes from RD03-A. Here it must be stated, must not be a hiring probability and must never exclude an applicant for unassessed mandatory requirements; recruiter sorting and filtering leave the snapshot unchanged | Plan §1, §2; CL-01A note. OD-02 |
| A-37 | **Reviewer records.** Notes, "reviewer disagrees" marks, agreement and override scores are stored apart from model output and never change it | Plan §1, §3. RD05-M |
| A-38 | **Candidate-provided values.** Labeled "candidate-provided" with no quote, unless the candidate selects a CV span, which is validated as new evidence on the same resume version | RD01-Y A-08, F-03; CL-01A. RD03-K may set another rule |
| A-39 | **Autosave.** Automatic while typing and on leaving a question; no interval, offline limit or draft retention is set | CL-01B saveDraft(); RD02-Y F-04. OD-07 |
| A-40 | **Notifications.** In the application plus one further channel (email assumed, not decided) | RD01-Y A-09 |
| A-41 | **Question bank.** Approved questions and rubrics come from RD06-H and are existing inputs; UC-01 has no authoring use case | Plan App. A, RD06-H |
| A-42 | **Languages.** Arabic and English screens; quotes keep their original language and direction; no translation of CV text in the core release | Plan, p.1; RD04-Y |
| A-43 | **Handles.** `@AhmedFadlallah1` and `@kareemmahmoud141224-prog` are the handles given in the task brief. The issue names the peer reviewer without a handle. Neither handle was checked against the repository; Y's GitHub username is pending | Task brief; Issue #16. Replace in the PR if different |
| A-44 | **Priority rule.** P0, P1 and P2 as defined in section 3; this task's rule, not the Plan's | Plan §6, p.7 (Week 3: prioritized). RD03-M may re-rank |
| A-45 | **Screens are logical.** A SCR ID names a purpose, content and states, not a route or a wireframe | RD04-Y may split or merge |
| A-46 | **Admin scope.** Organization-scoped; no platform-wide super-admin in the core release; at least one Admin always remains | UC-01 caption; Plan §3. Changes REQ-SYS-089 |
| A-47 | **Organization selector.** A user with several memberships selects one organization per session | Plan §3. RD03-M |
| A-48 | **RD02-Y findings.** Cited as listed in the task brief. They come from a heuristic substitute review without participants and are design hypotheses, not participant feedback. RD02-I was not needed and not used | Issue #16; Plan §1, p.2 |
| A-49 | **Status vocabularies.** The values in section 5.6 are proposals | CL-01A and CL-01B name the types only. OD-10 |
| A-50 | **Issue #16 text.** Read from screenshots of the issue page, not from GitHub. Its four acceptance criteria are quoted in section 1; the list of earlier gaps comes from the task brief. If the live issue differs, it governs | Task input |
| A-51 | **Oversized input.** DEP-01 allows rejection or referral for manual review; only rejection is modeled | DEP-01, p.18 |
| A-52 | **Score display.** Whole levels of the fixed 0–4 rubric with the level description and the quote | Plan §4, p.5; CL-01B. OD-11 |
| A-53 | **UML basis.** «include» and «extend» follow UML 2.5.1 (Plan ref. 18). The OMG site could not be fetched; Clause 18 and the semantics were checked against a secondary reading note on UML 2.5, chapter 18 | Verify against the OMG document at review |

---

## 12. Open decisions

Each decision has a provisional position so that the flows are complete today. A provisional position is not a decision. Conflicts are logged for RD03-I [Plan App. A, RD03-I].

| ID | Decision needed | Provisional position in this document | Owner |
|---|---|---|---|
| OD-01 | What a candidate who declines CM-01 or CM-02 can still do; consent notice wording and legal basis; whether a non-AI alternative exists | Declining blocks only CV upload or interview acceptance; account access and the other module are unaffected; no alternative path (REQ-SYS-012, 038) | RD03-H with the supervisor; legal input outside this document [A-15] |
| OD-02 | Ranking basis and treatment of unassessed mandatory requirements | Basis stated on the list; unassessed mandatory requirements flagged, never excluded (REQ-SYS-045 to 048) | RD03-A |
| OD-03 | Service target and requester verification for data requests | No target modeled; status always visible; the Admin verifies the requester (UC-ADM-03 M2) | Owner and supervisor; legal input [A-15] |
| OD-04 | Who selects the interview template | The recruiter selects one approved template per invitation (REQ-SYS-055) | RD03-H, confirmed with a recruiter or domain reviewer when available |
| OD-05 | Whether and when the candidate sees the decision outcome | The candidate sees only "Decision recorded" (REQ-SYS-040) | Owner; RD03-H |
| OD-06 | Session time limits and invitation expiry | None: no limit on answering and no automatic expiry (UC-CAN-08 A3). If a time limit is added, WCAG 2.2.1 Timing Adjustable applies | RD03-H; RD07-Y |
| OD-07 | Autosave interval, offline limits, draft retention | Automatic save while typing and on leaving a question; unsaved text kept in the page while offline (REQ-SYS-063 to 066) | RD05-H |
| OD-08 | Matching trigger, re-run rules, what the recruiter sees while pending | Matching after submission; no silent recompute after a job revision (REQ-SYS-043, 044, 053) | RD05-A |
| OD-09 | Retention defaults per data class, draft retention, whether withdrawal triggers deletion | The Admin sets a period per data class; no defaults; withdrawal keeps data until deletion or the end of retention (REQ-SYS-085, 086; A-32) | Owner and supervisor; legal input [A-15] |
| OD-10 | Final value sets for application, session and data-request status | The proposals in section 5.6 | RD05-M, RD05-H |
| OD-11 | Interview score as whole levels or as a float | Whole levels with the level description (REQ-SYS-072; A-52) | RD05-H, RD06-H |

---

## 13. Hand-off

### 13.1 Pull request

| Item | Instruction |
|---|---|
| Repository | `ai-recruitment-grad-team/ai-recruitment-platform`, milestone "RD03 — Requirements baseline and scope approval" [Issue #16] |
| File | `RD03-Y_use-case-model-and-screen-inventory.md`, in the folder where the team keeps the RD deliverables (follow the RD01-Y file; the issue names none) |
| Branch and title | Branch `rd03-y/use-case-model-and-screen-inventory` (suggested); PR title `[RD03-Y] Use-case model and screen inventory` |
| Issue link | Write `Refs #16` in the PR description. Use no automatic-closing keyword (`Closes`, `Fixes`, `Resolves` or similar). Only the owner accepts the task, merges the PR and closes the issue by hand [Issue #16] |
| Tags and reviews | Tag `@kareemmahmoud141224-prog` (final reviewer, owner) and `@AhmedFadlallah1` (peer reviewer) in the description and request a review from each [A-43] |
| After review | The owner selects Request changes or Approve; push fixes to the same PR and re-request review [Issue #16] |
| Scope | One Markdown file; no application code, wireframes or legal analysis [Issue #16; A-15] |

PR description to paste (the @ mentions have no backticks on purpose, so that GitHub notifies both reviewers):

~~~markdown
## [RD03-Y] Use-case model and screen inventory

Refs #16

Adds `RD03-Y_use-case-model-and-screen-inventory.md`:
- UML UC-01 refined into 20 use cases (Candidate 10, Recruiter 6, Admin 4), 36 prioritized screens and 94 provisional requirement IDs (REQ-SYS-001 to REQ-SYS-094). All 100 main and 98 alternate or failure flows are mapped to screens and requirements.
- Covers the gaps of RD01-Y and RD02-Y: modular consent with withdrawal, interview selection, interview result review, candidate data management.
- Source register, assumptions A-01 to A-53, consistency check, open decisions OD-01 to OD-11.

Limits: the RD02-Y findings are heuristic hypotheses, not participant feedback; REQ-SYS IDs are provisional until RD03-M adopts or maps them; no legal analysis.

Peer review: @AhmedFadlallah1. Final review: @kareemmahmoud141224-prog. Fixes will be pushed to this PR after Request changes.
~~~

### 13.2 Peer review request to Ahmed Fadlallah Abdelgwad (`@AhmedFadlallah1`)

Please review before RD03-I closes the requirements gate [Plan App. A, p.9]. Leave findings as PR review comments marked "accept", "change" or "reject".

1. **Flows.** Open five use cases in section 6, including UC-CAN-01 and one of UC-REC-04, UC-REC-05 or UC-ADM-03: each step needs a fitting screen (or "background") and requirement.
2. **Counts.** Compare section 9.2 with the document: 20 use cases, 36 screens, 94 requirements, 100 main and 98 alternate or failure flows.
3. **Sources.** Check that each tag in section 2 resolves and open the Plan page for five cited statements.
4. **Assumptions and gaps.** Mark each of A-28 to A-53 and confirm that the twelve findings in section 4 are resolved or carry a named open item.
5. **Consistency and wording.** Confirm that the PROP and OPEN items in section 10 are fair and have owners, and that no text claims participant feedback, presents a score as a hiring probability or makes a legal claim.

### 13.3 Owner review request to the final reviewer (`@kareemmahmoud141224-prog`)

1. Accept the REQ-SYS IDs as provisional and send them to RD03-M for adoption or mapping [A-28].
2. Give direction on OD-01, OD-03, OD-05 and OD-09 (consent policy, data requests, retention); no legal analysis is included [A-15].
3. Accept the RD02-Y findings as heuristic hypotheses until real participants are available [A-27, A-48].
4. Select Request changes or Approve. The owner alone accepts the task, merges the PR and closes issue #16 [Issue #16].

### 13.4 Checks for the task owner before opening the PR

- [ ] Add Y's GitHub username to the metadata table and replace the reviewer handles if the repository differs [A-43].
- [ ] Compare the live issue #16 with section 1 [A-50].
- [ ] Preview the Markdown; GitHub does not render the PlantUML source in section 5.5.
- [ ] Confirm that no private data, real candidate data or invented participant feedback is in the file.
- [ ] Open the PR with `Refs #16`, tag both reviewers and request both reviews.

### 13.5 What each follow-up task receives

RD03-K: UC-CAN-02 to UC-CAN-04, REQ-SYS-015 to REQ-SYS-031, CC-14. RD03-A: UC-REC-02, REQ-SYS-043 to REQ-SYS-053, OD-02, OD-08. RD03-M: all REQ-SYS IDs [A-28] and the role actions for the access-control matrix. RD03-H: UC-CAN-01, UC-CAN-08, UC-CAN-09, UC-REC-04 to UC-REC-06, OD-01, OD-04 to OD-06. RD03-I: sections 10 and 12. RD04-Y: section 7, P0 first, with Arabic and English wording [A-42]. RD05-K, RD05-A, RD05-H, RD05-M: CC-11, CC-13, OD-07, OD-08, OD-10, OD-11. RD06-M: CC-05 to CC-07. RD07-Y: REQ-SYS-005 to REQ-SYS-012, REQ-SYS-093, REQ-SYS-094. Week 8 review: CC-02.
