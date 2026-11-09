# [RD04-Y] Navigation Architecture and Low-Fidelity Screens

**AI Recruitment Platform · Research and Software Design Plan · Week 4 (RD04)**

| Field | Value |
|---|---|
| Task | RD04-Y — Navigation architecture and low-fidelity screens (GitHub issue #22) |
| Repository · milestone | `ai-recruitment-grad-team/ai-recruitment-platform` · RD04 — Architecture and technical decisions [Issue #22] |
| Week · priority · estimate | Week 4 (RD04) · P0 · 6 h [Issue #22; Plan App. A, p.9] |
| Owner | Youssef Mohammed Elbasosy (Y); GitHub username pending [Issue #22] |
| Peer reviewer | Ahmed Fadlallah Abdelgwad (A), `@AhmedFadlallah1` [Issue #22; A-43 of RD03-Y] |
| Final reviewer | `@kareemmahmoud141224-prog` [Issue #22] |
| Support | As needed [Issue #22] |
| Dependencies | RD03-Y; RD03-M [Issue #22]. Builds on RD01-Y and RD02-Y |
| Baseline | `planning/weekly_backlog.json`, RD-9W-FINAL [Issue #22] |
| Status · date | Ready for peer review · 6 November 2026 |
| Authoring | Task owner with AI-assisted drafting; single author [A-18 of RD03-Y] |
| Boundary | Research and design only. No application coding before the supervisor approves Design Baseline v1 [Issue #22; Plan §6, p.7] |
| Files | This document; `wireframes/` (76 PNG sheets: 36 screens and 2 shared-state sheets, each in English and Arabic); `ui-strings.csv` (every English and Arabic string of the sheets) |

**How to read this document.** Tags in square brackets give the source: [Plan §5, p.6], [RD03-Y …] for the earlier deliverable, [A-nn] a Clearly Marked Assumption (A-01 to A-53 are in RD03-Y; A-54 and later are new), [OD-nn] an open decision (OD-12 and later are new), [CK-nn] a consistency check, [RTL-nn] a direction convention, [NP-n] a navigation principle, [F-nn] a finding, [H-nn] a cross-role handoff. Identifiers: `SCR-CAN-nn`, `SCR-REC-nn`, `SCR-ADM-nn` screens (written CAN-nn, REC-nn, ADM-nn in tables); `KIT-S1`, `KIT-S2` shared-state sheets; `REQ-SYS-nnn` requirements (written nnn in tables); `F0`, `F1`… the frames (states) of one sheet; `CM-01`, `CM-02` consent modules.

## Limitation notice

This is a design document built from the Plan, RD01-Y, RD02-Y and RD03-Y. It is not evidence of what candidates, recruiters or admins want or can use.

- **No participant feedback.** The RD01-Y interviews could not be held and RD02-Y was a supervisor and heuristic review [Plan p.2; A-27 of RD03-Y]. The wireframes are untested design proposals. RD07-Y plans the first observation [Plan App. A, p.11].
- **Low fidelity.** The sheets show structure, order, states and direction behaviour in grayscale with placeholder content. They carry no visual design, brand, final typography or interaction timing [A-69, A-70].
- **Arabic wording is a proposal.** The author wrote all Arabic strings with AI assistance. No native reader has checked them [A-55, OD-17].
- **Provisional identifiers.** `SCR` and `REQ-SYS` identifiers stay provisional until RD03-M maps them [A-28 of RD03-Y]. No screen was split or merged.
- **Sources.** Issue #22 was read from screenshots [A-56]. The external sources of section 2 were read in this session; four others could not be reached and are not used [A-57].
- **No technology choice.** Final technology choices are recorded in the Week 4 feasibility review [Plan §3, p.4]. The route scheme is URL-level and framework-neutral.
- **No legal analysis.** Consent and data-request wording carries no legal claim [A-15, A-33 of RD03-Y].
- **Single author with AI-assisted drafting;** peer review is pending [A-18 of RD03-Y].

---

## 1. Purpose, scope and acceptance mapping

RD04-Y turns the 36 logical screens of RD03-Y into a navigation architecture (role shells, routes, guards, landing screens, links) and a set of low-fidelity wireframes in Arabic (right-to-left) and English (left-to-right) with explicit direction conventions [Plan App. A, RD04-Y, p.9]. It also checks the result against the requirements, flows and diagrams that RD03-Y used.

| Acceptance criterion (Issue #22, verbatim) | Met in |
|---|---|
| Map role-based screens/routes and produce a coherent wireframe set with RTL/LTR conventions. | Sections 5 (navigation, routes), 6 (RTL/LTR conventions), 7 (legend), 8 (shared states, messages), 9 (36 screen specifications and 76 wireframe sheets) |
| Link the deliverable and primary sources or clearly marked assumptions. | Section 2; source tags in every section; section 12 |
| Check consistency with requirements and relevant diagrams. | Section 11 (CK-01 to CK-21) |
| Submit a PR using `Refs #NUMBER`; request owner review. | Section 14 (`Refs #22`) |

**In scope:** navigation map, route table, guard order, wireframes with states, RTL/LTR conventions, shared-state patterns, message wording proposals, computed consistency checks. **Out of scope:** visual design and branding, the clickable prototype (RD06-Y), usability tests (RD07-Y), modules, interfaces and deployment (RD04-M), endpoints and data examples (RD05-Y), application code, legal analysis.

---

## 2. Source register

| Tag | Source and location |
|---|---|
| Issue #22 | "[RD04-Y] Navigation architecture and low-fidelity screens", repository `ai-recruitment-grad-team/ai-recruitment-platform`, milestone RD04 — Architecture and technical decisions. Read from screenshots; its criteria are quoted in section 1 [A-56] |
| Plan | AI Recruitment Platform — Research and Software Design Plan (final planning baseline). Printed pages used: summary p.1 (Arabic, English and mixed-language support; the supervisor accepts the design baseline); §3 p.4 (final technology choices are recorded in the Week 4 feasibility review); §5 p.6 (Week 4: "Architecture, technical decisions and low-fidelity screens"); §6 p.7 (Design Baseline v1; no application coding before approval) |
| Plan App. A | Appendix A weekly tasks: p.9 (RD04-Y: "Map role-based screens/routes and produce a coherent wireframe set with RTL/LTR conventions."), p.10 (RD06-Y: core clickable prototype, "RTL/LTR annotations"), p.11 (RD07-Y: keyboard/RTL checks) |
| UC-01, CL-01A/B, SEQ-01, ACT-01, ST-01, DEP-01 | Plan Appendix B diagrams as read in RD03-Y: UC-01 p.13 (three actors; "Owner Y; draft Week 3, consistency review Week 8"); CL-01A/B pp.14–15; SEQ-01 p.16; ACT-01 and ST-01 p.17; DEP-01 p.18 [A-16 of RD03-Y] |
| RD01-Y, RD02-Y, RD03-Y | Earlier deliverables of this author. RD03-Y (issue #16) supplies the 36 screens (its §7), the flows (§6), 94 requirements `REQ-SYS-001..094` (§8), the state vocabularies, consent modules CM-01 and CM-02, assumptions A-01..A-53, open decisions OD-01..OD-11 and checks CC-01..CC-19 |
| W3C-DIR | W3C Internationalization, "Structural markup and right-to-left text in HTML", https://www.w3.org/International/questions/qa-html-dir — set direction with the `dir` attribute in markup, not CSS; `dir="auto"` and isolation for user-supplied text. Read in this session |
| W3C-UBA | W3C Internationalization, "Unicode Bidirectional Algorithm basics", https://www.w3.org/International/articles/inline-bidi-markup/uba-basics — neutral characters take the surrounding direction; digits run left-to-right inside right-to-left text; `dir` fixes boundary errors. Read in this session |
| ALREQ | W3C Group Draft Note, "Arabic & Persian Layout Requirements", 2 October 2025, https://www.w3.org/TR/alreq/ — digit families differ by region; letter-spacing and kashida guidance. Read in this session |
| CSS-LOG | W3C Working Draft, "CSS Logical Properties and Values Module Level 1", 4 December 2025, https://www.w3.org/TR/css-logical-1/ — start/end and inline/block properties instead of left/right. Read in this session |
| HIG-RTL | Apple, Human Interface Guidelines, "Right to left", https://developer.apple.com/design/human-interface-guidelines/right-to-left — platform guideline used only as a design reference for what to mirror and what not to flip. Read in this session |
| WCAG-22 | W3C WAI, "What's New in WCAG 2.2", https://www.w3.org/WAI/standards-guidelines/wcag/new-in-22/ — 2.4.11 Focus Not Obscured (Minimum, AA), 2.5.8 Target Size (Minimum, AA, 24 by 24 CSS px), 3.3.7 Redundant Entry (A), 3.3.8 Accessible Authentication (Minimum, AA). Read in this session |
| WCAG-SC | W3C WAI Understanding pages read in this session: 1.3.2 Meaningful Sequence (A) https://www.w3.org/WAI/WCAG22/Understanding/meaningful-sequence.html; 2.4.3 Focus Order (A) https://www.w3.org/WAI/WCAG22/Understanding/focus-order; 3.1.2 Language of Parts (AA) https://www.w3.org/WAI/WCAG22/Understanding/language-of-parts.html |

Not used because they could not be reached in this session: Material Design bidirectionality guidance, MDN, Unicode UAX 9, the WCAG 2.2 Recommendation page [A-57].

---

## 3. Results at a glance

| Result | Value |
|---|---|
| Role shells | 7 shells in 3 families: candidate (mobile-first), recruiter and admin (desktop-first); route scheme `/{lang}/c`, `/{lang}/r`, `/{lang}/a`; guard order of 6 checks (section 5) |
| Screens and sheets | 36 screens (28 P0, 7 P1, 1 P2), 114 frames, 239 numbered annotations, 76 PNG sheets (EN and AR) |
| Navigation graph | 87 explicit edges plus shell navigation (163 edges in all); depth from the landing screen: candidate 3, recruiter 4, admin 1; no unreachable screen |
| Flows | All 49 same-role screen transitions of the RD03-Y flows are realized; 6 cross-role handoffs are documented as state effects |
| Requirements | 93 of 94 requirements appear on a sheet; REQ-SYS-043 has no screen in RD03-Y (F-02) |
| RTL/LTR | 20 conventions (RTL-01 to RTL-20); every sheet exists in both directions with correct `lang` and `dir` (76 of 76) |
| Glossary | 90 terms; 173 exact uses checked on the sheets; 0 mismatches |

**Findings for other tasks**

- **F-01** Eight screens that RD03-Y ranks P1 or P2 carry P0 requirements. Two of them lie on P0 main flows and have no substitute: SCR-CAN-09 (candidate landing, invitation and status list) and SCR-REC-10 (interview tracker, seven P0 requirements). The other six have a fallback in a P0-only build (table in section 11).
- **F-02** REQ-SYS-043 (start matching after submission) has no screen in RD03-Y; the wireframes show only its outcome through REQ-SYS-044 (pending or failed matching) on SCR-REC-06. No change needed.
- **F-03** RD03-Y's ranked list has eight columns on SCR-REC-06. At 1200 px the table fits; narrower recruiter screens are not designed [A-71].
- **F-04** The word "Declined" has two Arabic forms in the glossary (interview session and consent), which need native review [OD-17].

**Decisions needed from the owner:** OD-12 (priority of status screens) first; then OD-13 to OD-19 (section 13).

---

## 4. Inputs reused from RD03-Y

- **Screens:** the 36 logical screens of RD03-Y §7 with their priority (28 P0, 7 P1, 1 P2), purpose and required states. 88 required states are mapped to frames (CK-07).
- **Flows:** the main, alternate and failure flows of RD03-Y §6. Their screen sequences give 49 same-role transitions and 6 cross-role effects (CK-05, CK-06).
- **Requirements:** `REQ-SYS-001` to `REQ-SYS-094` and their screen mapping. Each callout in section 9 carries the requirements it realizes.
- **Vocabularies:** status values, evidence labels, display terms ("Not assessed", "Needs review", "Candidate-provided", "Consent withdrawn", "Source removed") and consent modules CM-01 and CM-02, fixed in one bilingual glossary (section 10).
- **Items routed to RD04-Y:** Arabic label wording [A-26 of RD03-Y], wording of the CV-processing messages [CC-09 of RD03-Y] and RTL/LTR conventions [A-42, A-45 of RD03-Y]. They are answered in sections 6, 8 and 10.

---

## 5. Navigation architecture

### 5.1 Principles

| ID | Principle |
|---|---|
| NP-1 | One shell family per role. The role is bound to the session and checked on every request [REQ-SYS-001, REQ-SYS-002; UC-01 note, p.13]. The URL prefix (`c`, `r`, `a`) names the role; it never grants it. |
| NP-2 | Candidate: mobile-first, because candidates may apply on a phone and on an unstable connection [A-25 of RD03-Y]. Recruiter and admin: desktop-first, because ranked tables, evidence review and audit lists need width [A-21 of RD03-Y]. |
| NP-3 | Few persistent destinations: 4 tabs for candidates, 3 sidebar items for recruiters, 4 for admins. Everything else is reached from the task in hand through a labelled link, a button or a breadcrumb. |
| NP-4 | Focused task flows. Applying and interviewing hide the tab bar, show steps and offer a close × that returns to the status list with the draft kept [A-67]. |
| NP-5 | One vocabulary in both languages and all roles. Status words, labels such as "Not assessed" and "Needs review" and the consent module names come from one glossary (section 10). |
| NP-6 | No silent exclusion. No screen offers an automatic rejection or a hiring probability. Sorting and filtering never change the saved snapshot [REQ-SYS-045, REQ-SYS-048, REQ-SYS-075, REQ-SYS-078]. |
| NP-7 | Guards reveal nothing. A resource of another role or organization looks exactly like a missing one [REQ-SYS-004]. |

### 5.2 Role shells

| Shell | Used by | Device priority | Layout | Primary navigation | Screens |
|---|---|---|---|---|---|
| `cand-public` | Candidate sign-in | Mobile-first | Centered form; language switch | None | 1 |
| `cand-tab` | Candidate landing and tab screens | Mobile-first | Top bar (title, language, account) and bottom tab bar | Applications · Notifications · My data · Privacy (tab bar, 4 items) | 5 |
| `cand-task` | Candidate apply and interview flows | Mobile-first | Task bar (close ×, title), optional step bar, no tab bar | Close × returns to SCR-CAN-09; steps 1/4..4/4 (apply) and 1/3..3/3 (interview) | 11 |
| `rec-public` | Recruiter sign-in | Desktop-first | Centered card; language switch | None | 1 |
| `rec` | Recruiter work screens | Desktop-first (≥ 1200 px) | Top bar (organization, language, account), sidebar at inline-start, breadcrumbs | Dashboard · Jobs · Interviews (sidebar, 3 items) | 12 |
| `adm-public` | Admin sign-in | Desktop-first | Centered card; language switch | None | 1 |
| `adm` | Admin work screens | Desktop-first (≥ 1200 px) | Same frame as `rec` | Members · Retention and deletion · Data requests · Audit history (sidebar, 4 items) | 5 |

### 5.3 Routes and guards

- **Pattern.** `/{lang}/{role}/…` with `lang` = `ar` or `en` and `role` = `c` (candidate), `r` (recruiter) or `a` (admin). Switching language swaps the prefix on the same path [RTL-11].
- **Identifiers.** Opaque, non-sequential, no personal data in a path [A-61]. `new` is the reserved identifier of create forms (for example invitations).
- **Organization.** Taken from the session and shown in the top bar, not from the path [A-60, OD-16].
- **Return after sign-in.** `?next=` carries the requested internal path; other values are ignored [A-61].
- **Consent gate.** `/{lang}/c/consent/{module}` (SCR-CAN-03 for CM-01, SCR-CAN-10 for CM-02).

| Step | Check | If it fails |
|---|---|---|
| 1 | Language prefix `/{lang}/` is `ar` or `en` | Otherwise redirect to the same path with the stored or default language [A-62] |
| 2 | Session is valid | Otherwise go to the role's sign-in with `?next=` set to the requested path (same-origin routes only) [A-61] |
| 3 | Role prefix equals the session role | Otherwise show "Not available" (same page as a missing route) [REQ-SYS-004] |
| 4 | Organization scope (recruiter, admin) | Taken from the session, never from the URL; otherwise "Not available" [REQ-SYS-003; A-60] |
| 5 | Resource belongs to the user (candidate) or the organization (recruiter, admin) | Otherwise "Not available" |
| 6 | Consent module accepted (candidate) | CM-01 before a CV is processed, CM-02 before an interview is accepted; otherwise `/{lang}/c/consent/{module}` (SCR-CAN-03, SCR-CAN-10) [REQ-SYS-005, 007] |

~~~mermaid
flowchart TD
  A["Request to /lang/role/path"] --> B{"Session valid?"}
  B -- no --> SI["Role sign-in with next"]
  B -- yes --> C{"Role prefix equals session role?"}
  C -- no --> NA["Not available"]
  C -- yes --> D{"Resource in the user or organization scope?"}
  D -- no --> NA
  D -- yes --> E{"Candidate and consent missing?"}
  E -- yes --> CG["Consent gate CAN-03 or CAN-10"]
  E -- no --> OK["Render the screen"]
~~~

**Route map** (priority from RD03-Y; depth = user actions from the landing screen, "entry" = sign-in screen)

| Screen | Route | Shell · nav | Pri | Depth |
|---|---|---|---|---|
| CAN-01 Sign-in | `/{lang}/c/sign-in` | `cand-public` · — | P0 | entry |
| CAN-02 Job details | `/{lang}/c/jobs/{jobId}` | `cand-tab` · — | P0 | 1 |
| CAN-03 Consent gate | `/{lang}/c/consent/{module}` | `cand-task` · — | P0 | 1 |
| CAN-04 CV upload | `/{lang}/c/applications/{appId}/cv` | `cand-task` · — | P0 | 1 |
| CAN-05 CV processing | `/{lang}/c/applications/{appId}/cv/processing/{procId}` | `cand-task` · — | P0 | 1 |
| CAN-06 Profile review | `/{lang}/c/applications/{appId}/profile` | `cand-task` · — | P0 | 1 |
| CAN-07 Edit item | `/{lang}/c/applications/{appId}/profile/items/{itemId}` | `cand-task` · — | P0 | 2 |
| CAN-08 Review and submit | `/{lang}/c/applications/{appId}/submit` | `cand-task` · — | P0 | 1 |
| CAN-09 My applications | `/{lang}/c/applications` | `cand-tab` · applications | P1 | 0 |
| CAN-10 Invitation | `/{lang}/c/interviews/{invId}/invitation` | `cand-task` · — | P0 | 1 |
| CAN-11 Briefing | `/{lang}/c/interviews/{invId}/briefing` | `cand-task` · — | P0 | 1 |
| CAN-12 Interview | `/{lang}/c/interviews/{invId}/session/{n}` | `cand-task` · — | P0 | 2 |
| CAN-13 Review answers | `/{lang}/c/interviews/{invId}/review` | `cand-task` · — | P0 | 3 |
| CAN-14 Resume prompt | `/{lang}/c/interviews/{invId}/resume` | `cand-task` · — | P0 | 1 |
| CAN-15 Privacy settings | `/{lang}/c/privacy` | `cand-tab` · privacy | P0 | 1 |
| CAN-16 My data | `/{lang}/c/my-data` | `cand-tab` · my-data | P1 | 1 |
| CAN-17 Notifications | `/{lang}/c/notifications` | `cand-tab` · notifications | P1 | 1 |
| REC-01 Sign-in | `/{lang}/r/sign-in` | `rec-public` · — | P0 | entry |
| REC-02 Dashboard | `/{lang}/r/dashboard` | `rec` · dashboard | P1 | 1 |
| REC-03 Jobs | `/{lang}/r/jobs` | `rec` · jobs | P0 | 0 |
| REC-04 Edit job | `/{lang}/r/jobs/{jobId}/edit` | `rec` · jobs | P0 | 1 |
| REC-05 Publish | `/{lang}/r/jobs/{jobId}/publish` | `rec` · jobs | P0 | 2 |
| REC-06 Applicants | `/{lang}/r/jobs/{jobId}/applicants` | `rec` · jobs | P0 | 1 |
| REC-07 Evidence review | `/{lang}/r/jobs/{jobId}/applicants/{appId}` | `rec` · jobs | P0 | 2 |
| REC-08 CV source | `/{lang}/r/jobs/{jobId}/applicants/{appId}/source/{spanId}` | `rec` · jobs | P0 | 3 |
| REC-09 Invite | `/{lang}/r/jobs/{jobId}/interviews/new` | `rec` · jobs | P0 | 2 |
| REC-10 Interview tracker | `/{lang}/r/interviews` | `rec` · interviews | P1 | 1 |
| REC-11 Interview result | `/{lang}/r/interviews/{sessionId}` | `rec` · interviews | P0 | 2 |
| REC-12 Decision | `/{lang}/r/jobs/{jobId}/applicants/{appId}/decision` | `rec` · jobs | P0 | 3 |
| REC-13 Timeline | `/{lang}/r/jobs/{jobId}/applicants/{appId}/timeline` | `rec` · jobs | P1 | 4 |
| ADM-01 Sign-in | `/{lang}/a/sign-in` | `adm-public` · — | P0 | entry |
| ADM-02 Members | `/{lang}/a/members` | `adm` · members | P0 | 0 |
| ADM-03 Invite or edit | `/{lang}/a/members/{memberId}` | `adm` · members | P0 | 1 |
| ADM-04 Retention | `/{lang}/a/retention` | `adm` · retention | P0 | 1 |
| ADM-05 Data requests | `/{lang}/a/requests` | `adm` · requests | P1 | 1 |
| ADM-06 Audit | `/{lang}/a/audit` | `adm` · audit | P2 | 1 |

### 5.4 Navigation maps

Thin arrows are links, thick arrows are automatic moves, dotted arrows are guards. Thick box border = landing screen; dashed border = screen that RD03-Y ranks P1 or P2. Back links and breadcrumbs are not drawn. The tab bar and the sidebars are always available and appear as grouped boxes.

**Candidate** — landing CAN-09

~~~mermaid
flowchart LR
  subgraph NAV["Tab bar (cand-tab screens)"]
    CAN_09["CAN-09<br/>My applications"]
    CAN_17["CAN-17<br/>Notifications"]
    CAN_16["CAN-16<br/>My data"]
    CAN_15["CAN-15<br/>Privacy settings"]
  end
  subgraph APPLY["Apply task (steps 1/4 to 4/4)"]
    CAN_02["CAN-02<br/>Job details"]
    CAN_03["CAN-03<br/>Consent gate"]
    CAN_04["CAN-04<br/>CV upload"]
    CAN_05["CAN-05<br/>CV processing"]
    CAN_06["CAN-06<br/>Profile review"]
    CAN_07["CAN-07<br/>Edit item"]
    CAN_08["CAN-08<br/>Review and submit"]
  end
  subgraph INT["Interview task (steps 1/3 to 3/3)"]
    CAN_10["CAN-10<br/>Invitation"]
    CAN_11["CAN-11<br/>Briefing"]
    CAN_12["CAN-12<br/>Interview"]
    CAN_13["CAN-13<br/>Review answers"]
    CAN_14["CAN-14<br/>Resume prompt"]
  end
  CAN_01["CAN-01<br/>Sign-in"]
  CAN_01 ==> CAN_02
  CAN_01 ==> CAN_09
  CAN_02 -.->|guard| CAN_01
  CAN_02 --> CAN_04
  CAN_04 -.->|guard| CAN_03
  CAN_03 ==> CAN_04
  CAN_03 --> CAN_09
  CAN_04 ==> CAN_05
  CAN_05 --> CAN_06
  CAN_05 --> CAN_04
  CAN_05 --> CAN_17
  CAN_06 --> CAN_07
  CAN_07 --> CAN_06
  CAN_06 --> CAN_08
  CAN_06 --> CAN_05
  CAN_06 --> CAN_15
  CAN_08 -.->|guard| CAN_03
  CAN_08 --> CAN_06
  CAN_08 ==> CAN_09
  CAN_09 --> CAN_02
  CAN_09 --> CAN_04
  CAN_09 --> CAN_05
  CAN_09 --> CAN_06
  CAN_09 --> CAN_08
  CAN_09 --> CAN_10
  CAN_09 --> CAN_11
  CAN_09 --> CAN_14
  CAN_10 -.->|guard| CAN_03
  CAN_03 ==> CAN_10
  CAN_10 --> CAN_11
  CAN_10 --> CAN_09
  CAN_11 --> CAN_12
  CAN_11 --> CAN_09
  CAN_11 --> CAN_15
  CAN_12 --> CAN_13
  CAN_12 -.->|guard| CAN_14
  CAN_14 --> CAN_12
  CAN_14 --> CAN_09
  CAN_12 --> CAN_15
  CAN_13 --> CAN_12
  CAN_13 ==> CAN_09
  CAN_15 --> CAN_16
  CAN_16 --> CAN_07
  CAN_17 --> CAN_05
  CAN_17 --> CAN_10
  CAN_17 --> CAN_16
  CAN_17 --> CAN_09
  classDef p1 stroke-dasharray: 5 4
  classDef land stroke-width:4px
  class CAN_09,CAN_16,CAN_17 p1
  class CAN_09 land
~~~

**Recruiter** — landing REC-03 (P0 fallback) / REC-02

~~~mermaid
flowchart LR
  subgraph NAV["Sidebar (rec screens)"]
    REC_02["REC-02<br/>Dashboard"]
    REC_03["REC-03<br/>Jobs"]
    REC_10["REC-10<br/>Interview tracker"]
  end
  REC_01["REC-01<br/>Sign-in"]
  REC_04["REC-04<br/>Edit job"]
  REC_05["REC-05<br/>Publish"]
  REC_06["REC-06<br/>Applicants"]
  REC_07["REC-07<br/>Evidence review"]
  REC_08["REC-08<br/>CV source"]
  REC_09["REC-09<br/>Invite"]
  REC_11["REC-11<br/>Interview result"]
  REC_12["REC-12<br/>Decision"]
  REC_13["REC-13<br/>Timeline"]
  REC_01 ==> REC_02
  REC_01 ==> REC_03
  REC_02 --> REC_06
  REC_02 --> REC_10
  REC_03 --> REC_04
  REC_03 --> REC_06
  REC_04 --> REC_05
  REC_05 --> REC_03
  REC_04 -.->|guard| REC_01
  REC_06 --> REC_07
  REC_06 --> REC_09
  REC_07 --> REC_08
  REC_07 --> REC_09
  REC_07 --> REC_12
  REC_09 --> REC_10
  REC_09 --> REC_12
  REC_10 --> REC_11
  REC_11 --> REC_12
  REC_12 --> REC_11
  REC_12 --> REC_13
  classDef p1 stroke-dasharray: 5 4
  classDef land stroke-width:4px
  class REC_02,REC_10,REC_13 p1
  class REC_03 land
~~~

**Admin** — landing ADM-02

~~~mermaid
flowchart LR
  subgraph NAV["Sidebar (adm screens)"]
    ADM_02["ADM-02<br/>Members"]
    ADM_04["ADM-04<br/>Retention"]
    ADM_05["ADM-05<br/>Data requests"]
    ADM_06["ADM-06<br/>Audit"]
  end
  ADM_01["ADM-01<br/>Sign-in"]
  ADM_03["ADM-03<br/>Invite or edit"]
  ADM_01 ==> ADM_02
  ADM_02 --> ADM_03
  ADM_03 --> ADM_02
  ADM_03 --> ADM_06
  ADM_02 -.->|guard| ADM_01
  ADM_04 --> ADM_05
  ADM_05 --> ADM_04
  ADM_04 --> ADM_06
  classDef p1 stroke-dasharray: 5 4
  classDef land stroke-width:4px
  class ADM_05,ADM_06 p1
  class ADM_02 land
~~~

Depth by screen (user actions from the landing screen):

| Role | Max | Screens by depth |
|---|---|---|
| Candidate | 3 | 0: CAN-09; 1: CAN-02, CAN-03, CAN-04, CAN-05, CAN-06, CAN-08, CAN-10, CAN-11, CAN-14, CAN-15, CAN-16, CAN-17; 2: CAN-07, CAN-12; 3: CAN-13 |
| Recruiter | 4 | 0: REC-03; 1: REC-02, REC-04, REC-06, REC-10; 2: REC-05, REC-07, REC-09, REC-11; 3: REC-08, REC-12; 4: REC-13 |
| Admin | 1 | 0: ADM-02; 1: ADM-03, ADM-04, ADM-05, ADM-06 |

Starting from SCR-REC-02 instead of SCR-REC-03 the recruiter maximum is also 4. Landing choices: SCR-CAN-09 for candidates, SCR-REC-03 for recruiters (SCR-REC-02 is P1 and optional), SCR-ADM-02 for admins [A-68, OD-12].

### 5.5 Link kinds

| Kind | Meaning | Cost | Explicit edges |
|---|---|---|---|
| `link` | User follows a button or link to another screen | 1 | 58 |
| `back` | User returns to the previous screen of a flow | 1 | 8 |
| `crumb` | User follows a breadcrumb ancestor (recruiter, admin) | 1 | 4 |
| `auto` | System moves the user after an action (for example sign-in to landing, upload to processing) | 0 | 10 |
| `guard` | A route guard sends the user (sign-in, consent gate) | 0 | 7 |
| `shell` | Always-available shell navigation (tab bar or sidebar) to its 4, 3 or 4 destinations | 1 | 76 |

Of the 87 explicit edges, 47 are backed by a step of an RD03-Y flow; 40 are navigation additions (back links, breadcrumbs and extra links such as opening the audit history from the retention screen). The per-screen "In" and "Out" lines of section 9 list the edges.

### 5.6 Cross-role handoffs

A handoff is a state change made by one role that another role sees. It is not a link between shells; no screen of one role links to a screen of another.

| ID | From | To | Trigger | Effect | Source |
|---|---|---|---|---|---|
| H-01 | CAN-09 | REC-06 | Candidate withdraws an application | The applicant row shows "Withdrawn" | UC-CAN-07 A2; REQ-SYS-042 |
| H-02 | CAN-10 | REC-10 | Candidate accepts, declines or does not answer an invitation | Tracker shows Accepted, Declined or still Invited | UC-CAN-08 M4, A1, A3; REQ-SYS-059, 060 |
| H-03 | CAN-15 | REC-06 | Candidate withdraws CM-01 (CV analysis and matching) | Results of that module are hidden; the row shows "Consent withdrawn" | UC-CAN-01 W5; REQ-SYS-011 |
| H-04 | CAN-15 | REC-10 | Candidate withdraws CM-02 during an open interview | Session closes; tracker shows "Closed"; results hidden | UC-CAN-01 A5; REQ-SYS-010, 011 |
| H-05 | REC-10 | CAN-09 | Recruiter sends or cancels an invitation | Invitation appears in the application status and in notifications (SCR-CAN-17) | UC-REC-04 M4, A4; REQ-SYS-057, 092 |
| H-06 | REC-13 | CAN-09 | Recruiter saves a decision | Candidate sees "Decision recorded" only; the outcome is not shown [OD-05 of RD03-Y] | UC-REC-06 M5; REQ-SYS-077 |

~~~mermaid
flowchart LR
  subgraph C["Candidate shells"]
    CAN_09["CAN-09<br/>My applications"]
    CAN_10["CAN-10<br/>Invitation"]
    CAN_15["CAN-15<br/>Privacy settings"]
  end
  subgraph E["Recruiter shell"]
    REC_06["REC-06<br/>Applicants"]
    REC_10["REC-10<br/>Interview tracker"]
    REC_13["REC-13<br/>Timeline"]
  end
  CAN_09 -.->|H-01| REC_06
  CAN_10 -.->|H-02| REC_10
  CAN_15 -.->|H-03| REC_06
  CAN_15 -.->|H-04| REC_10
  REC_10 -.->|H-05| CAN_09
  REC_13 -.->|H-06| CAN_09
~~~

---

## 6. RTL/LTR conventions

Arabic is right-to-left and English left-to-right. Both are first-class: every screen exists in both directions and every convention below can be checked on the sheets. "Basis" names the source tag of section 2 or the assumption where a rule is a proposal.

| ID | Convention | Where it shows | Basis |
|---|---|---|---|
| RTL-01 | Language and direction are set in markup on the root element (`lang="ar" dir="rtl"`, `lang="en" dir="ltr"`), not by CSS alone. | All 76 sheets (build check CK-15) | W3C-DIR |
| RTL-02 | One layout is mirrored through logical properties (inline-start/end, block-start/end), not through separate left/right style sheets. | Sidebar at inline-start; gutters; alignment | CSS-LOG; W3C-DIR |
| RTL-03 | Mirror what expresses order or direction: page layout, sidebar, breadcrumb chevrons, back/next/previous, steppers and progress fill, table column order, tab-bar order. | Every Arabic sheet | HIG-RTL |
| RTL-04 | Do not flip logos, checkmarks, clocks, photographs or the page image of a CV; real-world icons keep their shape. | SCR-REC-08 page view; status marks | HIG-RTL |
| RTL-05 | Digits inside one number never reverse. Counters are written as words ("3 of 10" / "3 من 10"), not "3/10", and a sequence of progress items reverses with the control. | Pager and step counters in CAN-12, CAN-13 | HIG-RTL; W3C-UBA |
| RTL-06 | Western digits (0–9) in both languages for the first release; regions differ, so the choice is open [OD-13]. | All sheets | ALREQ; HIG-RTL; A-63 |
| RTL-07 | Values that are always left-to-right (email, URL, identifiers such as PROC-0042, DR-0002, ERR-7F3A, file names) are isolated and set `dir="ltr"`; values inserted into an Arabic sentence are wrapped with `<bdi>`. | Email fields; "Reference: ERR-7F3A"; file names | W3C-DIR; W3C-UBA |
| RTL-08 | Quoted CV text keeps its own language and direction (`lang`, `dir="auto"`); the accent bar of the quote follows the quote, the labels around it follow the page. | SCR-REC-07, REC-08, REC-11 quotes | W3C-DIR; WCAG-SC 3.1.2; A-24 of RD03-Y |
| RTL-09 | Free-text inputs use `dir="auto"` so Arabic, English and mixed answers align naturally; the detected direction is kept with the saved text [A-58]. | Interview answer, notes, rationale | W3C-DIR |
| RTL-10 | A paragraph of three or more lines is aligned by its own language; short labels follow the page direction; all items of one list share one alignment. | Quotes; consent notice | HIG-RTL |
| RTL-11 | The language switch sits in every top bar, names each language in itself (English, العربية) and keeps the user on the same page with the prefix swapped and unsaved input kept. | All shells | WCAG-22 (3.3.7) |
| RTL-12 | Focus order equals DOM order equals visual reading order in both directions; no positive tab index; a sticky bar never hides the focused element. | All shells | WCAG-SC 1.3.2, 2.4.3; WCAG-22 (2.4.11) |
| RTL-13 | Interactive targets are at least 24 by 24 CSS px (tab-bar items, icon buttons, row actions, chips). | All shells | WCAG-22 (2.5.8) |
| RTL-14 | Arabic text has no letter-spacing and no kashida or justification stretch; line height is larger than for Latin text (wireframes: 1.75 against 1.5); Arabic is set slightly larger beside capital Latin letters. | All Arabic sheets | ALREQ; HIG-RTL; A-65 |
| RTL-15 | No italics for Arabic emphasis; emphasis uses weight, a label or an icon with text. | All Arabic sheets | A-65 (not verified in a source) |
| RTL-16 | Messages with inserted values are whole-sentence templates per language ("File {name}, saved as version {n}"); strings are never concatenated across languages. | Section 8 catalogue | A-66 |
| RTL-17 | Status is never colour alone: each status has text, a border style and an icon or marker. | All badges and alerts | A-69 |
| RTL-18 | Dates and times use one placeholder pattern (`2026-11-05 10:45`) in both languages until the locale format is decided [OD-13]. | Timeline, tracker, history | A-64 |
| RTL-19 | Tables mirror their column order; identifiers stay at inline-start; numeric cells keep digit order; the rank column stays first. | SCR-REC-06, REC-10, ADM-02, ADM-05, ADM-06 | HIG-RTL |
| RTL-20 | Every glossary term has one Arabic form used on every screen (section 10); the check CK-14 counts exact matches. | All sheets | RD03-Y A-26 |

---

## 7. Wireframe conventions and legend

- **Sheets.** One sheet per screen and language: `wireframes/SCR-CAN-05_en.png` (left-to-right) and `wireframes/SCR-CAN-05_ar.png` (right-to-left). Each sheet has a header (identifier, title, route with language prefix, "placeholder content" note) and one to four frames.
- **Frames.** F0 is the default state; F1 and later show the states RD03-Y requires, named as in RD03-Y. Section 9 maps each state to its frame.
- **Callouts.** A number in a circle sits at an element that realizes requirements; the table of the screen in section 9 lists number, frame, element and requirements. Elements without a requirement have no number.
- **Link tags.** A small `→CAN-06` tag on an element names the destination screen of its link or button.
- **Status marks.** Green solid = ok; double red = error; dashed amber = warning; blue = information; gray outline = neutral. Every status also has text [RTL-17].
- **Shells.** Candidate frames are 390 px wide with a bottom tab bar or a task bar; recruiter and admin frames are 1200 px wide with a sidebar at inline-start.
- **Placeholder content.** Names, identifiers, dates and numbers are invented [A-70].

<img src="wireframes/SCR-CAN-05_en.png" alt="SCR-CAN-05 English sheet" width="480"> <img src="wireframes/SCR-CAN-05_ar.png" alt="SCR-CAN-05 Arabic sheet" width="480">

---

## 8. Shared states and message catalogue

### 8.1 Shared states

Every screen uses the same five patterns, drawn once in the candidate shell (`KIT-S1`) and once in the recruiter shell (`KIT-S2`). Identical wording and behaviour apply to the admin shell.

| State | Pattern | Rule | Sheet |
|---|---|---|---|
| Loading | Layout stays in place; a progress line and skeleton rows; a status text for assistive technology | If loading takes too long the view is replaced by Error with retry [A-72] | KIT-S1 F0, KIT-S2 F0 |
| Empty | One sentence saying what is missing and what to do next; no illustration needed | Empty is never shown for an error | KIT-S1 F1, KIT-S2 F1 |
| Error with retry | What failed, "Nothing was changed", a Retry button and a reference code (left-to-right) | Entered data stays on the page; Retry repeats the same request | KIT-S1 F2, KIT-S2 F2 |
| Not available | The same text for a wrong, expired or out-of-scope link; one button to the role landing | Never says whether the resource exists elsewhere [REQ-SYS-004] | KIT-S1 F3 |
| Session expired | Says the session ended; Sign in; returns to the same page afterwards (`?next=`) | Answers already saved stay saved; data already given is not asked for again (3.3.7) | KIT-S2 F3 |

Wording used on the shared sheets:

| State | English | Arabic |
|---|---|---|
| Loading | Loading your applications… | جار تحميل طلباتك… |
| Empty | You have no applications yet. | ليس لديك طلبات بعد. |
| Error with retry | We could not load your applications. Nothing was changed. | تعذر تحميل طلباتك. لم يتغير شيء. |
| Not available | The link may be wrong, expired or not meant for your account. We cannot say which. | قد يكون الرابط خاطئا أو منتهيا أو غير مخصص لحسابك. لا يمكننا تحديد السبب. |
| Session expired | Your session ended. Sign in again to continue where you stopped. | انتهت جلستك. سجل الدخول مرة أخرى لمتابعة ما توقفت عنده. |

### 8.2 CV-processing and upload messages (answer to CC-09 of RD03-Y)

The messages follow ST-01 (Queued, Processing, Ready, Failed; one automatic retry shown as a note on Queued, never a fifth state) [ST-01, p.17; REQ-SYS-019 to 022]. The last two rows are wording proposals for the other two failure categories; they are not drawn.

| Case | English | Arabic | Sheet |
|---|---|---|---|
| Queued | Your CV is in the queue. We will start shortly. | سيرتك الذاتية في قائمة الانتظار وسنبدأ قريبا. | CAN-05 |
| Queued, one automatic retry | Retrying once after a temporary problem. | نعيد المحاولة مرة واحدة بعد مشكلة مؤقتة. | CAN-05 |
| Processing | We are reading your CV and finding skills and experience. | نقرأ سيرتك الذاتية ونستخرج المهارات والخبرات. | CAN-05 |
| Ready | Your CV is ready. Review the information we found. | سيرتك الذاتية جاهزة. راجع المعلومات التي استخرجناها. | CAN-05 |
| Failed: no readable text | Failed: no readable text in the file. | فشلت المعالجة: لا يوجد نص مقروء في الملف. | CAN-05 |
| Failed: next step | Next step: upload a text PDF of up to 5 MB and 5 pages. | الخطوة التالية: ارفع ملف PDF نصيا حتى 5 ميغابايت و5 صفحات. | CAN-05 |
| Leave and return | You can leave this page. We will tell you here and by email when it is ready. | يمكنك مغادرة هذه الصفحة. سنخبرك هنا وبالبريد الإلكتروني عندما تصبح جاهزة. | CAN-05 |
| Upload: oversized file | The file is 7 MB. The limit is 5 MB. Nothing was uploaded. | حجم الملف 7 ميغابايت والحد الأقصى 5 ميغابايت. لم يتم رفع شيء. | CAN-04 |
| Failed: temporary service problem (not drawn) | Failed: a temporary problem on our side. Try again in a few minutes. | فشلت المعالجة بسبب مشكلة مؤقتة لدينا. حاول مرة أخرى بعد دقائق. | CAN-05 |
| Failed: unsupported or oversized file (not drawn) | Failed: the file type or size is not supported. Upload a text PDF of up to 5 MB and 5 pages. | فشلت المعالجة: نوع الملف أو حجمه غير مدعوم. ارفع ملف PDF نصيا حتى 5 ميغابايت و5 صفحات. | CAN-05 |

---

## 9. Wireframe specifications

Each block gives the shell, priority and depth, the links in and out (kinds in section 5.5), the frames with their RD03-Y states, and the callout table. The sheets of screen CAN-02 are `wireframes/SCR-CAN-02_en.png` and `wireframes/SCR-CAN-02_ar.png`; every other screen follows the same pattern. In the tables **Fr** is the frame, element text is the English text shortened to 70 characters, and **REQ** lists `REQ-SYS` numbers. Arabic text is on the sheets and in `ui-strings.csv`.

### 9.1 Candidate screens

#### CAN-01 · Candidate sign-in and registration · تسجيل الدخول أو إنشاء حساب
`cand-public` · P0 · depth entry

In: CAN-02 (guard) · Out: CAN-02 (auto), CAN-09 (auto)

Frames: F0 Default · F1 Error · F2 Locked. States: error → F1; locked → F2; language choice → F0

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Heading: Candidate sign-in | 001 |
| 2 | F0 | Field: Password | 001 |
| 3 | F0 | Button: Sign in | 001 |
| 4 | F1 | Alert: The email or password is incorrect. | 001 |
| 5 | F1 | Alert: This is not a candidate account. Use the recruiter sign-in. | 004 |
| 6 | F2 | Alert: Too many attempts. Try again later. | 001 |

#### CAN-02 · Job details and application start · تفاصيل الوظيفة
`cand-tab` · P0 · depth 1

In: CAN-01 (auto), CAN-09 · Out: CAN-01 (guard), CAN-04

Frames: F0 Open job · F1 Job closed · F2 Job revised. States: job closed → F1; job revised → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Heading: Sample job | 013 |
| 2 | F0 | Card: Description | 013 |
| 3 | F0 | Card: Requirements | 013 |
| 4 | F0 | Note: Job version 2, published 2026-11-01 | 014 |
| 5 | F0 | Button: Start application | 014 |
| 6 | F1 | Alert: This job is closed to new applications. | 013 |
| 7 | F2 | Alert: This job was revised (version 3). Start again to apply to the new ver… | 014 |

#### CAN-03 · Consent notice and module choice · الموافقة
`cand-task` · P0 · depth 1

In: CAN-04 (guard), CAN-08 (guard), CAN-10 (guard) · Out: CAN-04 (auto), CAN-09, CAN-10 (auto)

Frames: F0 CM-01 notice · F1 Declined · F2 Storage error · F3 Notice version changed. States: declined outcome → F1; storage error → F2; notice version changed → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Heading: CV analysis and matching (CM-01) | 005 |
| 2 | F0 | Note: Notice version 3 · English · separate from CM-02 | 008 |
| 3 | F0 | Card: What happens with your data | 006 |
| 4 | F0 | Alert: Processing starts only after you agree. | 007 |
| 5 | F0 | Button: I agree | 005 |
| 6 | F1 | Alert: Without CM-01 you cannot upload a CV or submit this application. Your… | 012, 038 |
| 7 | F1 | Alert: If you decline CM-02, the recruiter is told that you declined, withou… | 059 |
| 8 | F1 | Note: Your decision is stored with the time and notice version. | 008 |
| 9 | F2 | Alert: We could not save your decision. Nothing was processed. | 008 |
| 10 | F3 | Alert: The notice changed (version 4). Read it and decide again. | 006, 008 |

#### CAN-04 · CV upload · رفع السيرة الذاتية
`cand-task · step 1/4` · P0 · depth 1

In: CAN-02, CAN-03 (auto), CAN-05, CAN-09 · Out: CAN-03 (guard), CAN-05 (auto)

Frames: F0 Default · F1 Oversized · F2 Unsupported or scanned · F3 Replace upload. States: oversized → F1; unsupported → F2; scanned → F2; replace upload → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Field: Choose a text PDF | 015 |
| 2 | F0 | Note: Consent for CV analysis (CM-01) is requested first if needed. | 007 |
| 3 | F0 | Button: Upload | 015 |
| 4 | F1 | Alert: The file is 7 MB. The limit is 5 MB. Nothing was uploaded. | 015 |
| 5 | F2 | Alert: Scanned or image-only PDFs are not supported yet. Upload a PDF with s… | 016 |
| 6 | F3 | Button: Replace file | 023 |

#### CAN-05 · Processing status · معالجة السيرة الذاتية
`cand-task · step 2/4` · P0 · depth 1

In: CAN-04 (auto), CAN-06, CAN-09, CAN-17 · Out: CAN-06, CAN-04, CAN-17

Frames: F0 Queued · F1 Processing · F2 Ready · F3 Failed. States: retrying → F0; failed by category → F3; leave and return → F0

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Stepper: Queued ; Processing ; Ready | 019 |
| 2 | F0 | Text: Your CV is in the queue. We will start shortly. | 019 |
| 3 | F0 | Alert: Retrying once after a temporary problem. | 021 |
| 4 | F0 | Note: File cv.pdf, saved as version 1 | 017 |
| 5 | F0 | Note: Processing ID: PROC-0042 | 018 |
| 6 | F0 | Text: You can leave this page. We will tell you here and by email when it i… | 020, 092 |
| 7 | F3 | Alert: Failed: no readable text in the file. | 022 |
| – | – | Non-visual: Job identifier returned and status readable within 2 s is a latency t… | 018 |

#### CAN-06 · CV profile review · مراجعة ملف السيرة الذاتية
`cand-task · step 3/4` · P0 · depth 1

In: CAN-05, CAN-07, CAN-08, CAN-09 · Out: CAN-07, CAN-08, CAN-05, CAN-15

Frames: F0 Default · F1 Many unknown · F2 Mixed Arabic and English · F3 Consent withdrawn. States: many unknown → F1; mixed Arabic/English → F2; consent withdrawn → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Toast: Saved at 10:32 as profile version 2 | 030 |
| 2 | F0 | Quote: Built REST APIs in Python and deployed them on Linux. | 024, 026 |
| 3 | F0 | Button: Edit | 027 |
| 4 | F0 | Quote: عملت في تطوير تطبيقات الويب لمدة سنتين. | 026 |
| 5 | F0 | Badge: Unknown | 025 |
| 6 | F0 | Badge: Source validation failed | 025 |
| 7 | F0 | Button: Add an item | 027 |
| 8 | F0 | Button: Confirm profile and continue | 031, 038 |
| 9 | F1 | Alert: 4 of 6 items are Unknown. Unknown is not a negative result. | 025 |
| 10 | F2 | Quote: عملت مع Django و PostgreSQL في مشروع تجريبي. | 026 |
| 11 | F3 | Alert: Consent withdrawn: CV analysis stopped and results are hidden from re… | 010 |

#### CAN-07 · Profile item editor · تعديل عنصر
`cand-task · step 3/4` · P0 · depth 2

In: CAN-06, CAN-16 · Out: CAN-06

Frames: F0 Edit · F1 Candidate-provided label · F2 Not saved · F3 Span rejected. States: not saved → F2; span rejected → F3; candidate-provided label → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Note: Original value: not found | 025 |
| 2 | F0 | Field: Value | 027, 093 |
| 3 | F0 | Button: Restore original value | 027 |
| 4 | F0 | Card: Source in your CV (optional) | 029 |
| 5 | F0 | Source page: Page 2 | 026 |
| 6 | F0 | Button: Save | 030 |
| 7 | F1 | Toast: Saved at 10:32 as profile version 3 | 030 |
| 8 | F1 | Badge: Candidate-provided | 028 |
| 9 | F3 | Alert: The selected text does not match the CV text. Select the passage agai… | 029 |

#### CAN-08 · Application review and submit · المراجعة والإرسال
`cand-task · step 4/4` · P0 · depth 1

In: CAN-06, CAN-09 · Out: CAN-03 (guard), CAN-06, CAN-09 (auto)

Frames: F0 Default · F1 Blocked · F2 Job version changed · F3 Submit error. States: blocked (not Ready, no consent) → F1; job version changed → F2; submit error → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Text: Sample job, version 2 | 014 |
| 2 | F0 | Text: Resume version 1, confirmed on 2026-11-05 | 031 |
| 3 | F0 | Note: The application stays linked to job version 2 even if the job is revi… | 036 |
| 4 | F0 | Card: What the recruiter will see | 041 |
| 5 | F0 | Checkbox: CV analysis consent (CM-01) is granted | 007 |
| 6 | F0 | Button: Submit application | 039 |
| 7 | F0 | Note: You will not see rankings or scores. | 041 |
| 8 | F1 | Alert: You cannot submit yet: the CV is not Ready and consent CM-01 is missi… | 038, 007 |
| 9 | F2 | Alert: The job changed (version 3). Your application stays on version 2. | 014, 036 |
| 10 | F3 | Alert: Not submitted. Your data is safe. Try again. | 039 |

#### CAN-09 · My applications and status · طلباتي
`cand-tab` · P1 · depth 0

In: CAN-01 (auto), CAN-03, CAN-08 (auto), CAN-10, CAN-11, CAN-14, CAN-13 (auto), CAN-17, tab bar (shell) · Out: CAN-02, CAN-04, CAN-05, CAN-06, CAN-08, CAN-10, CAN-11, CAN-14

Frames: F0 Default · F1 Empty · F2 Withdrawn · F3 Decision recorded. States: empty → F1; withdrawn → F2; decision recorded → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Badge: Submitted | 040 |
| 2 | F0 | Badge: Interview invited | 057, 040 |
| 3 | F0 | Button: View invitation | 057 |
| 4 | F0 | Button: Withdraw an application | 042 |
| 5 | F0 | Note: You see only your own applications and their status, with no rankings… | 041 |
| 6 | F2 | Badge: Withdrawn | 042 |
| 7 | F3 | Badge: Decision recorded | 077 |

#### CAN-10 · Interview invitation and consent · دعوة إلى مقابلة
`cand-task` · P0 · depth 1

In: CAN-09, CAN-03 (auto), CAN-17 · Out: CAN-03 (guard), CAN-11, CAN-09

Frames: F0 Invitation · F1 Cancelled invitation · F2 Declined. States: cancelled invitation → F1; declined → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Badge: Invited | 074 |
| 2 | F0 | Heading: Text interview for Sample job | 054, 057 |
| 3 | F0 | Card: Before you accept | 058 |
| 4 | F0 | Note: Accepting asks for consent to CM-02 first if needed. | 005 |
| 5 | F0 | Button: Accept | 059 |
| 6 | F0 | Button: Decline | 012 |
| 7 | F0 | Note: Declining keeps your application and CV evidence unchanged. | 060 |
| 8 | F1 | Alert: The recruiter cancelled this invitation before it started. | 054 |
| 9 | F2 | Alert: You declined. The recruiter was told, without a reason. Your applicat… | 059, 060 |

#### CAN-11 · Interview briefing · تعليمات المقابلة
`cand-task · step 1/3` · P0 · depth 1

In: CAN-09, CAN-10 · Out: CAN-12, CAN-09, CAN-15

Frames: F0 Ready · F1 Session closed. States: ready → F0; session closed → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Heading: Before you start | 058 |
| 2 | F1 | Alert: This session is closed because CM-02 was withdrawn. | 010 |

#### CAN-12 · Interview session · المقابلة
`cand-task · step 2/3` · P0 · depth 2

In: CAN-11, CAN-14, CAN-13 · Out: CAN-13, CAN-14 (guard), CAN-15

Frames: F0 Saved at time · F1 Saving · F2 Not saved with reason · F3 Offline and language fallback. States: Saving → F1; Saved at time → F0; Not saved with reason → F2; offline → F3; language fallback → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Progress: Question 3 of 10 | 067 |
| 2 | F0 | Heading: Describe a project where you used SQL. | 061 |
| 3 | F0 | Field: Your answer | 062, 071 |
| 4 | F0 | Save state: Saved at 10:30 | 064 |
| 5 | F0 | Note: Saved automatically while you type and when you leave a question. | 063 |
| 6 | F0 | Note: Your answer is read as text only, never as instructions. | 071 |
| 7 | F0 | Pager: Previous ; 3 of 10 ; Next | 067, 094 |
| 8 | F0 | Note: If you leave, the session is marked Interrupted and you can resume. | 065 |
| 9 | F2 | Save state: Not saved: the server did not respond | 064 |
| 10 | F2 | Alert: Leaving now loses unsaved text. | 064 |
| 11 | F3 | Badge: This question is available in English only | 061 |
| 12 | F3 | Alert: Your text is kept on this page and syncs when you are back online. | 066 |
| – | – | Non-visual: 010: when the session is closed the editor becomes read-only with the… | 010, 054 |

#### CAN-13 · Interview answer review and submit · المراجعة والإرسال
`cand-task · step 3/3` · P0 · depth 3

In: CAN-12 · Out: CAN-12, CAN-09 (auto)

Frames: F0 Review · F1 Received · F2 Not received · F3 Already submitted. States: received → F1; not received → F2; already submitted → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Heading: Review your answers | 067 |
| 2 | F0 | Checkbox: I confirm I want to submit all answers. | 067 |
| 3 | F0 | Button: Submit answers | 068 |
| 4 | F0 | Note: Sending twice is safe: it is stored once. | 068 |
| 5 | F1 | Alert: Your answers were received on 2026-11-05 10:50. | 070 |
| 6 | F1 | Text: A fixed rubric version scores answers and the recruiter reviews them.… | 070 |
| 7 | F2 | Alert: We are not sure your answers were received because the connection was… | 068 |
| 8 | F3 | Alert: These answers were submitted on 2026-11-05 10:50 and cannot be change… | 069 |

#### CAN-14 · Interview resume prompt · استئناف المقابلة
`cand-task` · P0 · depth 1

In: CAN-09, CAN-12 (guard) · Out: CAN-12, CAN-09

Frames: F0 Resume prompt · F1 Draft restored · F2 Session closed. States: session closed → F2; draft restored → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Text: Your session was Interrupted. Your draft for question 3 is saved (10:… | 065 |
| 2 | F1 | Toast: Draft restored at question 3 | 065 |
| 3 | F2 | Alert: This session was closed. You cannot resume it. | 065 |

#### CAN-15 · Privacy and consent settings · الخصوصية والموافقة
`cand-tab` · P0 · depth 1

In: CAN-06, CAN-11, CAN-12, tab bar (shell) · Out: CAN-16

Frames: F0 Default · F1 Confirm withdrawal · F2 Withdrawal applied. States: confirm withdrawal → F1; withdrawal applied → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: CV analysis and matching (CM-01) | 008 |
| 2 | F0 | Button: Withdraw consent | 009 |
| 3 | F1 | Item: New processing stops now. | 009 |
| 4 | F1 | Item: Queued and running jobs are cancelled and open interview invitations… | 010, 054 |
| 5 | F1 | Item: Recruiters no longer see the results; the application shows Consent w… | 011 |
| 6 | F2 | Alert: Consent withdrawn on 2026-11-05 10:55. Processing stopped. | 008 |
| 7 | F2 | Note: Interview status: Closed | 074 |

#### CAN-16 · My data and requests · بياناتي وطلباتي
`cand-tab` · P1 · depth 1

In: CAN-15, CAN-17, tab bar (shell) · Out: CAN-07

Frames: F0 Default · F1 Pending · F2 Rejected with reason · F3 Completed. States: pending → F1; rejected with reason → F2; completed → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Data we hold about you | 079 |
| 2 | F0 | Button: Correct a profile item | 027 |
| 3 | F0 | Card: New request | 080 |
| 4 | F0 | Card: Your requests | 081 |
| 5 | F1 | Note: The organization that holds the data processes the request and you ar… | 081, 092 |
| 6 | F2 | Note: Reason: identity could not be verified. | 082 |
| 7 | F3 | Button: Download export file | 082 |
| 8 | F3 | Note: Deleted items show as removed; their private text is not kept. | 083 |

#### CAN-17 · Notifications · الإشعارات
`cand-tab` · P1 · depth 1

In: CAN-05, tab bar (shell) · Out: CAN-05, CAN-10, CAN-16, CAN-09

Frames: F0 Unread · F1 Read · F2 Empty. States: empty → F2; read → F1; unread → F0

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Your CV is Ready | 020 |
| 2 | F0 | Card: Data request update | 082 |
| 3 | F0 | Note: Events that need action also arrive by email. | 092 |

### 9.2 Recruiter screens

#### REC-01 · Recruiter sign-in and organization selection · تسجيل دخول مسؤول التوظيف
`rec-public` · P0 · depth entry

In: REC-04 (guard) · Out: REC-02 (auto), REC-03 (auto)

Frames: F0 Sign in · F1 Several memberships · F2 Access denied. States: several memberships → F1; access denied → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Button: Sign in | 002 |
| 2 | F1 | Choice: Choose an organization | 003 |
| 3 | F1 | Button: Continue | 003 |
| 4 | F2 | Alert: You do not have access to this page. | 004 |
| 5 | F2 | Note: We do not show whether the page exists in another organization. | 004 |

#### REC-02 · Recruiter dashboard · لوحة المتابعة
`rec` · P1 · depth 1

In: REC-01 (auto), sidebar (shell) · Out: REC-06, REC-10

Frames: F0 Default · F1 Empty. States: empty → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Counter: Applications needing review | 045 |
| 2 | F0 | Counter: Interviews awaiting review | 074 |

#### REC-03 · Job list and version history · الوظائف
`rec` · P0 · depth 0

In: REC-01 (auto), REC-05, REC-06 (back), sidebar (shell) · Out: REC-04, REC-06

Frames: F0 Default · F1 Closed · F2 Revised. States: closed → F1; revised → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Button: New job | 032 |
| 2 | F0 | Table: Job; Version; Applications; Status; Actions | 037 |
| 3 | F0 | Card: Version history: Sample job A | 037 |
| 4 | F1 | Alert: Sample job B is closed to new applications. Its 3 existing applicatio… | 037 |
| 5 | F2 | Alert: Sample job A is now version 3. Earlier applications stay on the versi… | 037 |

#### REC-04 · Job editor · تعديل الوظيفة
`rec` · P0 · depth 1

In: REC-03, REC-05 (back) · Out: REC-05, REC-01 (guard)

Frames: F0 Default · F1 Validation error · F2 Edited after publication. States: validation error → F1; edited after publication → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Field: Title | 032 |
| 2 | F0 | Field: Language | 032 |
| 3 | F0 | Card: Requirements | 033 |
| 4 | F0 | Note: Mandatory means missing evidence is shown as «Not assessed» and never… | 034 |
| 5 | F0 | Card: Preview: an applicant with no evidence for a mandatory requirement | 035 |
| 6 | F0 | Button: Review and publish | 036 |
| 7 | F1 | Alert: Add a title and at least one requirement. | 032 |
| 8 | F2 | Alert: This job is published as version 2. Saving creates version 3; earlier… | 036, 037 |

#### REC-05 · Job publish review · مراجعة ونشر
`rec` · P0 · depth 2

In: REC-04 · Out: REC-03, REC-04 (back)

Frames: F0 Review · F1 New version created. States: new version created → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Sample job · new version 3 | 036 |
| 2 | F0 | Card: Effect on existing applications | 037 |
| 3 | F1 | Toast: Version 3 published | 036 |

#### REC-06 · Ranked applicant list · المتقدمون
`rec` · P0 · depth 1

In: REC-02, REC-03, REC-07 (back), REC-09 (back), REC-08 (crumb), REC-12 (crumb), REC-13 (crumb) · Out: REC-07, REC-09, REC-03 (back)

Frames: F0 Default · F1 Empty list. States: pending or failed matching → F0; consent withdrawn → F0; empty → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Alert: Ranking basis: requirements matched in the saved snapshot. It is not… | 045, 048 |
| 2 | F0 | Filter: All (6) ; Needs review (2) | 047 |
| 3 | F0 | Field: Sort by rank | 047 |
| 4 | F0 | Table: Rank; Applicant; Supported; Unsupported; Contradicted; Insufficient e… | 046 |
| 5 | F0 | Row: – ; Applicant C ; – ; – ; – ; – ; – ; Matching pending | 044 |
| 6 | F0 | Row: – ; Applicant D ; – ; – ; – ; – ; – ; Matching failed | 044 |
| 7 | F0 | Row: – ; Applicant E ; – ; – ; – ; – ; – ; Consent withdrawn | 011 |
| 8 | F0 | Row: – ; Applicant F ; – ; – ; – ; – ; – ; Withdrawn | 042 |
| – | – | Non-visual: Cross-cutting: the job version is named in the breadcrumb and header;… | 053, 094 |

#### REC-07 · Application evidence review · مراجعة الأدلة: المتقدم أ
`rec` · P0 · depth 2

In: REC-06, REC-08 (back), REC-12 (back), REC-13 (crumb) · Out: REC-06 (back), REC-08, REC-09, REC-12

Frames: F0 Default · F1 Validation failure · F2 Older version or consent withdrawn. States: validation failure → F1; Insufficient evidence with reason → F0; older job version → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Alert: Results rest on job version 2, resume version 1 and snapshot 2026-11-… | 053 |
| 2 | F0 | Button: Invite to interview | 054 |
| 3 | F0 | Button: Record decision | 076 |
| 4 | F0 | Badge: Supported | 049 |
| 5 | F0 | Badge: Source valid | 050 |
| 6 | F0 | Quote: Wrote SQL queries and views for reporting. | 051, 093 |
| 7 | F0 | Field: Reviewer note | 052 |
| 8 | F0 | Badge: Not assessed | 025 |
| 9 | F0 | Badge: Candidate-provided | 028 |
| 10 | F1 | Badge: Source validation failed | 050 |
| 11 | F2 | Alert: This application targets job version 1; the job is now version 3. Res… | 053 |
| 12 | F2 | Alert: Consent withdrawn: this module's results are hidden. | 011 |

#### REC-08 · CV source viewer · مصدر السيرة الذاتية
`rec` · P0 · depth 3

In: REC-07 · Out: REC-07 (back), REC-06 (crumb)

Frames: F0 Default · F1 Source removed · F2 Unreadable text. States: source removed → F1; unreadable text → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Source page: Page 2 of 5 | 051 |
| 2 | F1 | Alert: Source removed on 2026-11-06. The record stays; the private text was… | 083 |
| 3 | F2 | Alert: The text at this position cannot be displayed. The page image is show… | 051 |

#### REC-09 · Interview invitation · دعوة إلى مقابلة
`rec` · P0 · depth 2

In: REC-06, REC-07 · Out: REC-10, REC-12, REC-06 (back)

Frames: F0 Default · F1 No template · F2 Blocked by withdrawal. States: no template → F1; blocked by withdrawal → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Applicants | 054 |
| 2 | F0 | Field: Interview template | 055 |
| 3 | F0 | Link: No interview needed: record the decision | 056 |
| 4 | F1 | Alert: No approved template is available for this job. | 055 |
| 5 | F2 | Alert: Applicant E withdrew consent or the application, so they cannot be in… | 011, 042 |

#### REC-10 · Interview tracker · متابعة المقابلات
`rec` · P1 · depth 1

In: REC-02, REC-09, REC-11 (back), sidebar (shell) · Out: REC-11

Frames: F0 Default · F1 Declined and closed. States: Interrupted → F0; Declined → F1; Closed → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Note: Candidates are notified when invited and see the invitation in their… | 057 |
| 2 | F0 | Table: Applicant; Job; Interview status; Actions | 074 |
| 3 | F0 | Row: Applicant B ; Sample job A ; Invited ; Cancel invitation | 054 |
| 4 | F1 | Alert: Applicant F declined, with no reason given. The application and CV ev… | 012, 059, 060 |
| 5 | F1 | Alert: Applicant G: the session was closed because CM-02 was withdrawn. Resu… | 010, 011 |

#### REC-11 · Interview result review · نتيجة المقابلة: المتقدم أ
`rec` · P0 · depth 2

In: REC-10, REC-12 · Out: REC-10 (back), REC-12

Frames: F0 Default · F1 Not submitted · F2 Closed. States: not submitted → F1; not assessed → F0; closed → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Alert: Scores are supporting assessments. They are not a hiring recommendati… | 075 |
| 2 | F0 | Card: Question 1 · rubric version 2 | 072 |
| 3 | F0 | Checkbox: Reviewer agrees | 073 |
| 4 | F1 | Alert: Applicant B has not submitted answers yet (status: In progress). | 072 |
| 5 | F2 | Alert: This session is closed. Answers saved before closing are shown; unsco… | 072 |

#### REC-12 · Hiring decision · قرار التوظيف
`rec` · P0 · depth 3

In: REC-07, REC-09, REC-11, REC-13 (back) · Out: REC-11, REC-07 (back), REC-13, REC-06 (crumb)

Frames: F0 Default · F1 Save error · F2 Previous decisions. States: save error → F1; previous decisions → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Versions this decision rests on | 077 |
| 2 | F0 | Card: Evidence and interview summary | 072 |
| 3 | F0 | Note: Scores are supporting assessments, not a hiring recommendation. | 075 |
| 4 | F0 | Choice: Outcome | 076 |
| 5 | F0 | Alert: The system never records or changes a decision by itself. | 078 |
| 6 | F0 | Note: No interview needed? Record the decision directly. | 056 |
| 7 | F1 | Alert: The decision was not saved. Nothing changed. Try again. | 077 |
| 8 | F2 | Table: Date; Outcome; Rationale | 077 |
| 9 | F2 | Alert: If a consent module is withdrawn, its results are hidden here. | 011 |

#### REC-13 · Application timeline · الجدول الزمني للطلب
`rec` · P1 · depth 4

In: REC-12 · Out: REC-12 (back), REC-06 (crumb), REC-07 (crumb)

Frames: F0 Default · F1 Removed source. States: removed source → F1

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Event: 2026-11-05 10:40 · Application submitted | 040 |
| 2 | F0 | Event: 2026-11-05 12:00 · Decision: On hold | 077 |

### 9.3 Admin screens

#### ADM-01 · Admin sign-in and organization selection · تسجيل دخول مسؤول المؤسسة
`adm-public` · P0 · depth entry

In: ADM-02 (guard) · Out: ADM-02 (auto)

Frames: F0 Sign in · F1 Several memberships · F2 Access denied. States: several memberships → F1; access denied → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F1 | Choice: Choose an organization | 003 |
| 2 | F1 | Button: Continue | 003 |
| 3 | F2 | Alert: You do not have access to this page. | 004 |
| 4 | F2 | Note: We do not show whether the page exists in another organization. | 004 |

#### ADM-02 · Members and roles · الأعضاء والأدوار
`adm` · P0 · depth 0

In: ADM-01 (auto), ADM-03, sidebar (shell) · Out: ADM-03, ADM-01 (guard)

Frames: F0 Default · F1 Last Admin blocked · F2 Invitation expired. States: last Admin blocked → F1; invitation expired → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Button: Invite member | 087 |
| 2 | F0 | Table: Member; Role; State; Actions | 088 |
| 3 | F0 | Row: Member C ; Recruiter ; Invited ; Resend · Cancel | 087 |
| 4 | F0 | Alert: Every change takes effect at once and is recorded in the audit histor… | 001, 002 |
| 5 | F0 | Note: Admin views never show candidate evidence or interview content. | 091 |
| 6 | F1 | Alert: Member A is the only Admin. Appoint another Admin before removing or… | 089 |
| 7 | F2 | Alert: The invitation to Member C expired. Send a new invitation. | 087 |

#### ADM-03 · Invite or edit member · دعوة عضو أو تعديله
`adm` · P0 · depth 1

In: ADM-02 · Out: ADM-02, ADM-06

Frames: F0 Invite · F1 Edit member · F2 Invalid email · F3 Role change confirmation. States: invalid email → F2; role change confirmation → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Field: Email | 087 |
| 2 | F0 | Field: Role | 087 |
| 3 | F1 | Field: Role | 088 |
| 4 | F1 | Button: Save changes | 088 |
| 5 | F1 | Button: Deactivate member | 088 |
| 6 | F1 | Button: Remove member | 088 |
| 7 | F2 | Alert: Enter a valid email address. | 087 |
| 8 | F3 | Item: The role changes from Recruiter to Admin. | 088 |
| 9 | F3 | Item: The change takes effect at once and is recorded in the audit history. | 088 |

#### ADM-04 · Retention settings and deletion jobs · الاحتفاظ بالبيانات ومهام الحذف
`adm` · P0 · depth 1

In: ADM-05, sidebar (shell) · Out: ADM-05, ADM-06

Frames: F0 Default · F1 Failed deletion · F2 Shortened period confirmation. States: failed deletion → F1; shortened period confirmation → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Card: Retention period for each data class | 085 |
| 2 | F0 | Card: Scheduled and completed deletions | 086 |
| 3 | F0 | Note: Every completed deletion keeps a removal record without the private t… | 083 |
| 4 | F1 | Alert: DEL-0102 failed at the vectors step. 14 items remain. Retry the delet… | 086 |
| 5 | F2 | Item: From N days to a shorter period. 37 items will be deleted at the next… | 085, 086 |
| 6 | F2 | Item: Warning: 2 of these items belong to active applications. | 085 |
| – | – | Non-visual: Cache and derived-input invalidation after an edit or deletion is a s… | 084 |

#### ADM-05 · Data request queue and detail · طلبات البيانات
`adm` · P1 · depth 1

In: ADM-04, sidebar (shell) · Out: ADM-04

Frames: F0 Default · F1 Partial failure · F2 Rejected · F3 Cancelled. States: partial failure → F1; rejected → F2; cancelled → F3

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Table: ID; Type; Received; Status | 080 |
| 2 | F0 | Stepper: Verify ; Process ; Complete | 082 |
| 3 | F0 | Note: Only this organization's data is processed. Other organizations recei… | 002, 081 |
| 4 | F0 | Item: Files, extracted text, vectors and caches of this scope are deleted. | 083 |
| 5 | F0 | Item: Affected caches and derived inputs are invalidated. | 084 |
| 6 | F0 | Note: The candidate is notified in the application and by email. | 092 |
| 7 | F1 | Alert: Deletion partly failed: files deleted, vectors failed (14 items). The… | 083 |
| 8 | F2 | Field: Reason (recorded and sent to the candidate) | 082 |
| 9 | F3 | Alert: The candidate cancelled DR-0005 before processing. The request is clo… | 080 |

#### ADM-06 · Audit and processing history · سجل المراجعة ومعالجة البيانات
`adm` · P2 · depth 1

In: ADM-03, ADM-04, sidebar (shell) · Out: shell only

Frames: F0 Default · F1 Removed source · F2 Empty. States: removed source → F1; empty → F2

| # | Fr | Element | REQ |
|---|---|---|---|
| 1 | F0 | Filter: All ; Processing attempts ; Consent changes ; Data requests ; Decisio… | 090 |
| 2 | F0 | Table: Time; Type; Item; Result | 090 |
| 3 | F0 | Row: 2026-11-05 09:30 ; Member change ; Member B · role changed ; Recorded | 088 |
| 4 | F0 | Row: 2026-11-05 12:00 ; Decision ; Application A-17 ; Decision recorded | 091 |
| 5 | F0 | Note: Entries show metadata only: no CV text, evidence or interview answers. | 091 |
| 6 | F0 | Card: Entry detail: processing attempts of PROC-0042 | 022 |
| 7 | F1 | Alert: Source removed on 2026-11-06. Only the removal record is shown; the p… | 083 |

### 9.4 Shared-state sheets

#### KIT-S1 · Candidate shell, mobile
`cand-tab` · sheets `wireframes/KIT-S1_en.png`, `wireframes/KIT-S1_ar.png` · Frames: F0 Loading · F1 Empty · F2 Error with retry · F3 Not available

#### KIT-S2 · Recruiter and admin shell, desktop
`rec` · sheets `wireframes/KIT-S2_en.png`, `wireframes/KIT-S2_ar.png` · Frames: F0 Loading · F1 Empty · F2 Error with retry · F3 Session expired

---

## 10. Bilingual glossary

One Arabic form per term on every screen. Items marked ² have two accepted Arabic forms depending on context. All Arabic wording is a proposal [A-55, OD-17].

- **Evidence label:** Supported = مدعوم; Unsupported = غير مدعوم; Contradicted = متناقض; Insufficient evidence = أدلة غير كافية
- **Display term:** Not assessed = لم يتم التقييم; Needs review = يحتاج إلى مراجعة; Candidate-provided = من إدخال المرشح; Consent withdrawn = تم سحب الموافقة; Source removed = تمت إزالة المصدر; Unknown = غير معروف; Source validation failed = فشل التحقق من المصدر; Mandatory = إلزامي
- **CV processing (ST-01):** Queued = في الانتظار; Processing = قيد المعالجة; Ready = جاهز; Failed = فشل
- **Interview session:** Invited = تمت الدعوة; Accepted = تم القبول; Interrupted = منقطعة; Declined = تم الاعتذار²; Closed = مغلقة
- **Interview session / request:** In progress = قيد التنفيذ
- **Interview session / application:** Submitted = تم الإرسال
- **Application status:** Interview invited = دعوة إلى مقابلة; Interview in progress = المقابلة قيد التنفيذ; Interview submitted = تم إرسال المقابلة; Decision recorded = تم تسجيل القرار
- **Application / consent status:** Withdrawn = تم السحب
- **Consent status:** Granted = تمت الموافقة; Declined = تم الرفض²; Not asked = لم يطلب بعد
- **Data request type:** Export = تصدير; Correction = تصحيح; Consent withdrawal = سحب الموافقة; Deletion = حذف
- **Data request status:** Pending = بانتظار المعالجة; Completed = مكتمل; Rejected = مرفوض; Cancelled = ملغى
- **Decision outcome:** Hire = توظيف; Not hire = عدم التوظيف; On hold = معلق
- **Role:** Candidate = المرشح; Recruiter = مسؤول التوظيف; Admin = مسؤول المؤسسة
- **Noun:** Job = الوظيفة; Jobs = الوظائف; Application = الطلب; Applications = الطلبات; Applicant = المتقدم; Applicants = المتقدمون; Interview = المقابلة; Interviews = المقابلات; CV = السيرة الذاتية; Profile = الملف; Notifications = الإشعارات; Privacy = الخصوصية; My data = بياناتي; Consent = الموافقة; Members = الأعضاء; Audit history = سجل المراجعة
- **Consent module CM-01:** CV analysis and matching = تحليل السيرة الذاتية والمطابقة
- **Consent module CM-02:** Text interview and AI-assisted assessment = المقابلة النصية والتقييم بمساعدة الذكاء الاصطناعي
- **Common action:** Save = حفظ; Cancel = إلغاء; Continue = متابعة; Back = رجوع; Confirm = تأكيد; Submit = إرسال; Delete = حذف; Edit = تعديل; Remove = إزالة; Add = إضافة; Close = إغلاق; Yes = نعم; No = لا; Search = بحث; Filter = تصفية; Sort = ترتيب; Retry = إعادة المحاولة; Sign in = تسجيل الدخول; Sign out = تسجيل الخروج; Register = إنشاء حساب
- **Common field:** Email = البريد الإلكتروني; Password = كلمة المرور
- **Consent action:** I agree = أوافق; Decline = أرفض²; Withdraw consent = سحب الموافقة
- **Invitation action:** Accept = قبول; Decline = اعتذار²

---

## 11. Consistency check

Results: **OK** consistent; **REF** consistent after a refinement stated in the row; **OPEN** a decision is needed. Rows marked (computed) come from scripts run over the wireframe sources and the RD03-Y data.

| ID | Checked against | Result | Status and action |
|---|---|---|---|
| CK-01 | UC-01 actors and note [p.13] | Three actors map to three shell families with separate sign-in and prefixes `c`, `r`, `a`. "Authenticated roles and organization-scoped access apply to every use case" is the guard order of section 5.3. | OK |
| CK-02 | RD03-Y §7 screen inventory (computed) | 36 of 36 screens have a route, a shell, a sheet in each language and a block in section 9. Priorities are carried over (28/7/1). None split or merged. | OK |
| CK-03 | RD03-Y §7 requirement mapping per screen (computed) | For every screen, the requirements named by the RD03-Y flows appear as callouts or documented non-visual items; extras are limited to nine cross-cutting requirements. Errors: 0. | OK |
| CK-04 | Requirements `REQ-SYS-001..094` (computed) | 93 of 94 appear on a sheet. REQ-SYS-043 has no screen in RD03-Y [F-02]. Every P0 requirement also has a P0 screen. | REF |
| CK-05 | RD03-Y flows, same role (computed) | 49 transitions derived from main, alternate and failure flows; 49 realized by a link, auto or guard edge or by shell navigation; uncovered: 0. 40 explicit edges are navigation additions with no flow. | OK |
| CK-06 | RD03-Y flows, cross-role (computed) | 6 cross-role pairs occur inside single flow steps; all are covered by handoffs H-01 to H-06 (section 5.6). No screen links to another role. | REF |
| CK-07 | RD03-Y screen states (computed) | All 88 required states are mapped to a frame (89 mappings). | OK |
| CK-08 | ACT-01 main path and branches [p.17] (computed) | Five journeys are walkable; user actions: J1 4; J2 4; J3 4; J4 3; J5 2. Journey 5 is the "no interview needed" branch [REQ-SYS-056]. | OK |
| CK-09 | ST-01 [p.17]; CC-09 of RD03-Y | CAN-05 shows Queued, Processing, Ready and Failed only; the single retry is a note on Queued; failure shows its category and next step [REQ-SYS-021, 022]. Wording is in section 8.2. | REF — wording needs native review [OD-17] |
| CK-10 | CL-01A [p.14] | REC-07 shows the four evidence labels and a separate source-validity indicator; "Not assessed" and "Needs review" never read as rejection (REC-04 preview, REC-06). | OK |
| CK-11 | CL-01B [p.15]; OD-10 of RD03-Y | REC-10 shows seven session states; CAN-10 to CAN-14 cover invitation to submission. Vocabulary is still a proposal. | REF — OD-10 |
| CK-12 | DEP-01 [p.18]; A-51 of RD03-Y | CAN-04 shows the limits (5 MB, 5 pages, 20000 characters) and only rejection; referral for manual review is not drawn. | REF — A-51 |
| CK-13 | SEQ-01 [p.16] | CAN-05 shows the processing identifier and lets the candidate leave and return [REQ-SYS-018, 020]. | OK |
| CK-14 | Glossary (computed) | 90 terms; 173 exact uses of 61 distinct terms checked; mismatches: 0. "Declined" has two Arabic forms [F-04]. | REF — OD-17 |
| CK-15 | RTL/LTR rendering (computed) | 76 of 76 sheet builds carry the correct `lang` and `dir` on the root element; 76 PNG sheets exist. | OK |
| CK-16 | Routes (computed) | 36 routes; duplicates: 0; every route starts with `/{lang}/` and its role prefix. | OK |
| CK-17 | Reachability and depth (computed) | Unreachable from the landing screen: 0; from the sign-in screen: 0. Maximum depth: candidate 3, recruiter 4, admin 1 (target ≤ 4). | OK |
| CK-18 | Priority rule [A-44 of RD03-Y] (computed) | Eight P1 or P2 screens carry P0 requirements; two lie on P0 main flows without a substitute (table below). | OPEN — OD-12 |
| CK-19 | Sibling Week 4 tasks [Plan App. A, p.9] | No framework, state-management, endpoint or storage choice is made here. RD04-M may rename path segments; the guard order and the role binding are what it must keep. | REF |
| CK-20 | WCAG 2.2: 1.3.2, 2.4.3, 2.4.11, 2.5.8, 3.1.2, 3.3.7, 3.3.8 [WCAG-22, WCAG-SC] | Stated as design conventions (RTL-08, 11, 12, 13); sign-in screens use no puzzle or memory test (3.3.8). This is not an accessibility audit; RD07-Y tests keyboard and RTL. | REF |
| CK-21 | No automatic rejection and no hiring probability (computed) | Scan of the English strings for "recommend", "probab", "automatic", "reject", "exclud": 6 hits are negations or "never" statements; 9 others, none about a decision on a candidate: "automatic" in CAN-11, CAN-12, ADM-06 (saving and retry); "reject" in CAN-16, ADM-05 (status and action of data requests). | OK |

**P1 and P2 screens that carry P0 requirements (computed; F-01)**

| Screen | Pri | P0 requirements | Substitute in a P0-only build | Proposal |
|---|---|---|---|---|
| CAN-09 | P1 | 041, 057, 077 | None: landing, invitation list and status list | Raise to P0 or draw a minimum list [OD-12] |
| CAN-16 | P1 | 027, 083 | CAN-06 and CAN-07 carry 027; ADM-04 carries 083 | Keep P1 |
| CAN-17 | P1 | 020 | CAN-05 and email carry 020 | Keep P1 |
| REC-02 | P1 | 045 | REC-06 carries 045; REC-03 is the landing | Keep P1 |
| REC-10 | P1 | 010, 011, 012, 054, 057, 059, 060 | None: invitation and session states | Raise to P0 or draw a minimum list [OD-12] |
| REC-13 | P1 | 077 | REC-12 frame "Previous decisions" carries 077 | Keep P1 |
| ADM-05 | P1 | 002, 083, 084 | ADM-04 carries 083 and 084 | Keep P1 |
| ADM-06 | P2 | 022, 083, 088, 091 | CAN-05 (022), ADM-02 (088, 091), ADM-04 (083); only the audit view is P2 [REQ-SYS-090] | Keep P2 |

**Journeys walked for CK-08**

| Journey | Path | User actions |
|---|---|---|
| J1 Candidate applies (ACT-01 main path) | CAN-09 → CAN-02 → CAN-04 → CAN-05 → CAN-06 → CAN-08 → CAN-09 | 4 |
| J2 Recruiter reviews and invites | REC-03 → REC-06 → REC-07 → REC-09 → REC-10 | 4 |
| J3 Candidate takes the interview | CAN-09 → CAN-10 → CAN-11 → CAN-12 → CAN-13 → CAN-09 | 4 |
| J4 Recruiter reads the result and decides | REC-10 → REC-11 → REC-12 → REC-13 | 3 |
| J5 No interview needed (REQ-SYS-056) | REC-07 → REC-12 → REC-13 | 2 |

---

## 12. Clearly Marked Assumptions

### 12.1 Carried over from RD03-Y

| ID | Use here |
|---|---|
| A-18 | One author with AI-assisted drafting; the peer review is the second reader |
| A-21 | Recruiters triage under time pressure [REQ-SYS-046, 047] — scannable tables and one-line status |
| A-24 | Mixed-direction CV text [REQ-SYS-026, 093] — quotes keep their own direction (RTL-08) |
| A-25 | Phones and unstable connections [REQ-SYS-066] — mobile-first candidate shell; offline frame in SCR-CAN-12 |
| A-26 | Arabic and English interfaces; Arabic label wording is set in RD04-Y — proposals in sections 8 and 10 [A-55] |
| A-28 | REQ-SYS identifiers are proposals until RD03-M maps them; the same holds for SCR identifiers |
| A-42 | Arabic and English screens; quotes keep their language and direction; no translation of CV text |
| A-43 | Handles `@AhmedFadlallah1` and `@kareemmahmoud141224-prog` come from the task brief and were not checked in the repository |
| A-44 | P0, P1 and P2 follow the RD03-Y priority rule; RD03-M may re-rank (see F-01) |
| A-45 | Screens are logical units; none was split or merged here, so the 36 SCR identifiers stay valid |
| A-46 | No platform-wide super-admin; at least one Admin always remains (SCR-ADM-02, frame "Last Admin blocked") |
| A-47 | A user with several memberships selects one organization per session (SCR-REC-01, SCR-ADM-01) [A-60] |
| A-49 | Status vocabularies of RD03-Y section 5.6 are proposals [OD-10]; the wireframes use them unchanged |

### 12.2 New in RD04-Y

| ID | Assumption | Status |
|---|---|---|
| A-54 | Repeated failed sign-ins lead to a delay or lock with a neutral message; the rule belongs to RD05 [REQ-SYS-001]. SCR-CAN-01 shows only the message. | Provisional |
| A-55 | All Arabic text in the sheets, the glossary and the catalogue is a proposal written by the author with AI assistance. No native reader or domain reviewer has checked it. Layout does not depend on exact words; only line length may change [OD-17]. | Needs review |
| A-56 | Issue #22 was read from screenshots. Its four criteria are quoted in section 1; if the live issue differs, the live issue governs. | Verify |
| A-57 | Sources not reachable in this session (Material Design bidirectionality guidance, MDN, Unicode UAX 9, the WCAG 2.2 Recommendation page) were not used; no convention depends on them. HIG-RTL is a platform guideline used as a reference, not a web standard. | Recorded |
| A-58 | The direction of free-text answers is detected (`dir="auto"`) and kept with the text. The exact mechanism (for example the HTML `dirname` attribute) was not checked against the HTML Standard and is left to RD05. | Provisional |
| A-59 | One role per session. Recruiter and admin have separate sign-in routes; a person with two roles signs in again to switch [OD-14]. | Provisional |
| A-60 | Organization scope comes from the session and is shown in the top bar; the URL carries no organization [OD-16]. | Provisional |
| A-61 | URLs carry opaque, non-sequential identifiers and no personal data; `?next=` accepts only internal route patterns. | Provisional |
| A-62 | Language comes from the URL prefix; a first visit uses the browser language when it is `ar` or `en`, otherwise English [OD-15]. | Provisional |
| A-63 | Western digits (0–9) are used in both languages [OD-13]. | Provisional |
| A-64 | Dates and times use `YYYY-MM-DD HH:MM` as placeholders; calendar, time zone and locale format are open [OD-13]. | Provisional |
| A-65 | Arabic typography: no letter-spacing, no justification, line height 1.75, size about 1 px above Latin, no italics. Only letter-spacing and kashida are backed by ALREQ; the rest are author proposals. Final fonts belong to RD06-Y. | Provisional |
| A-66 | Messages are whole-sentence templates per language; word order is never assumed (general localization practice, no single source read). | Provisional |
| A-67 | Apply and interview flows hide the tab bar; the close × returns to SCR-CAN-09 and keeps the draft. | Provisional |
| A-68 | Landings: SCR-CAN-09 for candidates, SCR-REC-03 for recruiters (SCR-REC-02 is optional until built), SCR-ADM-02 for admins [OD-12]. | Provisional |
| A-69 | Wireframes are grayscale and structural. Status uses text, border style and marker, never colour alone; button emphasis and spacing are illustrative. | Recorded |
| A-70 | All names, identifiers, dates and numbers are placeholders. "N days" in SCR-ADM-04 is not a recommended period; the organization sets retention [OD-09 of RD03-Y]. | Recorded |
| A-71 | Recruiter and admin screens are designed for widths of 1200 px and above. Tablet and phone layouts for them are not designed [OD-18]. | Provisional |
| A-72 | A loading view that exceeds an implementation-defined time limit becomes "Error with retry"; the limit is not set here. | Provisional |
| A-73 | Dialogs are drawn inline inside a frame. Focus trap, Escape and return of focus are tested later (RD06-Y, RD07-Y). | Recorded |
| A-74 | Candidates on a desktop see the mobile layout as one centered column; a wide candidate layout is not drawn. | Provisional |
| A-75 | Breadcrumbs appear on recruiter and admin screens deeper than the landing level; candidates use back, close and step counters. There is no global search; lists have sort and filter only. | Provisional |

---

## 13. Open decisions

| ID | Question | Provisional position | Owner |
|---|---|---|---|
| OD-12 | Priority of status screens: raise SCR-CAN-09 and SCR-REC-10 to P0, or define a P0 minimum version of each (fallbacks for the other six in section 11). | Both drawn as P0-minimum; REC-03 is the recruiter landing | Owner; RD03-I and RD03-M |
| OD-13 | Numerals (Western or Eastern Arabic-Indic), date and time format and time zone in the Arabic interface. | Western digits; ISO-style placeholders | Owner with a native reviewer; RD06-Y |
| OD-14 | One person with two roles: separate sign-in per role or one sign-in with a role switch that asks again for credentials. | Separate sign-in (A-59) | RD03-M (access matrix); RD05 |
| OD-15 | Language choice: URL prefix, stored preference, default language. | URL prefix plus stored preference; browser language, else English | Owner; RD05 |
| OD-16 | Organization scope in the URL or in the session. | Session (A-60) | RD03-M; RD04-I |
| OD-17 | Native review of Arabic wording (glossary, messages, the two forms of "Declined"). Consent and legal wording stays out of scope. | Proposals in sections 8 and 10 | Owner and a native Arabic reviewer; before RD06-Y |
| OD-18 | Recruiter and admin on tablets and phones. | Not designed (A-71) | RD06-Y; RD07-Y |
| OD-19 | Notification channels and badges: unread marker on the tab, one further channel beside email [REQ-SYS-092]. | In-app list plus email; a dot marker only | RD03-M; RD05 |

---

## 14. Hand-off

**Files for the PR** (paths relative to the folder where the team keeps RD deliverables; the issue names none):

| File | Content |
|---|---|
| `RD04-Y_navigation-architecture-and-low-fidelity-screens.md` | This document |
| `wireframes/*.png` | 76 sheets: `SCR-xxx-nn_en.png`, `SCR-xxx-nn_ar.png`, `KIT-S1_*`, `KIT-S2_*` |
| `ui-strings.csv` | Every English and Arabic string, frame, requirement and link target of the sheets (for the native Arabic review) |

**Branch and PR title (proposal):** `rd04-y/navigation-architecture-and-low-fidelity-screens` · `[RD04-Y] Navigation architecture and low-fidelity screens`

**PR description** (the rules of Issue #22: use `Refs #22`; no automatic-closing keywords; the owner accepts the task, merges the PR and closes the issue manually):

~~~markdown
## [RD04-Y] Navigation architecture and low-fidelity screens

Refs #22

**What this PR adds**
- `RD04-Y_navigation-architecture-and-low-fidelity-screens.md`: role shells, route map and guard order, navigation maps, RTL/LTR conventions (RTL-01 to RTL-20), shared states, message wording, 36 screen specifications, computed consistency checks (CK-01 to CK-21), assumptions A-54 to A-75, open decisions OD-12 to OD-19.
- `wireframes/`: 76 PNG sheets (every screen and two shared-state sheets, English and Arabic).
- `ui-strings.csv`: all strings for native Arabic review.

**Please check**
1. Section 5.3 (guard order) and 5.4 (navigation maps) against RD03-M and the Week 4 tasks.
2. F-01 and OD-12: priority of SCR-CAN-09 and SCR-REC-10.
3. Arabic wording (sections 8 and 10, `ui-strings.csv`) with a native reader [A-55, OD-17].
4. Assumptions A-54 to A-75 and open decisions OD-12 to OD-19.

Research and design only; no application code. Reviews requested: peer review from @AhmedFadlallah1; final review from @kareemmahmoud141224-prog. Owner review requested; Refs #22.
~~~

**Peer review request (for `@AhmedFadlallah1`):** please read sections 5, 6 and 11 and look for broken links, missing states, wording that differs between English and Arabic, and any place where a role can see another role's data. Push fixes to the same PR and re-request review [Issue #22; Refs #22].

**Owner review request (for `@kareemmahmoud141224-prog`):** select Request changes or Approve. Only the owner accepts the task, merges the PR and closes the issue by hand [Issue #22].

**What the next tasks receive**

| Task | Receives |
|---|---|
| RD04-M | Shell list, route scheme and guard order (5.2, 5.3); role binding and organization scope (OD-14, OD-16) for the module and DEP-01 views |
| RD04-K | Upload and processing screens and messages (CAN-04, CAN-05, section 8.2); the "scanned" frame depends on the text-PDF/OCR decision |
| RD04-A | Ranked list columns and basis text (REC-06, REC-07); no probability or automatic rejection (CK-21) |
| RD04-H | Interview screens CAN-10 to CAN-14, REC-09 to REC-12 and the session states; failure frames |
| RD04-I | Organization in the session (A-60); retention classes and deletion jobs (ADM-04) |
| RD05-Y | Screen identifiers, requirements per screen and the message catalogue for input, output and error examples |
| RD05-I | Status messages (section 8) |
| RD06-Y | Wireframes as the base of the clickable prototype; RTL-01 to RTL-20 as the RTL/LTR annotations |
| RD07-Y | Journeys J1 to J5 (CK-08) and RTL-12, RTL-13 for keyboard and RTL checks |

**Reminder:** this document is a design proposal built without participant evidence. The owner decides OD-12 first.
