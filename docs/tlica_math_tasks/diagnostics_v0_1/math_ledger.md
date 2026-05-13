# TLICA Math Ledger — v0.1

> **Status:** v0.1, first formalization pass against TLICA v5.3.3 foundation.
> **Scope:** Core files 1–5 (`sources/core/*.md`).
> **Source of truth:** `project_manifest.yml` + current core files.
> **Counterpart documents:** `outputs/math_rigor_report.md`, `outputs/formalization/00_signature.md`.

## How to read this ledger

Each entry has the shape laid out by the math-formalization skill: identifier, kind, type signature where applicable, statement, source, dependencies, current rigor level, and an enumeration of the gaps blocking advancement. Rigor levels run from `prose-only` (informal natural-language statement) up to `formal-ready` (proof-assistant ingestible after surface translation). Where the source text has been faithful but informally stated, the ledger does not change the content; it lifts the surface to fully rigorous form.

The ledger is organized by the architectural strata: ground objects first, then the cogito and its anchoring, then the asymptotic field, then the three coordinates, then derived structure (profiles, the lived I, shells), then dynamics (focus, imprinting, osmotic mechanism), and finally the global model instance.

---

## Part I. Ground domain and primitives

### prim:Int — The intrinsic layer

- **Kind:** primitive
- **Signature:** $\mathsf{Int}$ is an unspecified set-like collection of Tier-1 items; carries the universality property in re.
- **Statement:** The architecture posits a domain $\mathsf{Int}$ of intrinsic items whose ontological status is in re universality. Members are not assigned φ values.
- **Source:** `sources/core/1_foundations.md` §2.1–2.2; `sources/core/3_formal_apparatus.md` §6.3 (tuple `(\mathsf{Int}, \ldots)`).
- **Dependencies:** none.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Is $\mathsf{Int}$ a set in ZFC, a class, or a category? The architecture has not committed.
  - Are there operations on $\mathsf{Int}$ used elsewhere (the cogito instantiates $\forall x: x = x$ over $\mathsf{Int}$-style universal content)? If so, $\mathsf{Int}$ needs structural commitments at least to a quantification language.

### prim:N — The primal not-I

- **Kind:** primitive (posited domain)
- **Signature:** $\mathsf{N}_m$ is a set of items not identical to $m$.
- **Statement:** For each modeling I $m$, there is a posited domain $\mathsf{N}_m$ providing the contact interface and a source of source-attribution.
- **Source:** `sources/core/1_foundations.md` (primal not-I as posit); `sources/core/3_formal_apparatus.md` §6.3.
- **Dependencies:** the modeling-I index.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Is $\mathsf{N}_m$ identical across I's at fixed time, or genuinely I-relative? The architecture says other I's are themselves elements of any $\mathsf{N}_m$; consistency of cross-references between $\mathsf{N}_m$ and $\mathsf{N}_{m'}$ is not formally treated.
  - Cardinality: large, presumably uncountable. Should it be treated as a measurable space for κ-purposes?

### prim:T — The time index

- **Kind:** primitive
- **Signature:** $T_m$ is a totally ordered set with order $\le_m$; usually treated as a subset of $\mathbb{R}$.
- **Statement:** Each modeling I $m$ has a time index $T_m$ with a relation $\le_m$ used in §6.2's time-stamped construction.
- **Source:** `sources/core/3_formal_apparatus.md` §6.2 (`s \leq_m t`) and §6.3.
- **Dependencies:** the modeling-I index.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Is $T_m$ discrete, dense, or continuous? Operations defined later (focus updates at events $e = (s, u, v, k, \alpha, \beta)$ in §8.4) suggest at least Dedekind-complete and likely continuous or hybrid.
  - The notation $s^-, s^+$ in the update rule (§8.4) presupposes a one-sided-limit structure; this is not stated as a formal property of $T_m$.

### prim:B,S — Substrate domain and substrate object

- **Kind:** primitive
- **Signature:** $\mathsf{B}_m$ is a domain of substrate states; $\mathsf{S}_m = (\mathsf{B}_m, \mathsf{E}_m, \chi_m)$ with $\mathsf{E}_m \subseteq \mathsf{N}_m$.
- **Statement:** Each modeling I has a substrate object packaging its body-like state, the substrate-relevant subset of the primal not-I, and the contact interface.
- **Source:** `sources/core/3_formal_apparatus.md` §8.1.
- **Dependencies:** `prim:N`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Internal structure of $\mathsf{B}_m$ unspecified. Later sections (§8.5) refer to $\mathsf{S}_m^{\text{cog}}$ and $\mathsf{S}_m^{\text{som}}$ as substructures; the architecture leaves their precise relationship to $\mathsf{B}_m$ open.

### prim:chi — The contact interface

- **Kind:** primitive operation
- **Signature:** $\chi_m : T_m \times \mathsf{N}_m \to [0, 1]$ (or some chosen ordered codomain). Used as $\kappa_{m,t}(n) := \chi_m(t, n)$.
- **Statement:** $\chi_m$ encodes the I's contact level with each not-I item at each time.
- **Source:** `sources/core/3_formal_apparatus.md` §7.1.
- **Dependencies:** `prim:N`, `prim:T`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - The codomain is never stated. The text uses $\le$ and $\sup$, which require an ordered structure; $[0, 1]$ is the natural reading but should be stated.
  - Measurability of $\chi_m(t, \cdot)$ is needed if probe integrals downstream reference contact.

### prim:K — The value field for φ

- **Kind:** primitive
- **Signature:** $\mathbb{K}$ is an ordered field extending $\mathbb{R}$ with a fixed positive infinitesimal $\delta$ satisfying $0 < \delta < r$ for every positive real $r$.
- **Statement:** All φ values, and the structurally fixed quantity $1 - \delta$, live in $\mathbb{K}$. The hyperreals are one valid choice; any equivalent construction is acceptable.
- **Source:** `sources/core/1_foundations.md` §2.3.
- **Dependencies:** none.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - The architecture says "any equivalent construction"; what is the equivalence relation? Two ordered field extensions of $\mathbb{R}$ with a fixed positive infinitesimal need not be isomorphic; what features of $\mathbb{K}$ are load-bearing?
  - Comparison structure: is $\le$ in $\mathbb{K}$ total? Are operations like the integral in §7.3 well-defined when $\mu^m_t$ produces $\mathbb{K}$-valued integrands? If $\mu^m_t$ is $\mathbb{R}$-valued and the integrand $1 - q(x)$ is $\mathbb{R}$-valued, the integral is $\mathbb{R}$-valued and we need a coherent embedding into $\mathbb{K}$.

---

## Part II. The cogito and identity anchoring

### obj:iota — The cogito

- **Kind:** primitive (distinguished element)
- **Signature:** $\hat\iota_m$ is the distinguished perspectival self-element of $m$; not in $\mathsf{N}_m$.
- **Statement:** For each modeling I $m$, the cogito $\hat\iota_m$ is the reflexive self-identification. It is Tier 2; its φ value is structurally fixed at $1 - \delta$.
- **Source:** `sources/core/1_foundations.md` §2.4; `sources/core/3_formal_apparatus.md` §5.1, §7.3 (tier 2 clause).
- **Dependencies:** `prim:K`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - The status of $\hat\iota_m$ relative to the asymptotic content domain $\mathsf{A}^m_t$ is implicit. §5.1 puts the cogito as a node of integration graphs; §6.1 says $\mathsf{A}^m_t$ is non-intrinsic, and the cogito is Tier 2. Cleanest typing: $\hat\iota_m$ is not in $\mathsf{A}^m_t$ but is the distinguished anchor of graphs whose other nodes come from $\mathsf{H}^m_t$.

### ax:cogito-phi — The cogito phi axiom

- **Kind:** axiom
- **Signature:** $\phi(\hat\iota_m) = 1 - \delta$.
- **Statement:** For every modeling I $m$, $\phi(\hat\iota_m) = 1 - \delta$ structurally. This holds for any cogniting being and is not I-relative.
- **Source:** `sources/core/3_formal_apparatus.md` §7.3, Tier 2 clause.
- **Dependencies:** `obj:iota`, `prim:K`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Independent of time? The text uses no time index. If $\phi(\hat\iota_m, t) = 1 - \delta$ for all $t$, that should be stated as a universal closure $\forall m \forall t : \phi(\hat\iota_m, t) = 1 - \delta$.

### ax:rho-anchoring — Identity-correlation anchoring

- **Kind:** axiom (definitional anchoring)
- **Signature:** $\rho^{m,k}_t(\hat\iota_m) = 1$ for every mode $k$ and time $t$; for $x \ne \hat\iota_m$, $\rho^{m,k}_t(x) < 1$.
- **Statement:** $\rho$ at the cogito is the unique maximum (=1) by anchoring convention. Every non-core node has strictly smaller $\rho$.
- **Source:** `sources/core/3_formal_apparatus.md` §5.1, §7.2.
- **Dependencies:** `obj:iota`.
- **Rigor level:** `well-defined` (when paired with `def:rho`, see §7.2 the construction makes this automatic).
- **Open questions:**
  - The strict inequality requires showing $\rho^{m,k}_t(x) < 1$ from the definition $\rho^{m,k}_t(x) = C / (1 + C)$. Since $C \ge 0$ is finite for finite graphs but unbounded for infinite graphs, the strict bound needs the finite-flow assumption stated. See `lem:rho-strict-bound` below.

---

## Part III. The asymptotic field

### def:A — The asymptotic content domain

- **Kind:** definition
- **Signature:** For each $(m, t)$, $\mathsf{A}^m_t$ is a set of non-intrinsic items. As a family: $(\mathsf{A}^m_t)_{t \in T_m}$.
- **Statement:** $\mathsf{A}^m_t$ contains the non-intrinsic items in $m$'s field at $t$, including conscious and unconscious contents. Disjoint from $\mathsf{Int}$.
- **Source:** `sources/core/3_formal_apparatus.md` §6.1.
- **Dependencies:** `prim:Int`, `prim:T`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - What axioms govern $(\mathsf{A}^m_t)_{t}$ across $t$? Persistence (§6.2) defines an equivalence relation; the underlying token construction $\widetilde{\mathsf{H}}^m_t$ presupposes that distinct contents at distinct times can be cleanly distinguished as tokens. This presumes a token-type structure on contents.
  - Relationship to $\mathsf{N}_m$: the source map $\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m)$ connects them, but $\mathsf{A}^m_t$ and $\mathsf{N}_m$ are not directly related as sets. This is correct (the I's contents are not identical with not-I items) but should be stated explicitly.

### def:A-plus — The phenomenally-available subset

- **Kind:** definition
- **Signature:** $\mathsf{A}^{+,m}_t := \{x \in \mathsf{A}^m_t : A_{m,t}(x) = 1\}$.
- **Statement:** The phenomenally-available subset of $\mathsf{A}^m_t$; subset induced by the status predicate $A_{m,t}$.
- **Source:** `sources/core/3_formal_apparatus.md` §6.1.
- **Dependencies:** `def:A`, `def:A-status`.
- **Rigor level:** `well-defined`.
- **Open questions:** none structural.

### def:A-status — The phenomenal-availability predicate

- **Kind:** definition (status predicate)
- **Signature:** $A_{m,t} : \mathsf{A}^m_t \to \{0, 1\}$.
- **Statement:** $A_{m,t}(x) = 1$ iff $x$ is phenomenally available to $m$ at $t$. The architecture treats $A$ as a status predicate, not as a fourth coordinate parallel to $\kappa, \phi, \rho$.
- **Source:** `sources/core/3_formal_apparatus.md` §6.1.
- **Dependencies:** `def:A`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - No axioms relate $A_{m,t}$ to dynamics. It is treated as exogenous to the formal apparatus, with phenomenological transitions described in prose (repression, activation, source-articulation). Whether transition rules are formalizable is an open question for application work (per the differentiated-affect paper).

### def:H-tilde, def:H — Time-stamped tokens and persistence

- **Kind:** definition
- **Signature:** $\widetilde{\mathsf{H}}^m_t := \{(s, x) : s \le_m t \land x \in \mathsf{A}^m_s\}$; $\mathsf{H}^m_t := \widetilde{\mathsf{H}}^m_t / \sim^m_H$.
- **Statement:** Time-stamped tokens of past and current contents, quotiented by a posited persistence equivalence.
- **Source:** `sources/core/3_formal_apparatus.md` §6.2.
- **Dependencies:** `def:A`, `prim:T`, `prim:persistence`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - The persistence relation `prim:persistence` is declared a posit, but no axioms govern it. Reflexivity, symmetry, transitivity should be stated; cross-time identity criteria are application-level.

### prim:persistence — Persistence equivalence relation

- **Kind:** primitive (posited relation)
- **Signature:** $\sim^m_H \subseteq \widetilde{\mathsf{H}}^m_t \times \widetilde{\mathsf{H}}^m_t$; equivalence.
- **Statement:** An equivalence relation on time-stamped tokens encoding when two tokens are tokens of the same persistent content.
- **Source:** `sources/core/3_formal_apparatus.md` §6.2 (posit clause).
- **Dependencies:** `def:H-tilde`.
- **Rigor level:** `prose-only` for axiomatic content; `signature-declared` for the relation itself.
- **Open questions:**
  - Stable across $t$? The relation should be coherent in the sense that restricting to $\widetilde{\mathsf{H}}^m_s$ for $s \le t$ yields the same equivalence on tokens that exist at $s$. This is a natural condition the text leaves unstated.

### def:sigma — The source map

- **Kind:** definition (partial function)
- **Signature:** $\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m)$ (partial; undefined for contents lacking a source-attribution).
- **Statement:** For content $x \in \mathsf{A}^m_t$ with source defined, $\sigma^m_t(x)$ is the set of not-I items to which $x$ source-attributes.
- **Source:** `sources/core/3_formal_apparatus.md` §7.1 (used in $\kappa^{\mathrm{out}}$); §8.5 (used in pathway orders).
- **Dependencies:** `def:A`, `prim:N`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - The domain of definition is implicit. Made explicit: $\mathrm{dom}(\sigma^m_t) \subseteq \mathsf{A}^m_t$ is the set of contents whose source is attributable from the I's current toolset (this connects to φ-pathway constructibility but is conceptually distinct).

---

## Part IV. The three coordinates

### def:kappa — Contact coordinate

- **Kind:** definition
- **Signature:**
  - Not-I level: $\kappa_{m,t} : \mathsf{N}_m \to [0, 1]$ with $\kappa_{m,t}(n) := \chi_m(t, n)$.
  - Content level: $\kappa^{\mathrm{out}}_{m,t} : \mathsf{A}^m_t \to [0, 1]$ with $\kappa^{\mathrm{out}}_{m,t}(x) := \sup\{\kappa_{m,t}(n) : n \in \sigma^m_t(x)\}$ when $\sigma^m_t(x)$ defined and nonempty, else 0 (unless an internal-contact convention is introduced).
- **Statement:** Contact at the not-I level is the χ value; content-level contact is the supremum over the source set.
- **Source:** `sources/core/3_formal_apparatus.md` §7.1.
- **Dependencies:** `prim:chi`, `def:sigma`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\sup$ over what? If $\sigma^m_t(x)$ is finite, $\max$ suffices; if it can be infinite, the sup needs the codomain to be Dedekind-complete (which $[0, 1]$ is). State this explicitly.
  - The "internal-contact convention" is mentioned but not formalized. Open: under what conditions is internal contact admitted, and what is its definition?

### def:rho — Identity-correlation by max-flow

- **Kind:** definition
- **Signature:**
  - Graph: $G^{m,k}_t = (V^m_t, E^{m,k}_t, w^{m,k}_t)$ with $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$ and $w^{m,k}_t : E^{m,k}_t \to [0, 1]$.
  - Integration capacity: $C^{m,k}_t(x) := \mathrm{MaxFlow}_{G^{m,k}_t}(\hat\iota_m, x)$.
  - Identity-correlation: $\rho^{m,k}_t(x) := C^{m,k}_t(x) / (1 + C^{m,k}_t(x))$ for $x \ne \hat\iota_m$; $\rho^{m,k}_t(\hat\iota_m) = 1$.
  - Scalar projection: $\rho_{m,t}(x) := \sum_{k \in K} a_k \rho^{m,k}_t(x)$ with $a_k > 0$, $\sum_k a_k = 1$.
- **Statement:** A mode-indexed family of weighted directed graphs rooted at the cogito. The mode-specific ρ is the squashed max-flow; the scalar ρ is a convex combination.
- **Source:** `sources/core/3_formal_apparatus.md` §7.2.
- **Dependencies:** `obj:iota`, `def:H`, `prim:K` (only if $\rho$ is to be compared with $\phi$ directly), `ax:rho-anchoring`.
- **Rigor level:** `signature-declared`; `well-defined` modulo open questions below.
- **Open questions:**
  - Max-flow on infinite networks. $V^m_t$ may be countably infinite; max-flow on infinite directed networks requires a definite generalization (Ford–Fulkerson-style on locally finite graphs, or the Aharoni–Berger theorem for arbitrary infinite networks). The architecture does not commit. See `oq:maxflow-infinite` below.
  - Edge structure $E^{m,k}_t$: not formally constrained beyond being a relation on $V^m_t \times V^m_t$. Should there be a source-out constraint (no edges out of the sink)? Acyclicity? The text does not say.
  - The scalar projection uses a convex combination but does not stipulate whether $a_k$ depend on $(m, t)$. If they do, the combination is itself a function $a : K \to (0, 1)$ at $(m, t)$.

### lem:rho-strict-bound — ρ < 1 for non-core nodes

- **Kind:** lemma (claimed property)
- **Signature:** For all $m, t, k, x$: $x \ne \hat\iota_m \implies \rho^{m,k}_t(x) < 1$, provided $C^{m,k}_t(x) < \infty$.
- **Statement:** The squashing $C / (1 + C)$ keeps $\rho$ strictly below 1 whenever the max-flow is finite.
- **Source:** `sources/core/3_formal_apparatus.md` §7.2 ("guarantees $0 \le \rho^{m,k}_t(x) < 1$").
- **Dependencies:** `def:rho`.
- **Rigor level:** `proven` for finite max-flow; `open` for infinite max-flow.
- **Open questions:**
  - On infinite networks, $C$ could be $+\infty$. The text's bound $\rho < 1$ fails or needs a $\bar{\mathbb{R}}$ extension (with $+\infty / (1 + \infty) := 1$). Either the architecture restricts to finite flows or it provides a separate clause. See `oq:maxflow-infinite`.

### def:phi — Truth-indistinguishability, three-tier

- **Kind:** definition (case-split function)
- **Signature:** $\phi$ is a partial $\mathbb{K}$-valued function on tiered contents:
  - Tier 1 (intrinsic items): not in domain.
  - Tier 2 (the cogito): $\phi(\hat\iota_m) = 1 - \delta$.
  - Tier 3 (asymptotic contents with constructible verification pathway): $\phi_{m,t}(x) = 1 - n_{m,t}(x)\delta - \epsilon_{m,t}(x)$ with the bound $n_{m,t}(x)\delta + \epsilon_{m,t}(x) \le 1$.
- **Statement:** φ takes structural values at Tier 2; I-relative, toolset-dependent values at Tier 3 with constructible pathway; is undefined otherwise.
- **Source:** `sources/core/1_foundations.md` §2.3 (formula); `sources/core/3_formal_apparatus.md` §7.3.
- **Dependencies:** `prim:K`, `obj:iota`, `def:n`, `def:epsilon`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Domain of Tier-3 φ: precisely the contents with constructible verification pathway from $\mathsf{Tools}^m_t$. This subset has no explicit name; suggest `domphi(m, t)`.
  - Type of $n_{m,t}(x)$: stated as $\ge 1$ (positive integer or extended integer). Should be $\mathbb{N}_{\ge 1}$.
  - Range checks: with $n \ge 1$ and $\epsilon \ge 0$, $\phi \le 1 - \delta < 1$ when $\delta > 0$, so Tier 3 sits strictly below Tier 2 by construction. The cogito enjoys the unique upper bound at $1 - \delta$. This deserves a stated lemma `lem:phi-tier-strict`.

### def:n — Conditional depth (φ-component)

- **Kind:** definition
- **Signature:** $n_{m,t} : \mathrm{domphi}(m, t) \to \mathbb{N}_{\ge 1}$.
- **Statement:** $n_{m,t}(x)$ counts the indexed conditional depth from universal reasoning to content $x$ given the I's current verification toolset. Toolset-dependent and decomposition-dependent.
- **Source:** `sources/core/1_foundations.md` §2.3; `sources/core/3_formal_apparatus.md` §7.3.
- **Dependencies:** `def:Tools`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - "Counts steps along the verification pathway constructible from $\mathsf{Tools}^m_t$": the pathway is a structured object, but the architecture has not formalized what a verification pathway is as a mathematical object. Suggested formalization: a finite sequence in a derivation system whose primitives are tools. See `oq:pathway-object`.
  - "Different decompositions yield different counts": is $n$ a function or a relation? If different decompositions are simultaneously available, the architecture is committing to a canonical-decomposition selection. State the selection rule.

### def:epsilon — Empirical robustness component

- **Kind:** definition
- **Signature:** $\epsilon_{m,t} : \mathrm{domphi}(m, t) \to [0, 1 - n_{m,t}(x)\delta] \subseteq \mathbb{K}$ given by the probe integral $\epsilon_{m,t}(x) = \int_{Q^m_t} (1 - q(x)) d\mu^m_t(q)$.
- **Statement:** ε measures empirical robustness uncertainty within the conditional depth, given by an integral over probes $q \in Q^m_t$ against the measure $\mu^m_t$.
- **Source:** `sources/core/3_formal_apparatus.md` §7.3.
- **Dependencies:** `def:Q`, `def:mu`, `def:n`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\mu^m_t$ is called a "probability weight"; needs measurable-space structure on $Q^m_t$ and σ-additivity. State the measurable-space commitment.
  - Each probe $q$ is treated as a function $q : \mathsf{A}^m_t \to [0, 1]$ (since $1 - q(x)$ is integrated). State this signature.
  - Range: the integral lives in $\mathbb{R}$ (assuming $\mu^m_t$ is a probability measure and $q$ values are real in $[0,1]$). The bound $\epsilon + n\delta \le 1$ in $\mathbb{K}$ then requires a coherent embedding $\mathbb{R} \hookrightarrow \mathbb{K}$ and reading the inequality in $\mathbb{K}$. The architecture has this implicitly; making it explicit removes friction.

### def:Q — Probe set

- **Kind:** primitive (per $m, t$)
- **Signature:** $Q^m_t$ is a set of probes; each $q \in Q^m_t$ is a map $\mathsf{A}^m_t \to [0, 1]$.
- **Source:** `sources/core/3_formal_apparatus.md` §7.3, §8.3.
- **Dependencies:** `def:A`.
- **Rigor level:** `signature-declared`.
- **Open questions:** as for `def:epsilon`.

### def:mu — Probe measure

- **Kind:** definition (derived object)
- **Signature:** $\mu^m_t$ is a probability measure on $Q^m_t$; $\mu^m_t = \Lambda^\mu_m(\mathsf{Foc}^m_t, \kappa^{\mathrm{out}}_{m,t}, Q^m_t)$.
- **Statement:** The probe measure is generated by current focus and content-level contact via the (unspecified) function $\Lambda^\mu_m$.
- **Source:** `sources/core/3_formal_apparatus.md` §7.3, §8.3.
- **Dependencies:** `def:Q`, `def:Foc`, `def:kappa`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\Lambda^\mu_m$ is one of the architecture's declared "open functions" — the architecture commits to the dependency but not the specific shape. The rigor lift must preserve this openness: $\Lambda^\mu_m$ has a fixed signature; its instantiation is application-level.

### prop:nonreducibility — Formal non-reducibility of $(\kappa, \phi, \rho)$

- **Kind:** proposition (variation argument)
- **Statement:** With graphs, truth-profiles, and $\chi_m$ held appropriately, varying one input changes one coordinate without changing the others. (See three bullet items in §7.4.)
- **Source:** `sources/core/3_formal_apparatus.md` §7.4.
- **Dependencies:** `def:kappa`, `def:phi`, `def:rho`.
- **Rigor level:** `prose-only`.
- **Open questions:**
  - Make the variation argument precise: for each of the three claims, state the held-fixed-vs-varied parameters as a tuple, and prove the conclusion. This is a small but real proof obligation, see `prop:nonreducibility-formal` in the formalization document.

---

## Part V. Derived structure

### def:P — Identity-correlation profile

- **Kind:** definition
- **Signature:** $P_{m,t} = \{(x, \rho_{m,t}(x)) : x \in \mathsf{A}^m_t\}$; equivalently a function $\rho_{m,t} : \mathsf{A}^m_t \to [0, 1)$.
- **Statement:** The profile is the primary structural object for an I at a time. Vector variant: $P^{\mathrm{vec}}_{m,t}$ retaining mode-specific structure.
- **Source:** `sources/core/3_formal_apparatus.md` §7.6.
- **Dependencies:** `def:rho`, `def:A`.
- **Rigor level:** `well-defined`.
- **Open questions:**
  - The codomain $[0, 1)$ depends on `lem:rho-strict-bound`. With infinite max-flow unresolved, the codomain should be $[0, 1]$ until that is fixed.

### def:lived-I — The lived I network

- **Kind:** derived
- **Signature:** $\mathsf{L}^m_t := \{x \in \mathsf{A}^m_t : \rho_{m,t}(x) > 0\}$ (support of $P_{m,t}$ on the non-core nodes).
- **Source:** `sources/core/3_formal_apparatus.md` §7.6.
- **Dependencies:** `def:P`.
- **Rigor level:** `well-defined`.
- **Open questions:** none structural.

### def:shells — Shells as threshold bands

- **Kind:** derived (coarse-graining)
- **Signature:** Given thresholds $0 = r_0 < r_1 < \ldots < r_n = 1$, shells are $\mathsf{Sh}^i_{m,t} := \{x \in \mathsf{A}^m_t : \rho_{m,t}(x) \in [r_{i-1}, r_i)\}$.
- **Source:** `sources/core/3_formal_apparatus.md` §5; §7.6.
- **Dependencies:** `def:P`.
- **Rigor level:** `well-defined`.
- **Open questions:** the shell labels in §5 (first shell, second shell, ...) are exemplary, not formal. The formalization is a parametrized family.

### def:taxonomy — Conscious/unconscious four-class taxonomy

- **Kind:** derived (case decomposition)
- **Signature:** For $x \in \mathsf{A}^m_t$, class is determined by the joint $(A_{m,t}(x), \phi_{m,t}(x))$:
  - $A = 1$ and $\phi$ defined: conscious-clear.
  - $A = 1$ and $\phi$ undefined or low: conscious-fuzzy.
  - $A = 0$ and pathway constructible: latent / retrievable.
  - $A = 0$ and pathway not constructible: unconscious-operative.
- **Source:** `sources/core/3_formal_apparatus.md` §6.1.
- **Dependencies:** `def:A-status`, `def:phi`.
- **Rigor level:** `well-defined`.
- **Open questions:**
  - "Low φ" needs a threshold or a structural test. The text's natural reading is "φ defined but small"; the application papers may need a specific threshold.

### def:D — Pathway order

- **Kind:** definition (typological feature, not a coordinate)
- **Signature:** $D_{m,t} : \mathrm{dom}(\sigma^m_t) \to \{1, 2, 3\}$.
- **Statement:** $D_{m,t}(x)$ is the dominant substrate-mediation pathway for $x$.
- **Source:** `sources/core/3_formal_apparatus.md` §8.5.
- **Dependencies:** `def:sigma`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - "Dominant" is informal in §8.5.2 ("orders are dominant pathways, not exclusive categories"). Either keep $D$ as a categorical function (one chosen winner) and accept information loss, or refine to a mixture vector $D^{\mathrm{vec}}_{m,t} \in \Delta^2$ (the 2-simplex). The current architecture takes the categorical reading.

### def:Fz — Fuzziness

- **Kind:** definition (phenomenological feature)
- **Signature:** $\mathrm{Fz}_{m,t} : \mathsf{A}^m_t \to [0, 1]$ (informally; a measure of lack of explicit propositional structure / source-resolution).
- **Source:** `sources/core/3_formal_apparatus.md` §8.5.4.
- **Dependencies:** `def:A`.
- **Rigor level:** `prose-only`.
- **Open questions:**
  - No measurement procedure or operational definition is given in the core. The text says Fz "characterizes how undefined-or-low φ feels for high-κ contents when source-resolution is poor." This is a heuristic placeholder. Either drop Fz from the formal apparatus (keep it as application-level vocabulary) or commit to an operational definition.

### prop:fuzziness-tendency — D-Fz tendency

- **Kind:** prediction (tendency claim)
- **Signature:** $D_{m,t}(x) \uparrow \leadsto \mathbb{E}[\mathrm{Fz}_{m,t}(x)] \uparrow$.
- **Source:** `sources/core/3_formal_apparatus.md` §8.5.4.
- **Dependencies:** `def:D`, `def:Fz`.
- **Rigor level:** `prose-only`.
- **Open questions:**
  - "$\leadsto$" is the expectation-arrow. The architecture flags this as tendency, not strict law; formalization requires a probabilistic structure (over what space?) and a monotonicity statement. Without `def:Fz` upgraded, this proposition has no formal content.

---

## Part VI. Substrate, focus, dynamics

### def:M-capacity — Substrate-bound focus capacity

- **Kind:** definition
- **Signature:** $M_m : T_m \to \mathbb{N} \cup \{\infty\}$, $M_m(t) = \Gamma^M_m(\mathsf{S}_m, t)$.
- **Source:** `sources/core/3_formal_apparatus.md` §8.1.
- **Dependencies:** `prim:B,S`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\Gamma^M_m$ is declared open. The signature is committed; the value is not.

### def:Foc — Focus allocation

- **Kind:** definition (constraint)
- **Signature:** $\mathsf{Foc}^m_t \subseteq \mathsf{A}^{+,m}_t$ (or a multiset / weighted subset?) with $|\mathsf{Foc}^m_t| \le M_m(t)$.
- **Source:** `sources/core/3_formal_apparatus.md` §8.1–8.2.
- **Dependencies:** `def:A-plus`, `def:M-capacity`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - Is $\mathsf{Foc}^m_t$ a set, a multiset, or a probability distribution? The "two-phase shift" decomposes $\mathsf{Foc}^m_t = \mathsf{Foc}^m_t[\text{contact-driven}] \oplus \mathsf{Foc}^m_t[\text{self-directed}]$; $\oplus$ is a notational choice. If sets, $\oplus$ is disjoint union; if weighted, $\oplus$ is sum-of-weights.

### def:Tools — Verification toolset

- **Kind:** primitive (per $m, t$)
- **Signature:** $\mathsf{Tools}^m_t$ is a set of verification tools.
- **Source:** `sources/core/3_formal_apparatus.md` §6.3.
- **Dependencies:** `prim:T`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - What is a tool, structurally? Used in the conditional depth $n$, in the pathway constructibility predicate (§6.1, §7.3), in tool imprinting (§8.6). A tool should at least be a partial inferential operator over contents.

### def:update — Imprinting update event and rule

- **Kind:** definition (dynamical rule)
- **Signature:** Event $e = (s, u, v, k, \alpha, \beta)$ with $s \in T_m$, $u, v \in V^m_t$, $k \in K$, $\alpha, \beta \in [0, 1]$ determined by $\alpha = \mathcal{A}^k_m(u, v, \mathsf{Foc}^m_s, \lambda^m_s(v))$, $\beta = \mathcal{B}^k_m(u, v, \mathsf{Foc}^m_s, \lambda^m_s(v))$, where $\lambda^m_s(v) = \sup\{\kappa_{m,s}(n) : n \in \sigma^m_s(v)\}$ when defined.
  - Update rule: $w^{m,k}_{s^+}(u, v) = \Pi_{[0,1]}\big((1 - \beta) w^{m,k}_{s^-}(u, v) + \alpha (1 - w^{m,k}_{s^-}(u, v))\big)$.
- **Source:** `sources/core/3_formal_apparatus.md` §8.4.
- **Dependencies:** `def:rho`, `def:Foc`, `def:kappa`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $s^-, s^+$ presuppose a one-sided-limit structure on $T_m$. If $T_m$ is discrete, $s^-$ is the predecessor and $s^+ = s$; if dense, define cleanly.
  - $\Pi_{[0,1]}$ is the projection $\max(0, \min(1, \cdot))$; state this explicitly.
  - Iterative behavior: under what conditions does the dynamics converge, oscillate, or diverge? The architecture leaves this to application work.

### def:osmotic — Osmotic imprinting

- **Kind:** definition (mechanism)
- **Statement:** Substrate-level pattern formation via repeated ambient co-occurrence; always-operating; transverse to the four kinds of imprinting.
- **Source:** `sources/core/3_formal_apparatus.md` §8.7.
- **Dependencies:** `prim:B,S`, `def:Foc`, `def:update`.
- **Rigor level:** `prose-only`.
- **Open questions:**
  - The mechanism is informal: "the mechanism-online status does not entail a measurable update at every interval." Formalize as a (possibly continuous) update channel with a bandwidth parameter $b^{\mathrm{osm}}_m(t) \ge 0$ that may vanish. The architecture explicitly disclaims rate-specification, so the formalization should keep $b^{\mathrm{osm}}$ unspecified (open function) while committing to its signature.

---

## Part VII. The model instance

### obj:Model — Outside-perspective model instance

- **Kind:** structural tuple
- **Signature:** $\mathcal{M}_m = (\mathsf{Int}, \hat\iota_m, \mathsf{N}_m, T_m, \mathsf{B}_m, \mathsf{S}_m, \Gamma^M_m, M_m, \chi_m, (\mathsf{A}^m_t)_t, (A_{m,t})_t, \sim^m_H, (\sigma^m_t)_t, (G^{m,k}_t)_{t,k}, (\mathsf{Foc}^m_t)_t, (\mu^m_t)_t, \mathsf{Tools}^m_t, \phi_m, \rho_m, \kappa_m)$.
- **Source:** `sources/core/3_formal_apparatus.md` §6.3.
- **Dependencies:** all of the above.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\mathsf{Tools}^m_t$ in the tuple but the family-over-$t$ subscript is omitted. Should read $(\mathsf{Tools}^m_t)_t$.
  - $\phi_m, \rho_m, \kappa_m$ in the tuple are themselves functions of $t$; the time-indexing should be made explicit.

### obj:Inside, obj:Outside — Inside-perspective vs outside-only

- **Kind:** structural tuples (projections of $\mathcal{M}_m$)
- **Signature:** Inside: $\mathsf{Inside}^m_t = (\mathsf{A}^{+,m}_t, \mathsf{Foc}^m_t, Q^m_t, \mathsf{Tools}^m_t, \ldots)$. Outside: $\mathsf{Outside}^m = (\mathsf{N}_m, \mathsf{B}_m, \mathsf{S}_m, \chi_m, \sigma^m_t, \tau^m_t, \mathsf{O}_m, \Gamma^M_m)$.
- **Source:** `sources/core/3_formal_apparatus.md` §6.3.
- **Dependencies:** `obj:Model`.
- **Rigor level:** `signature-declared`.
- **Open questions:**
  - $\tau^m_t$ and $\mathsf{O}_m$ appear in the Outside tuple but are not defined earlier in File 3 in the extracted material. They are likely the temporal stamp and the "other I's" set; the formalization document should pull their definitions into the same place.

---

## Part VIII. Cross-cutting open questions

These are formalization-level questions whose resolution is needed across multiple entries above. They are listed once here and referenced by id.

### oq:maxflow-infinite — Max-flow on possibly infinite networks

The integration graph $G^{m,k}_t$ may have countably infinite vertex set since $\mathsf{H}^m_t$ accumulates over time. Standard max-flow theory requires a definite generalization on infinite networks. Two principled options: restrict to locally finite, finite-flow graphs (operationally reasonable for any actual cognitive system at finite time); or adopt the Aharoni–Berger max-flow / min-cut theorem for arbitrary infinite networks. Either choice is consistent with the architecture; the choice should be made explicit.

### oq:pathway-object — Verification pathway as a formal object

The conditional depth $n_{m,t}(x)$ counts steps along the verification pathway constructible from $\mathsf{Tools}^m_t$. The architecture treats pathways informally. The simplest formal model: a verification pathway for $x$ from a toolset $\mathcal{T}$ is a finite sequence of inferential steps in a derivation system whose primitive operations are members of $\mathcal{T}$, terminating at universal-content matching $x$. Constructibility is then derivability in that system. This is one workable formalization; the architecture should commit.

### oq:phenomenology-status-axioms — Axioms for $A_{m,t}$

The phenomenal-availability predicate is currently exogenous. Two questions: are there closure or coherence axioms relating $A$ across $t$ (for example: $A_{m,t}(x) = 1$ requires $x \in \mathsf{A}^m_t$ — trivially true given the type; more substantively: how does $A$ transition under focus shifts)? Are there foundational axioms making $A_{m,t}$ depend on $\mathsf{Foc}^m_t$ (the architecture's prose suggests phenomenal availability is broader than focus, e.g. peripheral phenomenal availability)?

### oq:K-features-required — Which features of $\mathbb{K}$ are load-bearing

The architecture says "any equivalent construction will do." For formalization we need to identify exactly which features of $\mathbb{K}$ the apparatus depends on: existence of an embedded $\mathbb{R}$, existence of a fixed positive infinitesimal $\delta$ smaller than every positive real, totally ordered field structure, comparison with integrals over real-valued probe functions, and so on. With these features named, the architecture becomes parametrized over the class of fields satisfying them.

### oq:rho-modes-K — Mode index $K$

$K$ is described as "finite or countable" set of integration modes. The scalar projection uses $a_k > 0$, $\sum_k a_k = 1$ — convergence is automatic for finite $K$, needs convergence for countably infinite $K$. State the convention.

### oq:profile-comparison — Profile-to-profile comparison

The architecture says profiles, not isolated values, are the unit of structural analysis, and asserts "profile-to-profile comparison is what the architecture's predictions actually license." But no formal comparison metric is given. Candidate: a Wasserstein-like distance on the pushforward measure of $\rho_{m,t}$ on $\mathsf{A}^m_t$ relative to a fixed reference measure. Open: does the architecture commit to a comparison metric, or leave that to application papers?

### oq:probe-measure — Measurable structure on $Q^m_t$

The probe integral in §7.3 presupposes a σ-algebra on $Q^m_t$ and that each probe $q$ is measurable as a function $\mathsf{A}^m_t \to [0, 1]$. State the measurable structure.

---

## Summary statistics

By rigor level (counting `def:`, `prim:`, `obj:`, `ax:`, `lem:`, `prop:` entries; `oq:` cross-cutting questions excluded):

- `prose-only`: 4 (`def:Fz`, `def:osmotic`, `prop:nonreducibility`, `prop:fuzziness-tendency`).
- `signature-declared`: 19.
- `well-defined`: 5 (`ax:rho-anchoring`, `def:A-plus`, `def:P`, `def:lived-I`, `def:shells`, `def:taxonomy`).
- `proven` (conditional): 1 (`lem:rho-strict-bound`, only for finite max-flow).
- `formal-ready`: 0.

By load-bearing weight (subjective ranking of impact on derived material):

1. `def:rho` (everything downstream depends on max-flow being well-defined).
2. `def:phi`, `def:n`, `def:epsilon` (Tier-3 φ structure; load-bearing for verification-pathway machinery and the lossy-compression principle).
3. `def:update` (governs all dynamics).
4. `prim:K` (governs the comparison structure used everywhere φ appears).
5. `def:sigma` (used by κ, by D, by all source-attribution claims).
6. `prop:nonreducibility` (architectural commitment, currently prose-only).

Resolving the seven `oq:` items would advance the bulk of the apparatus from `signature-declared` to `well-defined`. None of them require theoretical change; they require theoretical *commitment* to specific structural choices already implicit in the text.
