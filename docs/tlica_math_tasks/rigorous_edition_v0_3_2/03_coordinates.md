# TLICA Formal Apparatus, Rigorous Edition

## 03. The Three Coordinates

> **Status:** Draft v0.1.
> **Relationship to 00–02.** This file gives the three coordinates of the architecture — contact $\kappa$, truth-indistinguishability $\phi$, and identity-correlation $\rho$ — in their full rigorous form. The graph-theoretic machinery for $\rho$ is built in `02_graph_theory.md`; here it is recapitulated and joined to the other two. The verification-pathway construction underlying $\phi$ is detailed (Gap 2 resolution). The probe-space integral underlying the empirical-robustness component of $\phi$ is detailed (Gap 6 resolution).

## 3.1 Contact $\kappa$

The contact coordinate quantifies the strength of $m$'s causal-informational coupling to the not-$I$ at $t$. It admits two principal aspects: an *outbound* aspect summarizing $m$'s sensitivity to the not-$I$, and an *inbound* aspect summarizing how a particular content $x$ is contact-driven.

### 3.1.1 The outbound contact summary

The outbound contact summary of $m$ at $t$ is the function $\chi_m(t, \cdot) : \mathsf{N}_m \to [0, 1]$ of `0.9`. It is a function on the primal not-$I$, not on the asymptotic content domain. Where the apparatus needs a single scalar, it derives one by aggregation: typically a measure-theoretic integral against a fixed reference measure on $\mathsf{N}_m$, or a focus-weighted summary. The architecture does not commit to a canonical aggregation rule; it commits only to the existence of an outbound contact summary that is well-typed as a function on $\mathsf{N}_m$.

We write $\kappa^{\text{out}}_{m,t}$ for any chosen outbound summary admissible to a given application. The probe-measure construction (`0.15`) takes $\kappa^{\text{out}}_{m,t}$ as one of its inputs.

### 3.1.2 The inbound contact summary

For a content $x \in \mathsf{A}^m_t$ with $x \in \mathrm{dom}(\sigma^m_t)$ (i.e. a content with a determinate source set), the *inbound contact value* is

$$\kappa^{\text{in}}_{m,t}(x) := \sup\{\chi_m(t, n) : n \in \sigma^m_t(x)\}.$$

The supremum is well-defined because $\chi_m(t, n) \in [0, 1]$ and $[0, 1]$ is Dedekind-complete in $\mathbb{R}$. For $x \notin \mathrm{dom}(\sigma^m_t)$, $\kappa^{\text{in}}_{m,t}(x)$ is undefined.

### 3.1.3 Alternative inbound aggregations

The supremum is the architecture's default. Alternative aggregations — sum-capped-at-1, weighted-average against contact strengths, or any monotone aggregation on $[0, 1]$ — are admissible at the application level and do not require modification of the foundation apparatus. We use the supremum throughout the rigorous edition for definiteness.

### 3.1.4 Range and strict bounds

$\kappa^{\text{in}}_{m,t}(x) \in [0, 1]$. The architecture does not impose a strict upper bound $< 1$ on $\kappa^{\text{in}}_{m,t}(x)$: a content can in principle have a source $n$ with $\chi_m(t, n) = 1$. Whether this is empirically realizable in any modeling I is an application-level question.

## 3.2 Identity-correlation $\rho$, recapitulation

The mode-wise identity-correlation $\rho^{m,k}_t(x)$ and the scalar $\rho_{m,t}(x)$ are constructed in `02_graph_theory.md`. We recapitulate the key facts.

For each $m, t, k$ and each $x \in V^m_t$,

$$\rho^{m,k}_t(x) = \frac{C^{m,k}_t(x)}{1 + C^{m,k}_t(x)},$$

with $C^{m,k}_t(x)$ the max-flow value from $\hat\iota_m$ to $x$ in $G^{m,k}_t$. By graph well-formedness (`0.17`), $C^{m,k}_t(x) < +\infty$ for $x \ne \hat\iota_m$, hence $\rho^{m,k}_t(x) < 1$ (Lemma 2.4.2). The cogito takes value $1$ in every mode.

The scalar aggregation $\rho_{m,t}(x) = \sum_k a_k(m, t)\, \rho^{m,k}_t(x)$ with $a_k(m, t)$ produced by the open function $A^k_m$ lies in $[0, 1]$ and is strict ($< 1$) off the cogito (Proposition 2.5.1).

## 3.3 Truth-indistinguishability $\phi$, three-tier

The $\phi$ coordinate is defined in three tiers, corresponding to the three-tier ontology of the architecture.

### 3.3.1 Tier 1: items in $\mathsf{Int}$

$\phi$ is *not defined* on $\mathsf{Int}$. Intrinsic items carry the universality property *in re*; they are not in the domain of truth-indistinguishability. The architecture's reason for this is doctrinal: $\phi$ measures how well a content withstands probe-testing, and intrinsic items are the termini of verification, not their objects. Asking for $\phi$ of an intrinsic item is a category mistake at the foundation level.

### 3.3.2 Tier 2: the cogito

$\phi(\hat\iota_m, t) = 1 - \delta$ for every $t$ (axiom of `0.6`). This is the structural anchor: the cogito's $\phi$-value is independent of $\mathsf{Tools}^m_t$ and of any verification pathway. It is set by axiom because no probe-based construction could yield it (the cogito is not in $\mathsf{A}^m_t$ and therefore not in the domain of probes), and yet the architecture requires the cogito to be saturatedly truth-indistinguishable in the I's own operation.

### 3.3.3 Tier 3: items in $\mathsf{A}^m_t$

For $x \in \mathsf{A}^m_t \cap \mathrm{Verif}(m, t)$ — i.e. a Tier-3 item for which a verification pathway from $\mathsf{Tools}^m_t$ exists — the $\phi$-value is

$$\phi_{m,t}(x) := 1 - n_{m,t}(x)\delta - \epsilon_{m,t}(x).$$

For $x \in \mathsf{A}^m_t \setminus \mathrm{Verif}(m, t)$ — an item with no verification pathway — $\phi_{m,t}(x)$ is *undefined*. The architecture treats such items as carrying no $\phi$-value, distinct from carrying a low $\phi$-value.

### 3.3.4 The conditional depth $n_{m,t}(x)$

$n_{m,t}(x) \in \mathbb{N}_{\ge 1}$ is the minimum length of a verification pathway for $x$ (`0.14`). It captures the *conditional fragility* of $x$: a content reachable only via a long pathway from $\mathsf{Int}$ is more conditional on the surviving toolset and is correspondingly more removed from the saturation value $1 - \delta$.

The minimum is achieved because the lengths of pathways form a non-empty subset of $\mathbb{N}_{\ge 1}$, which is well-ordered.

### 3.3.5 The empirical-robustness deficit $\epsilon_{m,t}(x)$

The empirical-robustness deficit is the probe-space integral

$$\epsilon_{m,t}(x) := \int_{Q^m_t} (1 - q(x))\, d\mu^m_t(q) \in [0, 1] \subseteq \mathbb{R}.$$

The integrand $q \mapsto 1 - q(x)$ is $\mathcal{Q}^m_t$-measurable (the evaluation map $\mathrm{ev}_x : q \mapsto q(x)$ is measurable by the Gap 6 commitment in `0.15`, hence so is $1 - \mathrm{ev}_x$). Since $1 - q(x) \in [0, 1]$ for every $q$, the integral exists and lies in $[0, 1]$.

The integral aggregates the probe-yield deficit of $x$: a content that all probes assign yield close to $1$ has small $\epsilon_{m,t}(x)$; a content for which probes often yield low values has large $\epsilon_{m,t}(x)$.

### 3.3.6 The compatibility bounds

The architecture commits to two structural bounds on the $\phi$-value, both restated from the foundation axioms of `0.14`:

(a) *Admissibility.* For every verified content $x$, $\epsilon_{m,t}(x) + n_{m,t}(x)\delta \le 1$, ensuring $\phi_{m,t}(x) \in [0, 1 - \delta]$.

(b) *Tier-3 strictness.* For every verified content $x \in \mathsf{A}^m_t$ (i.e. non-cogito), $n_{m,t}(x)\delta + \epsilon_{m,t}(x) > \delta$, ensuring $\phi_{m,t}(x) < 1 - \delta$ strictly.

Both bounds are read in $\mathbb{K}$ via $\iota_\mathbb{R}$. Together they place $\phi_{m,t}(x) \in [0, 1 - \delta)$ for every non-cogito verified content, with $1 - \delta$ uniquely attained at the cogito. Proposition 3.3.7 below makes the cogito-uniqueness explicit.

### Proposition 3.3.7 (cogito as the unique supremum of $\phi$).
For every $m, t$ and every $x$ in the domain of $\phi_{m,t}$ at $t$, $\phi_{m,t}(x) \le 1 - \delta$. The bound is achieved iff $x = \hat\iota_m$.

### Proof.
For $x = \hat\iota_m$, $\phi(\hat\iota_m, t) = 1 - \delta$ by the cogito φ-axiom (§0.6). For $x \in \mathsf{A}^m_t \cap \mathrm{Verif}(m, t)$, two facts apply jointly:

(a) The *φ-admissibility axiom* (§0.14) gives $\epsilon_{m,t}(x) + n_{m,t}(x)\delta \le 1$ in $\mathbb{K}$, hence $\phi_{m,t}(x) = 1 - n_{m,t}(x)\delta - \epsilon_{m,t}(x) \ge 0$. Together with $n_{m,t}(x) \ge 1$ and $\epsilon_{m,t}(x) \ge 0$, this yields $\phi_{m,t}(x) \le 1 - \delta$.

(b) The *Tier-3 strictness axiom* (§0.14) gives $n_{m,t}(x)\delta + \epsilon_{m,t}(x) > \delta$ for every Tier-3 verified content. Therefore $\phi_{m,t}(x) = 1 - (n_{m,t}(x)\delta + \epsilon_{m,t}(x)) < 1 - \delta$ strictly.

In particular, the bound $1 - \delta$ is attained at $\hat\iota_m$ and strictly *not* attained at any $x \in \mathsf{A}^m_t \cap \mathrm{Verif}(m, t)$. Items in $\mathsf{Int}$ are outside the domain of $\phi$ (§3.3.1) and do not enter the bound. The cogito is therefore the unique supremum of $\phi$ over its domain. ∎

### Remark 3.3.8 (status of Tier-3 strictness).
The Tier-3 strictness axiom is the substantive cogito-uniqueness postulate at the $\phi$ level. It does *not* follow from the φ-admissibility bound alone (admissibility allows $n=1, \epsilon=0$, which would attain $1 - \delta$). The architecture's commitment is that no constructed Tier-3 content matches the cogito's structural saturation; the axiom enshrines this as the formal correlate of the Tier-2 / Tier-3 ontological distinction. Without the axiom, Proposition 3.3.7 would establish only $\phi \le 1 - \delta$ with equality possible at non-cogito items, weakening the architecture's cogito-anchoring claim. The axiom resolves the φ-tier-boundary question (newly surfaced as `oq:phi-tier-boundary` in v0.2; closed in v0.3).

### 3.3.8 Reading in $\mathbb{K}$

The right-hand side of the $\phi$-formula is computed in $\mathbb{K}$: $n_{m,t}(x) \cdot \delta$ is the $\mathbb{K}$-scalar product, $\epsilon_{m,t}(x)$ enters via the embedding $\iota_\mathbb{R}$ (cf. `0.4`), and $1$ is read in $\mathbb{K}$. Specifically:

$$\phi_{m,t}(x) = 1_{\mathbb{K}} - n_{m,t}(x) \cdot \delta - \iota_\mathbb{R}(\epsilon_{m,t}(x)).$$

We drop the explicit embedding $\iota_\mathbb{R}$ in displayed formulas where context makes it unambiguous.

## 3.4 The verification pathway

The verification pathway construction (`0.14`) is the load-bearing notion behind the conditional-depth function $n_{m,t}$. We expand it here.

### Definition 3.4.1 (verification pathway).
A *verification pathway for $x \in \mathsf{A}^m_t$ from $\mathsf{Tools}^m_t$* is a finite sequence $\pi = (\pi_0, \pi_1, \ldots, \pi_n)$ with $n \ge 1$ such that:

1. $\pi_0 \in \mathsf{Int}$ (intrinsic terminus).
2. $\pi_n = x$.
3. For each $i \in \{0, 1, \ldots, n - 1\}$, there exists $T \in \mathsf{Tools}^m_t$ with $(\pi_i, \pi_{i+1}) \in T$, and any side conditions of $T$ are satisfied at $(m, t)$.

The *length* of $\pi$ is $n$.

### 3.4.2 Existence

A verification pathway for $x$ may fail to exist for at least two reasons: (a) no tool in $\mathsf{Tools}^m_t$ has $x$ in its right-side range, or (b) the chain of tools leading back to an intrinsic content cannot be completed in finite steps under the side conditions.

The constructibility domain $\mathrm{Verif}(m, t) = \{x \in \mathsf{A}^m_t : \exists \pi \text{ a pathway for } x\}$ is the formal correlate of the *verifiable subset* of contents at $(m, t)$.

### 3.4.3 The minimum length

For $x \in \mathrm{Verif}(m, t)$, the set $\{\mathrm{length}(\pi) : \pi \text{ a pathway for } x\}$ is a non-empty subset of $\mathbb{N}_{\ge 1}$, well-ordered, with minimum $n_{m,t}(x)$. The choice of *which* pathway achieves the minimum is not used in the apparatus; only the value $n_{m,t}(x)$ is.

### 3.4.4 Tool restrictions and pathway sensitivity

If $\mathsf{Tools}^m_t \subseteq \mathsf{Tools}^m_{t'}$ for $t \le t'$ — i.e. the toolset grows — then $\mathrm{Verif}(m, t) \subseteq \mathrm{Verif}(m, t')$ and $n_{m,t}(x) \ge n_{m,t'}(x)$ for every $x$ in both domains. The architecture does not posit toolset monotonicity in $t$; tools can be lost as well as gained (e.g. forgotten or disabled). The relation between $\mathrm{Verif}(m, t)$ and $\mathrm{Verif}(m, t')$ in the non-monotone case is not determinate.

## 3.5 The probe-measure construction

The probe measure $\mu^m_t : \mathcal{Q}^m_t \to [0, 1]$ is produced by

$$\mu^m_t = \Lambda^\mu_m(\mathsf{Foc}^m_t, \kappa^{\text{out}}_{m,t}, (Q^m_t, \mathcal{Q}^m_t)).$$

The architecture commits to the signature of $\Lambda^\mu_m$ — it produces probability measures on the probe space, with continuous dependence on its inputs — but not to its specific functional form.

### 3.5.1 Why a measure rather than a finite probe set

The architecture's reasons for using a measure on a probe space rather than a finite enumeration of probes are threefold. First, generality: any operational probe scheme yields a (possibly infinite) family of probes, and integrating against a measure unifies the treatment of finite, countable, and continuous probe families. Second, focus-sensitivity: $\Lambda^\mu_m$ allows the measure to track the current focus and contact, so that probes relevant to the current operation of $m$ receive greater weight without changing the underlying probe space. Third, formal cleanliness: the integral $\int (1 - q(x)) d\mu^m_t$ is well-typed by the measurability commitment (Gap 6 resolution) and produces a clean real value in $[0, 1]$.

### 3.5.2 The discrete special case

If $Q^m_t$ is finite or countable, $\mathcal{Q}^m_t$ is the power-set, and $\mu^m_t = \sum_i \mu^m_t(\{q_i\}) \delta_{q_i}$, then

$$\epsilon_{m,t}(x) = \sum_i \mu^m_t(\{q_i\}) (1 - q_i(x)).$$

This is the discrete reading of the probe-space integral, often more transparent in applications.

## 3.6 The three coordinates as a triple

The architecture's structural commitment is that the three coordinates are *separately well-typed* and *not mutually reducible*. For each $x$ in the appropriate domain, the triple is

$$(\kappa^{\text{in}}_{m,t}(x),\ \phi_{m,t}(x),\ \rho_{m,t}(\pi^m_t(x))) \in [0, 1] \times \mathbb{K} \times [0, 1],$$

with the domain restrictions:

- $\kappa^{\text{in}}_{m,t}$ defined on $\mathrm{dom}(\sigma^m_t) \subseteq \mathsf{A}^m_t$ only.
- $\phi_{m,t}$ defined on $\mathrm{Verif}(m, t) \cup \{\hat\iota_m\}$ only, with the cogito value supplied by axiom.
- $\rho_{m,t}$ defined on $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$; lifted to $\mathsf{A}^m_t$ via the projection $\pi^m_t : \mathsf{A}^m_t \to \mathsf{H}^m_t$ from §1.7.4, so that $\rho_{m,t}(x) := \rho_{m,t}(\pi^m_t(x))$ when $x \in \mathsf{A}^m_t$.

The *common domain* of the three coordinates is

$$\mathrm{Dom}(m, t) := \mathrm{dom}(\sigma^m_t) \cap \mathrm{Verif}(m, t),$$

since both restrictions are subsets of $\mathsf{A}^m_t$ and the lifted $\rho$ is defined on all of $\mathsf{A}^m_t$ through $\pi^m_t$. The apparatus's central derived object — the full-coordinate identity-correlation profile $P^{\rho\phi\kappa}_{m,t}$, formalized in `04_profiles.md` — is the family of triples over $\mathrm{Dom}(m, t)$. The core's primary structural object, the *base* ρ-profile $P^\rho_{m,t}$, is the simpler family over $\mathsf{A}^m_t$ that uses only $\rho$ through $\pi^m_t$; the relationship between the two is set out in `04_profiles.md` §4.1.

### 3.6.1 Formal non-reducibility

The architecture's claim of *formal non-reducibility* (`prop:nonreducibility`) is that no two of $\kappa^{\text{in}}_{m,t}$, $\phi_{m,t}$, $\rho_{m,t}$ determine the third. The three propositions establishing this are stated and proven in `06_independence_lemmas.md`. They are not derivable from the signature-level commitments of `00_signature.md` alone — they require an existence argument supplying concrete pairs of items that agree on two coordinates and disagree on the third — and so are deferred until the dynamics is in place.

### 3.6.2 Dynamic entanglement

The non-reducibility is *formal*: it concerns the static coordinate values, not the dynamics. The architecture acknowledges that in the dynamic regime, the three coordinates are entangled through the update rule (`05_dynamics.md`) and the open functions $\Lambda^\mu_m$, $A^k_m$. Dynamic entanglement does not contradict formal non-reducibility; they are claims at different levels.

---

*End of 03_coordinates.md.*
