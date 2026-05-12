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
