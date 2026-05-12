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
