# TLICA Rosetta Stone (v0.1)

> **Purpose.** A 1-to-1 mapping between the structural relationships of the Two-Layer Identity-Correlation Architecture (TLICA, core v5.3.3) and their pure-math representations. Every entry pairs a theoretical concept (with citation into the core or application papers) with its math representation (with citation into the v0.3.2 rigorous edition and the round-3 Lean project), and records the gap status of the correspondence.

> **Scope of v0.1.** Foundation-level concepts only. Application-level concepts (the agency, free will, affect, temporal phenomenology, and religious experience papers' application-specific structures) are deferred to v0.2 of this document. The Rosetta stone is intended as the project's integrating reference: every fragmented rigor effort to date — the rigorous edition, math ledger, profile-comparison working paper, prerogative formalization sketch, Lean project — is consolidated here under a single bidirectional structure.

> **Status field meanings.** *Machine-verified*: encoded in Lean and the build is green at v4.11.0. *Encoded*: encoded in Lean, build pending or yellow. *Signature-declared*: type signature in rigorous edition; functional form may be open. *Named-but-unformalized*: named at foundation, no formal apparatus yet committed; foundation explicitly defers to application. *Theory-only*: theoretical concept with no math representation yet. *Math-only*: math object with no clear theoretical referent (rare in this architecture). *Open*: under active development in a working paper.

> **How to read this document.** Each entry has the structure: theory description with citation, math representation with citation, Lean declaration (if any), status, optional sub-questions and cross-references. Entries are grouped thematically. Two appendices (§A and §B) provide alphabetical bidirectional indexes.

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

## 13. Application-level concepts (preview; v0.2 of this document)

This section is a placeholder. The full Rosetta stone entries for the application papers' application-specific concepts — including the agency paper's ten-component attribution profile $AP_{m,t;a}$, the empirical interpretation profile $EIP_p$, the prediction profile $PP_i$, the framework translation profile $FTP_f$, the affect paper's five profile-shape disturbances, Pattern A / Pattern B threshold dynamics, the compositional schema, the temporal phenomenology paper's integration-content shift apparatus, the religious experience paper's structural-transformation apparatus, and the cross-cutting concepts of source-status, ownership-integration, decision-event structure, order-asymmetric Mode B availability, the source-compromise continuum, and the lived-I-network projection-apparatus — are deferred to v0.2 of this document.

A first-cut entry for orientation:

### 13.1 Attribution profile $AP_{m,t;a}$ (preview)

- **Theory.** A ten-component profile encoding the structural conditions for responsibility-attribution for an action $a$ by modeling I $m$ at time $t$. Cf. `agency_paper_v0_3_0_patched.md` §9.
- **Math.** Application-level structure: a tuple $(V, O, S, C, B, D, K, M, R, T)$ where each component has its own type. Not yet given foundation-level signature.
- **Lean.** Not encoded.
- **Status.** Application-level concept; no foundation lift yet.
- **Cross-reference.** Application-level objects of this kind are the targets of the v0.2 of the profile-comparison working paper's recommendation that the foundation supply $P^\rho$-comparison apparatus the application objects can be built on.

---

## 14. Open sub-questions registry

The following list consolidates open sub-questions surfaced by entries in this document. Each is a candidate target for substantive math work. Items marked **gap** are from the v0.1 Math Rigor Report; items marked **oq** are open questions from §7.2 of the rigorous edition or from the working papers.

- **Gap 11**: $\mathsf{A}^m_t$ dynamics axioms. Source: §12.10.
- **Gap 12**: profile-comparison metric. Source: §7.4. Status: in active development (working paper v0.2).
- **oq:persistence-construction**: functional form of $\sim^m_H$. Source: §2.3.
- **oq:probe-measure**: which $\nu^m_t$ for Wasserstein. Source: §11.1 cross-ref to §7.4.
- **oq:inside-projection-specification**: cross-I content correspondence. Source: §1.1 cross-ref, application papers.
- **oq:profile-comparison-norm**: $L^p$ choice. Source: §7.4 cross-ref to working paper §11.
- **oq:profile-comparison-domain-form**: shared vs union. Source: §7.4.
- **oq:profile-comparison-persistence-refinement**: content vs persistence-class level. Source: §7.4.
- **oq:wasserstein-measure**: Source: §7.4 cross-ref to working paper.
- **oq:cross-i-correspondence**: Source: §7.4.
- **oq:profile-comparison-triangle-restriction**: domain-stable window structure. Source: working paper v0.2 §11.
- **oq:topological-invariant-vector**: composite invariant. Source: working paper v0.2 §11.
- **oq:persistent-homology-foundation**: foundation vs application. Source: working paper v0.2 §11.
- **MSI signature**: foundation-level type signature for the maximally-self-defined I. Source: §12.3.
- **PtCns signature**: foundation-level type signature for the prerogative of consistency. Source: §12.4.
- **PCE signature**: foundation-level type signature for the prerogative of continued existence. Source: §12.5.
- **Π signature**: foundation-level type signature for the preservation-ranking. Source: §12.6.
- **Project map signature**: foundation-level type signature for future-state projection. Source: §12.7.

---

## Appendix A. Theory-to-math index (alphabetical)

(Deferred to v0.2. The current §1–§13 entries are topically organized; the alphabetical theory-to-math index will be derived from them in v0.2.)

## Appendix B. Math-to-theory index (alphabetical)

(Deferred to v0.2.)

---

## Closing note

This v0.1 of the Rosetta stone documents the foundation-level theory-math correspondence in TLICA. Forty-plus concepts are entered with their cross-references; the gap status is recorded for each; the Lean encoding column shows which correspondences are machine-verified at v4.11.0. The orphan section (§12) catalogues the ten foundation-level concepts that have theoretical statement but no math yet, each with a candidate path for future formalization. The open-sub-questions registry (§14) consolidates the work targets.

v0.2 will extend the Rosetta stone to the application papers, building parallel sections for each of the five papers' application-specific structures. The application-level mapping is a substantially larger task than the foundation-level mapping because the application papers introduce many more named objects (attribution profile, EIP, PP, FTP, the affect paper's profile-shape disturbances and compositional schema, the temporal phenomenology paper's integration-content shift apparatus, etc.). The Rosetta stone v0.2 will be the integrating reference for the project's correspondence work.

A v0.3 might fold the alphabetical bidirectional indexes (§A, §B). A v1.0 would have every concept entered, every math object cross-referenced, every Lean declaration accounted for, every gap registered.

---

*End of Rosetta stone v0.1.*
