# TLICA Rosetta Stone (v0.2)

> **Purpose.** A 1-to-1 mapping between the structural relationships of the Two-Layer Identity-Correlation Architecture (TLICA, core v5.3.3) and their pure-math representations. Every entry pairs a theoretical concept (with citation into the core or application papers) with its math representation (with citation into the v0.3.2 rigorous edition and the round-3 Lean project), and records the gap status of the correspondence.

> **Scope of v0.2.** Foundation level (sections 1–12, unchanged from v0.1) plus application level (sections 13–17, new in v0.2 — one section per application paper). The five application papers covered are: temporal phenomenology, agency, free will, differentiated affect, and religiously charged experience. v0.1's section 13 placeholder is now superseded by the full application-level treatment in §13–17. The Rosetta stone is the project's integrating reference: every fragmented rigor effort to date — the rigorous edition, math ledger, profile-comparison working paper, prerogative formalization sketch, Lean project — is consolidated here under a single bidirectional structure.

> **Status field meanings.** *Machine-verified*: encoded in Lean and the build is green at v4.11.0. *Encoded*: encoded in Lean, build pending or yellow. *Signature-declared*: type signature in rigorous edition; functional form may be open. *Named-but-unformalized*: named at foundation, no formal apparatus yet committed; foundation explicitly defers to application. *Theory-only*: theoretical concept with no math representation yet. *Math-only*: math object with no clear theoretical referent (rare in this architecture). *Open*: under active development in a working paper. *Application-level (foundation-supported)*: concept defined at application level, formalization uses already-formalized foundation objects. *Application-level (foundation-deferred)*: concept requires foundation orphans (MSI, PtCns, PCE, Π, etc.) to be formalized first. *Application-level (signature pending)*: concept has application-level structural specification but lacks an explicit type signature.

> **How to read this document.** Each entry has the structure: theory description with citation, math representation with citation, Lean declaration (if any), status, optional sub-questions and cross-references. Entries are grouped thematically. Two appendices (§A and §B) provide alphabetical bidirectional indexes (deferred to v0.3).

---

## 1. Indexing and the modeling I

### 1.1 Modeling I

- **Theory.** The first-personal locus that performs all the operations the architecture describes: the bearer of contents, the substrate of integration, the subject of verification, the agent of action. Each I is constitutively indexed by its substrate. Cf. `sources/core/1_foundations.md` §1.1.
- **Math.** A type-level index `m` ranging over a typed universe of modeling I's. Cf. `formalization/00_signature.md` §0.1.
- **Lean.** Implicit in every TLICA module via type variable `m` (typically not Lean-declared, since modeling-I-indexing operates at the meta-level over instances).
- **Status.** Signature-declared.

### 1.2 Time

- **Theory.** The temporal index of each I's experience; not assumed to be the global physical time, but the time of $m$'s lived-I evolution. Cf. `sources/core/1_foundations.md` §1.2.
- **Math.** A linearly ordered set $T_m$ per modeling I. Cf. `formalization/00_signature.md` §0.2.
- **Lean.** Not yet encoded; T_m is a meta-level parameter in the existing modules.
- **Status.** Signature-declared.

### 1.3 Cogito

- **Theory.** The tautological self-identity of the modeling I; the structural anchor for $\rho$. Cf. `sources/core/1_foundations.md` §2.4: "any move that would deny the cogito presupposes the I performing the denial."
- **Math.** A distinguished vertex $\hat\iota_m \in V^m_t$ with $\rho_{m,t}(\hat\iota_m) = 1$. Cf. `formalization/00_signature.md` §0.5; `formalization/01_objects.md` §1.4.
- **Lean.** Implicit; the cogito φ-axiom is encoded in `TLICA.PhiCoordinate.phiCogito`.
- **Status.** Machine-verified (the cogito-uniqueness theorem `phi_tier3_lt_phiCogito` is green).

---

## 2. The ontology layers

### 2.1 Intrinsic content domain

- **Theory.** The universal layer of in-re-universal contents available to every modeling I. Cf. `sources/core/1_foundations.md` §3.1.
- **Math.** A set $\mathsf{Int}$ shared across modeling I's. Cf. `formalization/00_signature.md` §0.7.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 2.2 Asymptotic content domain

- **Theory.** The set of contents currently asymptotically available to $m$ at $t$ — items in $m$'s lived-I or asymptotic field. Cf. `sources/core/1_foundations.md` §3.4.
- **Math.** A set $\mathsf{A}^m_t$ per $(m, t)$, with non-monotone dependence on $t$. Cf. `formalization/00_signature.md` §0.8.
- **Lean.** Implicit; `ScalarProfile.domain` corresponds to $\mathsf{A}^m_t$ at an implicit $(m, t)$.
- **Status.** Signature-declared.

### 2.3 Time-stamped tokens and history domain

- **Theory.** Each currently-encountered content has a history of past encounters with the same content; the persistence-equivalence quotient produces "the same content as a member of $m$'s history". Cf. `sources/core/2_access_and_development.md` §5.2.
- **Math.** Time-stamped tokens $\widetilde{\mathsf{H}}^m_t$ with persistence equivalence $\sim^m_H$ producing the history domain $\mathsf{H}^m_t$. Cf. `formalization/00_signature.md` §0.12; `formalization/01_objects.md` §1.7.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared (the directed-system structure of inclusion maps under Proposition 1.2 is proven but not Lean-encoded).
- **Open sub-questions.** `oq:persistence-construction` — what functional form does $\sim^m_H$ take?

### 2.4 Content-to-history projection $\pi^m_t$

- **Theory.** A bridge that lets $\rho$ (defined on $V^m_t$) be evaluated on $\mathsf{A}^m_t$-contents (which $\phi$ and $\kappa$ live on). Cf. v0.3.1 rigor commitment.
- **Math.** $\pi^m_t : \mathsf{A}^m_t \to \mathsf{H}^m_t$, $\pi^m_t(x) := [(t, x)]$. Cf. `formalization/01_objects.md` §1.7.4 (introduced in v0.3 typing repair).
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

---

## 3. The coordinate field K and δ

### 3.1 Coefficient field K

- **Theory.** The architecture's coefficient field accommodates the cogito's structural saturation at 1 - δ and the infinitesimal slack that distinguishes Tier-3 verified content from the cogito. Cf. `sources/core/3_formal_apparatus.md` §6.3.
- **Math.** A linear ordered field K with a distinguished positive infinitesimal $\delta$, with the non-Archimedean property $\delta < q$ for every positive rational $q$. Cf. `formalization/00_signature.md` §0.3, §0.4.
- **Lean.** `TLICA.KField` typeclass with fields `δ`, `δ_pos`, `δ_lt_one`, `δ_lt_rat`.
- **Status.** Machine-verified.

### 3.2 The infinitesimal δ

- **Theory.** The architecture's structural separation between the cogito (φ = 1 - δ) and any Tier-3 verified content (φ < 1 - δ). Cf. `sources/core/3_formal_apparatus.md` line 181.
- **Math.** A positive infinitesimal $\delta \in \mathbb{K}$. Cf. `formalization/00_signature.md` §0.3.
- **Lean.** `TLICA.KField.δ`.
- **Status.** Machine-verified (the cogito-uniqueness theorem depends on $\delta_pos$).

---

## 4. The ρ coordinate (identity-correlation)

### 4.1 Integration graph

- **Theory.** The graph rooted at the cogito encoding how contents are integrated with the I. Edges carry weights reflecting the strength of integration channels. Cf. `sources/core/3_formal_apparatus.md` §4.
- **Math.** A directed weighted graph $G^{m,k}_t = (V^m_t, E^{m,k}_t, w^{m,k}_t)$ per mode $k$. Cf. `formalization/02_graph_theory.md` §2.1–2.2.
- **Lean.** Not yet encoded as a graph structure; max-flow facts are abstracted.
- **Status.** Signature-declared.

### 4.2 ρ (per-mode)

- **Theory.** The structural integration of a content with the cogito, in a specific mode $k$. Cf. `sources/core/3_formal_apparatus.md` §4.4.
- **Math.** $\rho^{m,k}_t(v) := C^{m,k}_t(v) / (1 + C^{m,k}_t(v))$ where $C^{m,k}_t(v)$ is the max-flow from $\hat\iota_m$ to $v$. Cf. `formalization/02_graph_theory.md` §2.3–2.4.
- **Lean.** `TLICA.IntegrationGraph.strict_rho_bound` (Lemma 2.4.2: ρ < 1 off cogito) is the warm-up theorem.
- **Status.** Machine-verified (Lemma 2.4.2 green at v4.11.0).

### 4.3 Mode aggregation (scalar ρ)

- **Theory.** Aggregating across modes to a single scalar ρ. Cf. `sources/core/3_formal_apparatus.md` §4.5.
- **Math.** Weighted average $\rho_{m,t}(v) := \sum_k a_k \cdot \rho^{m,k}_t(v)$ for some weighting $(a_k)$ with $\sum a_k = 1$. Cf. `formalization/02_graph_theory.md` §2.5 (Proposition 2.5.1).
- **Lean.** `TLICA.ModeAggregation.{mode_aggregation_summable, mode_aggregation_nonneg, mode_aggregation_le_one, mode_aggregation_lt_one}` — all four parts of Proposition 2.5.1.
- **Status.** Machine-verified (round 1).
- **Open sub-questions.** Functional form of $(a_k)$ at the foundation.

### 4.4 ρ-bound

- **Theory.** ρ is strictly less than 1 off the cogito; the cogito uniquely attains 1. Cf. `sources/core/3_formal_apparatus.md` §4.4.
- **Math.** Lemma 2.4.2: $\rho_{m,t}(v) < 1$ for $v \ne \hat\iota_m$. Cf. `formalization/02_graph_theory.md` §2.4.
- **Lean.** `TLICA.IntegrationGraph.strict_rho_bound`.
- **Status.** Machine-verified (round 1).

---

## 5. The φ coordinate (truth-indistinguishability)

### 5.1 Verification toolset and pathways

- **Theory.** The tools by which contents are verified; a verification pathway is a finite construction terminating at intrinsic content and head at the target. Cf. `sources/core/3_formal_apparatus.md` §6.
- **Math.** Toolset $\mathsf{Tools}^m_t$ as relations on the enlarged content domain $\mathsf{C}^m_t = \mathsf{Int} \cup \mathsf{A}^m_t$; pathway as a finite sequence with terminus in Int, head in $\mathsf{A}^m_t$, intermediates in $\mathsf{C}^m_t$. Cf. `formalization/00_signature.md` §0.14 (v0.3 typing repair).
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 5.2 Constructibility domain

- **Theory.** The set of contents for which a verification pathway exists. Cf. `sources/core/3_formal_apparatus.md` §6.2.
- **Math.** $\mathrm{Verif}(m, t) := \{x \in \mathsf{A}^m_t : \exists \text{ a verification pathway for } x\}$. Cf. `formalization/00_signature.md` §0.14.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 5.3 φ-admissibility axiom

- **Theory.** $\epsilon + n\delta \le 1$ for every verified content; ensures $\phi \in [0, 1 - n\delta]$. Cf. `sources/core/3_formal_apparatus.md` line 181.
- **Math.** Axiom in `formalization/00_signature.md` §0.14 lines 143–149.
- **Lean.** `TLICA.PhiCoordinate.PhiAdmissibility`.
- **Status.** Machine-verified (round 1).

### 5.4 Tier-3 strictness axiom

- **Theory.** Every Tier-3 verified content has $n\delta + \epsilon > \delta$; the cogito's structural saturation 1 - δ is not approached by any non-cogito content. Cf. v0.3 commitment.
- **Math.** Axiom in `formalization/00_signature.md` §0.14 lines 151–157.
- **Lean.** `TLICA.PhiCoordinate.Tier3Strictness`.
- **Status.** Machine-verified (round 1).

### 5.5 Cogito-uniqueness at φ (Proposition 3.3.7)

- **Theory.** The cogito is the unique supremum of φ across its domain. Cf. `sources/core/3_formal_apparatus.md` §6.4.
- **Math.** Proposition 3.3.7 in `formalization/03_coordinates.md` §3.3.6.
- **Lean.** `TLICA.PhiCoordinate.phi_tier3_lt_phiCogito` and `TLICA.PhiCoordinate.cogito_unique_phi_supremum`.
- **Status.** Machine-verified (round 1).

### 5.6 Admissible φ-domain $\mathsf{D}_\phi$

- **Theory.** The set of φ-values attainable by non-cogito Tier-3 verified content; a $\mathbb{K}$-valued half-open interval. Cf. v0.3.1 D_φ repair.
- **Math.** $\mathsf{D}_\phi := \{\alpha \in \mathbb{K} : 0 \le \alpha < 1 - \delta\}$. Cf. `formalization/06_independence_lemmas.md` §6.5 (notational prelude).
- **Lean.** `TLICA.PhiCoordinate.DPhi`.
- **Status.** Machine-verified (round 1; the v0.3.1 repair is exercised by `no_F_phi` in `TLICA.NonReducibility`).

---

## 6. The κ coordinate (contact)

### 6.1 Source map

- **Theory.** The map from contents to their source-sets in the primal not-I; partial because some contents have no specified source. Cf. `sources/core/3_formal_apparatus.md` §5.1.
- **Math.** $\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m)$. Cf. `formalization/00_signature.md` §0.13.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 6.2 Inbound contact

- **Theory.** The strength of contact between the I and a content's source(s) at time $t$. Cf. `sources/core/3_formal_apparatus.md` §5.2.
- **Math.** $\kappa^{\text{in}}_{m,t}(x) := \chi_m(t, n_x)$ for $x$ with source $n_x$, where $\chi_m : T_m \times \mathsf{N}_m \to [0, 1]$ is the contact-strength function. Cf. `formalization/03_coordinates.md` §3.5.
- **Lean.** Used as a domain in `TLICA.NonReducibility.CoordinateTriple` (the κ component).
- **Status.** Signature-declared.

---

## 7. Profiles

### 7.1 Base profile $P^\rho_{m,t}$

- **Theory.** The primary structural object: the family of ρ-values across the asymptotic content domain. Cf. `sources/core/3_formal_apparatus.md` line 219.
- **Math.** $P^\rho_{m,t} := \{(x, \rho_{m,t}(\pi^m_t(x))) : x \in \mathsf{A}^m_t\}$. Cf. `formalization/04_profiles.md` §4.1.1 (Definition; v0.3 faithfulness repair).
- **Lean.** `TLICA.Profile.ScalarProfile` (the round-3 encoding of the base profile as a Lean structure).
- **Status.** Machine-verified (round 3 build green).

### 7.2 Mode-vector profile $\vec P^\rho_{m,t}$

- **Theory.** The mode-resolved profile; retains the mode-specific structure that the scalar aggregation collapses. Cf. `sources/core/3_formal_apparatus.md` line 223.
- **Math.** $\vec P^\rho_{m,t} := \{(x, \vec\rho^m_t(\pi^m_t(x))) : x \in \mathsf{A}^m_t\}$. Cf. `formalization/04_profiles.md` §4.1.2.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 7.3 Full-coordinate profile $P^{\rho\phi\kappa}_{m,t}$

- **Theory.** Derived; the joint coordinate evaluation on the common-domain subset. Cf. v0.3 faithfulness commitment.
- **Math.** $P^{\rho\phi\kappa}_{m,t} := \{(x, \rho, \vec\rho, \phi, \kappa) : x \in \mathrm{Dom}(m, t)\}$ with $\mathrm{Dom}(m, t) = \mathrm{dom}(\sigma^m_t) \cap \mathrm{Verif}(m, t)$. Cf. `formalization/04_profiles.md` §4.1.3.
- **Lean.** Not yet encoded as a separate structure; coordinate triples are encoded in `TLICA.NonReducibility.CoordinateTriple`.
- **Status.** Signature-declared.

### 7.4 Profile comparison

- **Theory.** A notion of distance or similarity between profiles; needed for application-level claims about profile change. Cf. `sources/core/3_formal_apparatus.md` §7.6 + `oq:profile-comparison`.
- **Math.** Three candidate families: subdomain-restriction $L^\infty$ shared and union distances; Wasserstein-style on ρ-distribution; lived-I topological invariants. Cf. `formalization/profile_comparison_v0_2.md` §5–7.
- **Lean.** `TLICA.ProfileComparison.Pointwise.{dInfShared, dInfUnion}` with their pseudo-metric properties.
- **Status.** Signature-declared and partially encoded (round 3 green); foundation v0.4 integration recommended per `profile_comparison_v0_2.md` §9.

---

## 8. The lived-I network and shells

### 8.1 Support-lived-I network

- **Theory.** The subset of $\mathsf{A}^m_t$ with ρ > 0, together with the cogito; the primary lived-I notion. Cf. `sources/core/3_formal_apparatus.md` line 232.
- **Math.** $\mathfrak{L}^m_t := \{x \in \mathsf{A}^m_t : \rho_{m,t}(\pi^m_t(x)) > 0\} \cup \{\hat\iota_m\}$. Cf. `formalization/04_profiles.md` §4.2.1.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 8.2 Thresholded lived-I network

- **Theory.** A derived/application-level variant: the lived-I above a threshold $\theta$. Cf. application papers' use of "lived core."
- **Math.** $\mathfrak{L}^{m, \theta}_t := \{x : \rho \ge \theta_{m,t}\} \cup \{\hat\iota_m\}$ with $\theta_{m,t} = \Theta^\rho_m(\cdot)$. Cf. `formalization/04_profiles.md` §4.2.2.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared with $\Theta^\rho_m$ as an open function.

### 8.3 Shell partition

- **Theory.** Coarse-graining the profile by ρ-value bands. Cf. `sources/core/3_formal_apparatus.md` §7.6.
- **Math.** Strictly decreasing $1 = r_0 > r_1 > \ldots > r_5 > 0$; shells $\mathsf{Sh}_0 = \{\hat\iota_m\}, \mathsf{Sh}_i = \{x : r_i \le \rho < r_{i-1}\}$ for $i = 1, \ldots, 5$, $\mathsf{Sh}_6 = \{x : 0 \le \rho < r_5\}$. Cf. `formalization/04_profiles.md` §4.3.1 (Definition; v0.3 shell-partition repair).
- **Lean.** `TLICA.ProfileComparison.ShellRefinement.ShellThresholds` (round 3 skeleton); `shellOf` helper.
- **Status.** Encoded as a structure; the shell-stratified bound (Proposition 5.3.1) is a Lean placeholder pending round 4.

### 8.4 Strict not-I region

- **Theory.** Contents with ρ = 0; a limit notion distinct from the outer shell. Cf. `sources/core/3_formal_apparatus.md` line 232.
- **Math.** $\mathsf{N}^0_t := \{x \in V^m_t \setminus \{\hat\iota_m\} : \rho_{m,t}(x) = 0\}$; a subset of $\mathsf{Sh}_6$. Cf. `formalization/04_profiles.md` §4.3.2 (v0.3 shell-partition repair).
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

---

## 9. Dynamics

### 9.1 Update rule (imprinting under focus)

- **Theory.** Focus on contents drives the integration-graph weights toward higher integration; absence of focus admits decay. Cf. `sources/core/3_formal_apparatus.md` §8.
- **Math.** $w_{s+} = \Pi_{[0,1]}((1 - \beta) w_{s-} + \alpha (1 - w_{s-}))$ for $\alpha, \beta \in [0, 1]$. Cf. `formalization/05_dynamics.md` §5.4.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.
- **Open sub-questions.** Functional forms of $\alpha, \beta$ (the imprinting open functions); the architecture leaves these to application.

### 9.2 Uniform convergence of mode aggregation

- **Theory.** The scalar mode aggregation converges uniformly when modes are bounded. Cf. `sources/core/3_formal_apparatus.md` §4.5.
- **Math.** Proposition 5.7.2: uniform convergence by the Weierstrass M-test. Cf. `formalization/05_dynamics.md` §5.7.
- **Lean.** `TLICA.Dynamics.mode_aggregation_uniform_convergent`.
- **Status.** Machine-verified (round 2).

---

## 10. Formal non-reducibility

### 10.1 Non-reducibility of ρ from (φ, κ)

- **Theory.** ρ is its own coordinate; no universal function recovers it from φ and κ. Cf. `sources/core/3_formal_apparatus.md` §9.
- **Math.** Proposition 6.2.1; witness model agrees on (φ, κ), differs on ρ. Cf. `formalization/06_independence_lemmas.md` §6.2.
- **Lean.** `TLICA.NonReducibility.no_F_rho`.
- **Status.** Machine-verified (round 1).

### 10.2 Non-reducibility of φ from (ρ, κ)

- **Theory.** φ is its own coordinate; the architecture's slack-at-δ structure separates length-1 from length-2 pathways. Cf. core §9.
- **Math.** Proposition 6.3.1; witness model differs on φ by δ. Cf. `formalization/06_independence_lemmas.md` §6.3.
- **Lean.** `TLICA.NonReducibility.no_F_phi` (depends on v0.3.1 D_φ repair).
- **Status.** Machine-verified (round 1).

### 10.3 Non-reducibility of κ from (ρ, φ)

- **Theory.** κ is its own coordinate; source distinctness is independent of ρ and φ. Cf. core §9.
- **Math.** Proposition 6.4.1. Cf. `formalization/06_independence_lemmas.md` §6.4.
- **Lean.** `TLICA.NonReducibility.no_F_kappa`.
- **Status.** Machine-verified (round 1).

### 10.4 Formal non-reducibility (composite)

- **Theory.** The three-coordinate apparatus is structurally non-collapsible. Cf. core §9.
- **Math.** Theorem 6.5.1; three explicit functions $F_\rho, F_\phi, F_\kappa$ with typed nonexistence claims. Cf. `formalization/06_independence_lemmas.md` §6.5 (v0.3.1 D_φ form).
- **Lean.** `TLICA.NonReducibility.formal_non_reducibility`.
- **Status.** Machine-verified (round 1).

---

## 11. Probe space (empirical robustness)

### 11.1 Probe space

- **Theory.** The space of test conditions against which the I tests the content; probes return evaluations. Cf. `sources/core/3_formal_apparatus.md` §6.4.
- **Math.** $(Q^m_t, \mathcal{Q}^m_t, \mu^m_t)$ with measurable evaluation maps $\text{eval}_t : Q^m_t \to \mathsf{A}^m_t$. Cf. `formalization/00_signature.md` §0.15 (v0.3 commitment).
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

### 11.2 Empirical-robustness deficit ε

- **Theory.** A measure of how much a content fails to survive probing. Cf. core §6.4.
- **Math.** $\epsilon_{m,t}(x) := \int_{Q^m_t} \mathbf{1}_{\text{eval failure}}(q, x) \, d\mu^m_t(q)$ (schematic). Cf. `formalization/03_coordinates.md` §3.3.5.
- **Lean.** Not yet encoded.
- **Status.** Signature-declared.

---

## 12. Foundation-level orphans (named but not formalized at foundation)

This section contains concepts named at the foundation that lack foundation-level math representations. Each is a candidate for future formalization work.

### 12.1 Modes A, B, C

- **Theory.** Three modes of I-development: A (differentiating), B (self-modeling / reflective), C (integrating). Cf. `sources/core/2_access_and_development.md` §4.
- **Math.** Not yet formalized. Candidate path: each mode as a typed operator on profiles, with PtCns evaluation as the per-encounter selection mechanism (cf. §13.3 below).
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.2 I/not-I boundary

- **Theory.** The structural boundary emerging through Mode A differentiation; constitutive of the lived I. Cf. `sources/core/2_access_and_development.md` §4.5.
- **Math.** Not yet formalized. Candidate path: a partition of $\mathsf{A}^m_t$ into I-aligned (lived-I) and not-I regions, with boundary as the support of PtCns-positive evaluations.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.3 Maximally-self-defined I (MSI)

- **Theory.** "The action-relevant configuration of the lived-I network whose preservation counts, for the modeling I under current conditions, as continuation of itself." Cf. `sources/core/2_access_and_development.md` §4.8.
- **Math.** Not yet formalized. Candidate path: a distinguished subset $\mathsf{MSI}^m_t \subseteq \mathfrak{L}^m_t$ characterized by high-ρ membership in the maximally-self-defining configuration; functional form open.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.4 Prerogative of consistency (PtCns)

- **Theory.** "The structural feature by which the I's frame functions as the implicit consistency-standard against which encounters with not-I are evaluated." Cf. `sources/core/2_access_and_development.md` §4.8.
- **Math.** Not yet formalized at foundation. Candidate path: $\text{PtCns}_{m,t} : \mathsf{A}^m_t \to \mathcal{C}$ with $\mathcal{C}$ a consistency-evaluation space, parametrized by candidate consistency notions (ρ-coherence, φ-coherence, network-coherence). Per the prerogative formalization sketch.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized; sketched in the prerogative discussion.

### 12.5 Prerogative of continued existence (PCE)

- **Theory.** "The structural feature by which the modeling I pulls toward the path that maximizes continued existence of the maximally-self-defined I." Cf. `sources/core/4_derived_concepts_and_predictions.md` §10.7.
- **Math.** Not yet formalized at foundation. Candidate path: $\text{PCE}_{m,t}(a) := \mathbb{E}_{P' \sim \text{Project}(a, P^\rho_{m,t})}[\Pi_{m,t}(P' \cap \mathsf{MSI}^m_t)]$ with action $a$ selected by maximization; depends on MSI, Π, and the future-state Project map. Per the prerogative formalization sketch.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.6 Preservation-ranking Π

- **Theory.** A ranking on profile-configurations encoding which would best preserve the maximally-self-defined I. "Formal development of $\Pi_{m,t}$ as an architectural object distinct from ρ is application-level work." Cf. `sources/core/4_derived_concepts_and_predictions.md` §10.7.
- **Math.** Signature: $\Pi_{m,t} : \mathcal{P}(\mathfrak{L}^m_t) \to \mathbb{R}_{\ge 0}$ (or a partial order); functional form open. The architecture *explicitly* defers this to application.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized; explicit application-level deferral.

### 12.7 Future-state projection (Project map)

- **Theory.** The I's representation of profile-configurations candidate actions would produce. Cf. `sources/core/4_derived_concepts_and_predictions.md` §10.7; implicit in the "misdirected / defeated / distorted-projection" language.
- **Math.** Not yet formalized. Candidate path: $\text{Project} : \text{Actions} \times \text{Profiles} \to \text{ProbabilityMeasure(Profiles)}$.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.8 Identity-neutral encapsulation

- **Theory.** Profile-development into bounded non-centrality; the third PtCns response besides differentiation and integration. Cf. `sources/core/2_access_and_development.md` §4.5.
- **Math.** Not yet formalized. Candidate path: the PtCns-zero output of the evaluation function.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.9 Osmotic imprinting

- **Theory.** Substrate-level, non-conscious imprinting of patterns. Cf. `sources/core/3_formal_apparatus.md` §8.7.
- **Math.** Not yet formalized at foundation. Candidate path: a substrate-level dynamics complementing the update rule of §9.1, with weights influenced by repeated co-activation patterns.
- **Lean.** Not encoded.
- **Status.** Named-but-unformalized.

### 12.10 A_{m,t} dynamics

- **Theory.** How $\mathsf{A}^m_t$ evolves with $t$ — contents entering and leaving the asymptotic field. Cf. `oq:phenomenology-status-axioms` (Gap 11).
- **Math.** Not yet formalized; no axioms committed. Candidate path: a transition relation on $\mathsf{A}^m_\cdot$ with axioms about which contents can enter/leave based on focus and substrate.
- **Lean.** Not encoded.
- **Status.** Open-theoretical (Gap 11).

---

## 13. Temporal phenomenology

Source: `sources/papers/6_temporal_phenomenology.md` (File 6: First Application Paper). The paper develops the integration-content account of subjective time-flow rate, the structural account of "now," and the past/future asymmetry. It introduces no new foundation primitives; it consumes the foundation's focus, contact, pathway, and persistence apparatus and adds application-level temporal structures.

### 13.1 Substrate-bound focus capacity

- **Theory.** The modeling I's focus has a substrate-bounded capacity at any time; this bound is what makes the integration-content account of time-flow non-trivial. Cf. `6_temporal_phenomenology.md` §2.1.
- **Math.** A bound $\Phi^{\max}_{m,t} \in \mathbb{R}_{> 0}$ on the rate at which contents can be focused for imprinting.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 13.2 Two-phase focus shift

- **Theory.** Focus shifts in two phases: an attention-orientation phase and an imprinting phase. Cf. `6_temporal_phenomenology.md` §2.2.
- **Math.** A schematic two-phase transition $\text{orient} \to \text{imprint}$, each phase contributing to the update rule of §9.1.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 13.3 Imprinting interface

- **Theory.** The interface at which substrate-bound contents become available for imprinting. Cf. `6_temporal_phenomenology.md` §2.3.
- **Math.** $\mathsf{S}_m \subseteq V^m_t$ with $M_m(t) := \Gamma^M_m(\mathsf{S}_m, t)$; $\hat\iota_m \not\to M_m(t)$ by structure.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 13.4 Imprinting pathway

- **Theory.** The pathway by which an imprinting event modifies the integration graph at the substrate-bound contact interface. Cf. `6_temporal_phenomenology.md` §2.7.
- **Math.** A typed event $e = (s, u, v, k, \alpha, \beta)$ feeding the update rule of §9.1.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 13.5 Subjective time-flow rate (two formulations)

- **Theory.** Subjective rate is structurally tracked by *either* frame-rate compression (fewer integration-events per clock-second → faster subjective time) *or* per-frame allocation shift (same frame count, less integration-content per frame). The paper takes both as probably-operating, with their relative contributions empirically open. Cf. `6_temporal_phenomenology.md` §3.1–3.2.
- **Math.** Two candidate rate functions $R^{\text{fr}}_{m,t}, R^{\text{pf}}_{m,t} : T_m \to \mathbb{R}_{>0}$. Full subjective-time rate $R_{m,t} = \mathcal{A}(R^{\text{fr}}_{m,t}, R^{\text{pf}}_{m,t})$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending; the aggregation $\mathcal{A}$ is open).

### 13.6 Sublinear scaling

- **Theory.** Subjective time-flow scales sublinearly with integration-content rate, preventing extreme frame-lag. Cf. `6_temporal_phenomenology.md` §3.3.
- **Math.** $R_{m,t}$ is sublinear in integration-rate: $R_{m,t}(c \cdot I) \le c \cdot R_{m,t}(I)$ for $c \ge 1$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 13.7 Integration-content shifts across lifespan

- **Theory.** "Ten minutes at age five contains more new than ten minutes at age fifty" — the rate of new-integration accumulation decreases over the lifespan. Cf. `6_temporal_phenomenology.md` §3.5.
- **Math.** For the intertemporal profile distance $d^\infty_{\text{sh}, m}$ (§7.4), small $\Delta t$: $\partial_t d^\infty_{\text{sh}, m}(t, t + \Delta t) / \Delta t$ decreases with $t$ at typical $m$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported via §7.4).
- **Cross-reference.** Load-bearing use-case for the subdomain-restriction approach to profile comparison; cf. `profile_comparison_v0_2.md` §2.1.

### 13.8 Specious present (retention, impressional moment, protention)

- **Theory.** "Now" has internal three-part structure: retention (just-past), impressional moment (active imprinting), protention (anticipated next). Cf. `6_temporal_phenomenology.md` §4.3.
- **Math.** Three-component decomposition of focus at $t$: $F_{m,t} = (R_{m,t}, I_{m,t}, P_{m,t})$ corresponding to the three Husserlian moments.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 13.9 Past vs future asymmetry

- **Theory.** Past has actual integration-history; future has only projected imprinting. The directionality of "behind/ahead" follows. Cf. `6_temporal_phenomenology.md` §5.
- **Math.** Past at $t$ = integration-history of $\mathsf{A}^m_t$; future at $t$ = projection under future-state Project map (§12.7). Asymmetry: actual vs hypothetical.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.7).

### 13.10 Anticipated vs remembered emotion asymmetry

- **Theory.** Anticipated emotions are typically weaker than remembered emotions of comparable events because somatic systems respond to actual contact more strongly than to cognitive simulation. Cf. `6_temporal_phenomenology.md` §5.4.
- **Math.** $\kappa^{\text{in}}_{m, t}(\text{anticipated}) < \kappa^{\text{in}}_{m, t}(\text{remembered of comparable } \rho)$ at typical $m, t$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported via κ).

### 13.11 Cognitive-profile-dependent subjective time variation

- **Theory.** Variation in subjective-time across I's with different cognitive profiles (ADHD, autism-spectrum, depression states). Cf. `6_temporal_phenomenology.md` §6.1.
- **Math.** $R_{m,t}$ as a function of profile-features (focus-capacity bandwidth, mode-distribution, verification-tool acquisition rate) varying across modeling I's.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

---

## 14. Agency

Source: `sources/papers/agency_paper_v0_3_0_patched.md`. The largest and most application-object-dense of the application papers. Introduces four named application-level profile objects ($AP_{m,t;a}$, $EIP_p$, $PP_i$, $FTP_f$), the verification-toolkit, the live-option construction lemma with four failure modes, will/trying/effort as operator-bundle direction under resistance, decision-events with order-asymmetric Mode B object-domain availability, the seventeen-family variation taxonomy with ten-axis diagnostic schema, and the triadic ownership/responsibility/accountability apparatus.

### 14.1 The agency criterion

- **Theory.** The structural conditions distinguishing agency from non-agency. Cf. `agency_paper_v0_3_0_patched.md` §4.2.
- **Math.** A predicate $\mathsf{Agentive}_{m,t}(a)$ on a candidate action $a$, expanding into the conjunction of the live-option lemma's preconditions, the operator-bundle direction-fact, and ownership-integration.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.2 Three orders of willing (foundational)

- **Theory.** First-order (focus on focus-target), second-order (focus on thought), third-order (focus on substrate action). Cf. `agency_paper_v0_3_0_patched.md` §3.3, §4.4.
- **Math.** Three mode-indexed projections of the will-act: $\Omega^1_{m,t}, \Omega^2_{m,t}, \Omega^3_{m,t}$, each operating on the corresponding mode-projection of the integration graph.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported, builds on mode-vector profile §7.2).

### 14.3 Constructed orders of willing

- **Theory.** Fourth-order and higher: will-acts whose target is a not-I coordination structure (asking, directing, teaching). Cf. `agency_paper_v0_3_0_patched.md` §4.4.
- **Math.** $\Omega^n_{m,t}$ for $n \ge 4$, with target in the I's apparent-other contents (§14.7).
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §14.7).

### 14.4 The universal toolkit constraint

- **Theory.** Every will-act requires verification-toolkit operations: a live-option must be constructible, evaluable, and selectable. Cf. `agency_paper_v0_3_0_patched.md` §4.5.
- **Math.** Precondition on $\Omega^n_{m,t}$ requiring §14.5's toolkit components to be operational.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 14.5 Verification-toolkit (application-level)

- **Theory.** A specific structural object: the I's toolkit of construction, evaluation, and selection operations. Distinct from the foundation's generic $\mathsf{Tools}^m_t$. Cf. `agency_paper_v0_3_0_patched.md` §5.1.
- **Math.** A tuple $(T_{\text{construct}}, T_{\text{evaluate}}, T_{\text{select}}, \ldots)$ built on the foundation's toolset.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.6 Live-option construction lemma

- **Theory.** Candidate action $a$ is a live option iff the verification-toolkit can construct it, evaluate it, and inhabit it as a candidate. Four failure modes (construction, evaluation, source-compromise, inhabitation). Cf. `agency_paper_v0_3_0_patched.md` §5.2, §5.4.
- **Math.** $\mathsf{Live}_{m,t}(a) := T_{\text{construct}}(a) \wedge T_{\text{evaluate}}(a) \wedge \mathsf{Inhabit}_{m,t}(a) \wedge \mathsf{SourceClean}_{m,t}(a)$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.7 Apparent-I / other-I apparatus

- **Theory.** Distinguishes the I's representations of other agents (apparent-I-contents) from actual other agents. Foundational for fourth-order will, manipulation, coercion. Cf. `agency_paper_v0_3_0_patched.md` §4.11.
- **Math.** $\mathsf{AppI}^m_t \subseteq \mathsf{A}^m_t$ — contents representing other agents from $m$'s perspective, with a structural correspondence to actual modeling I's.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on `oq:inside-projection-specification`).

### 14.8 Three willing-strategies (direct / configurational / slingshot)

- **Theory.** Three strategic profiles of operator-bundle-mediated willing on a toolkit-richness continuum. Direct: operator-bundle straight to target. Configurational: configure substrate then operate. Slingshot: configurational with delayed direction. All meet the six conditions of free choice. Cf. `agency_paper_v0_3_0_patched.md` §5.8.
- **Math.** Three sub-types of $\Omega^n_{m,t}$: $\Omega^{n, \text{dir}}, \Omega^{n, \text{conf}}, \Omega^{n, \text{sling}}$, characterized by operator-bundle / substrate coupling.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 14.9 Source-compromise / manipulation continuum

- **Theory.** Continuum of source-compromise modes from acute manipulation (local toolset-input poisoning) through developmental manipulation (toolkit-shaping over time) to scaffold-captured agency (institutional source-compromise). Cf. `agency_paper_v0_3_0_patched.md` §5.9.
- **Math.** A source-cleanness function $\mathsf{SC}_{m,t}(a) \in [0, 1]$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.10 Will / willing-operation / will-act

- **Theory.** Three distinct architectural objects: the will (underlying capacity), the willing-operation (deployment under resistance), the will-act (completed event). Cf. `agency_paper_v0_3_0_patched.md` §6.2.
- **Math.** A triple $(W_{m,t}, \omega_{m,t}, \Omega^n_{m,t}(a))$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.11 Trying (under incomplete guarantee)

- **Theory.** Will-act under uncertain success; structurally distinct from will-act under guarantee. Cf. `agency_paper_v0_3_0_patched.md` §6.3.
- **Math.** Subset of $\Omega^n_{m,t}(a)$ where the projected outcome under Project (§12.7) is uncertain.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.7).

### 14.12 Effort (operator-bundle direction under resistance)

- **Theory.** Work done by an operator-bundle to direct the substrate under resistance. Eight-source resistance taxonomy. Cf. `agency_paper_v0_3_0_patched.md` §6.4.
- **Math.** $\mathsf{Effort}_{m,t}(a) := \mathcal{E}(\omega_{m,t}, R_{m,t}(a))$ where $R$ is the resistance profile.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.13 Decision-event structure

- **Theory.** A selection-event in which the operator-bundle commits to one option from a contrastive live-option space. Cf. `agency_paper_v0_3_0_patched.md` §7.3.
- **Math.** Typed event $\mathsf{Decide}_{m, t}(a; A)$ with $A \subseteq \mathsf{A}^m_t$ the live-option set and $a \in A$ selected.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.14 Order-asymmetric Mode B object-domain availability

- **Theory.** Mode B is one capacity, but its object-domains (first-order focusing, second-order thought, third-order action, constructed-order strategy, source-status, $\Pi$-ranking, PtCns relation, ownership-integration) are asymmetrically available across orders. Cf. `agency_paper_v0_3_0_patched.md` §7.6.
- **Math.** A function $\mathsf{ModeBAvail}_{m, t}(D) \in \{0, 1\}$ for each object-domain $D$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.15 Post-hoc recognition / source-opacity / confabulation triad

- **Theory.** Three structural failures: post-hoc recognition (correct identification of source after the act), source-opacity (no source-access), confabulation (incorrect source-attribution). Cf. `agency_paper_v0_3_0_patched.md` §7.9.
- **Math.** Typed classification $\mathsf{SourceAttr}_{m,t}(a) \in \{\text{post-hoc-correct}, \text{opaque}, \text{confabulated}\}$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 14.16 Seventeen-family variation taxonomy

- **Theory.** Seventeen named variation families: thin agency, constrained choice, omission/veto, akrasia, habit, compulsion/addiction, ADHD-like implementation-gap, deliberation-pathologies, learned helplessness, affect-mediated agency contraction, dissociation, apparent choice and confabulation, manipulation/source-compromise, constructed-order variations, skilled flow, reflexive action, compound configurations. Cf. `agency_paper_v0_3_0_patched.md` §8.3–8.20.
- **Math.** Typed enumeration $\mathsf{VarFam} := \{V_1, \ldots, V_{17}\}$, each a structural predicate on agency configurations.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — many families depend on §12 orphans).

### 14.17 Ten-axis diagnostic schema

- **Theory.** Ten axes for diagnostically locating an agency configuration: variation-family ($V$), ownership ($O$), source-status ($S$), condition-status ($C$), Mode B ($B$), developmental-window ($D$), kind of outcome ($K$), manipulation status ($M$), order-engagement ($R$), temporal ($T$). Cf. `agency_paper_v0_3_0_patched.md` §8.2.
- **Math.** Tuple $(V, O, S, C, B, D, K, M, R, T)$ over typed axes.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.18 Attribution profile $AP_{m,t;a}$ (ten components)

- **Theory.** A ten-component application-level profile encoding the structural conditions for responsibility-attribution for action $a$. Components: ownership-integration, sourcehood, ownership-recognition, condition-status, Mode B reflective availability, developmental-window, kind of outcome, manipulation, order-engagement, temporal position. Cf. `agency_paper_v0_3_0_patched.md` §9.
- **Math.** $AP_{m, t; a} = (O, S, R_{\text{own}}, C, B, D, K, M, \text{Ord}, T)$ as a typed tuple, drawing from foundation objects where possible.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).
- **Cross-reference.** Canonical example of an application-level profile distinct from foundation $P^\rho$; cf. `profile_comparison_v0_2.md` §2.2.

### 14.19 Empirical interpretation profile $EIP_p$

- **Theory.** A profile mapping empirical paradigms (Libet, Wegner, Soon-class) to architectural objects, through a timing-marker non-identity chain. Cf. `agency_paper_v0_3_0_patched.md` §10.
- **Math.** $EIP_p$ as a structure containing the chain $t_{\text{prep}} \not\equiv t_{\text{select}} \not\equiv t_{\text{report}} \not\equiv t_{\text{move}} \not\equiv t_{\text{outcome}} \not\equiv t_{\text{recognize}}$ plus paradigm-specific operationalization.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.20 Prediction profile $PP_i$

- **Theory.** A prediction-schema profile with backbone components for each of eighteen formal predictions across seven families. Cf. `agency_paper_v0_3_0_patched.md` §11.
- **Math.** $PP_i$ as a typed tuple of prediction components.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.21 Framework translation profile $FTP_f$

- **Theory.** Diagnostic schema for translating between the architecture and alternative frameworks, used under "translation-not-refutation" discipline. Cf. `agency_paper_v0_3_0_patched.md` §5; `free_will_paper_v0_3_0_patched.md` §5.
- **Math.** $FTP_f$ as a typed tuple of translation components for framework $f$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 14.22 Timing-marker non-identity chain

- **Theory.** Empirical-interpretation claim that six events at distinct times — preparation, selection, report, movement, outcome, recognition — are non-identical. Cf. `agency_paper_v0_3_0_patched.md` §10.
- **Math.** $t_{\text{prep}} \ne t_{\text{select}} \ne t_{\text{report}} \ne t_{\text{move}} \ne t_{\text{outcome}} \ne t_{\text{recognize}}$ in $T_m$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

---

## 15. Free will

Source: `sources/papers/free_will_paper_v0_3_0_patched.md`. Companion to the agency paper. Develops free-choice-proper as canonical case with six conditions, the triadic ownership/responsibility/accountability apparatus, and eleven framework translations under translation-not-refutation discipline. Shares much application apparatus with the agency paper (notably §14.16 seventeen-family taxonomy and §14.18–14.21 four named profile objects).

### 15.1 Six conditions of free choice (C1–C6)

- **Theory.** Free choice proper is the conjunction of: C1 (live-option-multiplicity), C2 (evaluative engagement), C3 (source-clean origination), C4 (Mode B reflective availability of the choice-process), C5 (developmental maturity), C6 (ownership-integration). Cf. `free_will_paper_v0_3_0_patched.md` §3.2.
- **Math.** $\mathsf{FreeChoice}_{m, t}(a) := C_1(a) \wedge C_2(a) \wedge C_3(a) \wedge C_4(a) \wedge C_5(a) \wedge C_6(a)$ as a six-fold conjunction with each $C_i$ a typed predicate.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 15.2 The choice-process stack

- **Theory.** Option-space construction → evaluative engagement → selection → ownership-integration → post-choice availability. Cf. `free_will_paper_v0_3_0_patched.md` §3.3.
- **Math.** Typed sequence of states; each transition has a foundation correlate (toolkit operation, $\rho$-update, $\phi$-attainment, ownership predicate).
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 15.3 Order × condition matrix

- **Theory.** The free-choice conditions $C_1, \ldots, C_6$ engage across orders of willing in characteristic ways. Cf. `free_will_paper_v0_3_0_patched.md` §3.5.
- **Math.** A $6 \times n$ matrix $M_{ij} \in \{0, 1, \text{partial}\}$ — which $C_i$ engages with $\Omega^j_{m,t}$ at what strength.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 15.4 Triadic apparatus: ownership, responsibility, accountability

- **Theory.** Three dissociable relations on an action: ownership-integration (was the act integrated as mine?), responsibility-attribution (under what conditions is the act mine to answer for?), accountability-practice (what social-practical engagement follows?). Dissociability is the load-bearing structural claim. Cf. `free_will_paper_v0_3_0_patched.md` §4.1.
- **Math.** Three relations $\mathsf{Own}_{m, t}(a), \mathsf{Resp}_{m, t}(a), \mathsf{Acc}_{m, t}(a)$, each typed; pairwise non-equivalent.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 15.5 Ownership-integration

- **Theory.** "The selected option is integrated into the lived-I profile as the I's action — PtCns-endorsed — rather than as alien, merely undergone, externally inserted, or dissociatively produced." Condition C6 above. Cf. `free_will_paper_v0_3_0_patched.md` §3.2.
- **Math.** $\mathsf{OwnInt}_{m, t}(a) := \mathsf{PtCns}_{m, t}(a) > 0 \wedge a \in \mathfrak{L}^m_{t+}$ (post-action lived-I integration).
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.4 PtCns).

### 15.6 Source-clean origination

- **Theory.** The act originates from a non-source-compromised toolkit-input. Condition C3. Cf. `free_will_paper_v0_3_0_patched.md` §3.2.
- **Math.** $\mathsf{SC}_{m, t}(a) > \theta_{\mathsf{SC}}$ for some threshold (cf. §14.9 source-compromise continuum).
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending; threshold open).

### 15.7 Lawful-frame qualifier

- **Theory.** Minimal structural regularity required for the architecture's coordinates and persistence relations to be definable. The architecture takes no further position on determinism / stochasticity / indeterminism. Cf. `free_will_paper_v0_3_0_patched.md` §2.2.
- **Math.** Meta-assumption on the structure of $(T_m, V^m_\cdot, w^{m, k}_\cdot)$: enough regularity for foundation definitions to be well-typed.
- **Lean.** Implicit in the project's setup; typeclass structures and noncomputable definitions are agnostic to determinism.
- **Status.** Meta-structural; not a typed object.

### 15.8 Eleven framework translations

- **Theory.** Eleven alternative frameworks translated under "compatibility-not-equivalence" discipline: classical compatibilism, hierarchical-identification / Frankfurt-class, reasons-responsiveness, attributionism / reactive-attitudes, sourcehood / manipulation arguments / hard incompatibilism, libertarianism / AP / indeterminism, illusionism, predictive-coding / active-inference / executive-control, phenomenology / existentialism / wisdom-traditions, source-sensitive Frankfurt-class descendants, self-determination-theory. Cf. `free_will_paper_v0_3_0_patched.md` §5.4–5.11.
- **Math.** Eleven instances of $FTP_f$ (§14.21).
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported via §14.21).

### 15.9 Manipulator-responsibility / manipulated-agent-responsibility

- **Theory.** Manipulation: the manipulator is responsible for source-compromise; the manipulated agent's responsibility is qualified, not eliminated. Cf. `free_will_paper_v0_3_0_patched.md` §4.3.
- **Math.** Two attributions $\mathsf{Resp}_{m_{\text{manip}}, t}(\text{source-shaping})$ and $\mathsf{Resp}_{m_{\text{target}}, t}(a)$, with the second reduced by the source-compromise term.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

---

## 16. Differentiated affect

Source: `sources/papers/differentiated_affect_v1_0_2_patched.md`. Constructs a structural taxonomy of differentiated affect from love-as-definitional-anchor: five clusters (connection, self, threat, boundary, embodied), five named profile-shape disturbances, the reflexive PtCns bridge lemma, the affect criterion, and the compositional schema. Many entries here are explicitly application-level extensions of foundation orphans (PtCns, PCE, profile-shape, projection-apparatus).

### 16.1 The affect criterion

- **Theory.** Affect-as-such is structural perturbation of: salience, action-readiness, profile stability, PCE, PtCns, or focus. Cf. `differentiated_affect_v1_0_2_patched.md` §2.
- **Math.** $\mathsf{Affective}_{m, t}(x) := \exists d \in D : \mathsf{Perturb}_d(x, m, t)$ where $D = \{\text{salience}, \text{action-readiness}, \text{profile stability}, \text{PCE}, \text{PtCns}, \text{focus}\}$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.4, §12.5).

### 16.2 Reflexive PtCns bridge lemma

- **Theory.** Connects PtCns operation on encounters to PtCns operation on the I's own contents. Foundational for the self-cluster and several profile-shape disturbances. Cf. `differentiated_affect_v1_0_2_patched.md` §4.3.
- **Math.** $\mathsf{PtCns}^{\text{refl}}_{m, t}(x) = \mathsf{PtCns}_{m, t}(x)$ applied to $x$ qua its position in the I's own profile, with the I's frame as consistency-standard.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.4).

### 16.3 The affect derivation schema

- **Theory.** Five-dimension schema for deriving any affect from love-anchor: profile-regions, active operators, operator dynamics (convergent/conflicting), dominant prerogative, stability. Cf. `differentiated_affect_v1_0_2_patched.md` §4.4.
- **Math.** Five-tuple $\mathsf{AffDeriv}_a := (\mathsf{Profile}, \mathsf{Ops}, \mathsf{Dyn}, \mathsf{Prerog}, \mathsf{Stab})$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred).

### 16.4 Five clusters of differentiated affect

- **Theory.** Five clusters partition the affect taxonomy: connection (extension-affects), self (frame-affects), threat (preservation-affects), boundary (encounter-affects), embodied (substrate-mediated). Cf. `differentiated_affect_v1_0_2_patched.md` §4.2, §5–9.
- **Math.** Partition $\mathsf{Affects} = \mathsf{Conn} \sqcup \mathsf{Self} \sqcup \mathsf{Threat} \sqcup \mathsf{Bound} \sqcup \mathsf{Embod}$ on the typed affect-space.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 16.5 Love (canonical case)

- **Theory.** The structural state in which the maximally-self-defined I has extended via Mode C to include another content at *constitutive-extension topology*, with PtCns preserving frame-coherence and the extension's $\Pi$-position invariant under non-reorganizing variation. Cf. `differentiated_affect_v1_0_2_patched.md` §3.1.
- **Math.** $\mathsf{Love}_{m, t}(y) := y \in \mathsf{MSI}^m_t \wedge \rho_{m, t}(y) \ge \theta_{\text{ext}} \wedge \mathsf{PtCns}_{m, t}(\text{extended frame}) > 0 \wedge \Pi_{m, t}(y) \text{ stable}$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.3, §12.4, §12.6).

### 16.6 Connection-cluster affects

- **Theory.** Variations on love: grief (loss of extension); fear-for-beloved (PCE-projection over extended-other); devotion (sustained PCE over extended configuration); jealousy (perceived threat to extension's integrity); joy-in-flourishing (PCE-positive change in extended-other); plus compounds. Cf. `differentiated_affect_v1_0_2_patched.md` §5.
- **Math.** Each is a parametric variation on the love-tuple of §16.5 with specific perturbations.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred).

### 16.7 Self-cluster affects

- **Theory.** Frame-affects: pride (positive reflexive PtCns), shame (whole-I-scope negative reflexive PtCns), guilt (act-scope negative), embarrassment (social-scope), self-loathing (sustained whole-I-scope negative). Cf. `differentiated_affect_v1_0_2_patched.md` §6.
- **Math.** Each affect is a configuration of $\mathsf{PtCns}^{\text{refl}}_{m, t}$ over different scopes of the I's own contents.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §16.2).

### 16.8 Threat-cluster affects

- **Theory.** Preservation-affects: fear (focused PCE-projection toward projected damage); anxiety (diffuse PCE-projection across projected futures); dread (certainty-weighted with foreshortened action-space); hope (PCE-projection of viable preservation-pathway under uncertainty); despair (projection-toolset unable to construct viable preservation-pathway). Cf. `differentiated_affect_v1_0_2_patched.md` §7.
- **Math.** Each affect is a configuration of the PCE / Project pair over different projected-future structures.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.5, §12.7).

### 16.9 Boundary-cluster affects

- **Theory.** Encounter-affects: anger (Mode A to current frame-violation); disgust (somatic boundary-rejection); awe (boundary-expansion under vast not-I); boredom (failed salience and contact at boundary); hate (sustained pathological boundary-configuration). Cf. `differentiated_affect_v1_0_2_patched.md` §8.
- **Math.** Each is a Mode A configuration (§12.1) on specific not-I encounters.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.1).

### 16.10 Embodied-cluster affects

- **Theory.** Substrate-mediated: pain (damage signal); pleasure (positive somatic signal); trauma-cue activation (substrate-mediated reactivation of imprinted patterns); diffuse somatic states (mood, fatigue, anhedonia, somatic dread). Cf. `differentiated_affect_v1_0_2_patched.md` §9.
- **Math.** Each is a substrate-coupling configuration with the third-order pathway, foundation-defined modulo the substrate-bridge open work.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — substrate bridge).

### 16.11 Five profile-shape disturbances

- **Theory.** Five named structural pathologies of the I's apparatus: dissolution, severe depression, learned helplessness, chronic boredom, anhedonia. Each damages different structural equipment. Cf. `differentiated_affect_v1_0_2_patched.md` §5.4, §6.5, §7.6, §8.4, §9.4.
- **Math.** Five typed states:
  - $\mathsf{Diss}_{m, t}$: Mode C over-extension past PtCns-stable boundary.
  - $\mathsf{SevDep}_{m, t}$: collapsed profile support + cogito/thought partition functional collapse (§16.12).
  - $\mathsf{LH}_{m, t}$: projection-apparatus systematically produces "no viable pathway" outputs.
  - $\mathsf{ChrBor}_{m, t}$: engagement-finding apparatus damaged.
  - $\mathsf{Anh}_{m, t}$: pleasure-response apparatus damaged.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred).
- **Cross-reference.** Canonical use-case for lived-I topological invariants; cf. `profile_comparison_v0_2.md` §2.4.

### 16.12 Cogito/thought partition functional collapse

- **Theory.** Architecture normally maintains a partition between $\hat\iota_m$ (cogito at structural $\rho = 1$) and contents of thought. In severe depression this partition functionally collapses: depressive thoughts acquire near-cogito $\rho$ and become functionally indistinguishable from cogito from inside. Structural cogito-anchoring is preserved throughout; what fails is the I's *access* to the partition. Cf. `differentiated_affect_v1_0_2_patched.md` §6.5; foundation §10.5.6.
- **Math.** Pair $(\rho^{\text{struct}}_{m,t}, \rho^{\text{func}}_{m,t})$: structural $\rho$ (always $\rho^{\text{struct}}(\hat\iota_m) = 1$) and functional $\rho$ (I's accessible $\rho$ from inside). Functional collapse: $\rho^{\text{func}}(\text{depressive content}) \to 1^-$ while $\rho^{\text{struct}}$ values intact.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 16.13 Pattern A / Pattern B threshold dynamics

- **Theory.** Two affect-availability trajectories: Pattern A — conscious-fuzzy buildup becoming phenomenally-clear after focus threshold crossed. Pattern B — unconscious-operative or encapsulated buildup, metastable until phase-change event brings it into conscious-fuzzy or conscious-clear access. Cf. `differentiated_affect_v1_0_2_patched.md` §10.
- **Math.** Two trajectories on the foundation's φ-tier and access ($\mathsf{A}^m_t$) structures: Pattern A traverses fuzzy → clear monotonically through threshold; Pattern B is metastable in encapsulated region until phase change.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported).

### 16.14 Recognition-lag pattern (bidirectional)

- **Theory.** Phenomenal-clear recognition of structural change typically lags the change itself, in both directions: a new affect is structurally present before recognized; a recovery is structurally underway before recognized. Cf. `differentiated_affect_v1_0_2_patched.md` §10.
- **Math.** Predicted offset $\Delta t_{\text{recog}} > 0$ between structural-profile change and conscious-clear access change.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 16.15 Compound affect schema

- **Theory.** Compound affects (e.g., survivor guilt) analyzed via the five-dimension schema (§16.3) plus convergent/conflicting/dominant analysis of compound operator dynamics. Cf. `differentiated_affect_v1_0_2_patched.md` §5.7.
- **Math.** Compound = $n$-tuple of base affects with explicit dynamics: convergent (reinforcing), conflicting (oscillating), or dominant (one over others).
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred).

### 16.16 Self-annihilation compound (suicidality)

- **Theory.** Four-mechanism configuration: sustained despair + whole-I-scope self-loathing + cogito/thought partition collapse + distorted $\Pi$/future-state projection. Architecture's most clinically dangerous configuration. Cf. `differentiated_affect_v1_0_2_patched.md` §6.5; foundation §10.7.
- **Math.** Compound state: $\mathsf{Despair}_{m,t} \wedge \mathsf{SelfLoathing}^{\text{whole-I}}_{m,t} \wedge \mathsf{PartitionCollapse}_{m,t} \wedge \mathsf{Pi}^{\text{distorted}}_{m,t}$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.5, §12.6, §16.12).

---

## 17. Religiously charged experience

Source: `sources/papers/religiously_charged_experience_v0_3_1.md`. Introduces the religiously-charged-content vs religiously-charged-encounter distinction, the sacred-otherness three-level distinction, four structural forms of religiously charged encounter, the four numinous signatures (the *mysterium tremendum* decomposition), and the mystical-union-with-cogito-anchor structure.

### 17.1 Religiously charged content vs religiously charged encounter

- **Theory.** Two distinct architectural objects: (a) religiously charged *content* — contents occupying frame-position criteria; (b) religiously charged *encounter proper* — recognition-events with specific recognition-event criteria. Cf. `religiously_charged_experience_v0_3_1.md` §3.1.
- **Math.** Two predicates: $\mathsf{RC\text{-}Content}_{m, t}(x)$ (frame-position criteria) and $\mathsf{RC\text{-}Encounter}_{m, t}(x, e)$ (recognition-event criteria).
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 17.2 Frame-position criteria

- **Theory.** Criteria a content meets to be religiously-charged-content: ultimate-structure position (high $\rho$-anchoring relative to other ultimate-structure contents), integrative-frame role, transcendence-position. Cf. `religiously_charged_experience_v0_3_1.md` §3.2.
- **Math.** $\mathsf{FramePos}_{m, t}(x) := x \in \mathsf{MSI}^m_t \wedge \rho_{m, t}(x) > \theta_{\text{ult}} \wedge \mathsf{IntegrFrame}_{m, t}(x)$.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §12.3 MSI).

### 17.3 Recognition-event criteria

- **Theory.** Criteria an event meets to be a religiously-charged-encounter-proper: recognition-event structure, ultimate-significance, numinous quality. Cf. `religiously_charged_experience_v0_3_1.md` §3.3.
- **Math.** $\mathsf{RecogEvent}_{m, t}(e) := \mathsf{ModeBAvail}_{m, t}(\mathsf{ult}) \wedge \mathsf{Numinous}(e) \wedge \mathsf{Recognition}_{m, t}(e)$.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 17.4 Sacred otherness: three-level distinction

- **Theory.** Three levels at which "the sacred other" can be located: ultimate-structure (structurally ultimate aspect of the architecture); apparent-other (the I's representation of a religious other); intersubjective (other-I's with shared religious frame). Cf. `religiously_charged_experience_v0_3_1.md` §4.1.
- **Math.** Three typed object-classes: ultimate-position contents, apparent-religious-others (subset of §14.7), shared-religious-frame other-I's.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §14.7).

### 17.5 Four structural forms of religiously charged encounter

- **Theory.** Four distinct configurations: Form 1 (affirmative ultimate-structure encounter); Form 2 (privative ultimate-structure encounter — encounter with absence-of-ultimate); Form 3 (mirror-form / dual-revelation — the religious-other reveals to the I and the I reveals to the religious-other); Form 4 (orthogonal-pattern encounter — encounter with a form not pre-anticipated in the I's frame). Cf. `religiously_charged_experience_v0_3_1.md` §5.
- **Math.** Four typed sub-predicates of $\mathsf{RC\text{-}Encounter}$ characterized by configurations of the ultimate-position content and the encounter's recognition-event structure:
  - $\mathsf{Form}_1$: affirmative ultimate-structure pattern recognized.
  - $\mathsf{Form}_2$: ultimate-structure absence recognized (the *via negativa* shape).
  - $\mathsf{Form}_3$: bidirectional revelation between I and other.
  - $\mathsf{Form}_4$: orthogonal-pattern recognition — the encounter pattern is outside the I's pre-existing frame.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 17.6 Four numinous signatures (the *mysterium tremendum*)

- **Theory.** Four structural signatures characterizing numinous experience: the tremendum (awesome power), the mysterium (radical unknowability), the fascinans (compelling attraction), and the augustum (commanding worth). Decomposes Otto's typology. Cf. `religiously_charged_experience_v0_3_1.md` §6.2.
- **Math.** Four signature predicates on encounter events: $\mathsf{Tremendum}, \mathsf{Mysterium}, \mathsf{Fascinans}, \mathsf{Augustum}$, each a structural predicate on the configuration of the encounter.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).

### 17.7 Awe as boundary-expansion

- **Theory.** Awe (cf. §16.9 boundary-cluster affect) extended to its religious form: boundary-expansion under encounter with the *augustum* + *fascinans* compound. Cf. `religiously_charged_experience_v0_3_1.md` §6.3.
- **Math.** Religious awe = boundary-cluster awe configuration (§16.9) intersected with §17.5 Form 1 or Form 3 encounter.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §16.9, §17.5).

### 17.8 Mystical union with cogito-anchor guardrail

- **Theory.** Mystical-union experiences (ego-dissolution, oceanic feeling, unitive experience) are structurally compatible with the cogito-anchor: the cogito $\hat\iota_m$ cannot be denied (any move that would deny it presupposes the I performing the denial). What "dissolves" in mystical experience is not the cogito but the *functional access* to the cogito/thought partition (cf. §16.12 for the analogous severe-depression case). Cf. `religiously_charged_experience_v0_3_1.md` §7.1.
- **Math.** Mystical union state: $\rho^{\text{func}}(\text{union-content}) \to 1^-$ while $\rho^{\text{struct}}(\hat\iota_m) = 1$ preserved. Distinct from §16.12 in that the high-$\rho^{\text{func}}$ content is ultimate-positive rather than adversarial.
- **Lean.** Not encoded.
- **Status.** Application-level (signature pending).
- **Cross-reference.** Same architectural mechanism (functional partition collapse) as §16.12 but with different content polarity.

### 17.9 Frame-preserving union vs dissolution

- **Theory.** Frame-preserving union (a Mode C extension to ultimate-structure content without PtCns-frame collapse) is structurally distinct from dissolution-cluster pathology (Mode C extension past PtCns-stable boundary). Cf. `religiously_charged_experience_v0_3_1.md` §7.2.
- **Math.** Frame-preserving union: $\mathsf{Love}_{m, t}(y_{\text{ult}}) \wedge \mathsf{PtCns}_{m, t}(\text{extended frame}) > 0$ for ultimate-structure content $y_{\text{ult}}$. Distinct from $\mathsf{Diss}_{m, t}$ of §16.11.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §16.5, §16.11, §12.4).

### 17.10 Apophatic mysticism / *via negativa*

- **Theory.** Mystical engagement whose object is the *absence* of positive ultimate-structure content; corresponds to §17.5 Form 2 (privative encounter). Cf. `religiously_charged_experience_v0_3_1.md` §7.3.
- **Math.** $\mathsf{Apophatic}_{m, t}$ characterized by Form 2 encounter with sustained engagement; $\mathsf{Mysterium}$ signature is the load-bearing one.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-supported via §17.5, §17.6).

### 17.11 Orthogonal-pattern mystical encounter

- **Theory.** Form 4 mysticism: encounter with a pattern not pre-anticipated in the I's frame, requiring frame-expansion to integrate. Cf. `religiously_charged_experience_v0_3_1.md` §7.4.
- **Math.** $\mathsf{OrthoMystic}_{m, t}$: Form 4 encounter (§17.5) accompanied by post-encounter PtCns-mediated frame-expansion absorbing the new pattern.
- **Lean.** Not encoded.
- **Status.** Application-level (foundation-deferred — depends on §17.5, §12.4).

---

## 18. Open sub-questions registry

The following list consolidates open sub-questions surfaced by entries in this document. Each is a candidate target for substantive math work. Items marked **gap** are from the v0.1 Math Rigor Report; items marked **oq** are open questions from §7.2 of the rigorous edition or from the working papers. Items marked **app** are application-level signature-pending items surfaced by v0.2.

**Foundation-level (§1–12).**

- **Gap 11**: $\mathsf{A}^m_t$ dynamics axioms. Source: §12.10.
- **Gap 12**: profile-comparison metric. Source: §7.4. Status: in active development (working paper v0.2; round-3 Lean encoding green).
- **oq:persistence-construction**: functional form of $\sim^m_H$. Source: §2.3.
- **oq:probe-measure**: which $\nu^m_t$ for Wasserstein. Source: §11.1 cross-ref to §7.4.
- **oq:inside-projection-specification**: cross-I content correspondence. Source: §1.1 cross-ref, application papers.
- **oq:profile-comparison-norm**: $L^p$ choice. Source: §7.4.
- **oq:profile-comparison-domain-form**: shared vs union. Source: §7.4.
- **oq:profile-comparison-persistence-refinement**: content vs persistence-class level. Source: §7.4.
- **oq:wasserstein-measure**: which measure family. Source: §7.4.
- **oq:cross-i-correspondence**: inter-$m$ content correspondence. Source: §7.4.
- **oq:profile-comparison-triangle-restriction**: domain-stable window structure. Source: working paper v0.2 §11.
- **oq:topological-invariant-vector**: composite invariant. Source: working paper v0.2 §11.
- **oq:persistent-homology-foundation**: foundation vs application. Source: working paper v0.2 §11.
- **MSI signature**: foundation-level type signature for the maximally-self-defined I. Source: §12.3.
- **PtCns signature**: foundation-level type signature for the prerogative of consistency. Source: §12.4.
- **PCE signature**: foundation-level type signature for the prerogative of continued existence. Source: §12.5.
- **Π signature**: foundation-level type signature for the preservation-ranking. Source: §12.6.
- **Project map signature**: foundation-level type signature for future-state projection. Source: §12.7.

**Application-level signature-pending items surfaced in v0.2 (§13–17).**

- **app:subjective-time-aggregation**: the aggregator $\mathcal{A}$ that combines frame-rate-compression and per-frame-allocation-shift formulations. Source: §13.5.
- **app:specious-present-decomposition**: the typed three-component decomposition of focus at $t$. Source: §13.8.
- **app:cognitive-profile-dimensions**: the dimensions on which subjective-time variation across cognitive profiles operates. Source: §13.11.
- **app:agency-criterion-predicate**: the typed predicate $\mathsf{Agentive}_{m,t}(a)$. Source: §14.1.
- **app:verification-toolkit-tuple**: the typed tuple $(T_{\text{construct}}, T_{\text{evaluate}}, T_{\text{select}}, \ldots)$. Source: §14.5.
- **app:live-option-predicate**: typed predicate $\mathsf{Live}_{m,t}(a)$ and its four failure modes. Source: §14.6.
- **app:source-cleanness-threshold**: the threshold $\theta_{\mathsf{SC}}$. Source: §14.9, §15.6.
- **app:effort-aggregator**: the typed effort function $\mathcal{E}(\omega, R)$. Source: §14.12.
- **app:decision-event-type**: typed event $\mathsf{Decide}_{m, t}(a; A)$. Source: §14.13.
- **app:mode-b-availability-table**: the function $\mathsf{ModeBAvail}_{m, t}(D)$ across object-domains $D$. Source: §14.14.
- **app:AP-component-types**: the ten typed component spaces of $AP_{m,t;a}$. Source: §14.18.
- **app:EIP-paradigm-mapping**: the typed mapping from paradigm to architectural object in $EIP_p$. Source: §14.19.
- **app:PP-component-types**: the typed components of $PP_i$. Source: §14.20.
- **app:FTP-component-types**: the typed translation-components of $FTP_f$. Source: §14.21.
- **app:six-conditions-predicates**: typed predicates $C_1, \ldots, C_6$ for free choice. Source: §15.1.
- **app:choice-process-stack**: typed sequence of choice-process states. Source: §15.2.
- **app:triadic-relations**: the typed dissociable relations $\mathsf{Own}, \mathsf{Resp}, \mathsf{Acc}$. Source: §15.4.
- **app:affect-criterion-predicate**: the typed $\mathsf{Affective}_{m, t}(x)$. Source: §16.1.
- **app:reflexive-PtCns**: extension of PtCns to the I's own contents. Source: §16.2.
- **app:affect-derivation-schema-types**: the typed five-tuple $\mathsf{AffDeriv}_a$. Source: §16.3.
- **app:profile-shape-disturbance-types**: typed states $\mathsf{Diss}, \mathsf{SevDep}, \mathsf{LH}, \mathsf{ChrBor}, \mathsf{Anh}$. Source: §16.11.
- **app:functional-structural-rho-pair**: the typed pair $(\rho^{\text{struct}}, \rho^{\text{func}})$ formalizing functional partition collapse. Source: §16.12.
- **app:recognition-lag-offset**: typed offset $\Delta t_{\text{recog}}$. Source: §16.14.
- **app:compound-affect-types**: typed $n$-tuple with convergent/conflicting/dominant dynamics. Source: §16.15.
- **app:religiously-charged-predicates**: $\mathsf{RC\text{-}Content}$ and $\mathsf{RC\text{-}Encounter}$. Source: §17.1.
- **app:frame-position-criteria**: typed $\mathsf{FramePos}_{m, t}(x)$ and the ultimate threshold $\theta_{\text{ult}}$. Source: §17.2.
- **app:numinous-signature-types**: typed $\mathsf{Tremendum}, \mathsf{Mysterium}, \mathsf{Fascinans}, \mathsf{Augustum}$. Source: §17.6.
- **app:four-forms-encounter**: typed sub-predicates Form 1–4 for religiously charged encounter. Source: §17.5.
- **app:mystical-union-typing**: the typed $\mathsf{Mystic Union}$ state with cogito-anchor preserved (parallel to §16.12). Source: §17.8.

The application-level items resolve to typed signatures whose final functional forms are calibrated by the application papers themselves, but the *signatures* should be added to a future foundation revision so downstream applications can build on uniform types.

---

## Appendix A. Theory-to-math index (alphabetical)

(Deferred to v0.2. The current §1–§13 entries are topically organized; the alphabetical theory-to-math index will be derived from them in v0.2.)

## Appendix B. Math-to-theory index (alphabetical)

(Deferred to v0.2.)

---

## Closing note

This v0.2 of the Rosetta stone extends the foundation-level treatment of v0.1 (sections 1–12, preserved unchanged) with a broad application-level mapping for all five application papers (sections 13–17, new in v0.2). Approximately 70 new entries cover temporal phenomenology (§13), agency (§14), free will (§15), differentiated affect (§16), and religiously charged experience (§17). The status field is now populated for every entry, with three new categories specific to application-level concepts (foundation-supported, foundation-deferred, signature-pending) sitting alongside the foundation-level categories (machine-verified, encoded, signature-declared, named-but-unformalized).

The open sub-questions registry (§18) now consolidates 47 items: the eighteen foundation-level items inherited from v0.1, plus 29 application-level signature-pending items surfaced by the v0.2 application sections. Each application-level item resolves to a typed signature whose final functional form is the application paper's calibration responsibility, but the *signatures* are foundation-level work that uniformizes the types across applications.

Three structural findings emerge from the v0.2 application-level treatment.

First, the *foundation-orphan dependency cascade* is now fully visible. Many application-level concepts (PtCns-reliant entries §15.5, §16.2, §16.7; PCE-reliant entries §16.8, §16.16; MSI-reliant entries §16.5, §17.2; Project-reliant entries §14.11, §16.8, §16.16) depend on the five foundation orphans (§12.3–§12.7: MSI, PtCns, PCE, Π, Project). Closing these five orphans would unblock a large fraction of the application-level signature-pending items.

Second, the *application-level profile-object family* (§14.18–§14.21: $AP_{m,t;a}$, $EIP_p$, $PP_i$, $FTP_f$) and the *application-level profile-shape disturbance family* (§16.11) are the architecture's two main classes of distinctive application-level structural objects. They are not built from the foundation's $P^\rho$ via simple restriction or composition; they have their own typed component spaces. Foundation-level work to support these families would be: uniform signatures for the component spaces, comparison apparatus parametric in those signatures.

Third, the *cogito-functional-collapse pattern* (§16.12 severe depression, §17.8 mystical union) is structurally the same mechanism with different content polarity. This is a structural finding visible only when both applications are mapped in the same Rosetta-stone framework. A foundation-level typed object $(\rho^{\text{struct}}, \rho^{\text{func}})$ would simultaneously support both applications and would be a clean foundation addition.

The natural next phase is v0.3 of this document, which would: (i) fold in the alphabetical bidirectional indexes (§A theory-to-math, §B math-to-theory) that v0.1 and v0.2 have deferred; (ii) commit the foundation to typed signatures for the highest-impact application-level signature-pending items (the foundation-orphan cluster MSI/PtCns/PCE/Π/Project, the $(\rho^{\text{struct}}, \rho^{\text{func}})$ pair, and the application-level profile-object family component spaces); (iii) consolidate cross-references across the application sections (currently each section is self-contained; v0.3 should cross-reference where applications share structural objects, e.g. between §16.12 and §17.8 for the functional-collapse pattern).

A v1.0 of this document would have every concept entered, every math object cross-referenced, every Lean declaration accounted for, every gap registered, and the alphabetical bidirectional indexes complete. v0.2 establishes broad Rosetta-stone coverage; v0.3 will be the final closure-and-indexing pass.

---

*End of Rosetta stone v0.2.*
