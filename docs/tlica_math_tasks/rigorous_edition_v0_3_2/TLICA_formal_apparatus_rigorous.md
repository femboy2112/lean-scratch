<!-- Assembled manuscript. Source files listed below. -->


<!-- SOURCE: outputs/formalization/00_signature.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 00. Signature

> **Status:** Draft v0.1.
> **Relationship to the core:** This file is one stratum of the rigorous edition of the TLICA formal apparatus. It does not replace the foundation in `sources/core/1_foundations.md` through `sources/core/5_translations_open_problems_conclusion.md`; it lifts the surface of that material to a level at which type signatures and well-definedness are explicit. No theoretical commitment of v5.3.3 is altered. Where the rigor lift requires a choice between formally equivalent or near-equivalent options, the choice and its rationale are stated.

## 0.1 Modeling-I indexing

There is a non-empty class $\mathfrak{I}$ of *modeling I's*. We use $m, m'$ as variables ranging over $\mathfrak{I}$. The architecture is articulated from the perspective of a fixed $m$; cross-perspective objects (other I's) are addressed in `sources/core/4_derived_concepts_and_predictions.md` §9 and are not in the scope of this signature file.

## 0.2 Time

For each $m \in \mathfrak{I}$ there is a totally ordered set $(T_m, \le_m)$, the *time index* of $m$. We adopt the *continuous-time regime* as the canonical formalization: $T_m$ is a Dedekind-complete dense linear order. The reader who prefers a discrete-time regime ($T_m$ order-isomorphic to a subset of $\mathbb{Z}$) may interpret $s^-$ and $s^+$ as predecessor and successor; the formal apparatus is equally serviceable in either regime, and downstream consequences are unchanged.

Where pre- and post-event values of time-indexed quantities are needed (see the update rule in `05_dynamics.md`), we adopt the *right-continuous convention*: for any time-indexed family $(f_t)_{t \in T_m}$ taking values in a separable metric space, $f_{s^-} := \lim_{u \uparrow s} f_u$ when the left-limit exists, and $f_{s^+} := f_s$.

## 0.3 The value field $\mathbb{K}$

The architecture's $\phi$ coordinate takes values in an ordered field $\mathbb{K}$ chosen to support a fixed positive infinitesimal. The structural requirements on $\mathbb{K}$, in full:

1. $\mathbb{K}$ is a totally ordered field.
2. There is a fixed embedding $\iota_\mathbb{R} : \mathbb{R} \hookrightarrow \mathbb{K}$ of ordered fields. We identify $\mathbb{R}$ with its image and write $r \in \mathbb{K}$ for $\iota_\mathbb{R}(r)$ throughout.
3. There exists a distinguished element $\delta \in \mathbb{K}$ with $0 < \delta$ and $\delta < r$ for every real $r > 0$. We fix one such $\delta$ once and for all.

Any non-Archimedean ordered field extending $\mathbb{R}$ supplies an admissible $\mathbb{K}$. The hyperreal numbers $\mathbb{R}^*$ are one canonical choice. The architecture is parametrized over admissible $\mathbb{K}$; downstream apparatus uses only properties guaranteed by clauses 1–3.

### Lemma (admissibility of $1 - \delta$).
$1 - \delta \in \mathbb{K}$ and $1 - \delta < 1$. For every $r \in \mathbb{R}$ with $r < 1$, $r < 1 - \delta$. Hence $1 - \delta$ is strictly less than $1$ but strictly greater than every standard real strictly less than $1$.

### Proof.
$1 - \delta < 1$ since $\delta > 0$. For $r \in \mathbb{R}_{<1}$, $1 - r$ is a positive real, hence $\delta < 1 - r$ by clause 3, hence $r < 1 - \delta$.

## 0.4 Embedding integrals into $\mathbb{K}$

Many quantities in the apparatus arise as real-valued integrals (notably the empirical-robustness component $\epsilon_{m,t}(x)$ in §7.3 of the core). When such an integral $J \in [0, 1] \subseteq \mathbb{R}$ is compared with a $\mathbb{K}$-valued quantity, we read the comparison in $\mathbb{K}$ via the fixed embedding $\iota_\mathbb{R}$. In particular, the bound $\epsilon + n\delta \le 1$ asserted in `def:epsilon` is to be read as $\iota_\mathbb{R}(\epsilon) + n \cdot \delta \le 1$ in $\mathbb{K}$. We drop $\iota_\mathbb{R}$ in notation whenever no ambiguity results.

## 0.5 The intrinsic layer

For each $m \in \mathfrak{I}$ there is a class-like collection $\mathsf{Int}$, the *intrinsic layer*. Elements of $\mathsf{Int}$ are Tier-1 items; they carry the architecture's *in re* universality property and are not in the domain of $\phi$. The architecture does not commit to whether $\mathsf{Int}$ is a set, a proper class, or a category. For the purposes of the formal apparatus it suffices to treat $\mathsf{Int}$ as a domain of quantification.

We take $\mathsf{Int}$ to be the same domain across modeling I's: the universality property is *in re*, not perspectival.

## 0.6 The cogito

For each $m \in \mathfrak{I}$ there is a distinguished element $\hat\iota_m$, the *cogito* of $m$. The cogito is not an element of $\mathsf{Int}$ (which contains Tier-1 items) and not an element of the primal not-I (defined below); it occupies Tier 2.

The cogito satisfies the *cogito phi axiom*:

> **Axiom (cogito φ).** For every $m \in \mathfrak{I}$ and every $t \in T_m$, $\phi(\hat\iota_m, t) = 1 - \delta$.

This axiom does not refer to $\mathsf{Tools}^m_t$ or to any verification pathway; the value at the cogito is structural.

## 0.7 The primal not-I

For each $m \in \mathfrak{I}$ there is a set $\mathsf{N}_m$ of items not identical to $m$, the *primal not-I*. Members of $\mathsf{N}_m$ provide the contact interface and the source-attribution domain.

The relationship between $\mathsf{N}_m$ and $\mathsf{N}_{m'}$ for distinct $m, m'$ is addressed by the architecture's treatment of other I's (Section 9 of File 4) and is not formalized here. For the apparatus to operate within a single modeling I's perspective, $\mathsf{N}_m$ alone suffices.

## 0.8 Substrate

For each $m \in \mathfrak{I}$ there is a substrate triple $\mathsf{S}_m = (\mathsf{B}_m, \mathsf{E}_m, \chi_m)$, where $\mathsf{B}_m$ is a set of substrate states, $\mathsf{E}_m \subseteq \mathsf{N}_m$ is the substrate-relevant subset of the primal not-I, and $\chi_m$ is the contact interface (next).

The architecture does not specify the internal structure of $\mathsf{B}_m$ further; later application work decomposes it into cognitive and somatic substrate substructures $\mathsf{S}_m^{\text{cog}}$ and $\mathsf{S}_m^{\text{som}}$ used in pathway-order analysis. For the signature, these substructures are noted as application-level commitments.

## 0.9 Contact interface

The *contact interface* is the function

$$\chi_m : T_m \times \mathsf{N}_m \to [0, 1] \subseteq \mathbb{R}.$$

We require that for each fixed $t$, the section $\chi_m(t, \cdot) : \mathsf{N}_m \to [0, 1]$ is measurable with respect to a fixed σ-algebra on $\mathsf{N}_m$ (the *contact σ-algebra*). The choice of σ-algebra is left to application work; the architecture commits to its existence so that downstream constructions (notably the probe-measure derivation $\Lambda^\mu_m$) are well-typed.

## 0.10 Asymptotic content domain

For each $m \in \mathfrak{I}$ and $t \in T_m$ there is a set $\mathsf{A}^m_t$, the *asymptotic content domain* of $m$ at $t$. We require:

1. $\mathsf{A}^m_t \cap \mathsf{Int} = \emptyset$ (content domain is non-intrinsic).
2. $\hat\iota_m \notin \mathsf{A}^m_t$ (the cogito is Tier 2, not asymptotic content).
3. $\mathsf{A}^m_t$ is not assumed to be related to $\mathsf{N}_m$ as a set; the source map $\sigma^m_t$ (below) connects them where appropriate.

The family $(\mathsf{A}^m_t)_{t \in T_m}$ is the *asymptotic content history*.

## 0.11 Phenomenal-availability predicate

For each $m, t$ there is a status predicate

$$A_{m,t} : \mathsf{A}^m_t \to \{0, 1\}.$$

The *phenomenally-available subset* is $\mathsf{A}^{+,m}_t := \{x \in \mathsf{A}^m_t : A_{m,t}(x) = 1\}$.

The architecture does not commit at the foundation level to axioms governing $A_{m,t}$ across $t$ or its dependence on $\mathsf{Foc}^m_t$. The predicate is a status indicator, not a coordinate, and its dynamics are deferred to application work.

## 0.12 Time-stamped tokens and persistence

The *time-stamped token domain* is

$$\widetilde{\mathsf{H}}^m_t := \{(s, x) : s \in T_m, \, s \le_m t, \, x \in \mathsf{A}^m_s\}.$$

There is a posited equivalence relation $\sim^m_H$ on $\widetilde{\mathsf{H}}^m_t$. We adopt the *coherence axiom* for $\sim^m_H$:

> **Axiom (persistence coherence).** For $s, t \in T_m$ with $s \le t$, the restriction of $\sim^m_H$ to $\widetilde{\mathsf{H}}^m_s$ coincides with the relation $\sim^m_H$ obtained by taking $s$ itself as the upper bound.

In words: persistence judgments do not change as time advances.

The *historical content domain* is the quotient $\mathsf{H}^m_t := \widetilde{\mathsf{H}}^m_t / \sim^m_H$.

## 0.13 The source map

For each $m, t$ there is a partial function

$$\sigma^m_t : \mathsf{A}^m_t \rightharpoonup \mathcal{P}(\mathsf{N}_m).$$

The *attribution domain* is $\mathrm{dom}(\sigma^m_t) \subseteq \mathsf{A}^m_t$. The architecture treats $\sigma^m_t$ as outside-perspective: a modeling I does not have full introspective access to its own source-attribution.

We require that for $x \in \mathrm{dom}(\sigma^m_t)$, $\sigma^m_t(x)$ is either finite or, when it is infinite, the contact values $\{\chi_m(t, n) : n \in \sigma^m_t(x)\}$ are a subset of $[0, 1]$ admitting a supremum (which is automatic, since $[0, 1]$ is Dedekind-complete).

## 0.14 The verification toolset and pathways

For each $m, t$ there is a set $\mathsf{Tools}^m_t$, the *verification toolset*. A *tool* is, structurally, a partial relation on the *enlarged content domain*

$$\mathsf{C}^m_t := \mathsf{Int} \cup \mathsf{A}^m_t,$$

i.e. $T \subseteq \mathsf{C}^m_t \times \mathsf{C}^m_t$ (or more generally a partial inferential operator on $\mathsf{C}^m_t$). The enlargement is required so that pathway transitions originating at an intrinsic terminus are well-typed; see the pathway definition below. Tools may carry side conditions on the I's state; we do not formalize these further here.

A *verification pathway for $x \in \mathsf{A}^m_t$ from $\mathsf{Tools}^m_t$* is a finite sequence $\pi = (\pi_0, \pi_1, \ldots, \pi_n)$ with $n \ge 1$ such that:

1. $\pi_0 \in \mathsf{Int}$ (universal-content terminus).
2. $\pi_n = x \in \mathsf{A}^m_t$.
3. Each intermediate $\pi_i$ ($1 \le i \le n - 1$) lies in $\mathsf{C}^m_t$.
4. Each transition $(\pi_i, \pi_{i+1})$ is justified by some $T \in \mathsf{Tools}^m_t$ (i.e. $(\pi_i, \pi_{i+1}) \in T$, plus any side conditions $T$ requires).

The *length* of $\pi$ is $n$. The *constructibility domain* is

$$\mathrm{Verif}(m, t) := \{x \in \mathsf{A}^m_t : \exists \text{ a verification pathway for } x \text{ from } \mathsf{Tools}^m_t\}.$$

The *conditional depth function* is

$$n_{m,t} : \mathrm{Verif}(m, t) \to \mathbb{N}_{\ge 1}, \quad n_{m,t}(x) := \min\{\mathrm{length}(\pi) : \pi \text{ a pathway for } x\}.$$

For $x \notin \mathrm{Verif}(m, t)$, $n_{m,t}(x)$ is undefined.

### Axiom (φ admissibility).

For every $m, t$ and every $x \in \mathrm{Verif}(m, t)$, the conditional depth and the empirical robustness deficit satisfy

$$\epsilon_{m,t}(x) + n_{m,t}(x) \cdot \delta \le 1,$$

read in $\mathbb{K}$ via the embedding $\iota_\mathbb{R}$ (cf. §0.4). This is the core admissibility bound (`def:epsilon` in the core, line 181 of `sources/core/3_formal_apparatus.md`); it ensures that the Tier-3 formula $\phi_{m,t}(x) = 1 - n_{m,t}(x) \delta - \epsilon_{m,t}(x)$ takes values in $[0, 1 - \delta]$.

### Axiom (Tier-3 strictness).

For every $m, t$ and every $x \in \mathrm{Verif}(m, t) \cap \mathsf{A}^m_t$,

$$n_{m,t}(x) \cdot \delta + \epsilon_{m,t}(x) > \delta.$$

This is the *cogito-uniqueness postulate at the φ level*: no Tier-3 content matches the cogito's structural saturation $1 - \delta$. The substantive reading is that any constructed content admits some pathway-length cost or some probe-deficit residue, however small in $\mathbb{R}$ or in $\mathbb{K}$. The Tier-3 strictness axiom, together with the admissibility bound, makes Proposition 3.3.7 (cogito as the unique supremum of $\phi$) a theorem rather than a posit-with-a-defective-proof.

## 0.15 Probes

For each $m, t$ there is a measurable space $(Q^m_t, \mathcal{Q}^m_t)$, the *probe space*. Each $q \in Q^m_t$ is a Borel-measurable function $q : \mathsf{A}^m_t \to [0, 1]$ (where $\mathsf{A}^m_t$ carries an implicit σ-algebra inherited from the operational structure; in practice a discrete σ-algebra suffices and is the default convention). The σ-algebra $\mathcal{Q}^m_t$ is chosen so that for each $x \in \mathsf{A}^m_t$, the evaluation map $\mathrm{ev}_x : Q^m_t \to [0, 1]$, $\mathrm{ev}_x(q) = q(x)$, is $\mathcal{Q}^m_t$-measurable.

The *probe measure* is a probability measure

$$\mu^m_t : \mathcal{Q}^m_t \to [0, 1],$$

produced by the open function

$$\mu^m_t = \Lambda^\mu_m\big(\mathsf{Foc}^m_t,\ \kappa^{\mathrm{out}}_{m,t},\ (Q^m_t, \mathcal{Q}^m_t)\big).$$

The architecture commits to $\Lambda^\mu_m$'s signature (it produces probability measures on the appropriate probe space) but not to its specific form, which is application-level.

## 0.16 Focus

For each $m, t$ there is a focus allocation $\mathsf{Foc}^m_t$ on $\mathsf{A}^{+,m}_t$. We adopt the *weighted-set convention*: $\mathsf{Foc}^m_t$ is a function $\mathsf{A}^{+,m}_t \to [0, \infty)$ with finite support, where the support is the set of contents currently in focus. The *focus mass* is $\|\mathsf{Foc}^m_t\|_1 := \sum_{x} \mathsf{Foc}^m_t(x)$ and is bounded by the substrate-determined capacity:

$$\|\mathsf{Foc}^m_t\|_1 \le M_m(t) := \Gamma^M_m(\mathsf{S}_m, t).$$

The *contact-driven / self-directed decomposition* $\mathsf{Foc}^m_t = \mathsf{Foc}^m_t[\text{cd}] + \mathsf{Foc}^m_t[\text{sd}]$ is then addition of weight functions. The cardinality bound $|\mathsf{Foc}^m_t| \le M_m(t)$ from the core (`def:Foc`) becomes the support-size bound; if a strict interpretation of the core is preferred, replace the focus allocation by its support set.

We commit to the weighted-set convention because the update rule and probe-measure derivations downstream are cleaner with weights than with bare sets, and the bare-set reading is recoverable as the support.

## 0.17 Integration graphs and integration modes

There is a non-empty index set $K$ of *integration modes*, with $|K|$ finite or countably infinite. For each $m, t, k$, there is a directed weighted graph

$$G^{m,k}_t = (V^m_t,\ E^{m,k}_t,\ w^{m,k}_t),$$

with $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$, $E^{m,k}_t \subseteq V^m_t \times V^m_t$, and $w^{m,k}_t : E^{m,k}_t \to [0, 1] \subseteq \mathbb{R}$.

We commit to the *locally-finite, finite-flow regime*:

> **Axiom (graph well-formedness).** For each $m, t, k$:
> 1. Local finiteness: every $v \in V^m_t$ has finitely many edges incident in $E^{m,k}_t$.
> 2. Finite reach: for every $x \in V^m_t \setminus \{\hat\iota_m\}$, the max-flow from $\hat\iota_m$ to $x$ in $G^{m,k}_t$ (computed in the standard sense for locally finite networks; see e.g. Aharoni–Berger–Georgakopoulos–Perlstein–Sprüssel for the countable-network max-flow/min-cut theorem and Lochbihler for its Isabelle/HOL formalization) is finite.

Local finiteness supports the standard max-flow theory on (possibly countably infinite) networks but does *not* by itself entail finite max-flow values; the strict bound $\rho^{m,k}_t(x) < 1$ for non-core $x$ (from `def:rho`) follows from the *finite-reach* clause applied to the normalization $C / (1 + C)$.

## 0.18 The scalar mode-aggregation

The architecture's scalar projection of mode-vector $\vec\rho^m_t(x) = (\rho^{m,k}_t(x))_k$ is

$$\rho_{m,t}(x) = \sum_{k \in K} a_k(m, t)\, \rho^{m,k}_t(x),$$

with $a_k(m, t) > 0$ for all $k \in K$ and $\sum_{k \in K} a_k(m, t) = 1$. For finite $K$ the sum is finite. For countably infinite $K$, the series converges absolutely because each summand lies in $[0, a_k(m, t)]$ and the $a_k$ are summable; the value lies in $[0, 1]$.

## 0.19 Notational conventions

The following conventions are used throughout the formalization edition.

- All quantifiers over modeling I, time, mode, content, and pathway are made explicit unless context renders them unambiguous.
- The hat-iota glyph $\hat\iota_m$ denotes the cogito of $m$. Variants without subscript are allowed only when $m$ is fixed.
- Subscripts $m, t, k$ are written in the order $m, t, k$ in this edition; the core uses $m, k, t$ in some places and $m, t, k$ in others. The rigorous edition standardizes to $m, t, k$.
- Set-builder notation $\{x \in S : P(x)\}$ presupposes $P$ is a definite predicate on $S$.
- $\rightharpoonup$ denotes a partial function.
- $\Pi_{[0,1]}(\cdot) := \max(0, \min(1, \cdot))$.

## 0.20 Forward references

The remaining files of the formalization edition (planned: `01_objects.md` through `07_open_questions.md`) build on this signature.

- `01_objects.md` makes the core objects (cogito, primal not-I, time, substrate, contact interface, asymptotic content domain, phenomenal-availability) precise, with the conventions of this file in force.
- `02_graph_theory.md` develops the integration-graph machinery in detail: local finiteness, max-flow definition, persistence-token quotient, edge structure conventions.
- `03_coordinates.md` gives κ, φ, ρ in their full rigorous form, including the verification-pathway machinery and the probe-space integral.
- `04_profiles.md` formalizes the profile, lived I, shells, four-class taxonomy, and pathway-order typology.
- `05_dynamics.md` formalizes the imprinting update event, the update rule, the osmotic mechanism with bandwidth signature, and dynamic-entanglement disclaimers.
- `06_independence_lemmas.md` states and proves the three formal-non-reducibility propositions.
- `07_open_questions.md` records residual open theoretical questions (notably the structure of $A_{m,t}$ dynamics and the profile-comparison metric).

When all eight files are complete, the formalization edition is assembled into a single manuscript via the `markdown-manuscript` skill using the `formal_apparatus_rigorous` paper profile in `project_manifest.yml`.

---

*End of 00_signature.md.*


<!-- SOURCE: outputs/formalization/01_objects.md -->


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


<!-- SOURCE: outputs/formalization/02_graph_theory.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 02. Graph Theory and Identity-Correlation

> **Status:** Draft v0.1.
> **Relationship to 00–01.** This file develops the graph-theoretic machinery underlying the identity-correlation coordinate $\rho$. The graph well-formedness axiom of `0.17` (local finiteness plus finite reach) is the foundation; from it we obtain a clean theory of max-flow, the capacity function $C^{m,k}_t$, the definition of $\rho^{m,k}_t$, and the strict bound $\rho^{m,k}_t(x) < 1$ for non-core $x$. Mode aggregation is given as a derived construction. The chapter closes with the edge-update protocol that ties the graph to the dynamics of `05_dynamics.md`.

## 2.1 Recapitulation: the integration graph

For each modeling I $m$, time $t \in T_m$, and mode $k \in K$, the *integration graph* is

$$G^{m,k}_t = (V^m_t,\ E^{m,k}_t,\ w^{m,k}_t),$$

with

$$V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t, \quad E^{m,k}_t \subseteq V^m_t \times V^m_t, \quad w^{m,k}_t : E^{m,k}_t \to [0, 1] \subseteq \mathbb{R}.$$

Edges are directed and weighted. The cogito $\hat\iota_m$ is the unique distinguished vertex; it serves as the source of every flow computation. Note that the vertex set $V^m_t$ depends on $m$ and $t$ but not on $k$: all modes share a common vertex set, and modes differ only in their edge set and edge weights. This is structurally important: the apparatus computes a *single* aggregate $\rho_{m,t}$ from the mode-wise $\rho^{m,k}_t$, and this requires a common vertex set.

### 2.1.1 Edge interpretation

An edge $(u, v) \in E^{m,k}_t$ with weight $w^{m,k}_t(u, v) = w$ encodes a *mode-$k$ integration channel from $u$ to $v$* with capacity $w$. The architecture is non-committal at the foundation level about the substantive interpretation of integration channels in each mode: applications give them concrete content (proprioceptive linkage, motor-affordance integration, etc.). For the apparatus, an edge is a typed datum with the listed components.

### 2.1.2 Cogito edges

There may be edges out of $\hat\iota_m$ to elements of $\mathsf{H}^m_t$, with weights in $[0, 1]$. There are no edges *into* $\hat\iota_m$ in the apparatus's standard reading. Some applications may benefit from allowing reflexive edges $(\hat\iota_m, \hat\iota_m)$; we do not require them and do not exclude them. The strict-bound lemma below does not depend on their presence or absence.

## 2.2 Graph well-formedness

The graph well-formedness axiom (`0.17`) is repeated here for emphasis.

### Axiom (graph well-formedness; restated).
For each $m \in \mathfrak{I}$, $t \in T_m$, $k \in K$:

1. **Local finiteness.** Every $v \in V^m_t$ has finitely many incident edges in $E^{m,k}_t$.
2. **Finite reach.** For every $x \in V^m_t \setminus \{\hat\iota_m\}$, the max-flow from $\hat\iota_m$ to $x$ in $G^{m,k}_t$ is finite.

**Operational justification.** Local finiteness corresponds to the empirical fact that a modeling I, considered at a single instant $t$, has accumulated a finite history of integration events and therefore stands in finitely many integration channels relative to any given item. Finite reach corresponds to the observation that no biologically embedded modeling I has infinite integration capacity into any single content. The architecture's restriction of attention to substrate-bounded I's over the closed interval of finite life makes these regularity conditions appropriate.

**Relation between the two clauses.** Local finiteness alone does not entail finite max-flow; an infinite locally-finite network with countably many disjoint cogito-to-$x$ paths each of capacity $1$ has infinite max-flow into $x$. Finite reach is therefore a *separate* condition, not derivable from local finiteness. The two together suffice to recover classical max-flow theory in the form needed for $\rho$: max-flow is well-defined, finite, and supports the strict bound $C/(1+C) < 1$ for non-source vertices. (See discussion in the Rigor Report, Gap 1, and the verification report's §6.1.)

**Background max-flow theory.** The standard max-flow/min-cut theorem for countable locally finite networks is proven in Aharoni, Berger, Georgakopoulos, Perlstein, and Sprüssel; an Isabelle/HOL formalization with proof corrections is given by Lochbihler. The rigorous edition treats these results as background and does not re-prove them.

### 2.2.1 Vertex cardinality

Local finiteness does *not* impose a finite cardinality on $V^m_t$. The vertex set may be countably infinite. What is imposed is that the *degree* of each vertex is finite. This is the standard locally-finite condition on infinite networks and is exactly what is needed for max-flow theory to behave classically.

### 2.2.2 The standard max-flow theory under local finiteness

Under local finiteness, the Ford–Fulkerson construction extends to networks of arbitrary vertex cardinality, with the standard result that max-flow equals min-cut, the max-flow value is well-defined (possibly $+\infty$ but excluded here by finite reach), and the strong duality holds. We use these facts without further proof; see standard references on flows in infinite networks.

## 2.3 The capacity function

For each $m, t, k$ and each $x \in V^m_t \setminus \{\hat\iota_m\}$, the *integration capacity* of $x$ in mode $k$ is

$$C^{m,k}_t(x) := \max\text{-flow value from } \hat\iota_m \text{ to } x \text{ in } G^{m,k}_t.$$

By graph well-formedness, $C^{m,k}_t(x) \in [0, \infty)$. For $x = \hat\iota_m$, we define $C^{m,k}_t(\hat\iota_m) := +\infty$ by convention (every flow into the source is trivially saturated; equivalently, the normalization below yields $\rho = 1$ as the limit value).

### 2.3.1 Range and properties

$C^{m,k}_t : V^m_t \to [0, +\infty]$ takes the value $+\infty$ only at $\hat\iota_m$ (by finite reach for non-source vertices). It is nonnegative everywhere. It is $0$ at any vertex disconnected from $\hat\iota_m$ in $G^{m,k}_t$.

### 2.3.2 Mode-dependence

$C^{m,k}_t(x)$ depends on $k$ through the edge structure: an item may have high capacity in some modes (e.g. proprioceptive integration) and low capacity in others (e.g. mathematical-content integration), and this differential is what distinguishes the modes.

## 2.4 Identity-correlation $\rho$

### Definition 2.4.1 (mode-wise $\rho$).
For each $m, t, k$ and each $x \in V^m_t$,

$$\rho^{m,k}_t(x) := \frac{C^{m,k}_t(x)}{1 + C^{m,k}_t(x)} \in [0, 1].$$

For $x = \hat\iota_m$, $\rho^{m,k}_t(\hat\iota_m) := 1$ (the limit as $C \to +\infty$).

### Lemma 2.4.2 (strict bound).
For every $m, t, k$ and every $x \in V^m_t \setminus \{\hat\iota_m\}$,

$$\rho^{m,k}_t(x) < 1.$$

### Proof.
By finite reach, $C^{m,k}_t(x) \in [0, +\infty)$ — i.e. $C^{m,k}_t(x) < +\infty$. The function $f(c) = c / (1 + c)$ is strictly increasing on $[0, +\infty)$, takes the value $0$ at $c = 0$, and has $\lim_{c \to +\infty} f(c) = 1$; in particular $f(c) < 1$ for every $c < +\infty$. Therefore $\rho^{m,k}_t(x) = f(C^{m,k}_t(x)) < 1$. ∎

### Remark 2.4.3.
The strict bound is a structural consequence of finite reach, not an additional posit. The Rigor Report (Gap 1) identified this as a load-bearing consequence: without finite reach, $\rho^{m,k}_t(x) = 1$ would be possible for items other than the cogito, collapsing the cogito's distinctive saturation role. The locally-finite, finite-flow regime preserves the strict bound for the entire architecture.

### 2.4.4 Range and behavior

$\rho^{m,k}_t(x) = 0$ iff $C^{m,k}_t(x) = 0$, which occurs iff $x$ is disconnected from $\hat\iota_m$ in $G^{m,k}_t$. The value $\rho^{m,k}_t(x)$ approaches $1$ as $C^{m,k}_t(x)$ grows large, but never reaches $1$ off the cogito. The cogito is the unique vertex with $\rho^{m,k}_t = 1$ in every mode.

## 2.5 The scalar mode-aggregation

The *scalar identity-correlation* of $x$ at $(m, t)$ is the mode-weighted aggregate

$$\rho_{m,t}(x) := \sum_{k \in K} a_k(m, t)\, \rho^{m,k}_t(x),$$

where $a_k(m, t) > 0$ for all $k$ and $\sum_k a_k(m, t) = 1$. The weights $(a_k(m, t))_k$ are produced by the open function $A^k_m$ from $\mathsf{Foc}^m_t$ and the substrate state.

### Proposition 2.5.1 (convergence and range).
The series defining $\rho_{m,t}(x)$ converges to a value in $[0, 1]$. For $x = \hat\iota_m$, $\rho_{m,t}(\hat\iota_m) = 1$. For $x \ne \hat\iota_m$, $\rho_{m,t}(x) < 1$.

### Proof.
For finite $K$ the sum is finite. For countably infinite $K$, $0 \le a_k(m, t)\, \rho^{m,k}_t(x) \le a_k(m, t)$ for every $k$, and $\sum_k a_k(m, t) = 1 < \infty$, so the series converges absolutely by comparison. The value lies in $[0, 1]$ since it is a convex combination of values in $[0, 1]$. For $x = \hat\iota_m$, every summand is $a_k(m, t) \cdot 1 = a_k(m, t)$, summing to $1$. For $x \ne \hat\iota_m$, Lemma 2.4.2 gives $\rho^{m,k}_t(x) < 1$ for *every* $k$, so $1 - \rho^{m,k}_t(x) > 0$ for every $k$. The deficit is

$$1 - \rho_{m,t}(x) = \sum_{k \in K} a_k(m, t)\, (1 - \rho^{m,k}_t(x)).$$

Since $a_k(m, t) > 0$ for every $k$ (positivity of the mode weights, §0.18) and each summand on the right is strictly positive, the series is a sum of strictly positive terms with at least one (in fact every) term positive, hence $1 - \rho_{m,t}(x) > 0$, i.e. $\rho_{m,t}(x) < 1$. ∎

### 2.5.2 Numerical caveat for infinite $K$

The strict bound $\rho_{m,t}(x) < 1$ for $x \ne \hat\iota_m$ is uniform termwise (each $\rho^{m,k}_t(x) < 1$) but not necessarily uniform over $x$: as $x$ varies, the *supremum* $\sup_{x \ne \hat\iota_m} \rho_{m,t}(x)$ may approach $1$ (a sequence of items each with very high integration). The architecture does not require uniform separation from $1$, and the apparatus does not depend on it.

## 2.6 Edge structure and provenance

The edges $E^{m,k}_t$ and the weights $w^{m,k}_t$ are not free parameters of the apparatus. They are the cumulative product of imprinting events along the history $T_m \cap (-\infty, t]$, governed by the dynamics in `05_dynamics.md` (Imprinting Update Rule). At the foundation level we record only the following structural commitments.

### 2.6.1 Edge persistence

An edge $(u, v) \in E^{m,k}_t$ that is established by an imprinting event at some $s \le t$ remains in $E^{m,k}_{t'}$ for $t' \ge t$ unless its weight reaches $0$ at some $t'' \in [t, t']$, in which case the architecture is permissive about whether the edge is dropped from the edge set or retained with weight $0$. The two readings are equivalent for max-flow.

### 2.6.2 Compatibility with the persistence quotient

When two tokens $(s, x), (s', x')$ become $\sim^m_H$-equivalent (i.e. are merged in $\mathsf{H}^m_t$), the edge structure must respect the merge: edges to or from $[(s, x)]$ and to or from $[(s', x')]$ are identified, and weights are combined (the architecture leaves the combination rule to applications, but the default is parallel-edge aggregation via the larger of the two weights or via sum-capped-at-$1$; both preserve max-flow up to bounded factors). The persistence-coherence axiom (`0.12`) ensures that merges do not happen retroactively, so the edge-structure compatibility need only be enforced at the time of the merge.

### 2.6.3 No mode-mixing in the graph

Edges in $E^{m,k}_t$ are mode-$k$-specific: there is no edge that simultaneously occupies multiple modes. Mode-mixing happens at the aggregation stage (§2.5), not at the graph stage. This is what allows the four-class taxonomy of `04_profiles.md` to read off discrete *mode-profiles* of an item.

## 2.7 The vector $\vec\rho^m_t$

The *mode-vector of identity-correlation* of $x$ at $(m, t)$ is

$$\vec\rho^m_t(x) := (\rho^{m,k}_t(x))_{k \in K} \in [0, 1]^K.$$

The scalar $\rho_{m,t}(x)$ is the contraction of $\vec\rho^m_t(x)$ against the mode weight $(a_k(m, t))_k$. The architecture retains the vector form for diagnostics: $\vec\rho^m_t(x)$ reveals *which modes* an item is highly integrated in, which is not visible from $\rho_{m,t}(x)$ alone.

### 2.7.1 Mode-profile classes

For each item $x$ and time $t$, the *mode-profile class* of $x$ is the pattern of which modes give it high vs. low $\rho^{m,k}_t$. The four-class taxonomy of core File 4 §10 (somatic-dominant, cognitive-dominant, etc.) reads off this pattern. Formalization of the taxonomy is deferred to `04_profiles.md`.

## 2.8 The graph snapshot vs. the graph history

At each fixed $t$, the graph $G^{m,k}_t$ is a *snapshot* of integration structure at $t$. The *graph history* is the family $(G^{m,k}_t)_{t \in T_m}$. The history is constrained by the imprinting dynamics: weights and edges may change in $t$ only by the imprinting update rule (`05_dynamics.md`). The vertex set may only grow (by the monotonicity of $\mathsf{H}^m_t$ in $t$ via the canonical inclusion $j^m_{s,t}$, Proposition 1.2).

Because vertex addition is monotone but vertex removal does not occur, max-flow values can only increase or remain the same when an item is held fixed and time advances *with no edge-reweighting*. Of course in practice imprinting events do reweight edges, so the time-dependence of $\rho^{m,k}_t(x)$ for fixed $x$ is the resultant of vertex addition (weakly increasing) and edge reweighting (either direction).

### Proposition 2.8.1 (vertex monotonicity).
For each fixed $x \in \mathsf{H}^m_s$ and $s \le t$, the value $C^{m,k}_t(j^m_{s,t}(x))$ in $G^{m,k}_t$ is at least $C^{m,k}_s(x)$ in $G^{m,k}_s$, provided that the restriction of $E^{m,k}_t$ to $V^m_s$ has the same edges and edge weights as $E^{m,k}_s$ (i.e. $G^{m,k}_s$ embeds as a subnetwork of $G^{m,k}_t$ via the directed system $j^m_{s,t}$, with no old edge weight reduced and no old vertex's incident-edge structure altered).

### Proof.
Under the proviso, any feasible flow on $G^{m,k}_s$ extends to a feasible flow on $G^{m,k}_t$ by setting the flow to zero on every edge of $E^{m,k}_t$ not in the image of $E^{m,k}_s$ under the embedding. Capacity constraints are preserved (old edges retain their old capacities; new edges have flow $0 \le w$). Conservation is preserved at every vertex (old vertices retain their old in/out balance; new vertices have zero flow in and out). The extended flow has the same value at $j^m_{s,t}(x)$ as the original at $x$. Hence $C^{m,k}_t(j^m_{s,t}(x)) \ge C^{m,k}_s(x)$. ∎

The proviso is restrictive: it isolates the *vertex-addition* effect from the *edge-reweighting* effect. Without the proviso the proposition is silent. This is the right factorization: vertex addition is monotone, edge reweighting is the substantive dynamics.

## 2.9 Forward dependencies

`03_coordinates.md` uses $\rho^{m,k}_t$ as one of the three coordinates and the locally-finite, finite-flow regime ensures it is well-typed.

`04_profiles.md` collects $\rho^{m,k}_t(x)$ values over $x$ and $k$ into the *profile* $P_{m,t}$, the primary structural object of the architecture.

`05_dynamics.md` specifies the edge-reweighting protocol — the Imprinting Update Rule — that drives the time-dependence of $\rho^{m,k}_t$.

`06_independence_lemmas.md` uses the strict bound (Lemma 2.4.2) and the mode-decomposability of $\rho$ to prove the formal non-reducibility of $\rho$ to $\phi$ or $\kappa$.

---

*End of 02_graph_theory.md.*


<!-- SOURCE: outputs/formalization/03_coordinates.md -->


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


<!-- SOURCE: outputs/formalization/04_profiles.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 04. Profiles, Lived I, Shells, Taxonomy

> **Status:** Draft v0.1.
> **Relationship to 00–03.** With the three coordinates in place, this file formalizes the architecture's *primary structural object*: the identity-correlation profile $P_{m,t}$. From the profile, three derived constructions follow: the lived-$I$ network, the shell stratification, and the four-class taxonomy of mode-profiles. The pathway-order coordinate $D$ is introduced and connected to these derived structures. The fuzziness coordinate $Fz$ is omitted from the formal apparatus at this revision (per Gap 8 of the Rigor Report); a stub note appears in `07_open_questions.md`.

## 4.1 The identity-correlation profile

The core architecture's primary structural object for an I at a time is the *identity-correlation profile* in its ρ-valued form (`sources/core/3_formal_apparatus.md` §7.6, line 219). The rigorous edition preserves this and adds a derived full-coordinate profile that retains the additional structure of the three-coordinate apparatus. The two profiles are distinguished notationally.

### Definition 4.1.1 (base identity-correlation profile).

The *base identity-correlation profile of $m$ at $t$* is the family

$$P^\rho_{m,t} := \big\{\, (x,\ \rho_{m,t}(\pi^m_t(x)))\ :\ x \in \mathsf{A}^m_t\,\big\},$$

with $\pi^m_t : \mathsf{A}^m_t \to \mathsf{H}^m_t$ the content-to-history projection of §1.7.4. The base profile is core-faithful: it is the indexed family $\{(x, \rho_{m,t}(x))\}_{x \in \mathsf{A}^m_t}$ as written in the core, made type-correct by the projection.

Equivalently, $P^\rho_{m,t}$ may be written as the function $\rho_{m,t} \circ \pi^m_t : \mathsf{A}^m_t \to [0, 1]$, with the codomain bounded strictly below $1$ for all non-core contents and reaching $1$ only at the cogito (a vacuous case at the level of $\mathsf{A}^m_t$, since the cogito is not in $\mathsf{A}^m_t$ at the foundation level).

### Definition 4.1.2 (mode-vector profile).

The *mode-vector profile of $m$ at $t$* is the family

$$\vec P^\rho_{m,t} := \big\{\, (x,\ \vec\rho^m_t(\pi^m_t(x)))\ :\ x \in \mathsf{A}^m_t\,\big\}.$$

It retains the mode-specific information that the scalar projection collapses. Core File 3 §7.6 (line 223) presents this as the "full vector profile, retaining mode-specific structure."

### Definition 4.1.3 (full-coordinate profile).

The *full-coordinate identity-correlation profile of $m$ at $t$* is the family

$$P^{\rho\phi\kappa}_{m,t} := \big\{\, \big(x,\ \rho_{m,t}(\pi^m_t(x)),\ \vec\rho^m_t(\pi^m_t(x)),\ \phi_{m,t}(x),\ \kappa^{\text{in}}_{m,t}(x)\big)\ :\ x \in \mathrm{Dom}(m, t)\,\big\},$$

with $\mathrm{Dom}(m, t) = \mathrm{dom}(\sigma^m_t) \cap \mathrm{Verif}(m, t)$ from §3.6. The full-coordinate profile is a *derived* object: it is constructed from the three coordinates over the subset of contents where all three are defined. It is not a replacement for the base profile $P^\rho_{m,t}$ but a refinement available where all three coordinates can be jointly evaluated.

### 4.1.4 Which profile is the primary structural object?

In the core architecture and in the rigorous edition, $P^\rho_{m,t}$ is the primary structural object: it is what the architecture's predictions about identity-correlation operate on, and it is what the shells of §4.3 partition. The full-coordinate profile $P^{\rho\phi\kappa}_{m,t}$ is a derived object useful for the formal-non-reducibility analysis of Chapter 6 and for application-level reasoning that combines all three coordinates. The mode-vector profile $\vec P^\rho_{m,t}$ is a refinement of the base profile that exposes mode structure.

The rigorous edition v0.2 collapsed all three into the full-coordinate version, silently strengthening the core's commitment. This was identified as a faithfulness defect in the verification report (§4 of the external verification) and is corrected in v0.3 by the split above.

### 4.1.5 Profile equality

Two base profiles $P^\rho_{m,t}$ and $P^\rho_{m',t'}$ are *equal* iff $\mathsf{A}^m_t = \mathsf{A}^{m'}_{t'}$ as sets and $\rho_{m,t} \circ \pi^m_t = \rho_{m',t'} \circ \pi^{m'}_{t'}$ pointwise. The architecture acknowledges that across distinct modeling I's the equality is unlikely to hold because $\mathsf{A}^m_t$ depends on $m$. *Comparison* of profiles across $(m, t)$ pairs requires a notion of restriction or matching of domains, which is open question `oq:profile-comparison`. Analogous remarks apply to $\vec P^\rho_{m,t}$ and $P^{\rho\phi\kappa}_{m,t}$.

### 4.1.6 Profile evolution

The architecture's dynamics, formalized in `05_dynamics.md`, drive the evolution of the profiles in $t$. The vertex monotonicity proposition (Proposition 2.8.1) and the toolset-non-monotonicity remark (§3.4.4) jointly imply that $\mathsf{A}^m_t$ and $\mathrm{Dom}(m, t)$ are *not* monotone in $t$: contents can enter and leave the domains as the apparatus operates. Profile evolution is therefore not modeled as evolution on a fixed domain, but as the time-indexed family of values-on-time-varying-domains.

## 4.2 The lived-$I$ network

The core architecture defines the lived-$I$ network as the support of the base profile where $\rho > 0$ (`sources/core/3_formal_apparatus.md` §7.6, line 232). The rigorous edition preserves this definition and adds a derived *thresholded* lived-$I$ as an application-level refinement, but the support form is the core-faithful primary notion.

### Definition 4.2.1 (support-lived-$I$ network).

The *support-lived-$I$ network of $m$ at $t$*, denoted $\mathfrak{L}^m_t$, is the subset of $\mathsf{A}^m_t$ on which the base profile takes positive values, lifted into the graph by $\pi^m_t$:

$$\mathfrak{L}^m_t := \{x \in \mathsf{A}^m_t : \rho_{m,t}(\pi^m_t(x)) > 0\},$$

together with the cogito $\hat\iota_m$ (which has $\rho_{m,t}(\hat\iota_m) = 1$ at the level of $V^m_t$).

This is the core-faithful primary notion: the lived-$I$ is the set of contents that are *at all* integrated with the cogito, not those above a chosen threshold.

### Definition 4.2.2 (thresholded lived-$I$ network).

The *thresholded lived-$I$ network of $m$ at $t$ at level $\theta$*, denoted $\mathfrak{L}^{m,\theta}_t$, is

$$\mathfrak{L}^{m,\theta}_t := \{x \in \mathsf{A}^m_t : \rho_{m,t}(\pi^m_t(x)) \ge \theta_{m,t}\} \cup \{\hat\iota_m\},$$

with $\theta_{m,t} = \Theta^\rho_m(\mathsf{Foc}^m_t, \mathsf{S}_m, t) \in (0, 1)$ a threshold produced by an open function $\Theta^\rho_m$ (in place of the v0.2 notation $\rho_*$, which collided with the imprinting open function $B^k_m$ as flagged in the verification report §8.7).

The thresholded form is a derived/application-level refinement of the support form: $\mathfrak{L}^{m,\theta}_t \subseteq \mathfrak{L}^m_t$ for every admissible $\theta$. Applications that distinguish a "lived core" from a "lived periphery" (e.g. temporal phenomenology, agency) typically operate on a thresholded form; the foundation apparatus retains both.

### 4.2.3 Status of $\Theta^\rho$

The threshold $\Theta^\rho$ is an open function, parametrized over the substrate state and the focus configuration. The architecture commits to its signature but not to its functional form; specific thresholds are calibrated by application work. The threshold is *strict-below-1*: $\Theta^\rho_m(\cdot) < 1$ for every input, since otherwise $\mathfrak{L}^{m,\theta}_t = \{\hat\iota_m\}$ trivially.

### 4.2.4 The lived-$I$ as a network

Although $\mathfrak{L}^m_t$ (or $\mathfrak{L}^{m,\theta}_t$) is defined as a vertex subset, the architecture reads it as a *network*: the induced subgraph of $G^{m,k}_t$ on the corresponding $\pi^m_t$-images, in each mode $k$, is the lived-$I$ network in that mode. The architecture's claim is that this network — the cogito together with high-correlation items, with their mutual integration channels — is the formal structure underlying first-personal identity ascriptions.

## 4.3 Shells

The architecture's *shell walkthrough* (core File 3 §5) presents identity-correlation as a series of nested strata. We formalize the strata as a partition of $V^m_t$ induced by a finite sequence of thresholds.

### Definition 4.3.1 (shell stratification).
Fix a strictly decreasing finite sequence of thresholds

$$1 = r_0 > r_1 > r_2 > r_3 > r_4 > r_5 > 0,$$

with $r_0 = 1$ included only as the cogito-saturation level. The *shells* of $m$ at $t$ are the sets

$$\mathsf{Sh}_0(m, t) := \{\hat\iota_m\},$$
$$\mathsf{Sh}_i(m, t) := \{x \in V^m_t \setminus \{\hat\iota_m\} : r_i \le \rho_{m,t}(x) < r_{i-1}\}, \quad i = 1, \ldots, 5,$$
$$\mathsf{Sh}_6(m, t) := \{x \in V^m_t \setminus \{\hat\iota_m\} : 0 \le \rho_{m,t}(x) < r_5\}.$$

The architecture reads the shells as: (0) cogito, (1) first shell — contents currently experienced as me, (2) second shell — stable embodied integration, (3) third shell — deep integrations, (4) fourth shell — peripheral integrations, (5) fifth shell — contents in current awareness without integration, (6) outer shell — contents present in the asymptotic field but only weakly integrated.

### 4.3.2 The strict not-$I$ region

The core architecture characterizes strict not-$I$ as content where $\rho$ *approaches* $0$ (`sources/core/3_formal_apparatus.md` §7.6, line 232), not as content where $\rho$ exactly equals $0$. The strict not-$I$ region is therefore a *limit notion*, not a sharp shell-class. We define it separately from the shell partition:

$$\mathsf{N}^0_t := \{x \in V^m_t \setminus \{\hat\iota_m\} : \rho_{m,t}(x) = 0\}.$$

$\mathsf{N}^0_t$ is a subset of $\mathsf{Sh}_6(m, t)$ (since the shell admits $\rho = 0$). The architecture treats $\mathsf{N}^0_t$ as the *strictly disconnected* region — items in $V^m_t$ with no integration channel from the cogito in any mode — distinct from the *near-zero* region (items in $\mathsf{Sh}_6$ with $\rho$ small but positive). The shell partition does not collapse this distinction.

### 4.3.3 Status of the threshold sequence

The thresholds $r_1, \ldots, r_5$ are *not* part of the foundation commitment. They are application-level parameters calibrated to the application's empirical content. Different applications may use different threshold sequences; the architecture commits only to the *existence* of a strictly decreasing sequence yielding a non-trivial stratification, and to the universal endpoint $r_0 = 1$ (cogito).

### 4.3.4 The shell partition

The shells partition $V^m_t$:

$$V^m_t = \bigsqcup_{i = 0}^{6} \mathsf{Sh}_i(m, t).$$

Proof: the intervals $[r_1, 1), [r_2, r_1), \ldots, [r_5, r_4), [0, r_5)$ partition $[0, 1)$, and $\{1\}$ is the cogito's value. Together with the cogito-saturation singleton $\{1\}$ at $\mathsf{Sh}_0$, the seven sets are pairwise disjoint and their union is $V^m_t$. ∎

### 4.3.5 Lived-$I$ as shell union

For a threshold $\theta_{m,t} \in [r_j, r_{j-1})$ from a thresholded lived-$I$ construction, the thresholded lived-$I$ network is

$$\mathfrak{L}^{m,\theta}_t = \mathsf{Sh}_0(m, t) \cup \mathsf{Sh}_1(m, t) \cup \cdots \cup \mathsf{Sh}_{j-1}(m, t) \cup \{x \in \mathsf{Sh}_j(m, t) : \rho_{m,t}(x) \ge \theta_{m,t}\}.$$

The support-lived-$I$ network $\mathfrak{L}^m_t$ is the union of all shells $\mathsf{Sh}_i$ with $i \le 6$ on which $\rho > 0$, i.e. $V^m_t \setminus \mathsf{N}^0_t$.

## 4.4 The pathway-order coordinate $D$

The architecture's *pathway-order* coordinate $D \in \{1, 2, 3\}$ records the dominant order of substrate-mediation in the integration channel by which an item is imprinted. The three orders are:

**Order 1 (somatic-primary):** the item is integrated via the somatic substrate $\mathsf{B}_m^{\text{som}}$ first, with cognitive integration following or absent.

**Order 2 (cognitive-with-somatic):** the item is integrated via the cognitive substrate $\mathsf{B}_m^{\text{cog}}$, but with somatic involvement contributing significantly.

**Order 3 (cognitive-primary):** the item is integrated via the cognitive substrate, with somatic involvement minimal or absent.

### Definition 4.4.1 (pathway-order assignment).
For each $m, t$ and each $x \in V^m_t$ with non-trivial integration ($\rho_{m,t}(x) > 0$), the *pathway-order* of $x$ is

$$D_{m,t}(x) \in \{1, 2, 3\},$$

assigned by an open function $A^T_m$ (in the model instance tuple of §1.12). The function takes as inputs the substrate decomposition $(\mathsf{B}_m^{\text{cog}}, \mathsf{B}_m^{\text{som}})$ — i.e. an application-level commitment from §1.4 — and the integration history producing the edges in $E^{m,k}_t$ that contribute to $C^{m,k}_t(x)$.

The architecture commits to the *signature* of $A^T_m$ — the output is a value in $\{1, 2, 3\}$ — and to the *three-class structure* of pathway orders, but not to the specific functional form of $A^T_m$.

### 4.4.2 Pathway-order as type, not coordinate

$D$ is a typed value in a three-element set, not a real- or $\mathbb{K}$-valued coordinate. The architecture treats it as a categorical typing of items rather than as a graded quantity. Applications may benefit from a graded version (e.g. a real-valued "somatic involvement" coefficient), but the foundation commitment is to the categorical type.

### 4.4.3 The lossy-compression principle

The architecture's commitment that substrate-mediation is lossy (core File 3 §8.5.3) means that as an item passes through more layers of substrate, more of its content is compressed away. Higher-order pathways ($D = 3$) are lossier than lower-order pathways ($D = 1$). This is a substantive empirical commitment carried into the apparatus only through its consequences (e.g. profile-shape predictions in §4.6 below); the apparatus does not impose a formal loss-quantification at the foundation level.

## 4.5 The four-class mode-profile taxonomy

The architecture's *four-class taxonomy* (core File 4 §10) classifies items by the pattern of $\rho^{m,k}_t(x)$ across the canonical pair of modes — typically *cognitive* mode $k = \text{cog}$ and *somatic* mode $k = \text{som}$. Other mode pairs admit analogous taxonomies.

### Definition 4.5.1 (mode-profile class).
Fix two modes $k_1, k_2 \in K$ and two thresholds $\theta^{k_1}, \theta^{k_2} \in (0, 1)$ (produced by mode-specific threshold open functions, analogous to $\Theta^\rho_m$ of §4.2.2). The *mode-profile class* of $x$ at $(m, t)$ is determined by the pair

$$(\rho^{m,k_1}_t(\pi^m_t(x)) \ge \theta^{k_1},\ \rho^{m,k_2}_t(\pi^m_t(x)) \ge \theta^{k_2}) \in \{0, 1\}^2.$$

The four classes are:

| Class | $\rho^{m,k_1}_t(\pi^m_t(x)) \ge \theta^{k_1}$ | $\rho^{m,k_2}_t(\pi^m_t(x)) \ge \theta^{k_2}$ |
|-------|-----------------------------------------------|-----------------------------------------------|
| A     | Yes                                           | Yes                                           |
| B     | Yes                                           | No                                            |
| C     | No                                            | Yes                                           |
| D     | No                                            | No                                            |

With the canonical pair $(k_1, k_2) = (\text{cog}, \text{som})$, the classes are: A = high in both, B = cognitive-dominant, C = somatic-dominant, D = low in both.

### 4.5.2 Relation to pathway order

The four-class taxonomy and the pathway-order coordinate $D_{m,t}(x)$ are related but distinct. The mode-profile class records the *final integration state* of $x$ across modes; pathway order records the *route* by which $x$ arrived at that state. The architecture treats these as orthogonal in the foundation: an item could be Class A (high in both modes) by Order 1 (somatic-primary) routing or by Order 3 (cognitive-primary) routing.

In application work the two are correlated (and often partially predictive of each other), but the architecture does not commit to a deterministic relation at the foundation level.

### 4.5.3 Generalization to $|K| > 2$

For an arbitrary index set $K$ of modes and a threshold family $(\theta^k)_{k \in K}$, the *generalized mode-profile class* of $x$ is the function

$$\chi^x_{m,t} : K \to \{0, 1\}, \quad \chi^x_{m,t}(k) = \mathbb{1}[\rho^{m,k}_t(\pi^m_t(x)) \ge \theta^k].$$

The four-class case is the restriction to $|K| = 2$. Applications that distinguish three or more modes (e.g. cognitive, somatic, affective) yield richer taxonomies; the apparatus admits them uniformly.

## 4.6 Profile-shape consequences

The architecture makes substantive predictions about *which* mode-profile classes are expected to be most populated as a function of pathway order and substrate properties (core File 3 §8.5.10). These predictions are application-level outputs of the foundation, not foundation-level commitments.

### 4.6.1 Statement schema

Predictions take the form: *under certain substrate conditions and certain toolset conditions, items with pathway order $D$ are expected to concentrate in mode-profile classes $\mathcal{C} \subseteq \{A, B, C, D\}$ with relative frequency $\pi(D, \mathcal{C})$.*

The architecture does not commit to particular values of $\pi(D, \mathcal{C})$ at the foundation level. Calibrating $\pi$ is empirical work in application papers.

### 4.6.2 Why these predictions are not foundation-level

The foundation apparatus is parametrized over the open functions $\Gamma^M_m, \Lambda^\mu_m, A^k_m, B^k_m, A^T_m$ without specifying their forms. Substantive predictions about *which items end up where* require committing the open functions to particular forms, which is the work of applications. The foundation's role is to ensure that *whatever* commitments are made at the application level, they are constrained by the apparatus's structural axioms.

## 4.7 Fuzziness $Fz$: status note

The core architecture (File 3 §8.5.4) introduces a *fuzziness* coordinate $Fz$ tracking the indeterminateness of pathway-order assignment for items integrated through hybrid pathways. As of this revision, $Fz$ is *not* part of the formal apparatus.

The Rigor Report (Gap 8) recommended this exclusion because $Fz$ as stated has no declared signature and does not appear in any foundation-level definition of the three coordinates, the profile, the shells, or the four-class taxonomy. Promotion of $Fz$ to a formal coordinate of the apparatus would require:

- a signature for $Fz_{m,t}$ on $V^m_t$ or a sub-domain thereof;
- an explicit formula or open-function specification;
- a role in either the static profile (which would change Definition 4.1.1) or in the dynamics (which would change `05_dynamics.md`).

A stub recording this is included in `07_open_questions.md`. The exclusion is tentative; future revisions of the rigorous edition may promote $Fz$ if a suitable signature is found.

## 4.8 Forward dependencies

`05_dynamics.md` specifies how $P_{m,t}$ evolves: the update rule reweights edges in $E^{m,k}_t$, which changes $C^{m,k}_t$, which changes $\rho^{m,k}_t$, which changes the profile.

`06_independence_lemmas.md` uses the four-class taxonomy and the lived-$I$ network as witnesses to the formal non-reducibility of the three coordinates.

`07_open_questions.md` records the pathway-order open structure (`oq:pathway-object`), the fuzziness stub, the profile-comparison metric (`oq:profile-comparison`), and the $A_{m,t}$ dynamics open question (`oq:phenomenology-status-axioms`).

---

*End of 04_profiles.md.*


<!-- SOURCE: outputs/formalization/05_dynamics.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 05. Dynamics

> **Status:** Draft v0.1.
> **Relationship to 00–04.** This file specifies how the integration graph $G^{m,k}_t$, and through it the profile $P_{m,t}$, evolves in time. The central object is the *imprinting update*: an event-driven reweighting of edges in $E^{m,k}_t$. The update rule is given in detail, along with focus-driven imprinting (which selects the edges receiving updates) and osmotic imprinting (a low-rate background variant). The chapter closes with a convergence statement for the scalar mode-aggregation and a delimitation between formal non-reducibility (proven in `06_independence_lemmas.md`) and dynamic entanglement.

## 5.1 The imprinting event

An *imprinting event* at time $s \in T_m$ for mode $k \in K$ and edge $(u, v) \in V^m_t \times V^m_t$ is a triple

$$\mathcal{E} = (s, k, (u, v))$$

representing a moment at which the integration channel from $u$ to $v$ in mode $k$ is exercised. The architecture's stand is that exercise of an integration channel raises its weight; non-exercise causes decay. Both effects are unified in the update rule.

The set of imprinting events at $s$ in mode $k$ is determined by the focus configuration $\mathsf{Foc}^m_s$ and the open function $B^k_m$ (which selects which edges are exercised when which items are in focus). The architecture commits to the signature of $B^k_m$ but not to its specific form.

## 5.2 The update rule

### Definition 5.2.1 (imprinting update).
Fix $m, k$. Let $\mathcal{E} = (s, k, (u, v))$ be an imprinting event with the edge $(u, v) \in E^{m,k}_t$ for $t = s^-$ (i.e. the edge already exists pre-event). Let $w_{s^-} := w^{m,k}_{s^-}(u, v) \in [0, 1]$ be the pre-event weight. The post-event weight is

$$w_{s^+} := \Pi_{[0, 1]}\big((1 - \beta)\, w_{s^-} + \alpha\, (1 - w_{s^-})\big),$$

where:

- $\alpha = \alpha(m, s, k, (u, v)) \in [0, 1]$ is the *imprinting rate* (event-driven, applied only when the channel is exercised);
- $\beta = \beta(m, s, k, (u, v)) \in [0, 1]$ is the *decay rate* (applied at all events; for non-exercising events, $\alpha = 0$);
- $\Pi_{[0, 1]}(\cdot) = \max(0, \min(1, \cdot))$ is the clipping projection.

For an event-instant $s$ that does *not* exercise the channel — i.e. when $\mathcal{E}$ does not concern this edge — the update degenerates to $w_{s^+} = (1 - \beta) w_{s^-}$ (pure decay, $\alpha = 0$).

### 5.2.2 Properties of the update

Three immediate properties.

**(U1) Range preservation.** $w_{s^+} \in [0, 1]$ whenever $w_{s^-} \in [0, 1]$. The clipping projection $\Pi_{[0,1]}$ guarantees this unconditionally. Without clipping: $(1 - \beta) w_{s^-} + \alpha(1 - w_{s^-}) = w_{s^-}(1 - \alpha - \beta) + \alpha$, which is nonnegative iff $\alpha + (1 - \alpha - \beta) w_{s^-} \ge 0$ (always true for $\alpha \ge 0$ and $w_{s^-}(1 - \alpha - \beta) + \alpha \ge 0$) and at most $1$ iff $\alpha + (1 - \alpha - \beta) w_{s^-} \le 1$, which simplifies to $w_{s^-} \ge (1 - \alpha) / (\alpha + \beta - 1)$ when $\alpha + \beta > 1$. Range preservation is therefore not automatic without clipping when $\alpha + \beta > 1$; the clipping projection is included precisely to handle this case. The condition $\alpha + \beta \le 1$ is *not* a range condition but a *convexity/interpretability* condition: under it the unclipped update is a convex combination, which is the natural reading. We retain $\Pi_{[0,1]}$ throughout the apparatus so that range preservation holds regardless of which regime $(\alpha, \beta)$ are in.

**(U2) Fixed-point structure.** Setting $w_{s^+} = w_{s^-} = w$ and solving (without clipping) gives $w(\alpha + \beta) = \alpha$, so the fixed point is $w^* = \alpha / (\alpha + \beta)$ when $\alpha + \beta > 0$. This is the long-run weight of a channel exercised at constant rate with constant $\alpha, \beta$. The fixed point lies in $[0, 1]$ for any $\alpha, \beta \ge 0$ with $\alpha + \beta > 0$.

**(U3) Convex combination structure (under $\alpha + \beta \le 1$).** The update without clipping reads $w_{s^+} = (1 - \alpha - \beta) w_{s^-} + \alpha$. When $\alpha + \beta \le 1$, this is a convex combination of $w_{s^-}$ and $1$ with mixing coefficient $\alpha + \beta$, biased by the residual decay term. The structural reading is that exercise drives the weight toward $1$ at rate $\alpha$ while inactivity decays it at rate $\beta$. When $\alpha + \beta > 1$, the unclipped update is not a convex combination but is bounded into $[0, 1]$ by $\Pi$.

### 5.2.3 Edge creation

If the channel $(u, v)$ does *not* currently exist in $E^{m,k}_{s^-}$, an imprinting event introduces it with the same rule, treating $w_{s^-} = 0$:

$$w_{s^+} = \Pi_{[0, 1]}(\alpha).$$

The architecture treats edge creation as a special case of the same update with prior weight zero. The architecture commits to the threshold-free convention: $w_{s^+} > 0$ suffices to count the edge as present in $E^{m,k}_{s^+}$. Zero-weight edges are dropped or retained at the apparatus's discretion (the choice does not affect max-flow).

### 5.2.4 Vertex creation

If the head $v$ of an imprinting event is *not* currently in $\mathsf{H}^m_{s^-}$, then both $v$ and the edge $(u, v)$ are introduced at $s$. By the monotonicity of $\mathsf{H}^m_t$ in $t$ (Proposition 1.2), $v$ is added to the history domain at $s$, and the new vertex's persistence-equivalence class is established at the time of introduction.

## 5.3 Focus-driven imprinting

The architecture's substantive commitment about *which* edges are exercised at $s$ is that focus drives imprinting (core File 3 §8.4): edges incident to items currently in focus are the ones exercised.

### Definition 5.3.1 (focus-driven exercise).
At time $s$, an edge $(u, v) \in E^{m,k}_s$ is *focus-exercised* iff $u \in \mathrm{supp}(\mathsf{Foc}^m_s) \cup \{\hat\iota_m\}$ and $v \in \mathrm{supp}(\mathsf{Foc}^m_s) \cup \{\hat\iota_m\}$.

The imprinting rate at a focus-exercised edge is positive: $\alpha(m, s, k, (u, v)) > 0$ when the edge is focus-exercised, and $\alpha = 0$ when it is not. The decay rate $\beta$ may apply to all edges regardless of focus status; this is application-dependent.

### 5.3.2 Focus-weighted exercise

A graded version: $\alpha(m, s, k, (u, v))$ is proportional to $\min(\mathsf{Foc}^m_s(u), \mathsf{Foc}^m_s(v))$, or to some other monotone function of the focus weights at $u$ and $v$. The architecture's commitment is the *qualitative* one — that focus drives imprinting — and the graded versions are application-level choices.

### 5.3.3 The cogito as boundary

The cogito $\hat\iota_m$ is treated, for purposes of focus-driven exercise, as if it carried infinite focus weight. Every focused item is in focus-channel with the cogito. This is the dynamical correlate of the cogito's anchoring role in $\rho$: items become integrated with the cogito by being in focus.

## 5.4 The two-phase shift

The architecture's two-phase shift in focus allocation (core File 3 §8.2) is a claim about the dynamic regime: the contact-driven component $\mathsf{Foc}^m_t[\text{cd}]$ dominates in early phases of an item's integration; the self-directed component $\mathsf{Foc}^m_t[\text{sd}]$ dominates in later phases. Formally, this is a claim about which decomposition component carries the larger mass over the relevant time window.

The two-phase shift is not a foundation-level axiom. It is an empirical regularity that the architecture's apparatus is designed to accommodate but does not impose. Application papers (notably the agency paper and the differentiated-affect paper) use the two-phase shift as a substantive premise.

## 5.5 Osmotic imprinting

The architecture's *osmotic imprinting* (core File 3 §8.7) is a low-rate background dynamics applying to items *not* in focus but in the asymptotic-content domain. Its rates $(\alpha_{\text{osm}}, \beta_{\text{osm}})$ are small in absolute terms compared to the focus-driven rates.

### Definition 5.5.1 (osmotic event).
For each $s, k$ and each edge $(u, v) \in E^{m,k}_s$ that is *not* focus-exercised at $s$, an *osmotic event* applies the update rule with rates $(\alpha_{\text{osm}}(m, s, k, (u, v)), \beta_{\text{osm}}(m, s, k, (u, v)))$ in place of the focus-driven rates.

The osmotic rates are non-zero in general; they capture a *bandwidth* of background reweighting that proceeds in parallel with focus-driven imprinting.

### 5.5.2 Why osmotic imprinting

The architecture's reason for osmotic imprinting is twofold. First, it accounts for slow background changes in $\rho_{m,t}$ for items that are not actively in focus but are nonetheless part of $V^m_t$. Second, it provides a mechanism for items to *drift* between shells over time without requiring continuous focus exercise — which is empirically necessary because no I focuses on all of its lived-$I$ network at once.

### 5.5.3 The bandwidth signature

We commit to the existence of $(\alpha_{\text{osm}}, \beta_{\text{osm}})$ as open functions with the signature

$$\alpha_{\text{osm}}, \beta_{\text{osm}} : \mathfrak{I} \times T \times K \times (V \times V) \to [0, 1],$$

(suppressing the inner $V^m_t$ dependence) with values typically much smaller than the corresponding focus-driven rates. The architecture does not commit to a specific bound or a specific functional form. This is the *bandwidth signature commitment* (cf. Rigor Report Gap 9).

## 5.6 Toolset dynamics

The toolset $\mathsf{Tools}^m_t$ also evolves in $t$. The architecture's dynamics for $\mathsf{Tools}^m_t$ is open: tools are gained by learning events and lost by forgetting or disabling, and the architecture does not formalize the specific mechanism at the foundation level. The toolset's evolution is recorded only through its consequences for $\phi$: as the toolset changes, $\mathrm{Verif}(m, t)$ and $n_{m,t}$ change accordingly.

### 5.6.1 Verification-tool imprinting

The architecture's *verification-tool imprinting dynamics* (core File 3 §8.6) is the parallel claim that exercise of a verification tool $T \in \mathsf{Tools}^m_t$ reinforces its presence in the toolset, while non-exercise decays it. The mechanism is structurally analogous to edge imprinting but applies to toolset membership rather than to edge weights. We do not formalize this at the foundation level; the toolset is treated as a time-indexed set without an explicit reinforcement dynamics in the rigorous edition.

## 5.7 Mode-weight dynamics

The mode weights $a_k(m, t)$ produced by $A^k_m$ are themselves time-dependent. The architecture's commitment is that $a_k$ varies continuously (in an appropriate sense) with the substrate state and the focus configuration. Specific dynamics for $a_k$ are application-level.

### 5.7.1 The convergence statement

For the scalar aggregation $\rho_{m,t}(x) = \sum_k a_k(m, t) \rho^{m,k}_t(x)$ to be well-defined when $K$ is countably infinite, the series must converge absolutely. We restated this convergence in Proposition 2.5.1: with $a_k(m, t) > 0$ and $\sum_k a_k(m, t) = 1$, the series converges absolutely for every $x$.

We add now a *uniform convergence* statement, useful for dynamic reasoning.

### Proposition 5.7.2 (uniform convergence in $x$).
For each $m, t$, the series $\sum_k a_k(m, t) \rho^{m,k}_t(x)$ converges uniformly in $x \in V^m_t$.

### Proof.
$|a_k(m, t) \rho^{m,k}_t(x)| \le a_k(m, t)$ for every $x$, and $\sum_k a_k(m, t) = 1 < \infty$. By the Weierstrass $M$-test, the series converges uniformly in $x$. ∎

Uniform convergence in $x$ means that perturbations of $\rho^{m,k}_t(x)$ at a particular $x$ propagate into $\rho_{m,t}(x)$ in a controlled way, regardless of which $x$ is being perturbed.

## 5.8 Formal non-reducibility vs. dynamic entanglement

The architecture distinguishes *formal non-reducibility* of the three coordinates (proven in `06_independence_lemmas.md`) from *dynamic entanglement* of the three coordinates (a feature of the dynamics articulated here).

### 5.8.1 What dynamic entanglement is

Dynamic entanglement is the fact that the time-derivatives of $\kappa$, $\phi$, $\rho$ are not independent: a change in focus changes both the probe measure (via $\Lambda^\mu_m$, hence $\phi$) and the edges exercised (via $B^k_m$, hence $\rho$). A change in contact changes both $\kappa$ directly and the focus configuration (via the contact-driven component), hence both $\phi$ and $\rho$. The three coordinates respond *together* to changes in the underlying open functions.

### 5.8.2 What dynamic entanglement is not

Dynamic entanglement is *not* a contradiction of formal non-reducibility. The formal non-reducibility propositions (proven in `06_independence_lemmas.md`) state that no two coordinate values determine the third *as a function of the coordinate values themselves*. Dynamic entanglement is a property of the joint evolution under a fixed family of open functions; this evolution can mix the three coordinates without making any one a function of the others.

The distinction is important because the architecture's empirical predictions involve dynamic entanglement (e.g. predictions about how $\rho$ changes when focus shifts, in agency-paper and free-will-paper applications), while the architecture's structural commitment to *three irreducible coordinates* is the static formal non-reducibility.

## 5.9 Forward dependencies

`06_independence_lemmas.md` uses the static apparatus to prove the three formal non-reducibility propositions. The dynamics formalized here are not directly invoked in those proofs, although they motivate why the architecture takes the static non-reducibility as a load-bearing commitment.

`07_open_questions.md` records open questions concerning the dynamics: the precise form of $A^k_m$ (`oq:rho-modes-K`), the bandwidth ratio between osmotic and focus-driven rates (`oq:osmotic-bandwidth`), and the toolset dynamics (`oq:tool-reinforcement`).

---

*End of 05_dynamics.md.*


<!-- SOURCE: outputs/formalization/06_independence_lemmas.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 06. Independence Lemmas

> **Status:** Draft v0.1.
> **Relationship to 00–05.** This file establishes the *formal non-reducibility* of the three coordinates $\kappa$, $\phi$, $\rho$. The architecture's structural commitment is that no two of these coordinates determine the third. The commitment is made formal by three independence propositions, each of which constructs a pair of items agreeing on two coordinates and disagreeing on the third. The constructions use only the apparatus established in `00`–`05`; no additional posits are introduced. Dynamic entanglement (`05_dynamics.md` §5.8) is a distinct phenomenon and is not in tension with these independence results.

## 6.1 The independence claim

The architecture's static commitment is that the map

$$\Phi_{m,t} : x \mapsto \big(\kappa^{\text{in}}_{m,t}(x),\ \phi_{m,t}(x),\ \rho_{m,t}(\pi^m_t(x))\big)$$

from $\mathrm{Dom}(m, t)$ to $[0, 1] \times \mathbb{K} \times [0, 1]$ is *not redundant*: no proper subset of the three components determines the third by a function of the other two values uniformly across admissible models. The projection $\pi^m_t : \mathsf{A}^m_t \to \mathsf{H}^m_t$ from §1.7.4 lifts $\rho$ from $V^m_t$ to $\mathsf{A}^m_t$ so that all three coordinates are evaluable on a common content.

This is the *coordinate-value* non-reducibility, to be distinguished from non-reducibility *at the dynamics* (which is false: the three coordinates are dynamically entangled through shared open functions). The three propositions of this chapter establish coordinate-value non-reducibility by exhibiting, for each pair, an admissible model in which two contents share that pair of coordinate values but differ on the third.

The structure of each proposition is the same. We construct an admissible model containing two contents agreeing on two coordinates and disagreeing on the third. The existence of such a model rules out any universal coordinate-value function on those two coordinates that yields the third.

## 6.2 Proposition I: $(\phi, \kappa)$ does not determine $\rho$

### Proposition 6.2.1.
There exists a modeling I $m$, a time $t$, and items $x, x' \in \mathrm{Dom}(m, t)$ such that

$$\phi_{m,t}(x) = \phi_{m,t}(x'),\quad \kappa^{\text{in}}_{m,t}(x) = \kappa^{\text{in}}_{m,t}(x'),\quad \text{but } \rho_{m,t}(x) \ne \rho_{m,t}(x').$$

### Proof.
We construct an explicit witnessing scenario. Fix $m$ and $t$. We specify the apparatus by exhibiting the relevant components.

**Items and sources.** Let $x, x' \in \mathsf{A}^m_t$ be distinct items. Let $\sigma^m_t(x) = \{n\}$ and $\sigma^m_t(x') = \{n'\}$ for distinct $n, n' \in \mathsf{N}_m$ with $\chi_m(t, n) = \chi_m(t, n') = c$ for some fixed $c \in (0, 1)$. Then $\kappa^{\text{in}}_{m,t}(x) = \kappa^{\text{in}}_{m,t}(x') = c$. The first equation is satisfied.

**Verification pathways.** Choose a tool $T \in \mathsf{Tools}^m_t$ and an intrinsic content $\iota \in \mathsf{Int}$ such that $(\iota, x) \in T$ and $(\iota, x') \in T$ (recall that tools relate elements of $\mathsf{C}^m_t = \mathsf{Int} \cup \mathsf{A}^m_t$ per the repaired typing of §0.14). Then $\pi = (\iota, x)$ is a length-$1$ verification pathway for $x$, and analogously for $x'$. Therefore $n_{m,t}(x) = n_{m,t}(x') = 1$.

**Probe measure and integrand.** Choose a probe space $(Q^m_t, \mathcal{Q}^m_t, \mu^m_t)$ and probes $(q_i)$ such that $q_i(x) = q_i(x')$ for every $i$, and $\epsilon_{m,t}(x) = \epsilon_{m,t}(x') = e$ for some $e \in (0, 1 - \delta)$ chosen so that the Tier-3 strictness axiom is satisfied at both items: $n_{m,t}(x) \delta + \epsilon_{m,t}(x) = \delta + e > \delta$ holds since $e > 0$. (Any positive $e$ suffices; the witness uses $e$ to ensure that no Tier-3 saturation occurs.) The admissibility bound $\epsilon + n\delta \le 1$ is satisfied since $\delta + e \le 1$ for $e \le 1 - \delta$.

By the $\phi$-formula, $\phi_{m,t}(x) = 1 - \delta - e = \phi_{m,t}(x')$. The second equation is satisfied.

**Differential integration.** Now specify the integration graph in some fixed mode $k$ as follows. The vertex set $V^m_t$ contains $\hat\iota_m$ together with the persistence classes $\pi^m_t(x) = [(t, x)]$, $\pi^m_t(x') = [(t, x')]$, and at least one auxiliary vertex $y = \pi^m_t(y_0) \in \mathsf{H}^m_t$ for some auxiliary content $y_0$. The edge set $E^{m,k}_t$ contains $(\hat\iota_m, \pi^m_t(x))$ with weight $1/2$ and $(\hat\iota_m, \pi^m_t(x'))$ with weight $1/10$. Additionally $(\hat\iota_m, y)$ and $(y, \pi^m_t(x))$ each with weight $1/2$ — providing a second flow path into $\pi^m_t(x)$ via $y$ — while no edge enters $\pi^m_t(x')$ from $y$.

The max-flow from $\hat\iota_m$ to $\pi^m_t(x)$ is the sum of flows along the direct edge ($1/2$) and along the two-hop path through $y$ ($\min(1/2, 1/2) = 1/2$), totaling $C^{m,k}_t(\pi^m_t(x)) = 1$. The max-flow from $\hat\iota_m$ to $\pi^m_t(x')$ is $C^{m,k}_t(\pi^m_t(x')) = 1/10$ (only the direct edge contributes).

Therefore $\rho^{m,k}_t(\pi^m_t(x)) = 1/2$ while $\rho^{m,k}_t(\pi^m_t(x')) = 1/11$. Taking $K = \{k\}$ (single mode) for concreteness, the scalar $\rho_{m,t}(\pi^m_t(x)) = 1/2 \ne 1/11 = \rho_{m,t}(\pi^m_t(x'))$. The third inequality is satisfied.

**Consistency.** The construction is consistent with all apparatus axioms: $\sigma^m_t$ is a partial function with finite source sets; verification pathways start at an intrinsic terminus and proceed through a tool typed on $\mathsf{C}^m_t$; the probe space is well-typed (a finite probe family with the discrete σ-algebra), the integral is a finite sum, the φ-admissibility and Tier-3 strictness axioms are satisfied at both items; the integration graph is locally finite (each vertex has degree at most $3$) and finite-reach (max-flow values are at most $1$). The graph well-formedness axiom of `0.17` is satisfied. ∎

The witnessing scenario shows that *two items with the same source-contact value and the same truth-indistinguishability can have different identity-correlation* whenever the integration graph distinguishes them. This is the load-bearing structural fact behind the architecture's commitment that $\rho$ is its own coordinate.

## 6.3 Proposition II: $(\kappa, \rho)$ does not determine $\phi$

### Proposition 6.3.1.
There exists a modeling I $m$, a time $t$, and items $x, x' \in \mathrm{Dom}(m, t)$ such that

$$\kappa^{\text{in}}_{m,t}(x) = \kappa^{\text{in}}_{m,t}(x'),\quad \rho_{m,t}(x) = \rho_{m,t}(x'),\quad \text{but } \phi_{m,t}(x) \ne \phi_{m,t}(x').$$

### Proof.
We construct another witnessing scenario.

**Items and sources.** Let $x, x' \in \mathsf{A}^m_t$ be distinct items with $\sigma^m_t(x) = \sigma^m_t(x') = \{n\}$ (same source). Then $\kappa^{\text{in}}_{m,t}(x) = \chi_m(t, n) = \kappa^{\text{in}}_{m,t}(x')$. The first equation is satisfied.

**Differential verification.** Choose a toolset $\mathsf{Tools}^m_t$ (with tools typed on $\mathsf{C}^m_t = \mathsf{Int} \cup \mathsf{A}^m_t$) such that the minimum-length verification pathway for $x$ has length $1$ — there exists $(\iota, x) \in T$ for some $T \in \mathsf{Tools}^m_t$ and $\iota \in \mathsf{Int}$ — while the minimum-length pathway for $x'$ has length $2$: no length-$1$ pathway exists, but a length-$2$ pathway $(\iota, y, x')$ exists, where $(\iota, y) \in T_1$ and $(y, x') \in T_2$ for tools $T_1, T_2 \in \mathsf{Tools}^m_t$ and an auxiliary content $y \in \mathsf{A}^m_t$. Then $n_{m,t}(x) = 1$ and $n_{m,t}(x') = 2$.

**Probe measure.** Choose probes so that $\epsilon_{m,t}(x) = \epsilon_{m,t}(x') = e$ for some $e \in (0, 1 - 2\delta)$. The admissibility bound $\epsilon + n\delta \le 1$ is satisfied at both items (at $x$: $\delta + e \le 1$; at $x'$: $2\delta + e \le 1$). The Tier-3 strictness axiom is satisfied at both ($\delta + e > \delta$ and $2\delta + e > \delta$, both because $e > 0$).

Then $\phi_{m,t}(x) = 1 - \delta - e$ and $\phi_{m,t}(x') = 1 - 2\delta - e$, so $\phi_{m,t}(x) - \phi_{m,t}(x') = \delta \ne 0$ in $\mathbb{K}$. The third inequality is satisfied (with $\phi$ values differing by the infinitesimal $\delta$).

**Matched integration.** Specify the integration graph so that $\pi^m_t(x)$ and $\pi^m_t(x')$ have the same max-flow from $\hat\iota_m$. The simplest construction: single edges $(\hat\iota_m, \pi^m_t(x))$ and $(\hat\iota_m, \pi^m_t(x'))$ each with weight $w \in (0, 1]$, with no other edges. Then $C^{m,k}_t(\pi^m_t(x)) = C^{m,k}_t(\pi^m_t(x')) = w$, so $\rho^{m,k}_t(\pi^m_t(x)) = \rho^{m,k}_t(\pi^m_t(x')) = w / (1 + w)$, and the scalar aggregation in any single-mode case gives $\rho_{m,t}(\pi^m_t(x)) = \rho_{m,t}(\pi^m_t(x'))$. The second equation is satisfied.

**Consistency.** All apparatus axioms are satisfied: $\sigma^m_t$ is partial-functional; verification pathways respect the intrinsic-terminus condition with tools typed on $\mathsf{C}^m_t$; the probe space has measurable evaluation maps; the admissibility and strictness axioms hold; the graph is locally finite (each vertex has degree at most $1$) and finite-reach. ∎

The witnessing scenario shows that *two items with the same source-contact and the same identity-correlation can have different truth-indistinguishability* whenever the toolset structure distinguishes their conditional depths. This is the load-bearing structural fact behind the architecture's commitment that $\phi$ is its own coordinate.

### Remark 6.3.2.
The $\phi$-difference in this construction is exactly $\delta$ — the architecture's infinitesimal. The proposition does not require larger differences; it requires only a non-zero difference. The infinitesimal slack between length-$1$ and length-$2$ pathways is exactly what the cogito φ-axiom and the depth-coefficient $n\delta$ structure of the apparatus is designed to register.

## 6.4 Proposition III: $(\phi, \rho)$ does not determine $\kappa$

### Proposition 6.4.1.
There exists a modeling I $m$, a time $t$, and items $x, x' \in \mathrm{Dom}(m, t)$ such that

$$\phi_{m,t}(x) = \phi_{m,t}(x'),\quad \rho_{m,t}(x) = \rho_{m,t}(x'),\quad \text{but } \kappa^{\text{in}}_{m,t}(x) \ne \kappa^{\text{in}}_{m,t}(x').$$

### Proof.
Construct as follows.

**Items and sources.** Let $x, x' \in \mathsf{A}^m_t$ with $\sigma^m_t(x) = \{n\}$ and $\sigma^m_t(x') = \{n'\}$, where $\chi_m(t, n) = c$ and $\chi_m(t, n') = c'$ with $c \ne c'$. Then $\kappa^{\text{in}}_{m,t}(x) = c \ne c' = \kappa^{\text{in}}_{m,t}(x')$. The third inequality is satisfied.

**Matched verification.** Choose tools (typed on $\mathsf{C}^m_t = \mathsf{Int} \cup \mathsf{A}^m_t$) and an intrinsic terminus so that both $x$ and $x'$ admit length-$1$ verification pathways. Then $n_{m,t}(x) = n_{m,t}(x') = 1$.

**Matched probes.** Choose probes so that $\epsilon_{m,t}(x) = \epsilon_{m,t}(x') = e$ for some $e \in (0, 1 - \delta)$. The admissibility bound holds ($\delta + e \le 1$) and the Tier-3 strictness axiom holds at both items ($\delta + e > \delta$ since $e > 0$). Then $\phi_{m,t}(x) = \phi_{m,t}(x') = 1 - \delta - e$. The first equation is satisfied.

**Matched integration.** As in Proposition 6.3.1, single edges $(\hat\iota_m, \pi^m_t(x))$ and $(\hat\iota_m, \pi^m_t(x'))$ of equal weight $w$ give $\rho_{m,t}(\pi^m_t(x)) = \rho_{m,t}(\pi^m_t(x')) = w / (1 + w)$. The second equation is satisfied.

**Consistency.** Apparatus axioms are satisfied as in the previous propositions: distinct sources with distinct contact values are unconstrained by the apparatus; verification pathways are independent of the source map; integration graph weights are independent of contact values; admissibility and Tier-3 strictness hold. ∎

The witnessing scenario shows that *two items with the same truth-indistinguishability and the same identity-correlation can have different source-contact* whenever the source map distinguishes them and the contact interface assigns different strengths. This is the load-bearing structural fact behind the architecture's commitment that $\kappa$ is its own coordinate.

## 6.5 Joint independence: the three propositions in concert

The three propositions establish that the three coordinates are *pairwise irreducible*: each is independent of the conjunction of the other two. We summarize this as a single statement.

### Theorem 6.5.1 (formal non-reducibility of the three coordinates).

*Notational prelude.* Define the *admissible φ-domain* as the $\mathbb{K}$-valued half-open interval

$$\mathsf{D}_\phi := \{\alpha \in \mathbb{K} : 0 \le \alpha < 1 - \delta\}.$$

This is the set of φ-values attainable by non-cogito verified contents (cf. Proposition 3.3.7 and the φ-admissibility and Tier-3 strictness axioms of §0.14). In a non-Archimedean field, $\mathsf{D}_\phi$ is strictly larger than $(1 - \delta - \mathbb{R}_{\ge 0})$: it contains, for example, $1 - 2\delta - e$ for any real $e \in [0, 1 - 2\delta]$, which is not of the form $1 - \delta - r$ for real $r \ge 0$ because $\delta$ is not in the image of $\iota_\mathbb{R}$. The witnessing scenario of Proposition 6.3.1 produces exactly such φ-values, so $\mathsf{D}_\phi$ is the type-clean choice for the theorem's universal quantification.

There is no function

$$F_\rho : \mathsf{D}_\phi \times [0, 1] \to [0, 1]$$

such that for every admissible model instance $M_m$, every $t \in T_m$, and every $x \in \mathrm{Dom}(m, t)$,

$$F_\rho(\phi_{m,t}(x),\ \kappa^{\text{in}}_{m,t}(x)) = \rho_{m,t}(\pi^m_t(x)).$$

There is no function

$$F_\phi : [0, 1] \times [0, 1] \to \mathbb{K}$$

such that for every admissible model instance $M_m$, every $t \in T_m$, and every $x \in \mathrm{Dom}(m, t)$,

$$F_\phi(\kappa^{\text{in}}_{m,t}(x),\ \rho_{m,t}(\pi^m_t(x))) = \phi_{m,t}(x).$$

There is no function

$$F_\kappa : \mathsf{D}_\phi \times [0, 1] \to [0, 1]$$

such that for every admissible model instance $M_m$, every $t \in T_m$, and every $x \in \mathrm{Dom}(m, t)$,

$$F_\kappa(\phi_{m,t}(x),\ \rho_{m,t}(\pi^m_t(x))) = \kappa^{\text{in}}_{m,t}(x).$$

### Proof.
Each of the three propositions (6.2.1, 6.3.1, 6.4.1) constructs an admissible model instance in which two items in $\mathrm{Dom}(m, t)$ share the relevant pair of coordinate values but differ on the third. Each such witness rules out the corresponding $F$: a putative $F$ would be required to take different values at the same input pair, contradicting its functionhood. ∎

### Remark 6.5.2 (model-local versus universal).
The theorem rules out *universal* coordinate-value functions valid across all admissible models. It does not rule out *model-local* dependencies in which, within a fixed model with specific open-function choices, the three coordinates may be statistically correlated or even functionally constrained on a restricted subdomain. Such model-local relationships are part of the dynamic entanglement discussed in `05_dynamics.md` §5.8 and are not in tension with the universal non-reducibility established here.

The architecture's structural commitment to a three-coordinate apparatus — rather than a two-coordinate apparatus with the third derived — is established formally by Theorem 6.5.1. The commitment is not merely a notational convenience but a structural fact about the apparatus.

## 6.6 What the propositions do not show

Three caveats are in order.

### 6.6.1 No claim about dynamic independence

The propositions concern *static* coordinate values at fixed $(m, t)$. They do not claim that the coordinates evolve independently in $t$. In fact the dynamics ties them together (`05_dynamics.md` §5.8.1).

### 6.6.2 No claim about empirical independence

The propositions exhibit witnessing scenarios that are *constructible* in the apparatus, not necessarily *realized* in any actual modeling I. The empirical question of whether actual I's exhibit items distinguishing the three coordinates is application-level. The architecture's commitment is that the apparatus *permits* such items; the empirical question is whether they exist.

### 6.6.3 No claim about higher-order non-reducibility

The propositions establish pairwise non-reducibility. They do not establish that the three coordinates exhaust the structural information of $\mathrm{Dom}(m, t)$. Additional coordinates — for instance, a future $Fz$ coordinate (cf. Gap 8) or a pathway-order class (formalized in §4.4) — may add information beyond what $(\kappa, \phi, \rho)$ captures. The architecture leaves room for such additions.

## 6.7 Forward dependencies

`07_open_questions.md` records the open questions concerning the formal apparatus, including the question of whether the three coordinates are *exhaustive* (`oq:coordinate-exhaustiveness`) — a question the propositions of this chapter do not resolve.

---

*End of 06_independence_lemmas.md.*


<!-- SOURCE: outputs/formalization/07_open_questions.md -->


# TLICA Formal Apparatus, Rigorous Edition

## 07. Open Questions

> **Status:** Draft v0.1.
> **Relationship to 00–06.** This file records the residual open theoretical questions of the rigorous edition. The questions are organized into three categories: (a) questions inherited from the Math Ledger that have been *resolved* by commitments in this edition; (b) questions inherited from the Math Ledger that *remain genuinely open* after this edition; and (c) new questions surfaced by the formalization work itself. The point of the file is to make the apparatus's residual indeterminacy explicit, so that future revisions can address what remains rather than rediscovering it.

## 7.1 Questions resolved by this edition

The following open questions from the Math Ledger v0.1 are resolved by the commitments in `00`–`06`. They are recorded here in resolved form so the trace is preserved.

### 7.1.1 `oq:maxflow-infinite` — Max-flow on possibly infinite networks

**Resolution.** The graph well-formedness axiom of `0.17` and `2.2` imposes local finiteness and finite reach on every integration graph. Under this regime, max-flow on the (possibly countably infinite) vertex set is well-defined by the standard locally-finite-network theory, takes finite values at every non-source vertex, and supports the strict bound $\rho^{m,k}_t(x) < 1$ for $x \ne \hat\iota_m$ (Lemma 2.4.2). This resolves the open question without altering any theoretical commitment of the core architecture; the regime is operationally appropriate for substrate-bounded modeling I's over finite lifespans.

### 7.1.2 `oq:pathway-object` — Status of a verification pathway as a formal object

**Resolution.** Definition 3.4.1 formalizes a verification pathway as a finite sequence $(\pi_0, \pi_1, \ldots, \pi_n)$ with $\pi_0 \in \mathsf{Int}$, $\pi_n = x$, and each transition justified by some $T \in \mathsf{Tools}^m_t$. The constructibility domain $\mathrm{Verif}(m, t)$ is the set of items admitting a pathway. The conditional-depth function $n_{m,t}(x)$ is the minimum pathway length over the (well-ordered) length set. No metalinguistic-only reading remains.

### 7.1.3 `oq:K-features-required` — What structural features of $\mathbb{K}$ are actually used

**Resolution.** §0.3 lists the structural requirements on $\mathbb{K}$ in full: total ordering, fixed embedding $\iota_\mathbb{R} : \mathbb{R} \hookrightarrow \mathbb{K}$, and a fixed positive infinitesimal $\delta$. The admissibility lemma (§0.3) shows that any such $\mathbb{K}$ supports the cogito φ-axiom. The architecture is parametrized over admissible $\mathbb{K}$. No additional features of $\mathbb{K}$ are required by the apparatus.

## 7.2 Questions remaining open after this edition

The following open questions from the Math Ledger v0.1 are not resolved by this edition and require future theoretical commitment.

### 7.2.1 `oq:phenomenology-status-axioms` — Axioms governing $A_{m,t}$

The phenomenal-availability predicate $A_{m,t} : \mathsf{A}^m_t \to \{0, 1\}$ is committed in `0.11` as a status indicator, but the architecture imposes no axioms governing its evolution in $t$ or its interaction with $\mathsf{Foc}^m_t$. Two natural candidates are: (i) *focus-availability coupling*, $\mathrm{supp}(\mathsf{Foc}^m_t) \subseteq \mathsf{A}^{+,m}_t$, requiring that everything in focus is phenomenally available; and (ii) *availability monotonicity*, requiring that once an item has been phenomenally available it remains so in any later moment in which it is in the asymptotic content domain. Neither is committed at the foundation level.

The architecture's reason for the openness is doctrinal: phenomenal availability is a substantive empirical category whose axioms are best calibrated by application work rather than fixed at the foundation. The status of this open question is therefore *open-theoretical* (commitment-needed but not yet made).

### 7.2.2 `oq:profile-comparison` — Profile-to-profile comparison metric

The profile $P_{m,t}$ is a triple-valued indexed family over $\mathrm{Dom}(m, t)$ (Definition 4.1.1). Comparing profiles across $(m, t)$ pairs requires either matching domains $\mathrm{Dom}(m, t) = \mathrm{Dom}(m', t')$ — typically false — or a notion of restriction or correspondence between domains. The architecture does not commit to such a metric at the foundation.

Candidate metrics include: (i) restriction to a common subdomain and pointwise distance on the triples in a chosen norm; (ii) Wasserstein-style transport-distance on the distribution of triples; (iii) topological invariants of the lived-$I$ network. Each candidate carries empirical and conceptual commitments the architecture has not yet made. The status is *open-theoretical*.

### 7.2.3 `oq:probe-measure` — Functional form of $\Lambda^\mu_m$

The probe measure $\mu^m_t = \Lambda^\mu_m(\mathsf{Foc}^m_t, \kappa^{\text{out}}_{m,t}, (Q^m_t, \mathcal{Q}^m_t))$ is produced by an open function with declared signature but unspecified form (`0.15`, §3.5). The architecture's reason for the openness is structural: the form of $\Lambda^\mu_m$ encodes substantive commitments about how focus and contact aggregate into a probe-weighting, and the architecture is parametrized over admissible $\Lambda^\mu_m$. The status is *open-theoretical* with deferral to application work.

### 7.2.4 `oq:rho-modes-K` — Structure of the mode index set $K$

The index set $K$ of integration modes is committed to be non-empty with $|K|$ finite or countably infinite (`0.17`). The architecture does not specify which: a finite $K$ (say $|K| = 2$ for cognitive and somatic, or $|K| = 3$ for cognitive, somatic, affective) is one option; a countably infinite $K$ (modeling a fine-grained mode decomposition) is another. The mode-weight family $(a_k(m, t))_k$ is summable to $1$ in either case (Proposition 2.5.1, 5.7.2), so the apparatus is robust to either choice. The status is *open-theoretical* with the canonical-finite-$K$ reading preferred by current application work.

### 7.2.5 `oq:osmotic-bandwidth` — Quantitative bandwidth of osmotic imprinting

The osmotic rates $(\alpha_{\text{osm}}, \beta_{\text{osm}})$ are committed in §5.5 with the signature of open functions and the qualitative property of being "much smaller" than the focus-driven rates. The quantitative bandwidth — the ratio of osmotic to focus-driven rates, the time-scale of osmotic dynamics, the per-mode variation — is not committed. The status is *open-theoretical* with application calibration required.

### 7.2.6 `oq:tool-reinforcement` — Toolset reinforcement dynamics

The toolset $\mathsf{Tools}^m_t$ evolves in $t$, but the rigorous edition does not formalize the dynamics (§5.6.1). The architecture's commitment is qualitative: tools are gained by learning, lost by forgetting or disabling. The specific mechanism is open. The status is *open-theoretical*.

## 7.3 Questions newly surfaced by the rigorous edition

The formalization work in `00`–`06` surfaces several questions that were not articulated in the pre-rigorous architecture.

### 7.3.1 `oq:coordinate-exhaustiveness` — Are the three coordinates exhaustive?

Theorem 6.5.1 establishes that the three coordinates $\kappa^{\text{in}}_{m,t}, \phi_{m,t}, \rho_{m,t}$ are pairwise non-reducible. The theorem does not establish that they are *exhaustive* — i.e. that the triple $\Phi_{m,t}(x)$ captures all the structural information of the apparatus about $x$ at $(m, t)$.

Counter-candidates to exhaustiveness include: the pathway-order coordinate $D_{m,t}(x)$ from §4.4 (a categorical type not derivable from the three coordinates); the mode-vector $\vec\rho^m_t(x)$ from §2.7 (richer than the scalar $\rho_{m,t}(x)$); a future $Fz$ coordinate if promoted (§4.7). The architecture's structural commitment is to the *primacy* of the three coordinates in the profile, not to their exhaustiveness. The status is *open-theoretical*.

### 7.3.2 `oq:Fz-promotion` — Status of the fuzziness coordinate (formerly Gap 8)

The fuzziness coordinate $Fz$ from the core architecture (File 3 §8.5.4) is excluded from the rigorous edition at this revision (§4.7), on the recommendation of the Rigor Report (Gap 8). The exclusion is *tentative*: future revisions may promote $Fz$ if a suitable signature and role in the profile are articulated.

Specifically, promotion would require: (a) a signature for $Fz_{m,t}$ on $V^m_t$ or a sub-domain; (b) a functional form, plausibly as a function of pathway-order assignments $D_{m,t}$ or of mode-vector spread $\vec\rho^m_t$; (c) a role in either the static profile (changing Definition 4.1.1) or in the dynamics. The status is *promotion-candidate*.

### 7.3.3 `oq:inside-projection-specification` — Specifying the inside projection

§1.12.1 introduces the inside/outside distinction at the level of the model-instance tuple, with the inside tuple being the I-internal projection. The projection itself is described qualitatively but not given a formal definition. Articulating the inside projection precisely — which components of the model instance are accessible to the I and which are not — is open work. Candidates: (i) the inside projection drops $\sigma^m_t$, the substrate $\mathsf{S}_m$, and the open functions $\Gamma^M_m$, $A^k_m$ (the "outside" components), retaining the rest; (ii) the inside projection drops the *parametric* components (open functions, $\mathbb{K}$, $\mathfrak{I}$) and retains the *fibered* components ($\hat\iota_m$, $\mathsf{Tools}^m_t$, $\mathsf{Foc}^m_t$, the asymptotic content domain). The architecture's natural reading is closer to (i), but a fully formal specification is open.

### 7.3.4 `oq:persistence-construction` — Constructive form of $\sim^m_H$

The persistence equivalence $\sim^m_H$ is posited as an equivalence relation on $\widetilde{\mathsf{H}}^m_t$ satisfying the coherence axiom (`0.12`). The apparatus does not specify *how* $\sim^m_H$ is constructed — what features of tokens determine their persistence equivalence, what the role of the I's introspective tracking is, what the relation between $\sim^m_H$ and the I's identity judgments is. The architecture treats $\sim^m_H$ as posited at the foundation level. A constructive theory of persistence is open work.

### 7.3.5 `oq:edge-merge-protocol` — Edge-structure compatibility under persistence merge

§2.6.2 commits the edge structure to be compatible with the persistence quotient: when two tokens become $\sim^m_H$-equivalent, edges to and from their classes are identified and weights combined. The apparatus is permissive about the *combination rule* — parallel-edge aggregation, weight-max, weight-sum-capped — and notes that the choice does not affect max-flow up to bounded factors. A fully specified combination rule, with its consequences for dynamic profile evolution, is open work. The status is *application-level* but with theoretical residue.

### 7.3.6 `oq:phi-tier-boundary` — The boundary between Tier 2 and Tier 3 *(CLOSED in v0.3)*

The cogito's $\phi$-value $1 - \delta$ is set by axiom; the Tier-3 $\phi$-formula $1 - n\delta - \epsilon$ recovers $1 - \delta$ only in the limit $n = 1, \epsilon = 0$. In v0.2 the architecture's claim that no Tier-3 item attains this limit was offered as posit-with-defective-proof in Proposition 3.3.7. The external verification report (§3, defect 4) flagged this as a substantive proof gap.

The v0.3 revision closes the question by introducing the *Tier-3 strictness axiom* in §0.14:

$$n_{m,t}(x) \cdot \delta + \epsilon_{m,t}(x) > \delta \quad \text{for every } x \in \mathrm{Verif}(m, t) \cap \mathsf{A}^m_t.$$

Together with the φ-admissibility bound $\epsilon + n\delta \le 1$ (also added in v0.3), this places $\phi_{m,t}(x) \in [0, 1 - \delta)$ for every non-cogito verified content, with $1 - \delta$ uniquely attained at the cogito. Proposition 3.3.7 becomes a genuine theorem in v0.3 rather than a posit. The boundary between Tier 2 and Tier 3 is cleanly drawn by the strictness axiom, and no Tier-3 content can be infinitesimally close to the cogito's φ-value.

## 7.4 The status table

We summarize the status of open questions across the rigorous edition.

| Question | Status | Where addressed |
|---|---|---|
| `oq:maxflow-infinite` | *resolved* (locally-finite, finite-flow regime) | §0.17, §2.2 |
| `oq:pathway-object` | *resolved* (finite-sequence formalization) | §0.14, §3.4 |
| `oq:K-features-required` | *resolved* (three structural requirements) | §0.3 |
| `oq:phenomenology-status-axioms` | *open-theoretical* | §1.6.2, §7.2.1 |
| `oq:profile-comparison` | *open-theoretical* | §4.1.2, §7.2.2 |
| `oq:probe-measure` | *open-theoretical* | §3.5, §7.2.3 |
| `oq:rho-modes-K` | *open-theoretical* | §0.17, §7.2.4 |
| `oq:osmotic-bandwidth` | *open-theoretical* | §5.5.3, §7.2.5 |
| `oq:tool-reinforcement` | *open-theoretical* | §5.6.1, §7.2.6 |
| `oq:coordinate-exhaustiveness` | *open-theoretical* | §6.6.3, §7.3.1 |
| `oq:Fz-promotion` | *promotion-candidate* | §4.7, §7.3.2 |
| `oq:inside-projection-specification` | *open-theoretical* | §1.12.1, §7.3.3 |
| `oq:persistence-construction` | *open-theoretical* | §0.12, §7.3.4 |
| `oq:edge-merge-protocol` | *application-level + residue* | §2.6.2, §7.3.5 |
| `oq:phi-tier-boundary` | *resolved in v0.3 (Tier-3 strictness axiom)* | §0.14, §3.3.6, Prop 3.3.7, §7.3.6 |

Of fifteen entries, four are resolved by this edition (oq:maxflow-infinite, oq:pathway-object, oq:K-features-required, oq:phi-tier-boundary), eight remain open-theoretical, one is a promotion candidate, one is application-level with theoretical residue, and the φ-tier-boundary entry moved from clean-up status to fully resolved in v0.3. The trajectory across editions should be: the open-theoretical entries become resolved (with theoretical commitments) or split into resolved-and-residual portions; the promotion-candidate either is promoted or is explicitly dropped.

## 7.5 Closing note on the rigorous edition

The rigorous edition is not a replacement for the core foundation (Files 1–5 of `sources/core/`). It is a stratum of the apparatus lifted to a level at which type signatures, well-definedness, and proof obligations are explicit. The core foundation retains the substantive doctrine of the architecture — the tautological cogito, the three-tier ontology, the in re universality of the intrinsic layer, the asymmetry between inside and outside perspectives, the substantive role of substrate-mediation in pathway-order lossiness. The rigorous edition adds: type-level transparency, well-typedness guarantees for derived constructions, formal proofs where the architecture's claims can already be proven (Propositions 1.1, 1.2, 2.4.2, 2.5.1, 2.8.1, 3.3.7, 5.7.2, Theorem 6.5.1, and the independence Propositions 6.2.1, 6.3.1, 6.4.1).

Future revisions of the rigorous edition will progressively close the open questions, either by additional theoretical commitments or by demonstrating that a question's apparent openness is dissolved by re-formalization. The aim is not a complete elimination of openness — the architecture's domain admits genuine theoretical questions — but a clear separation between commitments, derivations, and residual openness, so that each can be addressed on its own terms.

---

*End of 07_open_questions.md.*
