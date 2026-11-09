# [RD05-Y] Screen/API Contract Examples

**AI Recruitment Platform · Research and Software Design Plan · Week 5 (RD05)**

| Field | Value |
|---|---|
| Task | RD05-Y — Screen/API contract examples (GitHub issue #28) |
| Repository · milestone | `ai-recruitment-grad-team/ai-recruitment-platform` · RD05 — ERD, contracts and system behavior [Issue #28] |
| Week · priority · estimate | Week 5 (RD05) · P0 · 5 h [Issue #28; Plan App. A, p.10] |
| Owner | Youssef Mohammed Elbasosy (Y); GitHub username pending [Issue #28] |
| Peer reviewer | Ahmed Fadlallah Abdelgwad (A), `@AhmedFadlallah1` [Issue #28; A-43 of RD03-Y] |
| Final reviewer | `@kareemmahmoud141224-prog` [Issue #28] |
| Support | As needed during team review [Issue #28] |
| Dependencies | RD04-Y; RD04-M [Issue #28]. RD04-M was not available [A-100]. Builds on RD01-Y to RD03-Y |
| Baseline | `planning/weekly_backlog.json`, RD-9W-FINAL [Issue #28] |
| Status · date | Ready for peer review · 7 November 2026 |
| Authoring | Task owner with AI-assisted drafting; single author [A-18 of RD03-Y] |
| Boundary | Research and design only. No endpoint is implemented. No application coding before the supervisor approves Design Baseline v1 [Issue #28; Plan §6, p.7] |
| Files | This document; `problem-examples.json` (all 33 problem types as full bodies); `contract-index.csv` (one row per operation: screens, frames, requirements, use-case steps) |

**How to read this document.** Square brackets give the source: [Plan §3, p.4]; [RD03-Y …], [RD04-Y …]; [A-nn] a Clearly Marked Assumption (A-01 to A-53 are in RD03-Y, A-54 to A-75 in RD04-Y, A-76 to A-100 are new); [OD-nn] an open decision (OD-01 to OD-11 in RD03-Y, OD-12 to OD-19 in RD04-Y, OD-20 to OD-28 are new); [CK-nn] a check; [F-nn] a finding; [H-nn] a handoff of RD04-Y. `CT-xxx-nn` is a contract. Screens are written CAN-nn, REC-nn, ADM-nn (the `SCR-` prefix is omitted) and `F0`, `F1`… are their frames. `REQ-SYS-nnn` is written nnn in tables. `UC-…` is a use case. `CM-01` and `CM-02` are the consent modules.

## Limitation notice

This is a design document built from the Plan and RD01-Y to RD04-Y. It is not evidence of what candidates, recruiters or admins need from an interface.

- **Examples, not an interface.** No endpoint, schema file or server exists; names and values are illustrations [A-76].
- **No participant feedback.** The RD01-Y interviews could not be held and RD02-Y was a supervisor and heuristic review [Plan p.2; A-27 of RD03-Y]. The examples are untested design proposals. RD07-Y plans the first observation [Plan App. A, p.11].
- **Inputs not available.** RD04-M and the Week 5 tasks RD05-K, A, M, H and I were not available. Where they will decide something, the example states an assumption [A-100].
- **Arabic wording.** Screen texts stay in RD04-Y and are unchecked by a native reader [A-55, OD-17]. The examples carry data and error types, no interface text.
- **Provisional identifiers.** `SCR`, `REQ-SYS` and the new `CT` identifiers are provisional [A-28 of RD03-Y].
- **Sources.** Issue #28 was read from screenshots [A-77]. The external sources of section 2 were read in this session; one is an expired draft, not a standard [A-82].
- **No technology choice and no legal analysis.** Final choices belong to the Week 4 feasibility review [Plan §3, p.4]; HTTP and JSON only make the examples concrete [A-78]. Consent and data-request examples carry no legal claim [A-15, A-33 of RD03-Y].
- **Single author with AI-assisted drafting;** peer review is pending [A-18 of RD03-Y].

---

## 1. Purpose, scope and acceptance mapping

RD05-Y turns the 36 screens (114 frames) of RD04-Y into worked input, output and error examples. For each place where a screen reads or changes data, one contract says what is sent, what comes back and which problems can occur, and links it to screens, frames, requirements and use cases. The examples are then checked against the requirements and the diagrams of Plan Appendix B [Plan App. A, p.10; Plan §6, p.7].

| Acceptance criterion (Issue #28, verbatim) | Met in |
|---|---|
| Provide input/output/error examples and link them to screens and requirements without implementing endpoints. | Section 5 (conventions, error catalogue); section 6 (36 contracts, 84 operations, 102 success and 120 error examples); section 7 (screens, frames, requirements) |
| Link the deliverable and primary sources or clearly marked assumptions. | Section 2; source tags throughout; section 9 |
| Check consistency with requirements and relevant diagrams. | Section 8 (CK-01 to CK-16) |
| Submit a PR using `Refs #NUMBER`; request owner review. | Section 11 (`Refs #28`) |

**Out of scope:** endpoint code, OpenAPI or JSON Schema files, ERD (RD05-M), CV/evidence schema and state machine (RD05-K), matching result specification (RD05-A), interview and rubric schema (RD05-H), sequence and storage-access review (RD05-I), the clickable prototype (RD06-Y), legal analysis.

---

## 2. Source register

| Tag | Source and location |
|---|---|
| Issue #28 | "[RD05-Y] Screen/API contract examples", `ai-recruitment-grad-team/ai-recruitment-platform`, milestone RD05 — ERD, contracts and system behavior. Read from screenshots [A-77] |
| Plan | AI Recruitment Platform — Research and Software Design Plan (final baseline). §3 p.4: modules Auth, Jobs, Profiles, Matching, Interviews, Audit; rules such as "an application targets one job version", "permissions checked at each operation", records organization-scoped. §5 p.6: Week 5 "ERD/domain models, API contracts, sequences and states". §6 p.7: Week 5 gate; risk "Design inconsistency: check requirement IDs, class/ERD relations, message contracts and version references"; Design Baseline v1 |
| Plan App. A | p.10, Week 05 "ERD, contracts and system behavior" (RD05-Y, K, A, M, H, I) and Week 06 (RD06-M, RD06-Y); p.9: RD04-Y, RD04-M; p.11: RD07-Y |
| Diagrams | Plan Appendix B as read in RD03-Y [A-16 of RD03-Y]: UC-01 p.13; CL-01A/B pp.14–15 (attribute names); SEQ-01 p.16 ("202 + job ID", status reads); ACT-01 and ST-01 p.17; DEP-01 p.18 (input limits) |
| RD01-Y to RD04-Y | RD03-Y: use-case flows, `REQ-SYS-001..094`, §5.6 vocabularies, A-01..A-53, OD-01..OD-11. RD04-Y: 36 screens, 114 frames, routes, messages (§8), handoffs H-01..H-06, A-54..A-75, OD-12..OD-19 |
| RFC 9457 | IETF RFC 9457, "Problem Details for HTTP APIs", https://www.rfc-editor.org/rfc/rfc9457.html — members, extension members, `application/problem+json`. Read in this session |
| RFC 9110 | IETF RFC 9110, "HTTP Semantics", https://www.rfc-editor.org/rfc/rfc9110.html — ETag §8.8.3; safe and idempotent methods §9.2.1–9.2.2; Accept-Language §12.5.4; If-Match §13.1.1; status codes §15.3.2 (201), §15.3.3 (202), §15.5.4–15.5.5 (403, 404), §15.5.10 (409), §15.5.13 (412), §15.5.14 (413), §15.5.16 (415), §15.5.21 (422), §15.6.4 (503). Read in this session |
| RFC 6585 | IETF RFC 6585, "Additional HTTP Status Codes", https://www.rfc-editor.org/rfc/rfc6585.html — 428, 429. Read in this session |
| RFC 3339 | IETF RFC 3339, "Date and Time on the Internet: Timestamps", https://www.rfc-editor.org/rfc/rfc3339.html — `date-time`, `Z` for UTC. Read in this session |
| IDEMP-07 | IETF Internet-Draft draft-ietf-httpapi-idempotency-key-header-07, "The Idempotency-Key HTTP Header Field", 15 October 2025, expires 18 April 2026, https://www.ietf.org/archive/id/draft-ietf-httpapi-idempotency-key-header-07.html — not a standard; design reference only: `400` without key, `422` for a reused key with a different payload, `409` while the first request runs [A-82] |
| OWASP-API | OWASP API Security Top 10 2023, https://api-security.owasp.org/editions/2023/en/0x11-t10/ ; API1:2023 Broken Object Level Authorization, https://api-security.owasp.org/editions/2023/en/0xa1-broken-object-level-authorization/ ; API3:2023 Broken Object Property Level Authorization, https://api-security.owasp.org/editions/2023/en/0xa3-broken-object-property-level-authorization/ . Read in this session; basis of the scope and property rules in 5.2 |

OpenAPI, JSON Schema, BCP 47, RFC 8259 and RFC 5789 were not read for this task and no rule depends on them. No API style guide was consulted, so the conventions of section 5 are the author's, supported only by the sources above.

---

## 3. Results at a glance

| Result | Value |
|---|---|
| Contracts | 36 in 7 groups (six Plan modules and one provisional group); 84 operations (35 POST, 35 GET, 10 PUT, 4 DELETE); 102 success and 120 error examples; 3 full problem bodies here, all 33 in `problem-examples.json` |
| Screens and frames | 36 of 36 screens and 114 of 114 frames linked; 5 frames need no call of their own (7.2) |
| Requirements | 92 of 94 linked; 043 is internal (no screen, no response) and 094 is a client property (7.3) |
| Use cases | 20 of 20 use cases; 182 of 198 flow steps that name a screen are cited (steps in the CSV) |
| Error model | 33 problem types (RFC 9457), each linked to the RD04-Y frames that show it; 30 appear in operations, 3 idempotency types apply to every operation with `Idempotency-Key` (5.4) |
| Consistency | 16 checks: 11 OK, 5 refined, 0 open (section 8) |
| Registry | A-76 to A-100 (25); OD-20 to OD-28 (9); F-01 to F-09 (9) |

**Findings for other tasks**

- **F-01** Job version at submission. UC-CAN-06 A3 says the candidate "must confirm against the current version" after a job revision, while REQ-SYS-014 binds an application to one job version when it is started and REQ-SYS-036 keeps applications on the version they targeted. CT-APP-02 shows a refusal and an acknowledged submission on the bound version [OD-20].
- **F-02** No status before submission. An application exists once started [REQ-SYS-014] and CAN-09 links to CAN-04, 05, 06 and 08 to continue it, but RD03-Y §5.6 begins at SUBMITTED and RD04-Y draws no badge for an unsubmitted application. The examples use `DRAFT` [OD-21].
- **F-03** Identifiers without a class. 15 of the 27 identifier properties used in the examples have no attribute in CL-01A/B: AuditEvent, ConsentRecord, DataRequest, Decision, DeletionJob, InterviewTemplate, Job, Member or invitation, Notification, Organization, ProcessingJob, ProfileItem, RemovalRecord, Review, ReviewerNote. RD05-M decides which become entities and which stay API-level views.
- **F-04** Score type. CL-01B types the AnswerAssessment `score` as `float`; RD03-Y fixes whole levels 0 to 4 [A-52, OD-11 of RD03-Y]. CT-ITV-07 shows whole levels; RD05-H and RD05-M align the type.
- **F-05** Removal record and quote. REQ-SYS-083 keeps a removal record "without keeping its private text", while UC-REC-03 A4 shows "the quote text only" after the CV file is removed. The examples reconcile them by data class: a quote is returned while the extracted text is held [REQ-SYS-085]; the removal record keeps no text (CT-MAT-03). RD05-M and RD05-I confirm.
- **F-06** Recruiter closing a started session. UC-CAN-09 A7 has the recruiter close a session in progress, but no requirement, screen or call does it; REQ-SYS-054 covers unstarted invitations only [OD-22].
- **F-07** No screen for accepting a team invitation. UC-ADM-01 M3 ("Invitee accepts") points to ADM-02, the Admin member list; no frame shows the invitee accepting. CT-AUTH-05 shows the call; RD06-Y adds the screen or the step is dropped [A-89].
- **F-08** No registration frame. CAN-01 is named "sign-in and registration" but has only the frames Default, Error and Locked. CT-AUTH-02 shows registration without a frame; RD06-Y adds one.
- **F-09** Consent without an organization label. Consent is per candidate, organization and module [A-31 of RD03-Y], but the frames of CAN-15 show no organization. CT-CNS-02 returns the organization name with every record; RD06-Y adds the label.

**Decisions needed from the owner:** OD-20 and OD-21 first, because RD05-M models the application and its status; then OD-22 to OD-28 (section 10).

---

## 4. Inputs reused

Screens, frames, routes and messages of RD04-Y (§5, §8, §9); requirements, flows and vocabularies of RD03-Y (§5.6, §6, §8), unchanged (5.5). Routed to RD05: the lock rule [A-54] (A-88 here) and the direction of free text [A-58] (A-99 here).

---

## 5. Conventions used by all examples

### 5.1 How to read an example

~~~text
METHOD /path/{parameter}?query   an operation; {name} is a path parameter
  Name: value                    request header (only those that matter)
  > {body}                       request body (JSON)
  < 201 (label) {body}           success response; (label) names the case
    Name: value                  response header of the line above
  ! 409 problem-slug {members}   error: problem type (5.3) and its extension members
  ! 409 problem-slug             the full problem body follows, indented
~~~

`GET` only reads. A bracket in a value such as `[reviewer note]` stands for text the example does not need to show. Under each contract title: actor · screens and frames · requirements · use cases · diagrams.

### 5.2 Rules

| Topic | Rule | Source |
|---|---|---|
| Format | HTTP with JSON bodies (UTF-8); methods and status codes as in RFC 9110. English camelCase names that reuse the attribute names of CL-01A/B; `status` for lifecycle values, `state` for ST-01 only, `evidenceState` for evidence; UPPER_SNAKE_CASE values | A-78; RFC 9110 |
| Time and IDs | RFC 3339 UTC timestamps; opaque UUIDs; display codes are separate and never in paths | A-79, A-80, A-97; RFC 3339 |
| Scope | The organization comes from the session, never from a path or body. A resource that is missing, expired or outside the caller's scope gives the same `404 not-available`. A property the role must not see is absent, not `null` | A-87, A-60; REQ-SYS-002, 004; OWASP API1, API3 |
| Create and submit | `POST` with `Idempotency-Key`; `201` with the new resource; a repeat returns the stored result (5.4) | A-82; RFC 9110 §15.3.2 |
| Change a stored version | `If-Match` with the version read; the answer carries the new `ETag`; `428` without it, `412` if stale | A-83; RFC 9110 §13.1.1, §8.8.3; RFC 6585 |
| Long work | `202 Accepted` with a status resource and job identifier; the client polls with `GET`; states follow ST-01 | A-86; SEQ-01; RFC 9110 §15.3.3 |
| Limits | An upload over a DEP-01 limit is rejected with `413`, `415` or `422` and stores nothing; no truncation | A-91; DEP-01; REQ-SYS-015; RFC 9110 §15.5.14–15.5.21 |
| Methods | `PUT` sets a state and repeats safely; `POST` creates or runs an action (`…/withdrawal`, `…/submission`); `DELETE` removes; no partial-update method | RFC 9110 §9.2.1–9.2.2 |
| Lists | `limit` and an opaque `nextCursor`; filters and sorts as query parameters | A-84 |
| Wait and outage | `429` with `retryAfterSeconds` and `Retry-After`; `503` means nothing changed and the request can be repeated | A-88; RFC 6585; RFC 9110 §15.6.4 |
| Language | Stored content keeps its language; the client sets `dir="auto"` for free text; the interface language is `preferredLanguage` | A-99; A-42 of RD03-Y; A-58, A-62 |
| Candidate view | Candidate-facing responses carry no rank, score, evidence label, outcome, rationale or other applicant (CK-12) | REQ-SYS-041, 070, 077 |

### 5.3 Errors: problem types and screens

Every error is an RFC 9457 problem body. The screen picks its text from the RD04-Y catalogue by `type` and frame and never parses `detail` [A-81]. Several field errors share one body in `errors[]`. Extension members are shown in the examples and in `problem-examples.json`. One body in full:

~~~text
HTTP/1.1 422 Unprocessable Content
Content-Type: application/problem+json
{
  "type": "https://example.net/problems/validation-failed",
  "title": "Validation failed",
  "status": 422,
  "detail": "One or more fields are invalid.",
  "reference": "R-56F19F",
  "errors": [{"pointer": "#/email", "reason": "format"}, {"pointer": "#/password", "reason": "required"}]
}
~~~

| Status | Type (`https://example.net/problems/…`) | Shown on (RD04-Y frames) | REQ |
|---|---|---|---|
| 400 | `invalid-request` | KIT-S1 F2; KIT-S2 F2 | — |
| 400 | `idempotency-key-required` | KIT-S1 F2 | 039 068 077 |
| 401 | `session-expired` | KIT-S2 F3 | 001 |
| 401 | `credentials-invalid` | CAN-01 F1 | 001 |
| 403 | `access-denied` | CAN-01 F1; REC-01 F2; ADM-01 F2 | 002 004 |
| 403 | `consent-required` | CAN-03 F0; CAN-06 F3; CAN-10 F0 | 005 007 011 |
| 404 | `not-available` | KIT-S1 F3 | 002 004 |
| 409 | `job-closed` | CAN-02 F1 | 013 037 |
| 409 | `job-version-changed` | CAN-02 F2; CAN-08 F2 | 014 036 |
| 409 | `notice-version-changed` | CAN-03 F3 | 006 008 |
| 409 | `resume-not-ready` | CAN-05 F0 | 019 031 038 |
| 409 | `submission-blocked` | CAN-08 F1 | 007 031 038 |
| 409 | `session-closed` | CAN-11 F1; CAN-14 F2 | 010 054 065 |
| 409 | `already-submitted` | CAN-13 F3 | 068 069 |
| 409 | `invalid-state` | KIT-S1 F2; KIT-S2 F2 | — |
| 409 | `draft-incomplete` | REC-04 F1 | 032 033 |
| 409 | `last-admin` | ADM-02 F1 | 089 |
| 409 | `invitation-expired` | ADM-02 F2 | 087 |
| 409 | `request-closed` | ADM-05 F3 | 080 082 |
| 409 | `confirmation-required` | ADM-04 F2; CAN-16 F0 | 083 085 |
| 409 | `request-in-progress` | KIT-S1 F2 | 068 |
| 412 | `version-mismatch` | CAN-07 F2; REC-04 F2 | 027 036 |
| 413 | `file-too-large` | CAN-04 F1 | 015 |
| 415 | `file-type-unsupported` | CAN-04 F2 | 015 |
| 422 | `pdf-too-many-pages` | CAN-04 F1 | 015 |
| 422 | `text-too-long` | CAN-04 F1 | 015 |
| 422 | `pdf-scanned` | CAN-04 F2 | 016 |
| 422 | `span-invalid` | CAN-07 F3 | 025 029 |
| 422 | `validation-failed` | ADM-03 F2; REC-11 F0; REC-12 F0 | 073 076 087 |
| 422 | `idempotency-key-reused` | KIT-S1 F2 | 068 |
| 428 | `precondition-required` | KIT-S1 F2 | 027 |
| 429 | `too-many-attempts` | CAN-01 F2 | 001 |
| 503 | `service-unavailable` | KIT-S1 F2; KIT-S2 F2; CAN-03 F2; CAN-08 F3; REC-12 F1; CAN-12 F2 | 008 039 064 077 |

### 5.4 Idempotency and replay

~~~text
POST /applications   Idempotency-Key: K1                     → 201 created
POST /applications   Idempotency-Key: K1, same body          → 201 same result (replay)
POST /applications   Idempotency-Key: K1, other body         → 422 idempotency-key-reused
POST /applications   no header                               → 400 idempotency-key-required
POST /applications   K1 while the first call still runs      → 409 request-in-progress
~~~

13 operations take the header: CT-AUTH-05, CT-JOB-04, CT-CV-01, CT-APP-01, CT-APP-02, CT-MAT-02, CT-DEC-01, CT-ITV-01, CT-ITV-06, CT-PRV-01 (2), CT-PRV-02, CT-PRV-03. Other `POST` calls repeat safely by their state (`…/withdrawal` on a withdrawn application returns the same result).

### 5.5 Vocabularies reused unchanged

| Vocabulary | Values | Source |
|---|---|---|
| Processing (ST-01) | QUEUED, PROCESSING, READY, FAILED; `retrying` only on QUEUED | ST-01 p.17; REQ-SYS-019 to 022 |
| Application status | `DRAFT` (proposed, F-02), SUBMITTED, INTERVIEW_INVITED, INTERVIEW_IN_PROGRESS, INTERVIEW_SUBMITTED, DECIDED ("Decision recorded"), WITHDRAWN | RD03-Y §5.6; OD-10 |
| Interview session | INVITED, ACCEPTED, IN_PROGRESS, INTERRUPTED, SUBMITTED, DECLINED, CLOSED; `closedBecause`: CANCELLED_BY_RECRUITER, CONSENT_WITHDRAWN, CLOSED_BY_RECRUITER | RD03-Y §5.6; UC-CAN-09 A7 |
| Consent | NOT_ASKED, GRANTED, DECLINED, WITHDRAWN with `noticeVersion`; per candidate, organization and module | A-31 of RD03-Y |
| Evidence | SUPPORTED, UNSUPPORTED, CONTRADICTED, INSUFFICIENT; `sourceValid` is separate; whole-level score 0 to 4 | CL-01A/B; A-52 of RD03-Y |
| Data request | EXPORT, CORRECTION, CONSENT_WITHDRAWAL, DELETION; PENDING, IN_PROGRESS, COMPLETED, REJECTED, CANCELLED | A-33 of RD03-Y |
| Decision outcome | HIRE, NOT_HIRE, ON_HOLD; set only by a recruiter | ACT-01; REQ-SYS-075, 077 |

Other `status` values (job, member, profile item, deletion job) are proposals from the labels of the RD04-Y screens; RD03-Y names for deletion jobs only "scheduled and completed" and "failed" [SCR-ADM-04].

### 5.6 Placeholder identifiers

Identifiers are UUIDs [CL-01A/B]. To keep the transcripts short they are written as `tag-number`: `rv-1` stands for `06000001-0000-4000-8000-000000000001` (entity code `06`, number 1) [A-79, A-80]. Tags: `app` Application (02) · `job` Job (03) · `jv` JobVersion (04) · `rq` Requirement (05) · `rv` ResumeVersion (06) · `prc` Processing job (07) · `it` Profile item (08) · `ev` EvidenceSpan (09) · `snap` MatchSnapshot (0a) · `ses` InterviewSession (0b) · `qv` QuestionVersion (0c) · `sq` SessionQuestion (0d) · `ans` Answer (0e) · `asm` AnswerAssessment (0f) · `rub` RubricVersion (10) · `tpl` Interview template (11) · `dec` Decision (12) · `mem` Member or invitation (13) · `dr` Data request (14) · `del` Deletion job (15) · `aud` Audit event (16) · `ntf` Notification (17) · `org` Organization (18) · `con` Consent record (19) · `note` Reviewer note or review (1a). Display codes such as `PROC-0042` are not identifiers [A-97].

### 5.7 Route and path parameters

RD04-Y route parameters map to contract path parameters: `{appId}` → `applicationId`; `{jobId}` → `jobId`; `{invId}` (candidate) and `{sessionId}` (recruiter) → `sessionId` [A-95]; `{itemId}` → `itemId`; `{memberId}` → `memberId`; `{module}` → `module`; `{n}` → `order`; `{procId}` → `processingId`; `{spanId}` → `evidenceId`. `{lang}` has no counterpart: the API takes no language prefix. No path contains an organization [A-60].

---

## 6. Contract examples

36 contracts, grouped by the six Plan modules [A-85]. Applications sit with Jobs because an application targets one job version [Plan §3, p.4]. Consent, data requests, retention, notifications and the dashboard have no module in the Plan and form 6.7.

### 6.1 Auth

#### CT-AUTH-01 · Sign in

**Actor** any · **Screens** CAN-01 F0–F2 REC-01 F0 F2 ADM-01 F0 F2 · **REQ-SYS** 001 002 004 · **Use cases** UC-CAN-05 UC-REC-01 · **Diagrams** UC-01 preconditions

~~~text
POST /sessions
  > {"role": "candidate", "email": "candidate.a@example.org", "password": "(placeholder)"}
  < 201 {"role": "candidate", "preferredLanguage": "en", "organization": null, "memberships": []}
  ! 401 credentials-invalid
  ! 403 access-denied {"reason": "wrong-role", "useRole": "recruiter"}
  ! 429 too-many-attempts {"retryAfterSeconds": 900}

POST /sessions
  > {"role": "recruiter", "email": "recruiter.a@example.org", "password": "(placeholder)"}
  < 201 {
          "role": "recruiter",
          "organization": null,
          "memberships": [{"organizationId": "org-1", "name": "Sample Organization"}, {"organizationId": "org-2", "name": "Sample Organization 2"}]
        }
  ! 403 access-denied {"reason": "no-membership"}
~~~

A wrong password and an unknown email give the same `credentials-invalid`. `access-denied` is returned only after the credentials were verified [REQ-SYS-004]. The lock rule behind `too-many-attempts` is not set here [A-54 of RD04-Y; A-88].

#### CT-AUTH-02 · Register a candidate account

**Actor** any · **Screens** CAN-01 F0 · **REQ-SYS** 001 · **Use cases** UC-CAN-05 · **Diagrams** CL-01A Candidate

~~~text
POST /candidates
  > {"email": "candidate.a@example.org", "password": "(placeholder)", "preferredLanguage": "ar"}
  < 201 {"role": "candidate", "preferredLanguage": "ar"}
  ! 422 validation-failed {"errors": [{"pointer": "#/email", "reason": "format"}]}
~~~

CAN-01 is named "sign-in and registration" but RD04-Y draws no registration frame [F-08]. Whether an email that is already registered is revealed is open [OD-26].

#### CT-AUTH-03 · Session and organization

**Actor** recruiter, admin · **Screens** REC-01 F1 ADM-01 F1 KIT-S2 F3 · **REQ-SYS** 002 003 004 · **Use cases** UC-REC-01 UC-ADM-01 · **Diagrams** UC-01 organization scope

~~~text
GET /session
  < 200 {"role": "recruiter", "organization": {"organizationId": "org-1", "name": "Sample Organization"}}
  ! 401 session-expired

PUT /session/organization
  > {"organizationId": "org-1"}
  < 200 {"organization": {"organizationId": "org-1", "name": "Sample Organization"}}
  ! 404 not-available
~~~

The organization comes from the session, never from a path or a body [A-60 of RD04-Y]. A selection outside the memberships is answered like a missing resource.

#### CT-AUTH-04 · Members and roles

**Actor** admin · **Screens** ADM-02 F0–F2 ADM-03 F1 F3 · **REQ-SYS** 001 002 087 088 089 091 · **Use cases** UC-ADM-01 · **Diagrams** UC-01 Manage access

~~~text
GET /members?limit=25
  < 200 {
          "items": [
            {"memberId": "mem-1", "displayName": "Member A", "role": "ADMIN", "status": "ACTIVE"},
            {
              "memberId": "mem-3",
              "displayName": "Member C",
              "role": "RECRUITER",
              "status": "INVITED",
              "invitationExpiresAt": "2026-11-12T09:00:00Z"
            },
            {"memberId": "mem-4", "displayName": "Member D", "role": "RECRUITER", "status": "INVITATION_EXPIRED"}
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available

PUT /members/{memberId}/role
  > {"role": "ADMIN"}
  < 200 {"memberId": "mem-2", "role": "ADMIN", "effectiveAt": "2026-11-06T09:30:00Z", "auditEventId": "aud-5"}
  ! 409 last-admin

POST /members/{memberId}/deactivation
  < 200 {"memberId": "mem-2", "status": "DEACTIVATED", "openSessionsEnded": 2, "auditEventId": "aud-6"}
  ! 409 last-admin

DELETE /members/{memberId}
  < 204
  ! 409 last-admin
~~~

Member rows carry no candidate evidence or interview content [REQ-SYS-091]. A change takes effect at once and ends the member's open sessions; the audit event is created in the same call.

#### CT-AUTH-05 · Invitations to join

**Actor** admin; invitee · **Screens** ADM-03 F0 F2 ADM-02 F0 F2 · **REQ-SYS** 002 087 · **Use cases** UC-ADM-01

~~~text
POST /members/invitations
  Idempotency-Key: <key>
  > {"email": "member.c@example.org", "role": "RECRUITER"}
  < 201 {"memberId": "mem-3", "status": "INVITED", "invitationExpiresAt": "2026-11-12T09:00:00Z"}
  ! 422 validation-failed {"errors": [{"pointer": "#/email", "reason": "format"}]}

POST /members/{memberId}/invitation/resend
  < 200 {"status": "INVITED", "invitationExpiresAt": "2026-11-13T09:00:00Z"}
  ! 409 invalid-state {"currentStatus": "ACTIVE"}

DELETE /members/{memberId}/invitation
  < 204
  ! 404 not-available

POST /members/invitations/acceptance
  > {"token": "(one-time value from the invitation email)"}
  < 200 {"role": "RECRUITER", "organization": {"organizationId": "org-1", "name": "Sample Organization"}}
  ! 409 invitation-expired
  ! 404 not-available
~~~

The acceptance call has no wireframe: UC-ADM-01 M3 points to SCR-ADM-02, which is the Admin's list [F-07]. The token is an assumption [A-89].

### 6.2 Jobs and applications

#### CT-JOB-01 · Read a job posting

**Actor** candidate · **Screens** CAN-02 F0 F1 · **REQ-SYS** 013 014 · **Use cases** UC-CAN-05 · **Diagrams** CL-01A JobVersion, Requirement

~~~text
GET /jobs/{jobId}
  < 200 (open) {
                 "jobId": "job-1",
                 "jobVersionId": "jv-2",
                 "versionNumber": 2,
                 "publishedAt": "2026-11-01T09:00:00Z",
                 "locale": "en",
                 "title": "Sample job",
                 "description": "[job description]",
                 "requirements": [{"requirementId": "rq-1", "criterion": "SQL experience"}, {"requirementId": "rq-2", "criterion": "REST API development"}],
                 "acceptingApplications": true
               }
  < 200 (closed) {"jobId": "job-2", "acceptingApplications": false}
  ! 404 not-available
~~~

A closed job returns no description, because a job is offered only while it is published and open [REQ-SYS-013]. The candidate view omits `mandatory` [A-90]. An unpublished job is answered like a missing one.

#### CT-JOB-02 · Job list and closing

**Actor** recruiter · **Screens** REC-03 F0–F2 · **REQ-SYS** 032 037 · **Use cases** UC-REC-01 · **Diagrams** CL-01A JobVersion

~~~text
GET /jobs
  < 200 {
          "items": [
            {
              "jobId": "job-1",
              "title": "Sample job A",
              "status": "PUBLISHED",
              "currentVersion": {"jobVersionId": "jv-3", "number": 3, "publishedAt": "2026-11-06T09:00:00Z"},
              "applicationsByVersion": [{"number": 2, "count": 4}, {"number": 3, "count": 2}]
            },
            {
              "jobId": "job-2",
              "title": "Sample job B",
              "status": "CLOSED",
              "currentVersion": {"jobVersionId": "jv-5", "number": 1, "publishedAt": "2026-10-20T09:00:00Z"},
              "applicationsByVersion": [{"number": 1, "count": 3}]
            }
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available

POST /jobs/{jobId}/closure
  < 200 {"jobId": "job-2", "status": "CLOSED", "closedAt": "2026-11-06T09:30:00Z", "existingApplications": 3}
  ! 404 not-available
~~~

Closing repeats safely and changes no existing application [REQ-SYS-037]. `applicationsByVersion` feeds the version history.

#### CT-JOB-03 · Job draft

**Actor** recruiter · **Screens** REC-04 F0 F2 REC-03 F0 · **REQ-SYS** 032 033 034 035 036 · **Use cases** UC-REC-01 · **Diagrams** CL-01A JobVersion, Requirement

~~~text
POST /jobs
  > {
      "title": "Sample job",
      "locale": "en",
      "description": "[job description]",
      "requirements": [{"criterion": "SQL experience", "mandatory": true}, {"criterion": "REST API development", "mandatory": false}]
    }
  < 201 {
          "jobId": "job-1",
          "draft": {"revision": 1, "basedOnVersion": null},
          "requirements": [{"requirementId": "rq-1"}, {"requirementId": "rq-2"}]
        }
    ETag: "draft-1"
  ! 400 invalid-request

PUT /jobs/{jobId}/draft
  If-Match: "draft-1"
  > (same members as the POST body; an existing requirementId keeps that requirement)
  < 200 {"draft": {"revision": 2, "basedOnVersion": 2}}
    ETag: "draft-2"
  ! 412 version-mismatch {"currentVersion": "\"draft-3\""}
  ! 428 precondition-required

DELETE /jobs/{jobId}/draft
  < 204
  ! 404 not-available
~~~

Saving a draft never validates completeness; `CT-JOB-04` does. The mandatory-flag explanation [REQ-SYS-034] and the no-evidence preview [REQ-SYS-035] are fixed screen copy and need no call.

#### CT-JOB-04 · Review and publish a job

**Actor** recruiter · **Screens** REC-05 F0 F1 REC-04 F1 · **REQ-SYS** 032 033 036 037 · **Use cases** UC-REC-01 · **Diagrams** CL-01A JobVersion.publish()

~~~text
GET /jobs/{jobId}/draft/review
  < 200 {
          "draft": {"revision": 3},
          "newVersionNumber": 3,
          "basedOnVersion": 2,
          "effectOnApplications": {"stayOnEarlierVersions": 4, "byVersion": [{"number": 2, "count": 4}]}
        }
  ! 409 draft-incomplete
    {
      "type": "https://example.net/problems/draft-incomplete",
      "title": "Draft incomplete",
      "status": 409,
      "detail": "The job draft cannot be reviewed or published yet.",
      "reference": "R-66DF2D",
      "errors": [{"pointer": "#/title", "reason": "required"}, {"pointer": "#/requirements", "reason": "min-items"}]
    }

POST /jobs/{jobId}/publication
  If-Match: "draft-3"
  Idempotency-Key: <key>
  < 201 {"jobVersionId": "jv-3", "versionNumber": 3, "publishedAt": "2026-11-06T09:00:00Z", "earlierApplicationsUnchanged": 4}
  ! 412 version-mismatch {"currentVersion": "\"draft-4\""}
  ! 409 draft-incomplete {"errors": [{"pointer": "#/requirements/1/criterion", "reason": "empty"}]}
~~~

Publishing creates an immutable job version; earlier applications keep the version they targeted [REQ-SYS-036].

#### CT-APP-01 · Start an application

**Actor** candidate · **Screens** CAN-02 F0–F2 · **REQ-SYS** 013 014 · **Use cases** UC-CAN-05 · **Diagrams** CL-01A Application, JobVersion

~~~text
POST /applications
  Idempotency-Key: <key>
  > {"jobId": "job-1", "jobVersionId": "jv-2"}
  < 201 {"applicationId": "app-1", "jobId": "job-1", "jobVersionId": "jv-2", "status": "DRAFT", "submittedAt": null}
  ! 409 job-closed
  ! 409 job-version-changed {"boundJobVersion": 2, "currentJobVersion": 3}
  ! 404 not-available
~~~

The application is bound to the job version the candidate saw [REQ-SYS-014]. `DRAFT` is a proposed value: the vocabulary of RD03-Y section 5.6 has no status before submission [F-02].

#### CT-APP-02 · Review and submit an application

**Actor** candidate · **Screens** CAN-08 F0–F3 · **REQ-SYS** 007 014 031 036 038 039 041 · **Use cases** UC-CAN-06 · **Diagrams** ACT-01 "Submit reviewed application"; CL-01A Application.submit()

~~~text
GET /applications/{applicationId}/submission
  < 200 (ready) {
                  "job": {"jobVersionId": "jv-2", "versionNumber": 2, "title": "Sample job"},
                  "resumeVersion": {"resumeVersionId": "rv-1", "versionNumber": 1, "profileConfirmedAt": "2026-11-05T09:20:00Z"},
                  "consents": {"CM-01": "GRANTED"},
                  "sharedWithRecruiter": ["profile", "resume-file"],
                  "canSubmit": true,
                  "blockers": []
                }
  < 200 (blocked) {"canSubmit": false, "blockers": ["resume-not-ready", "consent-cm01-missing"]}
  < 200 (job revised) {
                        "job": {"versionNumber": 2, "currentVersionNumber": 3},
                        "canSubmit": true,
                        "blockers": [],
                        "acknowledgementRequired": true
                      }
  ! 404 not-available

POST /applications/{applicationId}/submission
  Idempotency-Key: <key>
  > {"resumeVersionId": "rv-1", "jobVersionId": "jv-2"}
  < 201 {
          "applicationId": "app-1",
          "status": "SUBMITTED",
          "submittedAt": "2026-11-05T10:40:00Z",
          "resumeVersionId": "rv-1",
          "jobVersionId": "jv-2"
        }
  ! 409 submission-blocked
    {
      "type": "https://example.net/problems/submission-blocked",
      "title": "Submission blocked",
      "status": 409,
      "detail": "The application cannot be submitted yet.",
      "reference": "R-7157C5",
      "reasons": ["resume-not-ready", "consent-cm01-missing"]
    }
  ! 409 job-version-changed {"boundJobVersion": 2, "currentJobVersion": 3}
  ! 409 job-closed
  ! 503 service-unavailable
~~~

Submission needs a Ready, confirmed resume version, an open job and a granted CM-01 [REQ-SYS-038]; the record keeps time, resume version and job version [REQ-SYS-039]. Matching then starts inside the system and returns nothing to the candidate [REQ-SYS-043]. After a job revision, the same request with `"acknowledgeJobVersion": 3` submits on the bound version 2 [A-94; F-01]. A failed call creates no partial application and can be repeated with the same key.

#### CT-APP-03 · My applications and withdrawal

**Actor** candidate · **Screens** CAN-09 F0–F3 · **REQ-SYS** 040 041 042 057 · **Use cases** UC-CAN-07 UC-REC-06 · **Diagrams** CL-01A ApplicationStatus; handoffs H-01, H-05, H-06 of RD04-Y

~~~text
GET /me/applications
  < 200 {
          "items": [
            {
              "applicationId": "app-1",
              "jobTitle": "Sample job",
              "jobVersion": 2,
              "status": "INTERVIEW_INVITED",
              "submittedAt": "2026-11-05T10:40:00Z",
              "invitation": {"sessionId": "ses-1", "status": "INVITED"}
            },
            {"applicationId": "app-2", "jobTitle": "Sample job B", "jobVersion": 1, "status": "DRAFT", "nextStep": "UPLOAD_CV"},
            {
              "applicationId": "app-3",
              "jobTitle": "Sample job C",
              "jobVersion": 1,
              "status": "DECIDED",
              "submittedAt": "2026-11-02T10:00:00Z"
            },
            {"applicationId": "app-4", "jobTitle": "Sample job D", "jobVersion": 1, "status": "WITHDRAWN"}
          ],
          "page": {"nextCursor": null}
        }
  ! 401 session-expired

POST /applications/{applicationId}/withdrawal
  < 200 {"applicationId": "app-1", "status": "WITHDRAWN", "withdrawnAt": "2026-11-05T10:55:00Z"}
  ! 404 not-available
~~~

`DECIDED` is shown to the candidate as "Decision recorded"; the response carries no outcome, rationale, rank, evidence label or other applicant [REQ-SYS-040, 041]. A matching that is pending or failed leaves the status unchanged [UC-CAN-07 A1]. Withdrawal repeats safely.

### 6.3 Profiles

#### CT-CV-01 · Upload a CV and list resume versions

**Actor** candidate · **Screens** CAN-04 F0–F3 CAN-05 F0 CAN-08 F0 · **REQ-SYS** 007 015 016 017 018 023 031 038 · **Use cases** UC-CAN-02 UC-CAN-06 · **Diagrams** SEQ-01; DEP-01 input bounds; CL-01A ResumeVersion

~~~text
POST /applications/{applicationId}/resume-versions
  Content-Type: multipart/form-data
  Idempotency-Key: <key>
  > file: cv.pdf (application/pdf, 1.2 MB, 3 pages)
  < 202 {
          "resumeVersionId": "rv-1",
          "versionNumber": 1,
          "fileName": "cv.pdf",
          "createdAt": "2026-11-05T09:10:00Z",
          "processing": {"processingId": "prc-1", "displayCode": "PROC-0042", "state": "QUEUED"}
        }
    Location: /processing-jobs/{processingId}
  ! 403 consent-required {"module": "CM-01", "consentStatus": "NOT_ASKED"}
  ! 413 file-too-large
    {
      "type": "https://example.net/problems/file-too-large",
      "title": "File too large",
      "status": 413,
      "detail": "The file is larger than the limit. Nothing was uploaded.",
      "reference": "R-D6F4BC",
      "limitBytes": 5242880,
      "actualBytes": 7340032
    }
  ! 415 file-type-unsupported {"accepted": ["application/pdf"]}
  ! 422 pdf-too-many-pages {"limitPages": 5, "actualPages": 8}
  ! 422 text-too-long {"limitCharacters": 20000, "actualCharacters": 31500}
  ! 422 pdf-scanned

GET /applications/{applicationId}/resume-versions
  < 200 {
          "items": [
            {
              "resumeVersionId": "rv-1",
              "versionNumber": 1,
              "fileName": "cv.pdf",
              "createdAt": "2026-11-05T09:10:00Z",
              "processingState": "READY",
              "profileConfirmedAt": "2026-11-05T09:20:00Z"
            },
            {
              "resumeVersionId": "rv-2",
              "versionNumber": 2,
              "fileName": "cv2.pdf",
              "createdAt": "2026-11-06T09:30:00Z",
              "processingState": "FAILED",
              "profileConfirmedAt": null
            }
          ]
        }
  ! 404 not-available
~~~

Checks run before anything is stored: a rejected file creates no resume version and is never truncated [REQ-SYS-015]. Limits come from DEP-01 [A-91]. `202` names the status resource and the job identifier [SEQ-01]. A replacement is a new version; earlier ones stay unchanged [REQ-SYS-023].

#### CT-CV-02 · Processing status

**Actor** candidate · **Screens** CAN-05 F0–F3 CAN-17 F0 · **REQ-SYS** 018 019 020 021 022 · **Use cases** UC-CAN-02 UC-CAN-03 · **Diagrams** SEQ-01 "request processing status"; ST-01

~~~text
GET /processing-jobs/{processingId}
  < 200 (queued, one automatic retry) {"processingId": "prc-1", "resumeVersionId": "rv-1", "state": "QUEUED", "retrying": true}
  < 200 (processing) {"processingId": "prc-1", "resumeVersionId": "rv-1", "state": "PROCESSING", "retrying": false}
  < 200 (ready) {"processingId": "prc-1", "resumeVersionId": "rv-1", "state": "READY", "profileVersion": 1}
  < 200 (failed) {"processingId": "prc-1", "resumeVersionId": "rv-2", "state": "FAILED", "failureCategory": "NO_READABLE_TEXT"}
  ! 404 not-available
~~~

Four states only; `retrying` is true only on QUEUED after one recoverable failure [REQ-SYS-021]. Failed is a state, not an HTTP error; `failureCategory` is `UNSUPPORTED_OR_OVERSIZED_FILE`, `NO_READABLE_TEXT` or `TEMPORARY_SERVICE_PROBLEM` [REQ-SYS-022]; message text: RD04-Y §8.2. The call answers within 2 s after the file bytes arrive [REQ-SYS-018].

#### CT-PRF-01 · Profile review and confirmation

**Actor** candidate · **Screens** CAN-06 F0–F3 · **REQ-SYS** 010 024 025 026 031 093 · **Use cases** UC-CAN-03 · **Diagrams** CL-01A EvidenceSpan, ResumeVersion

~~~text
GET /resume-versions/{resumeVersionId}/profile
  < 200 {
          "profileVersion": 2,
          "counts": {"total": 4, "unknown": 1, "validationFailed": 1},
          "items": [
            {
              "itemId": "it-1",
              "kind": "EXPERIENCE",
              "value": "REST API development",
              "status": "FOUND",
              "evidence": {
                "evidenceId": "ev-1",
                "page": 1,
                "offsets": {"start": 120, "end": 173},
                "quote": "Built REST APIs in Python and deployed them on Linux.",
                "lang": "en",
                "sourceValid": true
              }
            },
            {"itemId": "it-3", "kind": "SKILL", "value": null, "status": "UNKNOWN", "evidence": null},
            {
              "itemId": "it-4",
              "kind": "SKILL",
              "value": "Docker",
              "status": "VALIDATION_FAILED",
              "evidence": {"evidenceId": "ev-3", "page": 2, "quote": "[quote that failed validation]", "sourceValid": false}
            },
            {
              "itemId": "it-5",
              "kind": "EXPERIENCE",
              "value": "Django and PostgreSQL project",
              "status": "FOUND",
              "evidence": {
                "evidenceId": "ev-4",
                "page": 2,
                "offsets": {"start": 40, "end": 84},
                "quote": "عملت مع Django و PostgreSQL في مشروع تجريبي.",
                "lang": "mixed",
                "segments": [
                  {"text": "عملت مع ", "lang": "ar"},
                  {"text": "Django", "lang": "en"},
                  {"text": " و ", "lang": "ar"},
                  {"text": "PostgreSQL", "lang": "en"},
                  {"text": " في مشروع تجريبي.", "lang": "ar"}
                ],
                "sourceValid": true
              }
            }
          ]
        }
  ! 409 resume-not-ready {"processingState": "PROCESSING"}
  ! 403 consent-required {"module": "CM-01", "consentStatus": "WITHDRAWN"}
  ! 404 not-available

POST /resume-versions/{resumeVersionId}/profile/confirmation
  If-Match: "profile-2"
  < 200 {"confirmedAt": "2026-11-05T09:20:00Z", "profileVersion": 2, "unknownCount": 1}
  ! 412 version-mismatch {"currentVersion": "\"profile-3\""}
  ! 409 resume-not-ready {"processingState": "FAILED"}
~~~

A quote keeps its original text; `lang` is `ar`, `en` or `mixed`, and a mixed quote carries `segments` [REQ-SYS-026, 093; A-92]. Unknown items stay allowed at confirmation [UC-CAN-03 A3]. A failed quote returns `sourceValid: false`, never a positive result [REQ-SYS-025].

#### CT-PRF-02 · Profile item editor

**Actor** candidate · **Screens** CAN-07 F0–F3 CAN-06 F0 · **REQ-SYS** 025 026 027 028 029 030 · **Use cases** UC-CAN-04 · **Diagrams** CL-01A EvidenceSpan.validateQuote(); RD03-Y A-38

~~~text
GET /resume-versions/{resumeVersionId}/pages/{page}
  < 200 {"page": 2, "pageCount": 3, "text": "[text of page 2 as extracted]", "lang": "en"}
  ! 404 not-available

PUT /resume-versions/{resumeVersionId}/profile/items/{itemId}
  If-Match: "profile-2"
  > {"value": "SQL", "source": {"page": 2, "offsets": {"start": 310, "end": 352}}}
  < 200 {
          "profileVersion": 3,
          "savedAt": "2026-11-05T10:32:00Z",
          "item": {
            "itemId": "it-3",
            "kind": "SKILL",
            "value": "SQL",
            "status": "CANDIDATE_PROVIDED",
            "evidence": {
              "evidenceId": "ev-5",
              "page": 2,
              "offsets": {"start": 310, "end": 352},
              "quote": "[quote at the selected span]",
              "sourceValid": true
            }
          },
          "original": {"value": null, "status": "UNKNOWN"}
        }
    ETag: "profile-3"
  ! 422 span-invalid
  ! 412 version-mismatch {"currentVersion": "\"profile-4\""}
  ! 428 precondition-required
  ! 503 service-unavailable

POST /resume-versions/{resumeVersionId}/profile/items
  If-Match: "profile-3"
  > {"kind": "SKILL", "value": "Docker"}
  < 201 {
          "profileVersion": 4,
          "item": {"itemId": "it-6", "kind": "SKILL", "value": "Docker", "status": "CANDIDATE_PROVIDED", "evidence": null}
        }
  ! 412 version-mismatch {"currentVersion": "\"profile-5\""}

DELETE /resume-versions/{resumeVersionId}/profile/items/{itemId}
  If-Match: "profile-4"
  < 200 {"profileVersion": 5}
  ! 412 version-mismatch {"currentVersion": "\"profile-6\""}

POST /resume-versions/{resumeVersionId}/profile/items/{itemId}/restoration
  If-Match: "profile-5"
  < 200 {"profileVersion": 6, "item": {"itemId": "it-3", "kind": "SKILL", "value": null, "status": "UNKNOWN", "evidence": null}}
  ! 412 version-mismatch {"currentVersion": "\"profile-7\""}
~~~

Every change creates a new profile version and leaves earlier versions and results unchanged [REQ-SYS-027]. A typed value is `CANDIDATE_PROVIDED` with no quote unless a selected span is validated as new evidence on the same resume version [REQ-SYS-028, 029]. The save reports time and version at once [REQ-SYS-030]; the server invalidates derived inputs [REQ-SYS-084]. The offset unit is open [A-93].

### 6.4 Matching and decisions

#### CT-MAT-01 · Ranked applicant list

**Actor** recruiter · **Screens** REC-06 F0 F1 · **REQ-SYS** 011 042 044 045 046 047 048 053 · **Use cases** UC-REC-02 · **Diagrams** CL-01A MatchSnapshot; DEP-01 cached ranking p95 < 3 s

~~~text
GET /jobs/{jobId}/applicants?sort=rank
  < 200 {
          "basis": "[ranking basis statement]",
          "counts": {"all": 6, "needsReview": 2},
          "items": [
            {
              "applicationId": "app-1",
              "displayName": "Applicant A",
              "jobVersion": 2,
              "rank": 1,
              "snapshotId": "snap-1",
              "counts": {"SUPPORTED": 3, "UNSUPPORTED": 0, "CONTRADICTED": 0, "INSUFFICIENT": 1},
              "mandatoryNotAssessed": 1,
              "needsReview": true,
              "matching": "READY"
            },
            {"applicationId": "app-3", "displayName": "Applicant C", "jobVersion": 2, "matching": "PENDING"},
            {"applicationId": "app-4", "displayName": "Applicant D", "jobVersion": 2, "matching": "FAILED"},
            {"applicationId": "app-5", "displayName": "Applicant E", "jobVersion": 2, "flag": "CONSENT_WITHDRAWN"},
            {"applicationId": "app-6", "displayName": "Applicant F", "jobVersion": 2, "flag": "WITHDRAWN"}
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available
~~~

Rank and counts come from the saved snapshot; `sort`, `filter=needs-review` and paging change only the view [REQ-SYS-045, 047]. Pending, failed, withdrawn and consent-withdrawn applicants stay listed without results [REQ-SYS-011, 044]. No score or probability field [REQ-SYS-048]. An empty job returns `"items": []`.

#### CT-MAT-02 · Evidence review and notes

**Actor** recruiter · **Screens** REC-07 F0–F2 · **REQ-SYS** 011 025 026 028 049 050 051 052 053 093 · **Use cases** UC-REC-03 UC-REC-02 · **Diagrams** CL-01A RequirementResult, EvidenceState

~~~text
GET /applications/{applicationId}/evidence
  < 200 {
          "basis": {"jobVersion": 2, "currentJobVersion": 3, "resumeVersion": 1, "snapshotId": "snap-1", "createdAt": "2026-11-05T11:00:00Z"},
          "requirements": [
            {
              "requirementId": "rq-1",
              "criterion": "SQL experience",
              "mandatory": true,
              "evidenceState": "SUPPORTED",
              "sourceValid": true,
              "evidence": [
                {
                  "evidenceId": "ev-6",
                  "quote": "Wrote SQL queries and views for reporting.",
                  "page": 2,
                  "context": "[surrounding text]",
                  "lang": "en",
                  "candidateProvided": false
                }
              ],
              "notes": [{"noteId": "note-1", "text": "[reviewer note]", "disagrees": false}]
            },
            {
              "requirementId": "rq-2",
              "criterion": "REST API development",
              "mandatory": false,
              "evidenceState": "INSUFFICIENT",
              "sourceValid": true,
              "reason": "[reason where known]",
              "evidence": []
            },
            {
              "requirementId": "rq-3",
              "criterion": "Linux deployment",
              "mandatory": true,
              "evidenceState": "INSUFFICIENT",
              "sourceValid": false,
              "evidence": [{"evidenceId": "ev-7", "quote": "[quote that failed validation]", "page": 1, "candidateProvided": false}]
            }
          ]
        }
  < 200 (consent withdrawn) {"basis": {"jobVersion": 2, "snapshotId": "snap-1"}, "resultsHidden": "CONSENT_WITHDRAWN"}
  ! 404 not-available

POST /applications/{applicationId}/requirements/{requirementId}/notes
  Idempotency-Key: <key>
  > {"text": "[reviewer note]", "disagrees": true}
  < 201 {"noteId": "note-2", "recordedAt": "2026-11-06T09:30:00Z"}
  ! 422 validation-failed {"errors": [{"pointer": "#/text", "reason": "required"}]}
~~~

`sourceValid` is separate from `evidenceState`; the server never returns SUPPORTED when it is false [REQ-SYS-049, 050; OD-23]. Results belong to the job version in `basis` and are never recomputed silently [REQ-SYS-053]. A candidate-typed value is flagged and has no quote [REQ-SYS-028]. Notes are stored apart from model output [A-37 of RD03-Y].

#### CT-MAT-03 · CV source at a quoted span

**Actor** recruiter · **Screens** REC-08 F0–F2 REC-13 F1 ADM-06 F1 · **REQ-SYS** 026 051 083 · **Use cases** UC-REC-03 UC-ADM-02 UC-ADM-04 · **Diagrams** CL-01A EvidenceSpan; Plan section 3 retention row

~~~text
GET /applications/{applicationId}/evidence/{evidenceId}/source
  < 200 (available) {
                      "sourceStatus": "AVAILABLE",
                      "page": 2,
                      "pageCount": 5,
                      "text": "[page text]",
                      "highlight": {"start": 140, "end": 181},
                      "lang": "en"
                    }
  < 200 (file removed, extracted text kept) {
                                              "sourceStatus": "REMOVED",
                                              "removedAt": "2026-11-06T08:00:00Z",
                                              "removedScope": ["file"],
                                              "quote": "Wrote SQL queries and views for reporting."
                                            }
  < 200 (all removed) {"sourceStatus": "REMOVED", "removedAt": "2026-11-06T08:00:00Z", "removedScope": ["file", "extracted-text"]}
  < 200 (unreadable) {"sourceStatus": "UNREADABLE", "page": 2, "fallback": "PAGE_IMAGE"}
  ! 404 not-available
~~~

A removal record shows that a source was removed and keeps no private text [REQ-SYS-083]. `quote` appears only while the extracted text is still held, which RD03-Y UC-REC-03 A4 ("quote text only") allows because retention is set per data class [REQ-SYS-085; F-05].

#### CT-DEC-01 · Decision context and decision

**Actor** recruiter · **Screens** REC-12 F0–F2 · **REQ-SYS** 011 056 072 075 076 077 078 · **Use cases** UC-REC-06 · **Diagrams** ACT-01 "Recruiter records decision"; handoff H-06 of RD04-Y

~~~text
GET /applications/{applicationId}/decision-context
  < 200 {
          "basis": {
            "resumeVersionId": "rv-1",
            "jobVersionId": "jv-2",
            "snapshotId": "snap-1",
            "session": {"sessionId": "ses-1", "rubricVersionId": "rub-2"}
          },
          "evidenceSummary": {"SUPPORTED": 3, "UNSUPPORTED": 0, "CONTRADICTED": 0, "INSUFFICIENT": 1},
          "interviewSummary": {"answered": 10, "assessed": 9},
          "hiddenModules": [],
          "previousDecisions": [{"decisionId": "dec-1", "outcome": "ON_HOLD", "recordedAt": "2026-11-05T12:00:00Z", "rationale": "[rationale]"}]
        }
  ! 404 not-available

POST /applications/{applicationId}/decisions
  Idempotency-Key: <key>
  > {"outcome": "HIRE", "rationale": "[rationale]"}
  < 201 {
          "decisionId": "dec-2",
          "outcome": "HIRE",
          "recordedAt": "2026-11-06T09:30:00Z",
          "basis": {"resumeVersionId": "rv-1", "jobVersionId": "jv-2", "snapshotId": "snap-1", "sessionId": "ses-1", "rubricVersionId": "rub-2"},
          "candidateStatus": "DECIDED"
        }
  ! 422 validation-failed {"errors": [{"pointer": "#/outcome", "reason": "one-of HIRE, NOT_HIRE, ON_HOLD"}]}
  ! 503 service-unavailable
~~~

Only the recruiter's call records a decision; no model output, score or ranking sets `outcome` [REQ-SYS-078]. A new decision is added and earlier ones stay in `previousDecisions` [REQ-SYS-077]. Without an interview `session` is `null` [REQ-SYS-056]. A withdrawn module appears in `hiddenModules` and its results are omitted [REQ-SYS-011]. A repeated call with the same key creates no duplicate.

#### CT-DEC-02 · Application timeline

**Actor** recruiter · **Screens** REC-13 F0 F1 · **REQ-SYS** 040 077 · **Use cases** UC-REC-06 · **Diagrams** ACT-01

~~~text
GET /applications/{applicationId}/timeline
  < 200 {
          "items": [
            {"at": "2026-11-05T10:40:00Z", "type": "APPLICATION_SUBMITTED"},
            {"at": "2026-11-05T12:00:00Z", "type": "DECISION_RECORDED", "decisionId": "dec-1", "outcome": "ON_HOLD"},
            {"at": "2026-11-06T08:00:00Z", "type": "SOURCE_REMOVED", "removedScope": ["file"]}
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available
~~~

Events are metadata; a removed source shows only the removal record [REQ-SYS-083].

### 6.5 Interviews

#### CT-ITV-01 · Templates, invitations and "no interview needed"

**Actor** recruiter · **Screens** REC-09 F0–F2 · **REQ-SYS** 011 042 054 055 056 · **Use cases** UC-REC-04 · **Diagrams** ACT-01 invitation branches; CL-01B InterviewSession; handoff H-05 of RD04-Y

~~~text
GET /interview-templates?jobId={jobId}
  < 200 (one approved template) {
                                  "items": [
                                    {
                                      "templateId": "tpl-1",
                                      "name": "Sample template",
                                      "questionCount": 10,
                                      "rubricVersionId": "rub-2",
                                      "approvedAt": "2026-10-20T09:00:00Z"
                                    }
                                  ]
                                }
  < 200 (none approved) {"items": []}
  ! 404 not-available

POST /jobs/{jobId}/interviews
  Idempotency-Key: <key>
  > {"templateId": "tpl-1", "applicationIds": ["app-2", "app-5"]}
  < 200 {
          "results": [
            {"applicationId": "app-2", "outcome": "INVITED", "sessionId": "ses-2"},
            {"applicationId": "app-5", "outcome": "BLOCKED", "reason": "consent-withdrawn"}
          ]
        }
  ! 422 validation-failed {"errors": [{"pointer": "#/templateId", "reason": "not-approved"}]}

POST /applications/{applicationId}/interview-not-needed
  < 201 {"applicationId": "app-1", "recordedAt": "2026-11-06T09:30:00Z"}
  ! 404 not-available
~~~

One approved template per invitation; the session fixes question versions, order and rubric version [REQ-SYS-055]. A batch reports each applicant: `BLOCKED` carries `consent-withdrawn` or `application-withdrawn` and the others still succeed [UC-REC-04 A3, A5]. The candidate is notified in the application and by email [REQ-SYS-057].

#### CT-ITV-02 · Interview tracker and cancellation

**Actor** recruiter · **Screens** REC-10 F0 F1 · **REQ-SYS** 010 011 012 054 057 059 060 074 · **Use cases** UC-REC-05 UC-REC-04 UC-CAN-08 UC-CAN-01 · **Diagrams** CL-01B SessionStatus; handoffs H-02, H-04, H-05 of RD04-Y

~~~text
GET /interviews?jobId={jobId}&limit=25
  < 200 {
          "items": [
            {"sessionId": "ses-2", "displayName": "Applicant B", "jobTitle": "Sample job A", "status": "INVITED", "canCancel": true},
            {"sessionId": "ses-6", "displayName": "Applicant F", "jobTitle": "Sample job A", "status": "DECLINED", "reasonGiven": false},
            {
              "sessionId": "ses-7",
              "displayName": "Applicant G",
              "jobTitle": "Sample job A",
              "status": "CLOSED",
              "closedBecause": "CONSENT_WITHDRAWN"
            }
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available

POST /interviews/{sessionId}/cancellation
  < 200 {"sessionId": "ses-2", "status": "CLOSED", "closedBecause": "CANCELLED_BY_RECRUITER"}
  ! 409 invalid-state {"currentStatus": "IN_PROGRESS"}
~~~

`status` is one of INVITED, ACCEPTED, IN_PROGRESS, INTERRUPTED, SUBMITTED, DECLINED, CLOSED [RD03-Y section 5.6]. Only an unstarted invitation can be cancelled [REQ-SYS-054]; closing a started session has no screen [F-06]. A decline shows no reason unless the candidate gave one [REQ-SYS-059].

#### CT-ITV-03 · Invitation, briefing and response

**Actor** candidate · **Screens** CAN-10 F0–F2 CAN-11 F0 F1 CAN-14 F0 · **REQ-SYS** 005 010 054 057 058 059 060 · **Use cases** UC-CAN-08 UC-CAN-09 · **Diagrams** CL-01B InterviewSession; UC-01 "Respond to interview"; handoffs H-02, H-05 of RD04-Y

~~~text
GET /interviews/{sessionId}
  < 200 (invited) {
                    "sessionId": "ses-1",
                    "applicationId": "app-1",
                    "status": "INVITED",
                    "jobTitle": "Sample job",
                    "disclosure": {
                      "medium": "text",
                      "language": "en",
                      "questionCount": 10,
                      "answersEditableUntilSubmit": true,
                      "scoring": "fixed rubric, reviewed by the recruiter",
                      "visibleTo": "recruiters of the organization",
                      "retentionDays": 180
                    }
                  }
  < 200 (cancelled) {"sessionId": "ses-2", "status": "CLOSED", "closedBecause": "CANCELLED_BY_RECRUITER"}
  < 200 (interrupted) {"sessionId": "ses-3", "status": "INTERRUPTED", "resume": {"order": 3, "draftSavedAt": "2026-11-05T10:30:00Z"}}
  ! 404 not-available

POST /interviews/{sessionId}/response
  > {"decision": "ACCEPT"}
  < 200 {"sessionId": "ses-1", "status": "ACCEPTED"}
  ! 403 consent-required {"module": "CM-02", "consentStatus": "NOT_ASKED"}
  ! 409 session-closed {"closedBecause": "CANCELLED_BY_RECRUITER"}
  ! 409 invalid-state {"currentStatus": "DECLINED"}

POST /interviews/{sessionId}/response
  > {"decision": "DECLINE"}
  < 200 {"sessionId": "ses-1", "status": "DECLINED", "recruiterNotified": true, "reasonShared": false}
  ! 409 session-closed {"closedBecause": "CANCELLED_BY_RECRUITER"}
~~~

`disclosure` carries the items of REQ-SYS-058 with placeholder values [A-79]. Accepting needs CM-02, so the client runs CT-CNS-01 first [REQ-SYS-005]. A reason is optional and passed on only if given. A decline leaves the application and CV evidence unchanged [REQ-SYS-060]. The session is `sessionId` on every route [A-95].

#### CT-ITV-04 · Start and resume a session

**Actor** candidate · **Screens** CAN-11 F0 F1 CAN-14 F0–F2 CAN-12 F0 · **REQ-SYS** 010 054 061 065 · **Use cases** UC-CAN-09 · **Diagrams** CL-01B SessionStatus

~~~text
POST /interviews/{sessionId}/start
  < 200 {"sessionId": "ses-1", "status": "IN_PROGRESS", "order": 1, "total": 10}
  ! 409 session-closed {"closedBecause": "CONSENT_WITHDRAWN"}
  ! 409 invalid-state {"currentStatus": "SUBMITTED"}

POST /interviews/{sessionId}/resume
  < 200 {"sessionId": "ses-3", "status": "IN_PROGRESS", "order": 3, "draftSavedAt": "2026-11-05T10:30:00Z", "draftRestored": true}
  ! 409 session-closed {"closedBecause": "CLOSED_BY_RECRUITER"}
  ! 409 invalid-state {"currentStatus": "SUBMITTED"}
~~~

Leaving a session marks it INTERRUPTED and keeps the saved draft; how the server learns of the leave is open [OD-24]. A closed session cannot be resumed [REQ-SYS-065]. There is no time limit and no automatic expiry [OD-06 of RD03-Y].

#### CT-ITV-05 · Question and draft answer

**Actor** candidate · **Screens** CAN-12 F0–F3 CAN-14 F1 · **REQ-SYS** 010 054 061 062 063 064 066 067 071 · **Use cases** UC-CAN-09 · **Diagrams** CL-01B SessionQuestion, QuestionVersion, Answer.saveDraft()

~~~text
GET /interviews/{sessionId}/questions/{order}
  < 200 (question with draft) {
                                "order": 3,
                                "total": 10,
                                "sessionQuestionId": "sq-3",
                                "questionVersionId": "qv-3",
                                "text": "Describe a project where you used SQL.",
                                "locale": "en",
                                "draft": {"responseText": "[draft text]", "savedAt": "2026-11-05T10:30:00Z", "revision": 4}
                              }
  < 200 (language fallback) {
                              "order": 4,
                              "total": 10,
                              "questionVersionId": "qv-4",
                              "text": "[question text in English]",
                              "locale": "en",
                              "requestedLocale": "ar",
                              "draft": null
                            }
  ! 409 session-closed {"closedBecause": "CONSENT_WITHDRAWN"}
  ! 404 not-available

PUT /interviews/{sessionId}/questions/{order}/draft
  If-Match: "r4"
  > {"responseText": "[draft text]"}
  < 200 {"savedAt": "2026-11-05T10:30:00Z", "revision": 5}
    ETag: "r5"
  ! 412 version-mismatch {"currentVersion": "\"r6\""}
  ! 409 session-closed {"closedBecause": "CONSENT_WITHDRAWN"}
  ! 503 service-unavailable
~~~

The save is automatic while typing and when leaving a question; `savedAt` feeds "Saved at 10:30", a failed call feeds "Not saved" with the text kept in the page [REQ-SYS-063, 064, 066; OD-07 of RD03-Y]. After an offline period the client repeats the `PUT` [A-96]. Text is data, never instructions [REQ-SYS-071]. When the session closes the draft stays and further saves return `session-closed` [REQ-SYS-010].

#### CT-ITV-06 · Review and submit all answers

**Actor** candidate · **Screens** CAN-13 F0–F3 · **REQ-SYS** 067 068 069 070 · **Use cases** UC-CAN-09 · **Diagrams** CL-01B Answer.submit(); handoff to REC-10

~~~text
GET /interviews/{sessionId}/answers
  < 200 {
          "total": 10,
          "items": [
            {"order": 1, "questionText": "[question text]", "responseText": "[draft text]", "savedAt": "2026-11-05T10:30:00Z"},
            {"order": 7, "questionText": "[question text]", "responseText": "", "savedAt": null}
          ],
          "unanswered": [7]
        }
  ! 409 session-closed {"closedBecause": "CLOSED_BY_RECRUITER"}

POST /interviews/{sessionId}/submission
  Idempotency-Key: <key>
  > {"confirmed": true}
  < 201 {"sessionId": "ses-1", "status": "SUBMITTED", "receivedAt": "2026-11-05T10:50:00Z", "answerCount": 10}
  ! 409 already-submitted {"submittedAt": "2026-11-05T10:50:00Z"}
  ! 422 validation-failed {"errors": [{"pointer": "#/confirmed", "reason": "must-be-true"}]}
  ! 409 session-closed {"closedBecause": "CONSENT_WITHDRAWN"}
  ! 503 service-unavailable
~~~

Submission needs the explicit confirmation and is stored once: a repeat with the same key returns the stored receipt, the safe answer to "not received" [REQ-SYS-067, 068]; a repeat with a new key returns `already-submitted` [REQ-SYS-069]. No score or assessment is returned [REQ-SYS-070]. Unanswered questions: [OD-25].

#### CT-ITV-07 · Interview result and review

**Actor** recruiter · **Screens** REC-11 F0–F2 REC-12 F0 · **REQ-SYS** 011 072 073 075 · **Use cases** UC-REC-05 · **Diagrams** CL-01B AnswerAssessment; RD03-Y A-52, A-37

~~~text
GET /interviews/{sessionId}/result
  < 200 (submitted) {
                      "status": "SUBMITTED",
                      "rubricVersion": {"rubricVersionId": "rub-2", "number": 2},
                      "items": [
                        {
                          "order": 1,
                          "questionText": "[question text]",
                          "answer": {"answerId": "ans-1", "responseText": "[answer text]", "submittedAt": "2026-11-05T10:50:00Z"},
                          "assessment": {
                            "assessmentId": "asm-1",
                            "score": 3,
                            "scale": "0-4",
                            "levelDescription": "[level description]",
                            "sourceQuote": "[quote from the answer]"
                          },
                          "review": null
                        }
                      ]
                    }
  < 200 (not submitted) {"status": "IN_PROGRESS"}
  < 200 (closed) {
                   "status": "CLOSED",
                   "closedBecause": "CONSENT_WITHDRAWN",
                   "items": [{"order": 1, "questionText": "[question text]", "answer": {"responseText": "[saved text]"}, "assessment": null}]
                 }
  ! 404 not-available

PUT /interviews/{sessionId}/questions/{order}/review
  > {"agreement": "OVERRIDE", "overrideScore": 2, "note": "[reviewer note]"}
  < 200 {"reviewId": "note-3", "agreement": "OVERRIDE", "overrideScore": 2, "modelScore": 3, "recordedAt": "2026-11-06T09:30:00Z"}
  ! 422 validation-failed {"errors": [{"pointer": "#/overrideScore", "reason": "whole level 0-4"}]}
  ! 409 invalid-state {"currentStatus": "IN_PROGRESS"}
~~~

`score` is a whole level of the fixed 0 to 4 rubric with its description and quote [REQ-SYS-072; A-52 of RD03-Y]; CL-01B types it as `float` [F-04]. The review is stored apart and the model assessment stays unchanged [REQ-SYS-073]. No hiring recommendation field [REQ-SYS-075]. A session not yet submitted returns its status only; a closed one returns saved, unscored answers [REQ-SYS-010, 011].

### 6.6 Audit

#### CT-ADT-01 · Audit and processing history

**Actor** admin · **Screens** ADM-06 F0–F2 · **REQ-SYS** 022 083 088 090 091 · **Use cases** UC-ADM-04 UC-ADM-01 · **Diagrams** ST-01 attempts; Plan section 3 (Audit)

~~~text
GET /audit-events?type=DECISION,MEMBER_CHANGE&limit=25
  < 200 {
          "items": [
            {
              "auditEventId": "aud-1",
              "at": "2026-11-05T09:30:00Z",
              "type": "MEMBER_CHANGE",
              "item": "Member B · role changed",
              "result": "RECORDED"
            },
            {
              "auditEventId": "aud-2",
              "at": "2026-11-05T12:00:00Z",
              "type": "DECISION",
              "item": "Application A-17",
              "result": "DECISION_RECORDED"
            }
          ],
          "page": {"nextCursor": null}
        }
  < 200 (empty) {"items": []}
  ! 404 not-available

GET /audit-events/{auditEventId}
  < 200 (processing attempts) {
                                "auditEventId": "aud-3",
                                "type": "PROCESSING_ATTEMPT",
                                "processing": {
                                  "displayCode": "PROC-0042",
                                  "attempts": [
                                    {
                                      "attempt": 1,
                                      "state": "FAILED",
                                      "failureCategory": "TEMPORARY_SERVICE_PROBLEM",
                                      "at": "2026-11-05T09:10:30Z"
                                    },
                                    {"attempt": 2, "state": "READY", "at": "2026-11-05T09:11:10Z"}
                                  ]
                                }
                              }
  < 200 (removal record) {
                           "auditEventId": "aud-4",
                           "type": "SOURCE_REMOVAL",
                           "removal": {"removedAt": "2026-11-06T08:00:00Z", "removedScope": ["file", "extracted-text"]}
                         }
  ! 404 not-available
~~~

Types are PROCESSING_ATTEMPT, CONSENT_CHANGE, DATA_REQUEST, DECISION and MEMBER_CHANGE [REQ-SYS-090]. Entries are metadata only: no payload of any audit call has a CV text, evidence, quote or answer field [REQ-SYS-091]. A removal appears as a `SOURCE_REMOVAL` record with no private text [REQ-SYS-083].

### 6.7 No module in the Plan: consent, privacy, retention, notifications, dashboard

#### CT-CNS-01 · Consent notice and decision

**Actor** candidate · **Screens** CAN-03 F0–F3 CAN-10 F0 · **REQ-SYS** 005 006 007 008 012 059 · **Use cases** UC-CAN-01 UC-CAN-02 UC-CAN-08 · **Diagrams** SEQ-01 "upload CV + consent"; RD03-Y section 5.6 (consent)

~~~text
GET /applications/{applicationId}/consents/{module}/notice
  < 200 (first request) {
                          "module": "CM-01",
                          "noticeVersion": 3,
                          "language": "en",
                          "status": "NOT_ASKED",
                          "sections": [
                            {"id": "processed", "text": "[notice text]"},
                            {"id": "quotes", "text": "[notice text]"},
                            {"id": "recruiter-decides", "text": "[notice text]"},
                            {"id": "deletion", "text": "[notice text]"}
                          ]
                        }
  < 200 (renewal; sections as above) {
                                       "module": "CM-01",
                                       "noticeVersion": 3,
                                       "language": "en",
                                       "status": "GRANTED",
                                       "grantedNoticeVersion": 2,
                                       "renewalRequired": true
                                     }
  ! 404 not-available

PUT /applications/{applicationId}/consents/{module}
  > {"decision": "GRANTED", "noticeVersion": 3, "language": "en"}
  < 200 {
          "consentId": "con-1",
          "module": "CM-01",
          "status": "GRANTED",
          "noticeVersion": 3,
          "language": "en",
          "decidedAt": "2026-11-05T09:05:00Z"
        }
  ! 409 notice-version-changed {"module": "CM-01", "currentNoticeVersion": 4}
  ! 503 service-unavailable

PUT /applications/{applicationId}/consents/{module}
  > {"decision": "DECLINED", "noticeVersion": 3, "language": "en"}
  < 200 {"consentId": "con-2", "module": "CM-02", "status": "DECLINED", "noticeVersion": 3, "cannotDo": ["interview-acceptance"]}
  ! 409 notice-version-changed {"module": "CM-02", "currentNoticeVersion": 4}
~~~

The organization of the record is the one that owns the application's job [A-31 of RD03-Y]. The notice wording is out of scope [A-15 of RD03-Y]; `[notice text]` marks it. A decline never blocks sign-in or the other module [REQ-SYS-012]. The decision is a repeatable `PUT`; no key is needed.

#### CT-CNS-02 · Consent history and withdrawal

**Actor** candidate · **Screens** CAN-15 F0–F2 CAN-06 F3 · **REQ-SYS** 008 009 010 011 · **Use cases** UC-CAN-01 UC-CAN-08 · **Diagrams** RD03-Y section 5.6; handoffs H-03, H-04 of RD04-Y

~~~text
GET /me/consents
  < 200 {
          "items": [
            {
              "consentId": "con-1",
              "organization": {"name": "Sample Organization"},
              "module": "CM-01",
              "status": "GRANTED",
              "noticeVersion": 3,
              "history": [{"status": "GRANTED", "noticeVersion": 3, "language": "en", "at": "2026-11-05T09:05:00Z"}]
            }
          ]
        }
  ! 401 session-expired

POST /me/consents/{consentId}/withdrawal
  < 200 {
          "consentId": "con-1",
          "status": "WITHDRAWN",
          "withdrawnAt": "2026-11-05T10:55:00Z",
          "effects": {"newProcessingStopped": true, "jobsCancelled": 1, "sessionsClosed": 1, "resultsHiddenFromRecruiters": true}
        }
  ! 409 invalid-state {"currentStatus": "DECLINED"}
  ! 404 not-available
~~~

The confirmation dialog of CAN-15 F1 is client-side; its list of effects is fixed copy. Repeating a withdrawal returns the same result. Stored data stays until deletion is requested or retention ends [A-32 of RD03-Y].

#### CT-PRV-01 · My data and data requests

**Actor** candidate · **Screens** CAN-16 F0–F3 CAN-17 F0 · **REQ-SYS** 079 080 081 082 083 092 · **Use cases** UC-CAN-10 · **Diagrams** RD03-Y section 5.6 (data request); handoff to ADM-05

~~~text
GET /me/data
  < 200 {
          "categories": {"profileVersions": 2, "resumeFiles": 1, "applications": 2, "consents": 2, "interviewAnswers": 10, "dataRequests": 1},
          "organizations": [{"organizationId": "org-1", "name": "Sample Organization"}]
        }
  ! 401 session-expired

POST /me/data-requests
  Idempotency-Key: <key>
  > {"type": "DELETION"}
  ! 409 confirmation-required {"activeApplications": 1}

POST /me/data-requests
  Idempotency-Key: <key>
  > {"type": "DELETION", "acknowledge": {"activeApplications": 1}}
  < 201 {
          "requests": [
            {
              "requestId": "dr-5",
              "displayCode": "DR-0005",
              "organization": {"name": "Sample Organization"},
              "type": "DELETION",
              "status": "PENDING",
              "createdAt": "2026-11-06T09:30:00Z"
            }
          ]
        }
  ! 400 invalid-request

GET /me/data-requests
  < 200 {
          "items": [
            {"requestId": "dr-5", "displayCode": "DR-0005", "type": "DELETION", "status": "PENDING"},
            {
              "requestId": "dr-6",
              "displayCode": "DR-0006",
              "type": "EXPORT",
              "status": "REJECTED",
              "reason": "identity could not be verified"
            },
            {"requestId": "dr-7", "displayCode": "DR-0007", "type": "EXPORT", "status": "COMPLETED", "exportAvailable": true}
          ]
        }
  ! 401 session-expired

POST /me/data-requests/{requestId}/cancellation
  < 200 {"requestId": "dr-5", "status": "CANCELLED"}
  ! 409 invalid-state {"currentStatus": "IN_PROGRESS"}

GET /me/data-requests/{requestId}/export
  < 200 (a structured, readable JSON file with the candidate's data held by that organization)
  ! 409 invalid-state {"currentStatus": "PENDING"}
~~~

One request per organization that holds the candidate's data [UC-CAN-10 A2]. A deletion that would remove data of an active application is first answered with its consequences and created only by the repeated, acknowledged request [UC-CAN-10 A3; REQ-SYS-083]. `DR-0005` is a display code, never used in a path [A-97].

#### CT-PRV-02 · Data request queue and processing

**Actor** admin · **Screens** ADM-05 F0–F3 · **REQ-SYS** 002 080 081 082 083 084 092 · **Use cases** UC-ADM-03 · **Diagrams** RD03-Y section 5.6 (data request)

~~~text
GET /data-requests?status=PENDING
  < 200 {
          "items": [
            {
              "requestId": "dr-5",
              "displayCode": "DR-0005",
              "type": "DELETION",
              "requester": {"displayName": "Applicant A"},
              "receivedAt": "2026-11-06T09:30:00Z",
              "status": "PENDING"
            }
          ],
          "page": {"nextCursor": null}
        }
  ! 404 not-available

GET /data-requests/{requestId}
  < 200 (partial failure) {
                            "requestId": "dr-8",
                            "displayCode": "DR-0008",
                            "type": "DELETION",
                            "status": "IN_PROGRESS",
                            "steps": {"verify": "DONE", "process": "PARTIALLY_FAILED", "complete": "PENDING"},
                            "deletion": {
                              "deletionId": "del-102",
                              "displayCode": "DEL-0102",
                              "status": "PARTIALLY_FAILED",
                              "steps": [{"step": "files", "status": "DONE"}, {"step": "vectors", "status": "FAILED", "remainingItems": 14}]
                            }
                          }
  ! 404 not-available

POST /data-requests/{requestId}/steps
  > {"step": "REJECT", "reason": "identity could not be verified"}
  < 200 {"status": "REJECTED", "candidateNotified": true}
  ! 422 validation-failed {"errors": [{"pointer": "#/reason", "reason": "required"}]}
  ! 409 request-closed {"currentStatus": "CANCELLED"}

POST /data-requests/{requestId}/steps
  Idempotency-Key: <key>
  > {"step": "PROCESS"}
  < 202 {"status": "IN_PROGRESS", "deletion": {"deletionId": "del-102", "status": "RUNNING"}}
  ! 409 request-closed {"currentStatus": "CANCELLED"}
~~~

`step` is VERIFY, PROCESS, COMPLETE or REJECT; a rejection needs a reason that is recorded and sent to the candidate [REQ-SYS-082]. Only this organization's data is processed [REQ-SYS-002, 081]. A partly failed deletion keeps the request IN_PROGRESS and names the failed step [REQ-SYS-083; A-33 of RD03-Y]. The server invalidates caches and derived inputs [REQ-SYS-084]. The candidate is notified [REQ-SYS-092].

#### CT-PRV-03 · Retention settings and deletion jobs

**Actor** admin · **Screens** ADM-04 F0–F2 ADM-05 F1 · **REQ-SYS** 083 084 085 086 · **Use cases** UC-ADM-02 · **Diagrams** Plan section 3 retention row; DEP-01

~~~text
GET /retention-policy
  < 200 {
          "classes": [
            {"dataClass": "FILES", "periodDays": 180},
            {"dataClass": "EXTRACTED_TEXT", "periodDays": 180},
            {"dataClass": "VECTORS", "periodDays": 180},
            {"dataClass": "CACHES", "periodDays": 30},
            {"dataClass": "INTERVIEW_ANSWERS", "periodDays": 365}
          ]
        }
  ! 404 not-available

PUT /retention-policy
  > {"classes": [{"dataClass": "FILES", "periodDays": 90}]}
  ! 409 confirmation-required {"affectedItems": 37, "activeApplications": 2}

PUT /retention-policy
  > {"classes": [{"dataClass": "FILES", "periodDays": 90}], "acknowledge": {"affectedItems": 37}}
  < 200 {"effectiveAt": "2026-11-06T09:30:00Z", "scheduledDeletions": 37}
  ! 422 validation-failed {"errors": [{"pointer": "#/classes/0/periodDays", "reason": "positive-integer"}]}

GET /deletion-jobs
  < 200 {
          "items": [
            {"deletionId": "del-102", "displayCode": "DEL-0102", "status": "FAILED", "failedStep": "vectors", "remainingItems": 14},
            {"deletionId": "del-103", "displayCode": "DEL-0103", "status": "COMPLETED", "removalRecordId": "aud-9"}
          ]
        }
  ! 404 not-available

POST /deletion-jobs/{deletionId}/retry
  Idempotency-Key: <key>
  < 202 {"deletionId": "del-102", "status": "QUEUED"}
  ! 409 invalid-state {"currentStatus": "COMPLETED"}
~~~

Data classes are files, extracted text, vectors, caches and interview answers [REQ-SYS-085]; periods are placeholders [A-79]. Shortening a period is first answered with its consequences and applied only when the repeated request acknowledges the count [REQ-SYS-085, 086]. Every completed deletion leaves a removal record without private text [REQ-SYS-083].

#### CT-NTF-01 · Notifications

**Actor** candidate · **Screens** CAN-17 F0–F2 · **REQ-SYS** 020 082 092 · **Use cases** UC-CAN-07 UC-CAN-10 · **Diagrams** handoff H-05 of RD04-Y

~~~text
GET /notifications
  < 200 {
          "items": [
            {
              "notificationId": "ntf-2",
              "type": "DATA_REQUEST_UPDATE",
              "at": "2026-11-06T09:30:00Z",
              "read": false,
              "target": {"kind": "data-request", "id": "dr-5"}
            },
            {
              "notificationId": "ntf-3",
              "type": "INTERVIEW_INVITATION",
              "at": "2026-11-06T09:00:00Z",
              "read": false,
              "target": {"kind": "interview", "id": "ses-1"}
            },
            {
              "notificationId": "ntf-1",
              "type": "CV_READY",
              "at": "2026-11-05T09:10:00Z",
              "read": true,
              "target": {"kind": "processing", "id": "prc-1"}
            }
          ],
          "page": {"nextCursor": null}
        }
  ! 401 session-expired

POST /notifications/{notificationId}/read
  < 204
  ! 404 not-available
~~~

Newest first. An invitation sent by a recruiter appears as `INTERVIEW_INVITATION` [H-05 of RD04-Y; REQ-SYS-092]. The email copy of events that need action is sent by the system and has no call here [REQ-SYS-092; A-40 of RD03-Y].

#### CT-DASH-01 · Recruiter dashboard

**Actor** recruiter · **Screens** REC-02 F0 F1 · **REQ-SYS** 045 074 · **Use cases** UC-REC-02 UC-REC-05

~~~text
GET /dashboard
  < 200 {
          "applicationsNeedingReview": 2,
          "interviewsAwaitingReview": 1,
          "jobs": [{"jobId": "job-1", "title": "Sample job A", "status": "PUBLISHED", "applicants": 6}]
        }
  < 200 (empty) {"applicationsNeedingReview": 0, "interviewsAwaitingReview": 0, "jobs": []}
  ! 404 not-available
~~~

Counters are scoped to the session organization [REQ-SYS-002]. The counting rule is not defined in RD03-Y [A-98].

---

## 7. Coverage

### 7.1 Screens and contracts

36 of 36 screens and 114 of 114 frames are linked. A contract lists the frames whose data or errors it serves.

| Screen | Name | Contracts and frames |
|---|---|---|
| ADM-01 | Admin sign-in and organization selection | CT-AUTH-01 F0 F2; CT-AUTH-03 F1 |
| ADM-02 | Members and roles | CT-AUTH-04 F0–F2; CT-AUTH-05 F0 F2 |
| ADM-03 | Invite or edit member | CT-AUTH-04 F1 F3; CT-AUTH-05 F0 F2 |
| ADM-04 | Retention settings and deletion jobs | CT-PRV-03 F0–F2 |
| ADM-05 | Data request queue and detail | CT-PRV-02 F0–F3; CT-PRV-03 F1 |
| ADM-06 | Audit and processing history | CT-MAT-03 F1; CT-ADT-01 F0–F2 |
| CAN-01 | Candidate sign-in and registration | CT-AUTH-01 F0–F2; CT-AUTH-02 F0 |
| CAN-02 | Job details and application start | CT-JOB-01 F0 F1; CT-APP-01 F0–F2 |
| CAN-03 | Consent notice and module choice | CT-CNS-01 F0–F3 |
| CAN-04 | CV upload | CT-CV-01 F0–F3 |
| CAN-05 | Processing status | CT-CV-01 F0; CT-CV-02 F0–F3 |
| CAN-06 | CV profile review | CT-CNS-02 F3; CT-PRF-01 F0–F3; CT-PRF-02 F0 |
| CAN-07 | Profile item editor | CT-PRF-02 F0–F3 |
| CAN-08 | Application review and submit | CT-CV-01 F0; CT-APP-02 F0–F3 |
| CAN-09 | My applications and status | CT-APP-03 F0–F3 |
| CAN-10 | Interview invitation and consent | CT-CNS-01 F0; CT-ITV-03 F0–F2 |
| CAN-11 | Interview briefing | CT-ITV-03 F0 F1; CT-ITV-04 F0 F1 |
| CAN-12 | Interview session | CT-ITV-04 F0; CT-ITV-05 F0–F3 |
| CAN-13 | Interview answer review and submit | CT-ITV-06 F0–F3 |
| CAN-14 | Interview resume prompt | CT-ITV-03 F0; CT-ITV-04 F0–F2; CT-ITV-05 F1 |
| CAN-15 | Privacy and consent settings | CT-CNS-02 F0–F2 |
| CAN-16 | My data and requests | CT-PRV-01 F0–F3 |
| CAN-17 | Notifications | CT-CV-02 F0; CT-PRV-01 F0; CT-NTF-01 F0–F2 |
| REC-01 | Recruiter sign-in and organization selection | CT-AUTH-01 F0 F2; CT-AUTH-03 F1 |
| REC-02 | Recruiter dashboard | CT-DASH-01 F0 F1 |
| REC-03 | Job list and version history | CT-JOB-02 F0–F2; CT-JOB-03 F0 |
| REC-04 | Job editor | CT-JOB-03 F0 F2; CT-JOB-04 F1 |
| REC-05 | Job publish review | CT-JOB-04 F0 F1 |
| REC-06 | Ranked applicant list | CT-MAT-01 F0 F1 |
| REC-07 | Application evidence review | CT-MAT-02 F0–F2 |
| REC-08 | CV source viewer | CT-MAT-03 F0–F2 |
| REC-09 | Interview invitation | CT-ITV-01 F0–F2 |
| REC-10 | Interview tracker | CT-ITV-02 F0 F1 |
| REC-11 | Interview result review | CT-ITV-07 F0–F2 |
| REC-12 | Hiring decision | CT-DEC-01 F0–F2; CT-ITV-07 F0 |
| REC-13 | Application timeline | CT-MAT-03 F1; CT-DEC-02 F0 F1 |

The shared-state sheets KIT-S1 (candidate shell) and KIT-S2 (recruiter and admin shell) carry the generic failures: `idempotency-key-required`, `idempotency-key-reused`, `invalid-request`, `invalid-state`, `not-available`, `precondition-required`, `request-in-progress`, `service-unavailable`, `session-expired` (5.3).

### 7.2 Frames that need no call of their own

5 frames need no call of their own. They are listed in the contracts above because their data come from the neighbouring frame.

| Frame | RD04-Y name | What happens |
|---|---|---|
| CAN-12 F1 | Saving | The draft `PUT` of CT-ITV-05 is running; the frame needs no extra call |
| CAN-12 F3 | Offline and language fallback | Offline: no call is possible; the client keeps the text and repeats the `PUT` later (A-96). Language fallback: `lang` of stored content (A-99) |
| CAN-13 F2 | Not received | Recovery is the same `POST …/submission` with the same key (CT-ITV-06), which returns the stored receipt |
| CAN-15 F1 | Confirm withdrawal | A dialog; the call of CT-CNS-02 is sent only on confirmation |
| ADM-03 F3 | Role-change confirmation | A dialog; the call of CT-AUTH-04 is sent only on confirmation |

### 7.3 Requirements

92 of 94 requirements are linked to at least one contract. Not linked: **REQ-SYS-043** (matching starts after submission) is internal, with no screen and no response; CT-APP-02 notes it. **REQ-SYS-094** (every function operable by keyboard) is a property of the client, not of a call. Each link names a requirement that RD03-Y or RD04-Y places on a screen of the contract; 3 links rely on the nine cross-cutting requirements (004, 026, 041, 049, 053, 077, 091, 093, 094), which may appear on any screen of their kind. The requirement list of each contract is in section 6 and in `contract-index.csv`.

### 7.4 Cross-role handoffs of RD04-Y

The six handoffs of RD04-Y §5.6 are state changes made by one role and seen by another. Each is realized by a call on one side and a visible value on the other (computed, 6 of 6):

| Handoff | Trigger | Effect |
|---|---|---|
| H-01 | CT-APP-03 `POST …/withdrawal` | CT-MAT-01 row flag `WITHDRAWN` |
| H-02 | CT-ITV-03 `POST …/response` | CT-ITV-02 tracker `ACCEPTED`, `DECLINED`, `INVITED` |
| H-03 | CT-CNS-02 `POST …/withdrawal` (CM-01) | CT-MAT-01 flag `CONSENT_WITHDRAWN`; CT-MAT-02 `resultsHidden` |
| H-04 | CT-CNS-02 `POST …/withdrawal` (CM-02) | CT-ITV-02 `CLOSED` with `closedBecause`; `session-closed` in CT-ITV-04 to CT-ITV-06 |
| H-05 | CT-ITV-01 `POST /jobs/{jobId}/interviews`; CT-ITV-02 `POST …/cancellation` | CT-APP-03 `INTERVIEW_INVITED`; CT-NTF-01 `INTERVIEW_INVITATION` |
| H-06 | CT-DEC-01 `POST …/decisions` | CT-APP-03 status `DECIDED`, no outcome |

---

## 8. Consistency check

**OK** consistent; **REF** consistent after the refinement stated; **OPEN** a decision is needed. "(computed)" rows come from scripts run over the contract data and the RD03-Y and RD04-Y sources.

| ID | Checked against | Result | Status and action |
|---|---|---|---|
| CK-01 | Issue #28 criterion 1; Plan App. A p.10 | Every contract is a transcript with input, output and error examples: 84 operations (35 POST, 35 GET, 10 PUT, 4 DELETE), 102 success and 120 error examples. No endpoint, schema file or code. | OK |
| CK-02 | RD04-Y screens and frames (computed) | 36 of 36 screens and 114 of 114 frames are linked; every linked frame exists in RD04-Y; 5 frames need no call of their own (7.2). | OK |
| CK-03 | `REQ-SYS-001..094` (computed) | 92 of 94 linked; 043 is internal and 094 is a client property (7.3). Every link is on a screen of its contract in the RD03-Y flows or RD04-Y sheets, or is a cross-cutting requirement (3 links); mismatches: 0. | REF — Two requirements have no call by design |
| CK-04 | UC-01 and RD03-Y flows (computed) | 20 of 20 use cases linked; 182 of 198 flow steps that name a screen are cited; every cited step exists and names a screen of its contract. | OK |
| CK-05 | SEQ-01 [p.16] | CT-CV-01 answers `202` with the status resource in `Location` and the `processingId`; CT-CV-02 reads the state; the client polls [A-86]. | OK |
| CK-06 | ST-01 [p.17] (computed) | Only QUEUED, PROCESSING, READY, FAILED are used as `state`; `retrying: true` occurs once, only with QUEUED; FAILED carries a `failureCategory` and is a state, not an HTTP error [REQ-SYS-021, 022]. | OK |
| CK-07 | CL-01A/B [pp.14–15] (computed) | 12 of 27 identifier properties are diagram attributes; 15 have no class [F-03]. 31 diagram attributes are used as property names; unused: candidateId, contentHash, criterionId, criterionLevels, versionId. Renames: `questionText` (QuestionVersion `text`), `levelDescription` (RubricVersion `criterionLevels`). Score type: F-04. | REF — F-03, F-04 |
| CK-08 | DEP-01 [p.18] (computed) | The limits 5,242,880 bytes, 5 pages and 20,000 characters appear in the over-limit examples; each is a rejection that stores nothing and never truncates [REQ-SYS-015]. | REF — A-91 (unit of MB) |
| CK-09 | ACT-01 [p.17] | Submit (CT-APP-02), invite and "no interview needed" (CT-ITV-01) and decision (CT-DEC-01) have a call each; the decision ends in CT-APP-03 as `DECIDED` [REQ-SYS-056, 077]. | OK |
| CK-10 | RD03-Y §5.6 vocabularies (computed) | Application and session statuses, consent states, `closedBecause`, outcomes and data-request values stay inside their vocabularies; the only addition is `DRAFT` [F-02]; deletion-job values are proposals (5.5). | REF — OD-21 |
| CK-11 | RD04-Y message catalogue (computed) | 33 problem types, each linked to RD04-Y frames that exist; 30 appear in operations; 3 idempotency types apply to every operation with the header (5.4). Every error line names a catalogue type. | OK |
| CK-12 | Candidate view [REQ-SYS-041, 070, 077] (computed) | No candidate-facing contract carries rank, score, evidence label, outcome, rationale, snapshot, `mandatory` flag or another applicant's data; hits: 0. | OK |
| CK-13 | No automatic decision [REQ-SYS-075] (computed) | Only CT-ITV-07 has a score (whole level 0 to 4); no property is named recommendation, probability, rejection or exclusion; `outcome` exists only in CT-DEC-01 and CT-DEC-02, set by a recruiter. | OK |
| CK-14 | Placeholder rules (computed) | All `*Id` values expand to placeholder UUIDs (5.6), all `*At` values are RFC 3339 UTC, emails end in `@example.org`, no value contains an ellipsis, quote offsets equal the quote length and `segments` add up to the quote; violations: 0. | OK |
| CK-15 | RD04-Y routes and handoffs (computed) | H-01 to H-06 are each realized by a call and a visible value (7.4). Route parameters map to path parameters (5.7); no path contains an organization or a language. | OK |
| CK-16 | Plan §6, p.7 risk "Design inconsistency" | Requirement IDs (CK-03), message contracts (CK-05, CK-11) and version references (`jobVersionId`, `questionVersionId`, `resumeVersionId`, `rubricVersionId`, `sessionQuestionId`, `snapshotId`) are checked here; class and ERD relations belong to RD05-M and the reconciliation to RD06-M. | REF — RD05-M; RD06-M |

---

## 9. Clearly Marked Assumptions

### 9.1 Carried over

| ID | Use here |
|---|---|
| A-15, A-33 of RD03-Y | No legal analysis; data requests show workflow, not legal duty |
| A-18, A-28 of RD03-Y | One author with AI-assisted drafting; `SCR` and `REQ-SYS` identifiers provisional |
| A-24, A-42, A-52 of RD03-Y | Mixed-direction quotes carry `segments` (A-92); no translation of stored content; whole-level scores |
| A-31, A-37, A-38 of RD03-Y | Consent per module; reviewer records stored apart; candidate-provided values flagged |
| A-54, A-58 | Lock rule (A-88) and direction of free text (A-99) are routed to RD05 |
| A-59 to A-62, A-64, A-70 | One role per session; organization from the session; opaque identifiers; language prefix; placeholder values |

### 9.2 New in RD05-Y

| ID | Assumption | Status |
|---|---|---|
| A-76 | All examples are illustrative transcripts. No endpoint, schema file or server exists; names and values may change in RD04-M, RD05-K/A/M/H/I and RD06-M [Plan App. A, p.10; Issue #28]. | Recorded |
| A-77 | Issue #28 was read from screenshots; if the live issue differs, the live issue governs. The Idempotency-Key document is an expired draft, not a standard. | Verify |
| A-78 | HTTP with JSON (UTF-8); methods and status codes follow RFC 9110. camelCase names reuse CL-01A/B attribute names; `status` is for lifecycle values, `state` for ST-01 only, `evidenceState` for evidence; values are UPPER_SNAKE_CASE. A presentation choice, not an architecture decision [Plan §3, p.4]. | Provisional |
| A-79 | Every value is a placeholder: identifiers as in 5.6, RFC 3339 UTC timestamps with the clock digits of RD04-Y (display zone: OD-13 of RD04-Y), emails at `@example.org`. Counts and periods other than the DEP-01 limits are not recommendations [A-64, A-70]. | Recorded |
| A-80 | A placeholder identifier is written as an entity tag and a number (5.6) and stands for a UUID whose first two hex digits are the entity code. Real identifiers are opaque, non-sequential and never parsed by clients [A-61]. | Recorded |
| A-81 | Errors are RFC 9457 problem bodies with `type` URIs `https://example.net/problems/<slug>` (a reserved placeholder host, OD-27). Screens choose their text from the RD04-Y catalogue by `type` and frame and never parse `detail`. `reference` is a short support code. No error carries personal data or CV text. | Provisional |
| A-82 | Create and submit operations take `Idempotency-Key` and follow draft-ietf-httpapi-idempotency-key-header-07 (expired, not a standard): no key `400`; same key, other content `422`; same key while running `409`; same key and content returns the stored result. Lifetime and storage: OD-28. | Provisional |
| A-83 | Changes to a stored version send `If-Match` with the version read and receive the new `ETag`; missing `428`, stale `412` with the current version [RFC 9110 §13.1.1, §8.8.3; RFC 6585]. Version strings are placeholders. | Provisional |
| A-84 | Lists take `limit` and return an opaque `nextCursor` (null at the end). Page sizes are not set. | Provisional |
| A-85 | Contracts follow the six modules of the Plan diagram [Plan §3, p.4]. Applications, consent, data requests, retention, notifications and the dashboard have no module there and are placed provisionally; RD04-M decides. | Provisional |
| A-86 | SEQ-01 has the portal read the status with the job identifier. The examples do this by `GET`, with no push channel and no polling interval. DEP-01 timing targets are not tested here. | Provisional |
| A-87 | A session credential identifies the account, its one role and its organization [A-59, A-60]. How it travels (cookie or header) is open and omitted from the examples. | Provisional |
| A-88 | The rule behind `too-many-attempts` (attempts, delay, lock) is not set; `retryAfterSeconds` is a placeholder, also sent as `Retry-After` [A-54]. | Provisional |
| A-89 | An invitation is accepted with a one-time value sent by email; its form, lifetime and screen are open [F-07]. Expiry dates are placeholders. | Provisional |
| A-90 | The candidate view of a job omits the recruiter-side `mandatory` flag of requirements. RD03-Y does not say whether candidates may see it; adding it later adds one property [OWASP API3:2023]. | Provisional |
| A-91 | DEP-01's "5 MB" is read as 5,242,880 bytes (1 MB = 1,048,576). With 1,000,000 only the number changes [DEP-01, p.18]. | Provisional |
| A-92 | A mixed Arabic and English quote carries `segments` (runs with their own `lang`) so each run can be marked for assistive technology; the server makes them at extraction [A-24 of RD03-Y; REQ-SYS-026, 093]. | Provisional |
| A-93 | `offsets.start` (inclusive) and `offsets.end` (exclusive) count characters of the extracted text of `page`; `end - start` equals the quote length. CL-01A gives no unit; RD05-K sets it [REQ-SYS-029]. | Provisional |
| A-94 | `acknowledgeJobVersion` is the newer job version the candidate was shown; the application stays bound to the version it was started on [REQ-SYS-014, 036; F-01; OD-20]. | Provisional |
| A-95 | The session is `{invId}` on candidate routes and `{sessionId}` on recruiter routes of RD04-Y; contracts use `sessionId` only (5.7). | Recorded |
| A-96 | After an offline period the client repeats its last draft `PUT` with the version it knew; `version-mismatch` means newer text exists elsewhere and no merge is attempted [REQ-SYS-066]. | Provisional |
| A-97 | Display codes (`DR-0005`, `DEL-0102`, `PROC-0042`, `A-17`) are shown on screens and quoted to support; they are never identifiers or path parts. | Recorded |
| A-98 | Dashboard counters are scoped to the session organization [REQ-SYS-002]. RD03-Y does not define "waiting", so the numbers and the rule of CT-DASH-01 are placeholders. | Provisional |
| A-99 | Stored content is returned in its own language, never translated. The interface language is `preferredLanguage` (`ar` or `en`), not negotiated with `Accept-Language` [RFC 9110 §12.5.4]. The client sets `dir="auto"` for free text, so no direction is stored [A-58]. Error `title` and `detail` are English and not shown to users [A-42 of RD03-Y; A-62]. | Provisional |
| A-100 | RD04-M and RD05-K, A, M, H, I were not available. The examples use only the Plan's module names and the DEP-01 limits and are reconciled with those outputs in RD06-M [Plan App. A, p.10]. | Recorded |

---

## 10. Open decisions

| ID | Question | Provisional position | Owner |
|---|---|---|---|
| OD-20 | A job is revised after the application was started: (a) the candidate acknowledges and submits on the bound version; (b) starts a new application on the current version; (c) the application is re-bound to the current version after a new confirmation (literal UC-CAN-06 A3). | (a), shown in CT-APP-02; (c) conflicts with REQ-SYS-014, 036 | Owner; RD05-M |
| OD-21 | Status before submission: add `DRAFT` to RD03-Y §5.6, or keep unfinished applications as a separate record that becomes an Application at submission. | `DRAFT` (CT-APP-01, CT-APP-03) | RD05-M; OD-10 of RD03-Y |
| OD-22 | May a recruiter close a started session (UC-CAN-09 A7), and where is the action? REQ-SYS-054 and REC-10 cover only cancelling an unstarted invitation. | `CLOSED_BY_RECRUITER` is returned to the candidate; no call or screen creates it | Owner; RD05-H; RD06-Y |
| OD-23 | A quote that fails validation: keep the evidence label and set `sourceValid: false`, or give the requirement its own state. | `INSUFFICIENT` with `sourceValid: false`, never `SUPPORTED` [REQ-SYS-025, 049] | RD05-K; RD05-A |
| OD-24 | How the server learns that a candidate left an interview (INTERRUPTED): an explicit call on leaving, the next request after a gap, or a timeout (RD03-Y sets none, OD-06). | Explicit leave call; no timeout | RD05-H |
| OD-25 | May a candidate submit with unanswered questions (listed in `unanswered`)? | Yes, after the confirmation shown in CT-ITV-06 | RD05-H; owner |
| OD-26 | Registration with an email that already has an account: say so, or answer as for a new account. | Open; the example shows only a format error. No source on account enumeration was read | RD05-M; RD04-I |
| OD-27 | Host of the problem `type` URIs, API base URL and version prefix. | Placeholders: `example.net`, no prefix | RD04-M; RD04-I |
| OD-28 | Lifetime, storage and scope of idempotency keys. | Not set | RD04-M; RD05-I |

---

## 11. Hand-off

| File | Content |
|---|---|
| `RD05-Y_screen-api-contract-examples.md` | This document |
| `problem-examples.json` | All 33 problem types as full `application/problem+json` bodies |
| `contract-index.csv` | One row per operation: contract, group, actor, method and path, success and error types, screens and frames, requirements, use-case steps |

**Branch and PR title (proposal):** `rd05-y/screen-api-contract-examples` · `[RD05-Y] Screen/API contract examples`. Paths are relative to the folder where the team keeps RD deliverables; the issue names none.

**PR description** (Issue #28 rules: `Refs #28`, no automatic-closing keywords; the owner accepts the task, merges the PR and closes the issue manually):

~~~markdown
## [RD05-Y] Screen/API contract examples

Refs #28

**What this PR adds**
- `RD05-Y_screen-api-contract-examples.md`: conventions and error catalogue (33 problem types), 36 contract examples with input, output and error transcripts (84 operations), coverage of screens, frames and requirements, computed consistency checks (CK-01 to CK-16), assumptions A-76 to A-100, open decisions OD-20 to OD-28, findings F-01 to F-09.
- `problem-examples.json` and `contract-index.csv`.

**Please check**
1. Section 5 (conventions, error catalogue) against RD04-M and RD05-I.
2. F-01 with OD-20 and F-02 with OD-21: job version at submission; status before submission.
3. Section 7.1 and CK-03: wrong or missing links.
4. Assumptions A-76 to A-100 and open decisions OD-20 to OD-28.

Research and design only; no endpoint or application code. Peer review requested from @AhmedFadlallah1; final review from @kareemmahmoud141224-prog. Owner review requested; Refs #28.
~~~

**Peer review request (`@AhmedFadlallah1`):** please read sections 5, 7 and 8 and look for an example that contradicts a requirement or a diagram, a frame with no way to get its data, a role that can read another role's data, an error with no screen text in RD04-Y, and names that differ between contracts. Push fixes to the same PR and re-request review [Issue #28].

**Owner review request (`@kareemmahmoud141224-prog`):** select Request changes or Approve. Only the owner accepts the task, merges the PR and closes the issue by hand [Issue #28].

**What the next tasks receive**

| Task | Receives |
|---|---|
| RD05-K | CT-CV-01, CT-CV-02, CT-PRF-01, CT-PRF-02, CT-MAT-03: limits, `202` with status resource, ST-01 values, page, quote and offset fields (A-93); F-05, OD-23 |
| RD05-A | CT-MAT-01, CT-MAT-02: ranked list, evidence labels, `basis`, results hidden after withdrawal; OD-23 |
| RD05-M | F-02 to F-04, the 15 identifiers without a class, vocabularies (5.5), OD-20, OD-21 |
| RD05-H | CT-CNS-01, CT-CNS-02, CT-ITV-01 to CT-ITV-07: consent per module, session states, `closedBecause`, draft save, submit, recovery; F-04, F-06, OD-22, OD-24, OD-25 |
| RD05-I | Error catalogue (5.3), idempotency and retry rules (5.4), CT-CV-02, SEQ-01 check (CK-05); OD-27, OD-28 |
| RD06-M | All contracts and CK-01 to CK-16 to reconcile sequence, state and activity models with the API contracts |
| RD06-Y | Matrix 7.1, frames without a call (7.2), missing screens F-06 to F-09, parameter mapping (5.7) |
| RD07-Y | Error frames linked to problem types (5.3) for failure-path observation |

**Reminder:** this is a design proposal built without participant evidence. The owner decides OD-20 and OD-21 first.
