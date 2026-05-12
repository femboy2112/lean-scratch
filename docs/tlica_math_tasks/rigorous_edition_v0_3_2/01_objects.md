# TLICA Formal Apparatus, Rigorous Edition

## 01. Objects

> **Status:** Draft v0.1.
> **Relationship to 00.** Where `00_signature.md` declared the type signatures and minimal axioms required for the apparatus to be well-formed, this file unfolds the structural relations among the objects: how the cogito anchors the rest, how the intrinsic layer functions as the universal terminus for verification, how the primal not-I, substrate, and contact interface compose, and how the asymptotic content domain accumulates a history. Subsequent files build on the objects formalized here.

## 1.1 The cogito $\hat\iota_m$ as anchor

The cogito has three structural roles in the apparatus. First, it is the *identity anchor*: it is the unique element of $V^m_t$ which is the source for max-flow in every integration graph $G^{m,k}_t$, and the unique element on which $\rho$ takes the value $1$ (`def:rho`). Second, it is the *Tier-2 referent of $\phi$*: the cogito φ-axiom (`0.6`) fixes $\phi(\hat\iota_m, t) = 1 - \delta$ for every $t$, structurally and without reference to $\mathsf{Tools}^m_t$. Third, it is the *not-Tier-1 not-Tier-3* element: $\hat\iota_m \notin \mathsf{Int}$ and $\hat\iota_m \notin \mathsf{A}^m_t$ for every $m, t$ (`0.10` clause 2), which is what places the cogito in its own tier.

### Proposition 1.1 (cogito uniqueness within $m$).
For each $m \in \mathfrak{I}$, the cogito $\hat\iota_m$ is the unique element of $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$ (for every $t \in T_m$, every $k \in K$) on which both of the following hold:

1. $\phi(\hat\iota_m, t) = 1 - \delta$ by axiom, and the conditional-on-depth machinery of $\phi$ in §3.3 does not apply.
2. $\rho^{m,k}_t(\hat\iota_m) = 1$ identically by the max-flow normalization (see `def:rho` in `02_graph_theory.md`).

### Proof.
By the cogito φ-axiom, $\hat\iota_m$ satisfies clause 1 directly. By `def:rho`, the max-flow from $\hat\iota_m$ to itself is by convention infinite (or, equivalently, the normalization $C/(1 + C)$ is read as the limit $1$), so clause 2 holds. For any $x \in \mathsf{H}^m_t$ (i.e. $x \ne \hat\iota_m$), $\rho^{m,k}_t(x) < 1$ by the strict bound lemma proved in `02_graph_theory.md` (Lemma 2.4.2), so clause 2 fails. ∎

The cogito is the only modelling-I-internal element with both properties: $\rho = 1$ saturates the identity coordinate, and $\phi = 1 - \delta$ saturates truth-indistinguishability up to infinitesimal slack. This is the formal content of the architecture's claim that the cogito is the *necessary anchor* of identity-correlation.

## 1.2 The intrinsic layer $\mathsf{Int}$

The intrinsic layer is a domain of quantification populated by Tier-1 items. The defining structural feature, in the language of the rigorous edition, is that elements of $\mathsf{Int}$ serve as *universal-content termini* for verification pathways (cf. `0.14` clause 1).

We list three structural commitments that follow from how $\mathsf{Int}$ is used in the apparatus.

**(IL1) Non-overlap with the asymptotic content domain.** For every $m, t$, $\mathsf{Int} \cap \mathsf{A}^m_t = \emptyset$. This is `0.10` clause 1.

**(IL2) Non-overlap with the cogito.** $\hat\iota_m \notin \mathsf{Int}$ for every $m$. This follows from the Tier-2 placement of the cogito.

**(IL3) Universality.** Elements of $\mathsf{Int}$ are *in re* universal: the same domain serves every modeling I. There is no $m$-indexed intrinsic layer $\mathsf{Int}_m$. This is the architecture's stand on the locus of intrinsic universality.

The architecture is silent on whether $\mathsf{Int}$ admits internal structure beyond being a domain. For the apparatus to operate, no such structure is required. Application work may impose structure (e.g. by treating intrinsic items as logical or mathematical contents and inheriting their categorial structure from the relevant background theory), but this is not part of the core commitment.

## 1.3 The primal not-I $\mathsf{N}_m$

$\mathsf{N}_m$ is a set whose elements are *items not identical to $m$*. It plays three roles.

First, $\mathsf{N}_m$ is the *contact substrate*: $\chi_m(t, \cdot)$ is a function on $\mathsf{N}_m$, and the contact interface is how $m$ comes into causal-informational relation with what is not $m$.

Second, $\mathsf{N}_m$ is the *attribution domain*: $\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m)$ assigns subsets of $\mathsf{N}_m$ to contents that have a determinate source (`0.13`).

Third, $\mathsf{N}_m$ contains the *substrate-relevant subset* $\mathsf{E}_m \subseteq \mathsf{N}_m$, which is one component of the substrate triple (`0.8`).

The architecture does not commit at the foundation level to relations between $\mathsf{N}_m$ for distinct $m$. Inter-I considerations are addressed in core File 4 §9 and are out of scope for the foundation apparatus.

## 1.4 The substrate $\mathsf{S}_m = (\mathsf{B}_m, \mathsf{E}_m, \chi_m)$

The substrate is a triple. The set $\mathsf{B}_m$ of substrate states is left structurally minimal; the architecture does not commit to whether $\mathsf{B}_m$ is finite, infinite, discrete, or continuous. The substrate-relevant subset $\mathsf{E}_m \subseteq \mathsf{N}_m$ identifies which members of the primal not-I are substrate-relevant for $m$ (e.g. the body and its proximate environment, in the case where $m$ is a biological organism). The contact interface $\chi_m$ is the dynamical bridge from $\mathsf{E}_m$ to the rest of the apparatus.

Application work introduces a decomposition $\mathsf{B}_m = \mathsf{B}_m^{\text{cog}} \cup \mathsf{B}_m^{\text{som}}$ (cognitive and somatic substrate components) used to articulate pathway-order analysis in core File 3 §8.5. This decomposition is not part of the foundation apparatus and is not formalized here.

### 1.4.1 Capacity function

The substrate determines an *upper bound on focus mass* via the open function $\Gamma^M_m$:

$$M_m : T_m \to [0, \infty), \quad M_m(t) = \Gamma^M_m(\mathsf{S}_m, t).$$

The architecture commits to the existence and signature of $\Gamma^M_m$ but not to its functional form; the form is application-level and is constrained empirically rather than axiomatically. The only constraint at the foundation level is that $M_m$ is nonnegative.

## 1.5 The contact interface $\chi_m$

The contact interface (declared in `0.9`) is a function $\chi_m : T_m \times \mathsf{N}_m \to [0, 1]$ with each section $\chi_m(t, \cdot)$ measurable. Two structural points are worth making explicit.

**(C1) Range $[0, 1]$, not $\mathbb{K}$.** Contact takes real-valued strength, not $\mathbb{K}$-valued. This is intentional: the $\phi$ coordinate's $\mathbb{K}$-valuation is what enables the cogito's $1 - \delta$ value, but no analogous infinitesimal structure is required for contact. The architecture's commitment is that contact admits no exact-$1$ value in any modeling I's actual operation, but this is enforced by the empirical interpretation, not by an infinitesimal in the codomain.

**(C2) Measurability rationale.** The measurability of $\chi_m(t, \cdot)$ is required so that $\chi_m$ can be aggregated into mode-vector inputs (notably $\kappa^{\text{out}}_{m,t}$ in `0.15`) and so that $\Lambda^\mu_m$ can use contact-derived data in its construction of the probe measure.

## 1.6 The asymptotic content domain $\mathsf{A}^m_t$

$\mathsf{A}^m_t$ is the *current* asymptotic content domain of $m$ at $t$ — the set of contents in play, in some appropriate sense, at $t$. The family $(\mathsf{A}^m_t)_{t \in T_m}$ is the *asymptotic content history*.

### 1.6.1 Non-monotonicity

We do not require $s \le t \Rightarrow \mathsf{A}^m_s \subseteq \mathsf{A}^m_t$. The architecture treats $\mathsf{A}^m_t$ as the current domain, not as a cumulative history. Cumulation lives at the level of the time-stamped token domain $\widetilde{\mathsf{H}}^m_t$ (and after quotient, at the level of $\mathsf{H}^m_t$).

### 1.6.2 The phenomenally available subset

$\mathsf{A}^{+,m}_t = \{x \in \mathsf{A}^m_t : A_{m,t}(x) = 1\}$ is the subset of currently asymptotic contents that are *phenomenally available* — operationally, contents the I can take up in further processing at $t$. The phenomenal-availability predicate $A_{m,t}$ is treated as a status indicator. No coordinate of the architecture is computed from $A_{m,t}$; rather, $A_{m,t}$ restricts the domain on which the focus allocation lives.

The architecture leaves open whether $A_{m,t}$ admits axioms governing its evolution across $t$ or its interaction with $\mathsf{Foc}^m_t$. This is recorded as open question `oq:phenomenology-status-axioms` (Math Ledger, Part 8) and is left for application-level commitment.

## 1.7 Time-stamped tokens and the history domain

The time-stamped token domain (`0.12`) is the set of pairs

$$\widetilde{\mathsf{H}}^m_t = \{(s, x) : s \in T_m, \, s \le_m t, \, x \in \mathsf{A}^m_s\}.$$

The persistence equivalence relation $\sim^m_H$ identifies tokens that the I tracks as the same persisting content over time. The persistence coherence axiom (`0.12`) ensures that the equivalence relation does not change retroactively as $t$ advances.

### 1.7.1 The quotient $\mathsf{H}^m_t$

The *history domain* of $m$ at $t$ is the quotient

$$\mathsf{H}^m_t := \widetilde{\mathsf{H}}^m_t / \sim^m_H.$$

Elements of $\mathsf{H}^m_t$ are *persistence-equivalence classes of tokens*, which we may call *items* when the context permits. We write $[(s, x)]$ for the class of $(s, x)$ in $\mathsf{H}^m_t$.

### 1.7.2 Monotonic growth

For $s \le t$, the inclusion $\widetilde{\mathsf{H}}^m_s \hookrightarrow \widetilde{\mathsf{H}}^m_t$ descends to a well-defined function

$$j^m_{s,t} : \mathsf{H}^m_s \to \mathsf{H}^m_t, \quad [(u, x)]_s \mapsto [(u, x)]_t,$$

which is well-typed by the persistence-coherence axiom. The function $j^m_{s,t}$ is injective: if $[(u, x)]_s \ne [(u', x')]_s$ in $\mathsf{H}^m_s$, then $(u, x) \not\sim^m_H (u', x')$ as tokens, and this non-equivalence is preserved by coherence at $t$. The history domain is therefore monotone in $t$ along the canonical inclusion $j^m_{s,t}$, even though the asymptotic content domain $\mathsf{A}^m_t$ is not monotone in $t$.

### Proposition 1.2 (well-definedness of $\mathsf{H}^m_t$).
$\sim^m_H$ is an equivalence relation on $\widetilde{\mathsf{H}}^m_t$, and the quotient $\mathsf{H}^m_t$ is a well-defined set. The functions $j^m_{s,t}$ for $s \le t$ form a directed system, satisfying $j^m_{t,t} = \mathrm{id}_{\mathsf{H}^m_t}$ and $j^m_{u,t} = j^m_{s,t} \circ j^m_{u,s}$ for $u \le s \le t$.

### Proof.
$\sim^m_H$ is posited as an equivalence (`0.12`). The quotient is the standard quotient of a set by an equivalence. The identity and composition properties of $j^m_{s,t}$ follow from the persistence-coherence axiom applied at each pair of time points. ∎

The *vertex set* $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$ of the integration graph (`0.17`) is therefore an honest set, not a token-stratified informal collection. Every reference in the apparatus to "the same item across time" should be read as a reference to a class in $\mathsf{H}^m_t$.

### 1.7.3 The content-to-history projection $\pi^m_t$

The integration graph operates on vertices in $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$, while the asymptotic content domain $\mathsf{A}^m_t$ holds currently-active contents as raw items, not as persistence classes. The coordinate $\rho$ is defined on $V^m_t$; the coordinates $\phi$ and $\kappa$ are defined on $\mathsf{A}^m_t$. Composing the three coordinates requires a typing bridge between these two domains. We define it now and use it throughout the apparatus.

### Definition 1.7.4 (content-to-history projection).

For each $m, t$, the *content-to-history projection* is the function

$$\pi^m_t : \mathsf{A}^m_t \to \mathsf{H}^m_t, \quad \pi^m_t(x) := [(t, x)],$$

where $[(t, x)]$ is the persistence-equivalence class of the time-stamped token $(t, x) \in \widetilde{\mathsf{H}}^m_t$.

The projection is well-defined: $(t, x) \in \widetilde{\mathsf{H}}^m_t$ holds for any $x \in \mathsf{A}^m_t$ by the definition of the time-stamped token domain at $t$ (`0.12`), and the equivalence class is taken in $\mathsf{H}^m_t = \widetilde{\mathsf{H}}^m_t / \sim^m_H$. The projection is in general neither injective (two distinct contents at $t$ may be persistence-equivalent to a common earlier token) nor surjective (a class in $\mathsf{H}^m_t$ may have no current-time representative in $\mathsf{A}^m_t$).

### 1.7.5 Convention: $\rho$ evaluated on contents

Throughout the rigorous edition, when $\rho^{m,k}_t$ or the scalar $\rho_{m,t}$ is evaluated on a content $x \in \mathsf{A}^m_t$, the evaluation is by convention

$$\rho^{m,k}_t(x) := \rho^{m,k}_t(\pi^m_t(x)), \quad \rho_{m,t}(x) := \rho_{m,t}(\pi^m_t(x)),$$

with the right-hand side defined on $V^m_t$ as in `02_graph_theory.md`. This convention closes the typing gap between $\rho$'s definition on $V^m_t$ and the use of $\rho$ in profile constructions and coordinate triples on $\mathsf{A}^m_t$.

For the cogito, by convention $\pi^m_t(\hat\iota_m) := \hat\iota_m$ if $\hat\iota_m$ is treated as a member of $\mathsf{A}^m_t$ for the purposes of this evaluation; since the cogito is not in $\mathsf{A}^m_t$ at the foundation level (`0.10` clause 2), the convention is vacuous on the cogito and the natural reading $\rho^{m,k}_t(\hat\iota_m) := 1$ from `02_graph_theory.md` applies directly.

## 1.8 The source map $\sigma^m_t$

The source map $\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m)$ (`0.13`) is a partial function assigning to a content $x$ a subset of the primal not-I (its *source set*). The attribution domain $\mathrm{dom}(\sigma^m_t)$ is the subset of $\mathsf{A}^m_t$ for which $\sigma^m_t$ is defined.

Two structural points.

**(S1) Outside-perspective.** $\sigma^m_t$ is outside-perspective in the sense of core File 3 §6.3: it represents the actual source-attribution structure of $m$'s contents, not the modeling I's introspective access to that structure. A modeling I that misattributes a content has a definite $\sigma$-value that differs from its introspective report. The architecture treats this gap as built into the apparatus.

**(S2) Lifting to $\mathsf{H}^m_t$.** $\sigma^m_t$ is stated on $\mathsf{A}^m_t$, not on $\mathsf{H}^m_t$. Lifting along the projection requires a coherence condition: if $(s, x) \sim^m_H (s', x')$ are token-equivalent, the apparatus does not in general require $\sigma^m_s(x) = \sigma^m_{s'}(x')$. Source attribution can shift across the life of a persisting item without violating persistence. This is the formal correlate of *re-attribution* without *re-identification*.

## 1.9 The verification toolset $\mathsf{Tools}^m_t$

The toolset (`0.14`) is a set whose elements are tools. A *tool* is, at the foundation level, a partial inferential relation $T \subseteq \mathsf{A}^m_t \times \mathsf{A}^m_t$ that may carry side conditions. The architecture does not formalize side conditions further. They are domain-restrictive: a tool may be applicable only when certain auxiliary contents are available, certain substrate states obtain, or certain focus configurations hold. These are application-level constraints.

### 1.9.1 Closure properties

The toolset is not assumed to be closed under composition, sequencing, or any other inferential operation. The verification-pathway construction (`0.14`) handles composition explicitly by allowing arbitrary finite sequences whose successive transitions are justified by toolset members.

### 1.9.2 Universal terminus condition

Verification pathways are required to start at a member of $\mathsf{Int}$ (`0.14` clause 1). The architecture's reason for this is doctrinal: without an intrinsic terminus, $\phi$ would be regressive. The intrinsic terminus is what cuts the regress.

This is formalized as a requirement on pathways, not as a closure condition on $\mathsf{Tools}^m_t$. The toolset need not contain a tool whose left side is an intrinsic content; rather, *some* finite sequence of tool applications must connect an intrinsic content to $x$.

## 1.10 The probe space $(Q^m_t, \mathcal{Q}^m_t, \mu^m_t)$

The probe space (`0.15`) is a measurable space of probes carrying a probability measure. Three structural points.

**(P1) Probes are content-evaluations.** Each $q \in Q^m_t$ is a Borel-measurable function $q : \mathsf{A}^m_t \to [0, 1]$. The value $q(x)$ is the probe's *yield* for $x$ — an operational reading of how well $x$ survives the probe. The architecture does not commit to a specific interpretation of "probe" beyond this: probes encode tests, counterexample searches, alternative-explanation checks, and the like.

**(P2) Measurability of evaluation.** The σ-algebra $\mathcal{Q}^m_t$ is chosen so that $\mathrm{ev}_x : Q^m_t \to [0, 1]$, $\mathrm{ev}_x(q) = q(x)$, is measurable for every $x \in \mathsf{A}^m_t$. This is the commitment made in resolution of Gap 6 (Rigor Report). Without it, the integral defining $\epsilon_{m,t}(x)$ in `03_coordinates.md` is not well-defined.

**(P3) Probe measure as derived object.** The probe measure $\mu^m_t$ is produced by the open function $\Lambda^\mu_m$ from focus, contact, and the probe space. It is not a free parameter. The architecture's foundation-level commitment is to $\Lambda^\mu_m$'s signature (probability measures on $(Q^m_t, \mathcal{Q}^m_t)$, dependence on $\mathsf{Foc}^m_t$ and $\kappa^{\text{out}}_{m,t}$) but not to its functional form. This is open question `oq:probe-measure`.

## 1.11 Focus $\mathsf{Foc}^m_t$

We adopted the weighted-set convention in `0.16`: $\mathsf{Foc}^m_t : \mathsf{A}^{+,m}_t \to [0, \infty)$ with finite support. We add three structural points.

### 1.11.1 The contact-driven / self-directed decomposition

The decomposition $\mathsf{Foc}^m_t = \mathsf{Foc}^m_t[\text{cd}] + \mathsf{Foc}^m_t[\text{sd}]$ is addition of weight functions; both summands are nonnegative weight functions on $\mathsf{A}^{+,m}_t$, and the support of the sum is the union of supports.

The two-phase shift in core File 3 §8.2 is a claim about which decomposition is dominant in which mode of $m$'s operation. It is dynamic — a property of how $\mathsf{Foc}^m_t$ evolves in $t$ — not a coordinate of the apparatus.

### 1.11.2 The capacity bound

$\|\mathsf{Foc}^m_t\|_1 \le M_m(t)$. Two interpretations exist in the core.

(a) The *mass-bound* interpretation: total focus weight is bounded by capacity.

(b) The *cardinality-bound* interpretation: the number of items in focus is bounded by capacity.

The rigorous edition adopts (a), with (b) recoverable: if every weight is bounded below by some threshold $w_{\min} > 0$, then $|\mathrm{supp}(\mathsf{Foc}^m_t)| \le M_m(t) / w_{\min}$. The mass-bound is the more general statement.

### 1.11.3 Update event support

The update rule (`05_dynamics.md`) applies pointwise at items in focus. The support of $\mathsf{Foc}^m_t$ is therefore the set of items that can be touched by the update at $t$. Items outside the support of focus do not receive updates at $t$; they are dynamically inert at that instant.

## 1.12 The model instance $M_m$

The architecture treats a *model instance of $m$* as a long tuple assembling all of the foregoing into a single structure. We collect the components for reference.

$$M_m := \big(\mathfrak{I}, m, T_m, \mathbb{K}, \mathsf{Int}, \hat\iota_m, \mathsf{N}_m, \mathsf{S}_m, \chi_m, (\mathsf{A}^m_t)_t, (A_{m,t})_t, (\sim^m_H), (\sigma^m_t)_t, (\mathsf{Tools}^m_t)_t, (Q^m_t, \mathcal{Q}^m_t, \mu^m_t)_t, (\mathsf{Foc}^m_t)_t, (G^{m,k}_t)_{t,k}, \Gamma^M_m, \Lambda^\mu_m, A^k_m, B^k_m, A^T_m\big).$$

The first block ($\mathfrak{I}$ through $\hat\iota_m$) is *fixed* across time. The middle block (everything between $\mathsf{N}_m$ and $\mathsf{Foc}^m_t$) is *time-indexed* and varies with $t \in T_m$. The last block ($\Gamma^M_m$ through $A^T_m$) consists of *open functions* — operators of declared signature but unspecified form. The architecture is parametrized over admissible specifications of the open functions.

### 1.12.1 Inside vs. outside tuples

The architecture's inside/outside distinction (core File 3 §6.3) lifts to a distinction at the level of the tuple. The *inside tuple* is the I-internal projection: it contains the cogito, the contents that are phenomenally available, the focus, the toolset, and the probe space, but not the source map or the substrate (these are outside-perspective). The *outside tuple* is the full model instance.

The architecture's claim is that a third-person model of $m$ requires the outside tuple, while a first-person operation of $m$ has access only to the inside tuple. This is a structural claim, formalized here as a projection from the model instance to its inside-projection. The projection is the formal correlate of the architecture's *inside-outside asymmetry*.

---

*End of 01_objects.md.*
