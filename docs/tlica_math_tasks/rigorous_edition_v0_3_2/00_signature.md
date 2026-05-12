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
