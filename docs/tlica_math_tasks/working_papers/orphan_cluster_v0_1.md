# Foundation Orphan Cluster — A Working Paper (v0.1)

> **Purpose.** Substantive math on the five-orphan cluster identified in `rosetta_stone_v0_2.md` §12.3–12.7: the maximally-self-defined I ($\mathsf{MSI}$), the prerogative of consistency ($\mathsf{PtCns}$), the prerogative of continued existence ($\mathsf{PCE}$), the preservation-ranking ($\Pi$), and the future-state projection map ($\mathsf{Project}$). Plus the two related orphans Modes A/B/C (§12.1) and the I/not-I boundary (§12.2), since they are downstream consumers of $\mathsf{PtCns}$ and have natural formal apparatus once the cluster's primary orphans are in place.

> **Scope.** Foundation-ready type signatures and axiom systems, with candidate functional forms surveyed. The working-paper discipline is *structured agnosticism* — the same pattern the profile-comparison v0.2 paper uses for Gap 12: declare the signatures and the structural axioms, leave the functional forms open and application-calibrated. Each orphan in the cluster gets the same treatment.

> **Status.** Working paper, v0.1. Type signatures and axiom systems at foundation-ready level; candidate functional forms identified but not committed; Lean encoding targets sketched at module-design level; integration path into the v0.4 rigorous edition outlined. v0.1 of this paper is parallel in scope and discipline to `profile_comparison_v0_1.md`.

> **Relationship to existing work.** This paper draws on the prerogative formalization sketch I produced when first asked about PtCns and PCE, and extends it across the full cluster. The structured-agnosticism pattern follows `profile_comparison_v0_2.md` §9 and the Rosetta-stone v0.2 finding (§19 structural finding 1) that closing this cluster simultaneously unblocks a large fraction of application-level signature-pending items.

---

## 1. The problem

### 1.1 What the cluster is

The foundation-level orphan cluster consists of seven concepts that have theoretical statement but no math representation in the v0.3.2 rigorous edition:

- $\mathsf{MSI}^m_t$ — the maximally-self-defined I (§4.8 of File 2);
- $\mathsf{PtCns}_{m, t}$ — the prerogative of consistency (§4.8 of File 2, §9.5 of File 4);
- $\mathsf{PCE}_{m, t}$ — the prerogative of continued existence (§4.8 of File 2, §10.7 of File 4);
- $\Pi_{m, t}$ — the preservation-ranking (§10.7 of File 4);
- $\mathsf{Project}_{m, t}$ — the future-state projection map (§10.7 of File 4);
- $\Phi^A_{m,t}, \Phi^B_{m,t}, \Phi^C_{m,t}$ — the three modes of I-development (§4 of File 2);
- $\partial^{\text{I}}_{m, t}$ — the I/not-I boundary (§4.5 of File 2).

The architecture's deliberate silence on their formal apparatus is explicitly stated for $\Pi_{m,t}$: *"Formal development of $\Pi_{m,t}$ as an architectural object distinct from $\rho$ is application-level work; at the foundation level the placeholder is named to prevent $\rho$-leakage into preservation-priority"* (File 2 §4.8). The same deferral pattern applies implicitly to the other six.

### 1.2 Why now

The Rosetta stone v0.2 (§19, structural finding 1) made the dependency cascade fully visible: many application-level concepts in the agency, affect, and religious experience papers depend on these orphans. PtCns is invoked by §15.5 ownership-integration, §16.2 reflexive PtCns, §16.7 self-cluster affects, §17.9 frame-preserving union. PCE is invoked by §16.8 threat-cluster affects, §16.16 self-annihilation compound. MSI is invoked by §16.5 love, §17.2 frame-position criteria. Project is invoked by §14.11 trying, §16.8 threat-cluster, §16.16 suicidality. Π is invoked across all of these as the structural site of "preservation-priority" dynamics.

Closing this cluster — even at the structured-agnosticism level — unblocks approximately twenty application-level signature-pending items simultaneously, and produces a foundation that can support the application papers without each paper needing to re-introduce its own version of the cluster's primitives.

### 1.3 Internal dependency structure

The seven orphans are not independent. The dependency order is:

```
MSI ────► Π ────► PCE
 │        │       ▲
 │        │       │
 │        ▼       │
 │      Project ──┘
 ▼
PtCns ────► Modes A, B, C ────► I/not-I boundary
```

$\mathsf{MSI}$ is a sub-set of the lived-I network and is referenced by $\Pi$, $\mathsf{Project}$, and $\mathsf{PCE}$. $\Pi$ is referenced by $\mathsf{PCE}$. $\mathsf{Project}$ is referenced by $\mathsf{PCE}$. $\mathsf{PtCns}$ is an independent feature that governs Mode A / Mode C selection. The I/not-I boundary emerges from Mode A / Mode C operation.

The working paper develops the cluster in dependency order: MSI first (§3), Π second (§4), Project third (§5), PCE fourth (§6, the composite), then PtCns (§7), Modes (§8), and the boundary (§9).

---

## 2. Notation and structural shape

Throughout this paper, $m$ is a modeling I, $t \in T_m$ is its temporal index, $\mathsf{A}^m_t$ is the asymptotic content domain, $\mathfrak{L}^m_t \subseteq \mathsf{A}^m_t \cup \{\hat\iota_m\}$ is the support-lived-I network (Definition 4.2.1 of the rigorous edition), $\hat\iota_m$ is the cogito, $\rho_{m, t} : \mathsf{A}^m_t \to [0, 1]$ is the scalar identity-correlation coordinate, $\phi_{m, t}$ is the truth-indistinguishability coordinate, $\kappa^{\text{in}}_{m, t}$ is the inbound contact coordinate, and $P^\rho_{m, t}$ is the base profile.

**Structural shape of the cluster.** The orphan cluster is structurally distinct from the rigorous edition's coordinate apparatus: coordinates are functions from $(m, t, x)$ to a value space (numerical measurements of $x$); the orphan cluster consists of *structural features that operate over the apparatus* — they take profiles, networks, or contents and produce evaluations, orientations, selections, or boundaries that govern how the apparatus evolves.

This is the same structural-shape observation I made when the user first asked about PtCns and PCE. The implication is that the orphan cluster fits a *prerogative-and-operator framework* rather than a coordinate framework. Specifically:

- **MSI** is a *distinguished sub-structure* of the lived-I network.
- **Π** is a *ranking* on subsets of the lived-I.
- **Project** is a *transition function* from current state and action to projected future state.
- **PCE** is an *action-orientation principle* that selects actions to maximize Π under Project.
- **PtCns** is an *evaluation function* on encounters with not-I contents.
- **Modes A/B/C** are *evolutionary operators* on the profile.
- **The boundary** is a *derived structural region* of the asymptotic content domain.

The cluster fits seven distinct mathematical types; the foundation's job is to give each its type and its axiomatic shape, leaving functional form open.

---

## 3. The maximally-self-defined I (MSI)

### 3.1 Theoretical statement

The architecture states: "*The maximally-self-defined I is the action-relevant configuration of the lived-I network whose preservation counts, for the modeling I under current conditions, as continuation of itself.*" Cf. `2_access_and_development.md` §4.8.

Three operative phrases here: "configuration of the lived-I network" (subset of $\mathfrak{L}^m_t$), "action-relevant" (selection by current dispositional context), "preservation counts as continuation" (load-bearing for PCE).

### 3.2 Type signature

**Definition 3.2.1** (MSI type signature, foundation-ready form).

$$\mathsf{MSI}^m_t : T_m \to \mathcal{P}(\mathfrak{L}^m_t).$$

For each modeling I $m$ and time $t$, $\mathsf{MSI}^m_t$ is a subset of the support-lived-I network.

### 3.3 Axioms

**Axiom 3.3.1** (cogito inclusion). $\hat\iota_m \in \mathsf{MSI}^m_t$ for every $t \in T_m$.

This captures the architecture's commitment that the cogito-anchoring is fundamental: the I cannot have a "maximally-self-defined I" that excludes its own structural anchor.

**Axiom 3.3.2** (lived-I containment). $\mathsf{MSI}^m_t \subseteq \mathfrak{L}^m_t$ for every $t$.

The MSI is a sub-configuration of the I's current lived-I network, not an external object.

**Axiom 3.3.3** (high-ρ density). For every $x \in \mathsf{MSI}^m_t \setminus \{\hat\iota_m\}$, $\rho_{m,t}(x) > 0$ with a typical lower bound: $\rho_{m,t}(x) \ge \theta^{\text{MSI}}_{m,t}$ for some threshold $\theta^{\text{MSI}}_{m,t} \in (0, 1)$.

This formalizes "action-relevant configuration" via $\rho$-thresholding: MSI contents are not the marginal contents of the lived-I but its core. The threshold $\theta^{\text{MSI}}_{m,t}$ is allowed to depend on $(m, t)$ — the architecture does not commit to a universal threshold — and is itself parametric.

**Axiom 3.3.4** (closure under PCE-equivalence). If $S \subseteq \mathfrak{L}^m_t$ is a configuration whose preservation under typical Project outcomes is equivalent to $\mathsf{MSI}^m_t$'s preservation (in the sense that the I treats their preservation as equally continuation-of-self), then $S = \mathsf{MSI}^m_t$.

This is a maximality axiom: MSI is the maximal preservation-relevant configuration.

### 3.4 Candidate functional forms

Four candidate characterizations of MSI are visible in the architecture's prose. Each is a foundation commitment that would specify $\mathsf{MSI}^m_t$ functionally; the foundation may declare MSI axiomatically (§3.3) and let applications choose among the candidates.

**Candidate 3.4.1** (threshold-based MSI).

$$\mathsf{MSI}^m_t := \{x \in \mathfrak{L}^m_t : \rho_{m,t}(x) \ge \theta^{\text{MSI}}\}.$$

Simplest and most tractable. Requires only a threshold $\theta^{\text{MSI}} \in (0, 1)$, possibly $(m, t)$-dependent. Captures "action-relevant configuration" via $\rho$-density. Does not directly capture the "current conditions" dependency.

**Candidate 3.4.2** (cogito-component MSI).

Treat $\mathfrak{L}^m_t$ as an undirected graph induced from $G^{m, k}_t$ (the integration graph for mode $k$). $\mathsf{MSI}^m_t$ is the connected component containing the cogito.

This captures the structural-connectivity intuition: MSI contents are precisely those that are graph-connected to the cogito through the integration network. Does not directly use $\rho$ values; uses topology.

**Candidate 3.4.3** (action-relevance MSI).

$$\mathsf{MSI}^m_t := \{x \in \mathfrak{L}^m_t : x \text{ is referenced by some currently-active will-pathway from } \hat\iota_m\}.$$

This is closest to the architecture's "action-relevant" language. Requires that "currently-active will-pathway" be formalized, which involves the operator-bundle apparatus of the agency paper (§14.10 of the Rosetta stone).

**Candidate 3.4.4** (Π-maximal MSI).

$$\mathsf{MSI}^m_t := \arg\max_{S \subseteq \mathfrak{L}^m_t : \hat\iota_m \in S} \Pi_{m, t}(S).$$

Circular if $\Pi$ is itself defined relative to MSI (as in §4 below). Can be made non-circular if $\Pi$ is defined as a ranking on $\mathfrak{L}^m_t$-subsets without explicit MSI reference, and $\mathsf{MSI}$ is then defined as the $\Pi$-maximum.

**Recommendation**: foundation declares MSI axiomatically (§3.3). Candidate 3.4.1 is the cleanest minimal commitment; Candidates 3.4.2 and 3.4.3 are richer and capture more of the architecture's intent but require additional formal apparatus.

### 3.5 Lean encoding

```
structure MSI (m : ModelI) (t : Time m) where
  contents : Set (LivedI m t)
  cogito_in : (cogitoOf m) ∈ contents
  density   : ∀ x ∈ contents, x ≠ (cogitoOf m) → rho m t x ≥ msiThreshold m t
  maximal   : ∀ S : Set (LivedI m t), 
              isPCEEquivalent S contents → S = contents
```

The encoding declares MSI as a structure carrying its contents and the three axioms. Functional form (Candidate 3.4.1 vs others) becomes a separate definition that *instantiates* MSI.

---

## 4. The preservation-ranking Π

### 4.1 Theoretical statement

The architecture introduces $\Pi$ as "a situational *preservation-ranking* over possible profile-configurations and losses... distinct from $\rho$. The preservation-ranking $\Pi_{m,t}$ may depend on $\rho$ but is not reducible to it; $\rho$ measures identity-correlation (structural integration into the lived-I network), not valuation, preservation-priority, or action-priority." Cf. `2_access_and_development.md` §4.8 and `4_derived_concepts_and_predictions.md` §10.7.

$\Pi$ is therefore a value-rank, not a coordinate. It assesses sub-configurations of the lived-I for preservation-priority.

### 4.2 Type signature

**Definition 4.2.1** (Π type signature, foundation-ready form).

$$\Pi_{m, t} : \mathcal{P}(\mathfrak{L}^m_t) \to \mathbb{R}_{\ge 0}.$$

For each profile-configuration $S \subseteq \mathfrak{L}^m_t$, $\Pi_{m, t}(S)$ is a non-negative real measuring the preservation-priority the I assigns to maintaining $S$.

**Remark 4.2.2** (alternative codomain). Some applications may prefer $\Pi$ as a partial order on $\mathcal{P}(\mathfrak{L}^m_t)$ rather than a real-valued ranking. The architecture's commitments are compatible with either; the real-valued form is more tractable mathematically and is the foundation-recommended default.

### 4.3 Axioms

**Axiom 4.3.1** (cogito necessity). $\Pi_{m, t}(S) > 0$ implies $\hat\iota_m \in S$.

Preservation is meaningful only for configurations that preserve the cogito. A configuration that excludes the cogito has $\Pi = 0$ (no preservation-priority).

**Axiom 4.3.2** (MSI maximality). 

$$\Pi_{m, t}(\mathsf{MSI}^m_t) = \max_{S \subseteq \mathfrak{L}^m_t} \Pi_{m, t}(S).$$

The MSI is the preservation-maximum. (This connects Π to MSI; combined with Candidate 3.4.4, the two could be defined as a fixed-point pair, but the foundation declares them independently and connects them via this axiom.)

**Axiom 4.3.3** (monotonicity for MSI components). For configurations $S, T$ with $\hat\iota_m \in S \cap T$,

$$S \cap \mathsf{MSI}^m_t \supseteq T \cap \mathsf{MSI}^m_t \implies \Pi_{m, t}(S) \ge \Pi_{m, t}(T).$$

Adding MSI contents to a configuration never decreases its preservation-priority.

**Axiom 4.3.4** (non-MSI insensitivity, conditional). For $S \subseteq \mathfrak{L}^m_t$ with $\hat\iota_m \in S$, and for $x \notin \mathsf{MSI}^m_t$,

$$\Pi_{m, t}(S \cup \{x\}) - \Pi_{m, t}(S) \text{ is "small"}.$$

Adding non-MSI contents does not strongly change preservation-priority. The exact form of "small" is application-calibrated (a Lipschitz bound, a fractional bound, or a threshold).

**Axiom 4.3.5** (separation from ρ). $\Pi_{m, t}$ is not equal to $\rho_{m, t}$, and $\Pi$ may track features that $\rho$ does not (substrate urgency, future-projection, third-order pathway dynamics — the "factors beyond $\rho$-magnitude" of foundation §11.2 exclusion 19).

This is more of a meta-axiom than a structural axiom: it captures the architecture's explicit insistence that $\Pi$ is not reducible to $\rho$. Operationally, this means $\Pi$'s functional form must include parameters not derivable from $\rho$ alone.

### 4.4 Candidate functional forms

**Candidate 4.4.1** (ρ-weighted Π).

$$\Pi_{m, t}(S) := \sum_{x \in S \cap \mathsf{MSI}^m_t} w_{m, t}(x) \cdot \rho_{m, t}(x),$$

where $w_{m, t} : \mathsf{MSI}^m_t \to \mathbb{R}_{> 0}$ is an application-calibrated weighting that captures the "factors beyond $\rho$" of Axiom 4.3.5. Reduces to pure ρ-sum when $w \equiv 1$, but axiom 4.3.5 requires $w$ to capture non-ρ information.

**Candidate 4.4.2** (cardinality-weighted Π).

$$\Pi_{m, t}(S) := |S \cap \mathsf{MSI}^m_t|.$$

Simplest possible. Loses the gradation across MSI contents.

**Candidate 4.4.3** (lex-ordered Π).

$\Pi$ as a partial order with cogito-presence dominating, then MSI-coverage, then ρ-sum. Captures the structural priority pattern without numerical commitment.

**Candidate 4.4.4** (learned Π).

$\Pi$ as a learned function from the I's history, parameterized by experience. The architecture's "*how it is established, updated, and brought to bear*" language (§10.7) suggests this. Computationally substantial; probably application-level.

**Recommendation**: foundation declares Π axiomatically (§4.3). Candidate 4.4.1 with $w \equiv 1$ as default (the pure ρ-sum over MSI) gives a foundation-tractable instantiation; applications can over-ride $w$ for richer preservation-priority capture.

### 4.5 Lean encoding

```
structure PreservationRanking (m : ModelI) (t : Time m) (msi : MSI m t) where
  rank        : Set (LivedI m t) → ℝ≥0
  cogito_nec  : ∀ S, rank S > 0 → cogitoOf m ∈ S
  msi_max     : rank msi.contents = sSup (rank '' (powerset (LivedI m t)))
  monotone    : ∀ S T, cogitoOf m ∈ S ∩ T → 
                  S ∩ msi.contents ⊇ T ∩ msi.contents → 
                  rank S ≥ rank T
```

---

## 5. The future-state projection map

### 5.1 Theoretical statement

The architecture references "anticipated/projected future-states" in PCE's operation and "inaccurate future-state projection" in suicidality. Cf. `4_derived_concepts_and_predictions.md` §10.7, §10.5.6.

The Project map is the I's representation of how a candidate action would change the lived-I network and the MSI.

### 5.2 Type signature

**Definition 5.2.1** (Project type signature, foundation-ready form).

$$\mathsf{Project}_{m, t} : \mathsf{Actions}_{m, t} \times \mathcal{P}^\rho_{m, t} \to \mathcal{D}(\mathcal{P}^\rho_{m, t + \Delta}),$$

where $\mathsf{Actions}_{m, t}$ is the action-space available to $m$ at $t$ (application-defined), $\mathcal{P}^\rho_{m, t}$ is the space of $\rho$-profiles at time $t$, $\Delta > 0$ is a forward-projection horizon, and $\mathcal{D}(X)$ is the space of probability distributions on $X$.

**Remark 5.2.2** (deterministic special case). When the I's projection apparatus is deterministic at $(m, t)$, $\mathsf{Project}$ produces a Dirac measure and reduces to a function $\mathsf{Actions}_{m, t} \times \mathcal{P}^\rho_{m, t} \to \mathcal{P}^\rho_{m, t + \Delta}$. Most foundation work can proceed at the deterministic level; the stochastic codomain is preserved to support distorted-projection analysis.

### 5.3 Axioms

**Axiom 5.3.1** (identity action). $\mathsf{Project}_{m, t}(\text{no action}, P) \approx$ the natural evolution of $P$ under the foundation's update rule (§9.1 of Rosetta stone).

The "do nothing" projection should match the apparatus's autonomous dynamics. This connects Project to the established dynamics machinery.

**Axiom 5.3.2** (causal locality). If action $a$ has its effects confined to a sub-region $R \subseteq \mathfrak{L}^m_t$, then $\mathsf{Project}_{m, t}(a, P)$ differs from $\mathsf{Project}_{m, t}(\text{no action}, P)$ only on $R$ (in the support of the distribution).

Actions don't have non-local effects in the projection.

**Axiom 5.3.3** (MSI projection composition). Define the projected MSI as

$$\mathsf{MSI}^{m, \text{proj}}_{t + \Delta}(a) := \mathsf{MSI}^m_{t + \Delta} \text{ evaluated on the projected profile } \mathsf{Project}_{m, t}(a, P^\rho_{m, t}).$$

Then $\mathsf{MSI}^{m, \text{proj}}_{t + \Delta}(a)$ is the input for PCE evaluation of $a$ (cf. §6.2 below).

**Axiom 5.3.4** (distortion regime). The Project map can be inaccurate (distortions of the I's projection apparatus); this is the architectural mechanism behind §10.5.6's "distorted future-state projection in severe depression." Inaccuracy is modeled as a divergence between the I's $\mathsf{Project}_{m, t}$ and the "ground-truth" projection that would obtain if the apparatus were maximally accurate.

### 5.4 Candidate functional forms

**Candidate 5.4.1** (rule-based Project).

$\mathsf{Project}_{m, t}(a, P)$ produces the deterministic update of $P$ that would result from applying action $a$'s mode-update effect via the foundation's update rule (§9.1). Captures the "natural dynamics" branch of Axiom 5.3.1 with action-driven imprinting added.

**Candidate 5.4.2** (Bayesian Project).

$\mathsf{Project}_{m, t}$ is a Bayesian posterior over future profiles given action $a$ and current evidence. Stochastic by design. Computationally heavy; probably application-level.

**Candidate 5.4.3** (osmotic-imprinting-aware Project).

A variant of Candidate 5.4.1 that incorporates substrate-level osmotic effects (§12.9 orphan).

**Recommendation**: foundation declares Project axiomatically (§5.3) with Candidate 5.4.1 as the default deterministic instantiation. Stochastic and Bayesian variants are application-level.

### 5.5 Lean encoding

```
structure ProjectMap (m : ModelI) (t : Time m) (Δ : Time m) where
  project : Action m t → ScalarProfile (Content m) → 
            ProbabilityMeasure (ScalarProfile (Content m))
  identity_action : ∀ P, project NoAction P = naturalDynamics P
  causal_locality : ∀ a P, support (project a P) ⊆ 
                    affectedRegion a P × naturalDynamics
```

---

## 6. The prerogative of continued existence (PCE)

### 6.1 Theoretical statement

PCE is "the structural feature by which the modeling I structurally pulls toward the path that maximizes continued existence of the *maximally-self-defined I*." Cf. `2_access_and_development.md` §4.8.

PCE operates on actions, evaluates them via projection through Π over MSI, and selects the maximizing action under existential pressure. PCE can be "defeated, misdirected, or routed through distorted projections" — these failure modes are application-relevant for suicidality and self-sacrifice cases.

### 6.2 Type signature and composite definition

**Definition 6.2.1** (PCE type signature and definition).

$$\mathsf{PCE}_{m, t} : \mathsf{Actions}_{m, t} \to \mathbb{R}_{\ge 0},$$

$$\mathsf{PCE}_{m, t}(a) := \mathbb{E}_{P' \sim \mathsf{Project}_{m, t}(a, P^\rho_{m, t})}\left[\Pi_{m, t + \Delta}(P' \cap \mathsf{MSI}^m_{t + \Delta})\right].$$

PCE evaluates an action by projecting forward under Project, intersecting the projected profile with the projected MSI, and ranking under Π. The expectation handles stochastic Project; in the deterministic case it reduces to the Π-value of the projected MSI.

**The action-selection principle:**

$$a^\star_{m, t} \in \arg\max_{a \in \mathsf{Actions}_{m, t}} \mathsf{PCE}_{m, t}(a).$$

Under existential pressure (when $\Pi_{m, t}(\mathfrak{L}^m_t)$ is at risk of dropping significantly), this selection operates as the I's dominant action-orientation; otherwise other criteria may co-operate.

### 6.3 Axioms

**Axiom 6.3.1** (well-definedness). For every $a \in \mathsf{Actions}_{m, t}$, $\mathsf{PCE}_{m, t}(a)$ is well-defined as a non-negative real (or $+\infty$ if the Π codomain is extended).

**Axiom 6.3.2** (existential-pressure activation). When $\Pi_{m, t}(\mathfrak{L}^m_t) < \theta^{\text{ex}}_{m, t}$ for some "existential threshold" $\theta^{\text{ex}}_{m, t}$, the PCE-maximizing selection operates as the dominant action-orientation. Otherwise PCE co-operates with other criteria (effort-economy, social engagement, etc.).

**Axiom 6.3.3** (cogito-orientation under typical conditions). Under typical conditions (accurate Project, undisturbed Π, well-formed MSI), $\arg\max \mathsf{PCE}$ favors actions that preserve the MSI (and hence preserve the cogito by MSI-axiom 3.3.1).

**Axiom 6.3.4** (defeat conditions). PCE can fail to produce cogito-preserving selection when any of:

- (D1) **Project distortion**: $\mathsf{Project}_{m, t}$ is inaccurate, producing inflated $\Pi$-projections for cogito-destructive actions.
- (D2) **Π disturbance**: $\Pi_{m, t}$ is disturbed (e.g., depression's "distorted preservation-ranking"), assigning high preservation-priority to configurations that include self-cessation.
- (D3) **MSI malformation**: $\mathsf{MSI}^m_t$ itself is malformed (e.g., severe depression's collapsed profile support), so that PCE optimizes preservation of a malformed MSI.

These are the architectural mechanisms behind §10.7's self-sacrifice analysis and §10.5.6's severe-depression-and-suicidality analysis. The architecture's claim that "PCE is not metaphysically inviolable" (§11.2 exclusion 20) is captured here: PCE's structural primacy holds, but failure modes are formally specifiable.

### 6.4 Candidate functional forms

The composite Definition 6.2.1 is itself a functional form. Alternatives within this composite shape:

**Candidate 6.4.1** (expectation aggregator, default). The $\mathbb{E}$ in the definition is the standard expectation. Captures average-case future preservation-priority.

**Candidate 6.4.2** (risk-averse aggregator). Replace $\mathbb{E}$ with a risk-averse aggregator (CVaR, worst-case, etc.). Captures the I's risk-aversion in preservation-priority assessment. Empirically supported in some clinical phenomena (e.g., catastrophizing in anxiety).

**Candidate 6.4.3** (time-discounted PCE). $\mathsf{PCE}_{m,t}(a) := \mathbb{E}\left[\sum_\tau \gamma^\tau \Pi_{m, t + \tau}(P' \cap \mathsf{MSI}^m_{t + \tau})\right]$ with discount factor $\gamma$. Captures long-horizon preservation-priority.

**Recommendation**: foundation default is Candidate 6.4.1 (standard expectation); applications can substitute Candidate 6.4.2 or 6.4.3 for specific phenomena.

### 6.5 Self-sacrifice as a PCE phenomenon (architectural commitment)

The architecture commits that self-sacrifice is structurally compatible with PCE: "*self-sacrifice does not refute the cogito-anchoring $\rho_m(\hat\iota_m) = 1$, does not require any non-core $\rho$ to exceed 1, and does not require a hidden valuation coordinate beyond the existing apparatus*." Cf. §10.7.

In the formalism: when a high-ρ non-core network member is in $\mathsf{MSI}^m_t$ (e.g., a beloved child), and an action $a$ has $\mathsf{Project}_{m, t}(a) \cap \mathsf{MSI}^m_{t + \Delta}$ containing that member but not the modeling-I's substrate, $\Pi_{m, t + \Delta}$ on that projected configuration can exceed $\Pi$ on configurations preserving the substrate but losing the high-ρ member. PCE then selects $a$. Self-sacrifice is therefore a PCE-maximizing selection under non-distorted apparatus, not a refutation of PCE.

This is a foundation commitment, recoverable from the composite Definition 6.2.1 without further axioms.

### 6.6 Suicidality as a PCE-defeat compound (architectural commitment)

The architecture identifies severe-depression-with-suicidality as a compound of D1, D2, and D3 of Axiom 6.3.4: distorted projection (depressive futures appear hopeless), distorted Π (death-content appears preservation-positive), and malformed MSI (cogito/thought partition functional collapse — §16.12 of the Rosetta stone — produces an MSI containing depressive content as core). PCE then selects actions whose projected outcome involves substrate cessation because the apparatus has been disturbed such that this appears preservation-optimal.

This is the four-mechanism analysis of §10.7 with the three-condition formalism of Axiom 6.3.4. The architecture's careful "PCE is structurally primary, not metaphysically inviolable" stance is recoverable from this analysis.

### 6.7 Lean encoding

```
noncomputable def PCE (m : ModelI) (t : Time m) (Δ : Time m)
  (msi : MSI m t) (π : PreservationRanking m (t + Δ) (msiAt (t + Δ)))
  (proj : ProjectMap m t Δ) (a : Action m t) : ℝ≥0 :=
  expectation (fun P' => π.rank (P'.contents ∩ (msiAt (t + Δ)).contents))
              (proj.project a (currentProfile m t))
```

---

## 7. The prerogative of consistency (PtCns)

### 7.1 Theoretical statement

PtCns is "*the structural feature by which the I's frame functions as the implicit consistency-standard against which encounters with not-I are evaluated*." Cf. `2_access_and_development.md` §4.2, §4.8.

PtCns operates on encounters — pairings of the I's frame with candidate contents from not-I — and produces evaluations that drive Mode A (differentiation, integration would damage consistency), Mode C (integration, would preserve or extend consistency), or identity-neutral encapsulation (the third case named in §4.5).

Distinct from PCE in structural shape: PCE is action-orientational (chooses among actions); PtCns is evaluative-orientational (assesses encounters). Both fit the prerogative pattern (structural features governing how the apparatus evolves).

### 7.2 Type signature

**Definition 7.2.1** (PtCns type signature, foundation-ready form).

$$\mathsf{PtCns}_{m, t} : \mathsf{A}^m_t \to \mathcal{C},$$

where $\mathcal{C}$ is the *consistency-evaluation space*. Foundation-recommended default: $\mathcal{C} = \{-1, 0, +1\}$.

The three values correspond to:

- $-1$ = PtCns-negative: integrating this content would damage frame-consistency; Mode A differentiation is the structural response.
- $0$ = PtCns-zero: identity-neutral encapsulation; the content is registered as encountered but bounded as non-self-defining.
- $+1$ = PtCns-positive: integrating this content would preserve or extend frame-consistency; Mode C integration is the structural response.

**Remark 7.2.2** (graded variant). A graded codomain $\mathcal{C} = [-1, +1]$ captures graded PtCns evaluations (mild vs strong incompatibility, slight vs full extension). Suitable for clinical applications (hypertrophy / atrophy variants are graded perturbations from baseline). Foundation may declare both forms.

### 7.3 Axioms

**Axiom 7.3.1** (cogito invariance). $\mathsf{PtCns}_{m, t}(\hat\iota_m) = +1$.

The cogito is always consistent with the I's frame (the cogito anchors the frame; any move that would deny it presupposes it).

**Axiom 7.3.2** (asymmetric framing). $\mathsf{PtCns}_{m, t}$ evaluates against the I's frame at $(m, t)$, not against a frame-independent standard.

This captures the "two PtCns structures operating simultaneously" in inter-I encounter (foundation §9.5 of File 4): each I evaluates the other from its own perspective.

**Axiom 7.3.3** (Mode A / Mode C selection). The PtCns evaluation drives evolutionary operator selection:

$$\Phi^A_{m,t} \text{ triggered if } \mathsf{PtCns}_{m,t}(x) = -1,$$
$$\Phi^C_{m,t} \text{ triggered if } \mathsf{PtCns}_{m,t}(x) = +1,$$
$$\text{identity-neutral encapsulation if } \mathsf{PtCns}_{m,t}(x) = 0.$$

(The operators are formalized in §8 below.)

**Axiom 7.3.4** (consistency-standard preservation). Under Mode A, PtCns-negative content does not enter $\mathfrak{L}^m_{t^+}$ (or enters at $\rho = 0$). Under Mode C, PtCns-positive content enters $\mathfrak{L}^m_{t^+}$ at positive ρ. Under identity-neutral encapsulation, the content enters at the lived-I boundary but not in the high-ρ region.

This axiom connects PtCns evaluation to the foundation's ρ dynamics.

### 7.4 Candidate functional forms

Three candidate consistency notions are visible in the architecture. Foundation may declare PtCns parametric in which notion; applications calibrate by selecting one (or a composite).

**Candidate 7.4.1** (ρ-coherence form). 

$$\mathsf{PtCns}^\rho_{m, t}(y) := \begin{cases} +1 & \text{if integrating } y \text{ leaves } \rho_{m, t}(x) \ge \theta^{\text{MSI}} \text{ for all } x \in \mathsf{MSI}^m_t, \\ -1 & \text{if integration would push some } \rho_{m, t}(x), x \in \mathsf{MSI}^m_t, \text{ below } \theta^{\text{MSI}}, \\ 0 & \text{otherwise}. \end{cases}$$

Frame-consistency is operationalized as MSI ρ-stability. Operationally tractable; ties PtCns to MSI and to the update rule.

**Candidate 7.4.2** (φ-coherence form). 

$$\mathsf{PtCns}^\phi_{m, t}(y) := \begin{cases} +1 & \text{if integrating } y \text{ doesn't add a verification-pathway that conflicts with existing Tier-3 verified content}, \\ -1 & \text{if integration would introduce a φ-contradiction}, \\ 0 & \text{otherwise}. \end{cases}$$

Frame-consistency is operationalized as φ-pathway consistency. Captures the "factual encounter" case — discrepant facts, contradicting evidence — particularly cleanly.

**Candidate 7.4.3** (network-coherence form). 

$$\mathsf{PtCns}^{\text{net}}_{m, t}(y) := \begin{cases} +1 & \text{if integrating } y \text{ preserves the connectivity of } \mathfrak{L}^m_t \text{ as a graph}, \\ -1 & \text{if integration would create a cut that separates MSI components}, \\ 0 & \text{otherwise}. \end{cases}$$

Frame-consistency is operationalized as network-topological coherence.

**Candidate 7.4.4** (composite form). 

$$\mathsf{PtCns}^{\text{comp}}_{m, t}(y) := f(\mathsf{PtCns}^\rho_{m, t}(y), \mathsf{PtCns}^\phi_{m, t}(y), \mathsf{PtCns}^{\text{net}}_{m, t}(y))$$

for some aggregator $f$. Captures all three notions simultaneously.

**Recommendation**: foundation declares PtCns axiomatically (§7.3). Candidate 7.4.1 (ρ-coherence form) is the cleanest tractable default; Candidate 7.4.4 (composite) captures the architecture's full intent but is heavier. Applications can choose.

### 7.5 Hypertrophy / atrophy disturbance

The architecture identifies hypertrophied PtCns (the I treats any inconsistency as the not-I's defect) and atrophied PtCns (the I treats its own contents as more inconsistent than not-I, deferring to other frames). Cf. `4_derived_concepts_and_predictions.md` §10.5.1.

In the graded variant ($\mathcal{C} = [-1, +1]$), these are biases in the PtCns evaluation function: hypertrophied PtCns systematically returns values toward $-1$ on plausibly-compatible content; atrophied PtCns systematically returns values toward $0$ or $+1$ on incompatible content.

Formally: a baseline PtCns is $\mathsf{PtCns}^0$; the disturbed PtCns is $\mathsf{PtCns}^{\text{hyper}}_{m, t}(y) = \mathsf{PtCns}^0_{m, t}(y) - \epsilon^{\text{hyper}}_{m, t}$ shifted negative on plausibly-compatible content (with $\epsilon > 0$ the hypertrophy bias); atrophied is the dual shift toward $0$ or $+1$ on incompatible content.

This formalization captures the structural-disturbance status of these pathologies without commitment to specific clinical mechanism.

### 7.6 Lean encoding

```
inductive ConsistencyEval where
  | damage    : ConsistencyEval   -- -1
  | neutral   : ConsistencyEval   --  0
  | preserve  : ConsistencyEval   -- +1

structure PtCns (m : ModelI) (t : Time m) (msi : MSI m t) where
  eval        : Content m → ConsistencyEval
  cogito_pos  : eval (cogitoOf m) = .preserve
  ...
```

For the graded variant, replace `ConsistencyEval` with `Icc (-1 : ℝ) 1`.

---

## 8. Modes A, B, C

### 8.1 Theoretical statement

Modes A, B, C are the three modes of I-development. Mode A (differentiation), Mode B (self-modeling / reflective access), Mode C (integration). Cf. `2_access_and_development.md` §4.

Modes A and C are PtCns-governed: Mode A is the structural response to PtCns-negative encounters; Mode C is the response to PtCns-positive encounters. Mode B is a meta-mode that takes the I's own apparatus as object.

### 8.2 Type signatures

The modes are evolutionary operators on the apparatus state. Their type signature:

$$\Phi^A_{m, t}, \Phi^B_{m, t}, \Phi^C_{m, t} : \mathsf{A}^m_t \times \mathsf{ApparatusState}_{m, t} \to \mathsf{ApparatusState}_{m, t^+},$$

where $\mathsf{ApparatusState}_{m, t}$ encapsulates the relevant state (the integration graph $G^{m, k}_t$, the toolset, the source map, etc.) at time $t$.

In the foundation's update rule of §9.1 of the Rosetta stone, the apparatus state evolution is mediated by edge-weight updates $w_{s+} = \Pi_{[0, 1]}((1 - \beta) w_{s-} + \alpha (1 - w_{s-}))$ with parameters $\alpha, \beta$. The modes correspond to specific $(\alpha, \beta)$ patterns:

- **Mode A (differentiation)**: $\alpha = 0, \beta > 0$ — decay of integration weights for the content's relevant edges.
- **Mode C (integration)**: $\alpha > 0, \beta = 0$ — growth of integration weights.
- **Mode B (self-modeling)**: a separate apparatus operation that produces a meta-content in $\mathsf{A}^m_t$ representing the I's current apparatus state, without (directly) altering the integration graph.

### 8.3 Axioms

**Axiom 8.3.1** (PtCns triggering). For $x \in \mathsf{A}^m_t$:

$$\mathsf{PtCns}_{m, t}(x) = -1 \implies \Phi^A_{m, t}(x, s) \text{ is the operative mode at } (x, t),$$
$$\mathsf{PtCns}_{m, t}(x) = +1 \implies \Phi^C_{m, t}(x, s) \text{ is the operative mode at } (x, t),$$
$$\mathsf{PtCns}_{m, t}(x) = 0 \implies \text{identity-neutral encapsulation operates}.$$

**Axiom 8.3.2** (Mode A effect on ρ). Under Mode A applied to content $x$,

$$\rho_{m, t^+}(x) \le \rho_{m, t}(x),$$

with equality possible if Mode A operates on $x$'s context rather than on $x$ directly.

**Axiom 8.3.3** (Mode C effect on ρ). Under Mode C applied to content $x$,

$$\rho_{m, t^+}(x) \ge \rho_{m, t}(x).$$

**Axiom 8.3.4** (Mode B independence). Mode B does not directly alter $\rho$ values on the contents it takes as object; it produces a meta-content representation. (Cf. agency paper §7.5 on Mode B reflective availability.)

### 8.4 The identity-neutral encapsulation case

Identity-neutral encapsulation is the response to $\mathsf{PtCns}_{m,t}(x) = 0$. The content $x$ is registered but not subject to Mode A or Mode C; it enters the lived-I at low ρ, in a "peripheral or low-propagation position" (cf. foundation §4.5).

Formally: $x$ enters $\mathsf{A}^m_{t^+}$ but with $\rho_{m, t^+}(x) \approx \epsilon$ for some small $\epsilon$, and remains in the outer shell $\mathsf{Sh}_6$ of the shell partition.

### 8.5 Lean encoding sketch

```
inductive ModeOp where
  | modeA   : ModeOp   -- differentiation
  | modeB   : ModeOp   -- self-modeling
  | modeC   : ModeOp   -- integration
  | neutral : ModeOp   -- identity-neutral encapsulation

noncomputable def applyMode (op : ModeOp) (m : ModelI) (t : Time m)
  (x : Content m) (state : ApparatusState m t) : ApparatusState m (t + 1) := ...
```

---

## 9. The I/not-I boundary

### 9.1 Theoretical statement

"The lived I emerges as a differentiated agent through this boundary-drawing pressure... Mode A produces *the I/not-I boundary*. It is the mechanism by which the I emerges as a separable agent in the first place." Cf. `2_access_and_development.md` §4.

The boundary is a derived structural region — the support of structural distinction between I-aligned and not-I-aligned contents. Once Modes A and C are formalized (and the PtCns evaluation that triggers them), the boundary is derivable.

### 9.2 Type signature

**Definition 9.2.1** (I/not-I boundary).

$$\partial^{\text{I}}_{m, t} : T_m \to \mathcal{P}(\mathsf{A}^m_t),$$

a sub-region of the asymptotic content domain.

Two candidate characterizations:

**Candidate 9.2.2** (PtCns-sensitive boundary).

$$\partial^{\text{I}}_{m, t} := \{x \in \mathsf{A}^m_t : \mathsf{PtCns}_{m, t}(x) \text{ is sensitive to small perturbations of the I's frame}\}.$$

The boundary is precisely the region where the I's frame's stability matters — small frame perturbations swing PtCns evaluation across the $-1 / 0 / +1$ partition.

**Candidate 9.2.3** (Mode A / Mode C duality boundary).

$$\partial^{\text{I}}_{m, t} := \{x \in \mathsf{A}^m_t : \mathsf{PtCns}_{m, t}(x) \in \{-1, +1\} \text{ and the assignment is contestable}\}.$$

The boundary is the region where Mode A and Mode C both operate as candidates with active selection.

### 9.3 Axioms

**Axiom 9.3.1** (emergence). The boundary $\partial^{\text{I}}_{m, t}$ is non-empty for non-degenerate apparatus states (i.e., for any $m$ that has undergone Mode A and Mode C operations).

**Axiom 9.3.2** (cogito interiority). $\hat\iota_m \notin \partial^{\text{I}}_{m, t}$ for every $t$. The cogito is interior to the I, not at the boundary.

**Axiom 9.3.3** (not-I exteriority). The strict not-I region (Rosetta stone §8.4, $\mathsf{N}^0_t$) is disjoint from $\partial^{\text{I}}_{m, t}$ — boundary contents have non-zero ρ.

### 9.4 Connection to the architectural commitment

The architecture's claim that "the lived I emerges through differentiation" is recovered as: the boundary $\partial^{\text{I}}_{m, t}$ has empty initial state, develops through repeated Mode A / Mode C operation, and stabilizes as the structural region of the I's distinctive frame. This is the structural account of agent-emergence.

---

## 10. Foundation integration path

### 10.1 Recommended foundation commitment

The foundation (v0.4 of the rigorous edition) should commit to:

1. **MSI** (§3): signature 3.2.1 and axioms 3.3.1–3.3.4. Functional form open; Candidate 3.4.1 (threshold-based) as foundation default.
2. **Π** (§4): signature 4.2.1 and axioms 4.3.1–4.3.5. Functional form open; Candidate 4.4.1 (ρ-weighted, $w \equiv 1$ default) as foundation default.
3. **Project map** (§5): signature 5.2.1 and axioms 5.3.1–5.3.4. Functional form open; Candidate 5.4.1 (rule-based deterministic) as foundation default.
4. **PCE** (§6): composite definition 6.2.1 and axioms 6.3.1–6.3.4. Functional form fixed by composition of MSI, Π, Project.
5. **PtCns** (§7): signature 7.2.1 and axioms 7.3.1–7.3.4. Functional form open; Candidate 7.4.1 (ρ-coherence) as foundation default.
6. **Modes A, B, C** (§8): signatures 8.2 and axioms 8.3.1–8.3.4.
7. **I/not-I boundary** (§9): signature 9.2.1 (Candidate 9.2.2 as default) and axioms 9.3.1–9.3.3.

### 10.2 What this commitment does not do

It does not commit the foundation to specific functional forms beyond the defaults. It does not address the substrate-bridge work that osmotic imprinting (§12.9) requires. It does not address $A_{m,t}$ dynamics (Gap 11, §12.10). It does not specify how the cluster's primitives are *learned* (the architecture's "*how it is established, updated, and brought to bear*" question for $\Pi$ remains application-level).

### 10.3 Effect on the Rosetta stone v0.2 application-level entries

Closing this cluster at the signature-declared level would change the status of approximately 20 application-level entries from "foundation-deferred" to "foundation-supported (signature-pending for functional form)":

- §14.11 trying (foundation-deferred → foundation-supported via §6 PCE definition)
- §15.5 ownership-integration (foundation-deferred → foundation-supported via §7 PtCns)
- §16.2 reflexive PtCns bridge lemma (foundation-deferred → foundation-supported via §7)
- §16.5 love (foundation-deferred → foundation-supported via §3 MSI, §4 Π, §7 PtCns)
- §16.6 connection-cluster (foundation-deferred → foundation-supported via §3, §6, §7)
- §16.7 self-cluster (foundation-deferred → foundation-supported via §7 reflexive PtCns)
- §16.8 threat-cluster (foundation-deferred → foundation-supported via §6 PCE, §5 Project)
- §16.9 boundary-cluster (foundation-deferred → foundation-supported via §8 Mode A)
- §16.16 self-annihilation compound (foundation-deferred → foundation-supported via §6 PCE-defeat conditions)
- §17.2 frame-position criteria (foundation-deferred → foundation-supported via §3 MSI)
- §17.4 sacred otherness (foundation-deferred → foundation-supported via §3, §7, §8)
- §17.7 awe as boundary-expansion (foundation-deferred → foundation-supported via §8 Mode A)
- §17.8 mystical union with cogito-anchor (signature pending → foundation-supported via §3 MSI, §7 PtCns)
- §17.9 frame-preserving union vs dissolution (foundation-deferred → foundation-supported via §3, §4, §7)
- §17.11 orthogonal-pattern mystical encounter (foundation-deferred → foundation-supported via §7, §17.5)

### 10.4 Section-level integration in the rigorous edition

The foundation commitment would be added as new sections:

- **§4.4** *Maximally-self-defined I* — Definitions 3.2.1, Axioms 3.3.1–3.3.4 (~40 lines).
- **§4.5** *The preservation-ranking* — Definition 4.2.1, Axioms 4.3.1–4.3.5 (~50 lines).
- **§4.6** *Future-state projection* — Definition 5.2.1, Axioms 5.3.1–5.3.4 (~40 lines).
- **§4.7** *The prerogative of continued existence* — Definition 6.2.1, Axioms 6.3.1–6.3.4 (~60 lines, including the self-sacrifice and suicidality commitments).
- **§4.8** *The prerogative of consistency* — Definition 7.2.1, Axioms 7.3.1–7.3.4, hypertrophy/atrophy discussion (~70 lines).
- **§4.9** *Modes A, B, C as evolutionary operators* — §8 (~50 lines).
- **§4.10** *The I/not-I boundary* — §9 (~30 lines).

Total: roughly 340 new lines to the rigorous edition, plus updates to the open-question entries to reflect the new status.

---

## 11. Lean encoding targets

The Lean encoding of the cluster extends the round-3 verified TLICA project with seven new modules. The dependency order from §1.3 is the natural encoding order.

### 11.1 Module structure

- `TLICA.MSI` — the MSI structure with cogito-inclusion and density axioms.
- `TLICA.PreservationRanking` — Π as a typeclass over MSI with monotonicity.
- `TLICA.ProjectMap` — the projection map signature with identity and locality axioms.
- `TLICA.PCE` — the composite definition with action-selection.
- `TLICA.PtCns` — the consistency-evaluation function with mode-triggering axioms.
- `TLICA.Modes` — the three mode operators with ρ-effect axioms.
- `TLICA.IBoundary` — the I/not-I boundary as a derived structure.

### 11.2 Anticipated complexity

The MSI, PtCns, and Modes modules are mostly structural — typed records with axioms. The PCE module is the most computationally substantial: it involves an expectation over a probability measure parametrized by ProjectMap and Π. ENNReal codomain for Π and integrals over ProbabilityMeasure are well-supported in mathlib but require careful import management.

The boundary module is the smallest — it's a derived structure on top of PtCns.

### 11.3 Estimated effort

Roughly two round-3-equivalent compile-iteration cycles. The structural axioms are simpler than round 3's profile-comparison proofs; the PCE expectation integral is the main piece requiring substantive proof work. Round 4 of the Lean project could close the cluster.

---

## 12. Open sub-questions

The cluster's foundation-ready treatment leaves several functional-form questions open, plus a few cluster-specific structural questions.

- **app:msi-threshold-form** (§3.4). What is the functional form of $\theta^{\text{MSI}}_{m, t}$ when it depends on $(m, t)$?
- **app:msi-action-relevance** (§3.4, Candidate 3.4.3). How is "currently-active will-pathway" formalized (depends on the agency paper's operator-bundle apparatus)?
- **app:pi-weighting** (§4.4). What is the application-calibrated weighting $w_{m, t}$ in Candidate 4.4.1?
- **app:pi-non-rho-content** (§4.3.5). What non-ρ information does Π track? "Substrate urgency, future-projection, third-order pathway dynamics" — these are foundation §11.2 exclusion 19's qualifiers but unformalized.
- **app:project-stochasticity** (§5.4.2). When should the foundation default move from deterministic Project to stochastic?
- **app:pce-aggregator** (§6.4). Which aggregator (expectation, risk-averse, time-discounted) for application X?
- **app:pce-existential-threshold** (§6.3.2). What is $\theta^{\text{ex}}_{m, t}$ — when does PCE selection become the dominant action-orientation?
- **app:ptcns-consistency-notion** (§7.4). Which candidate (ρ-coherence, φ-coherence, network-coherence, composite) is the architecture's primary commitment?
- **app:ptcns-graded-vs-discrete** (§7.2.2). Should the foundation default codomain $\mathcal{C}$ be the three-element set or the graded interval?
- **app:hypertrophy-atrophy-formal** (§7.5). What is the formal characterization of hypertrophied / atrophied PtCns disturbance?
- **app:mode-b-meta-content** (§8.3.4). How is the Mode-B-produced meta-content represented in $\mathsf{A}^m_t$?
- **app:boundary-stability** (§9). How does $\partial^{\text{I}}_{m, t}$ evolve over time?

Plus the foundation-level open question that this paper does not address:

- **Gap 11** ($A_{m, t}$ dynamics axioms): the dynamics of asymptotic content domain change. Remains genuinely open.

---

## 13. Closing note

This v0.1 of the foundation orphan cluster working paper closes — at the signature-declared level — the cluster of seven foundation-named-but-unformalized concepts that the Rosetta stone v0.2 §19 structural finding 1 identified as the dependency-connected unit blocking approximately twenty application-level signature-pending items. Each orphan in the cluster receives the same treatment: foundation-ready type signature, structural axioms, candidate functional forms surveyed, foundation default identified, Lean encoding target sketched.

The structured-agnosticism pattern from the profile-comparison working paper transfers directly. The foundation commits to the signatures and the axioms; functional forms are application-calibrated. The downstream effect on the Rosetta stone is substantial (§10.3 lists the fifteen entries whose status changes). After foundation v0.4 incorporates this commitment plus the profile-comparison commitment, the Rosetta stone's "foundation-deferred" status disappears as a category — every application entry has at least foundation-level signature support for its dependencies.

The natural next phase is v0.2 of this paper, which would: (i) review the candidate functional forms against the application papers (the same pattern profile-comparison v0.2 §2 used — application-paper consultation to refine the recommendations); (ii) tighten the Modes A/B/C and boundary treatments (these are currently the most sketchy parts); (iii) propose specific Lean encoding targets at module-design level (parallel to profile-comparison v0.2 §10); (iv) commit (or refine) the foundation defaults.

A v0.3 of this paper, with the Lean encoding executed, would close the foundation-level orphan cluster development. The rigorous edition v0.4 would then incorporate this cluster (~340 new lines) plus the profile-comparison commitment (~80 new lines per the profile-comparison v0.2 §9.4 plan). At that point only Gap 11, osmotic imprinting (§12.9), and the persistence-construction question would remain as foundation-level open structural questions.

---

*End of foundation orphan cluster working paper v0.1.*
