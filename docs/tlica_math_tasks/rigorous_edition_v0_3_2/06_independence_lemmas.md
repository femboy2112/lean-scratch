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
