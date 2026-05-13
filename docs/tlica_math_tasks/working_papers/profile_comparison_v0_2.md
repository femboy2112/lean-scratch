# Profile Comparison in TLICA — A Working Paper (v0.2)

> **Purpose.** Continue the development of `oq:profile-comparison` (Gap 12 of the v0.1 Math Rigor Report; §7.2.2 of the v0.3.1 rigorous edition) from the v0.1 working paper. Four tasks were specified for v0.2 in the v0.1 closing note: (i) develop the subdomain-restriction $L^\infty$ shared form to foundation-ready definitions with proofs; (ii) tighten the Wasserstein and topological-invariant sketches; (iii) consult the application papers to confirm or refine the use-case recommendations; (iv) propose specific Lean encoding targets. This paper accomplishes all four, and adds a fifth task surfaced by the application-paper consultation: separate the foundation-level profile-comparison apparatus (comparing the $P^\rho$ family) from the application-level profile-comparison apparatus (comparing application-specific profile objects), so that the foundation supplies the supports the application papers actually need.

> **Status.** Working paper, v0.2. The subdomain-restriction $L^\infty$ shared form is at foundation-ready level with full type signatures, proven lemmas, and an explicit pseudo-metric structure (§5). The Wasserstein and topological-invariant approaches are at sketch-with-signatures level (§6, §7), suitable for application-paper reference but not yet at foundation-commitment level. The Lean encoding targets are specified at §10 with explicit module-design proposals. The synthesis and recommendations (§8, §9) are updated based on the application-paper consultation summarized in §2. The path to a candidate addition to §4.1.5 of the rigorous edition is sketched in §9.

> **Relationship to v0.1 and to v0.3.2 rigorous edition.** This paper supersedes v0.1 (the v0.1 paper is now archival). The rigorous edition is not changed by this paper; Gap 12 remains marked open-theoretical in §7.2.2, with the structured-agnosticism integration path recommended in §9 below as the eventual foundation commitment.

---

## 1. The problem (recap)

### 1.1 Foundation-level profile comparison

The base identity-correlation profile of a modeling I $m$ at time $t$, formalized in Definition 4.1.1 of the rigorous edition v0.3.1, is the indexed family

$$P^\rho_{m,t} = \big\{(x,\ \rho_{m,t}(\pi^m_t(x))) : x \in \mathsf{A}^m_t\big\},$$

equivalently the function $\rho_{m,t} \circ \pi^m_t : \mathsf{A}^m_t \to [0, 1]$. The mode-vector and full-coordinate variants $\vec P^\rho_{m,t}$ and $P^{\rho\phi\kappa}_{m,t}$ are derived structures over the same domain. The architecture's predictions are typically stated as profile-to-profile comparisons across $(m, t)$ pairs, but the architecture has been deliberately silent on what notion of comparison is being invoked. Profile equality is essentially never satisfied across distinct $(m, t)$, so a graded notion of similarity or distance is needed.

### 1.2 The foundation/application distinction

The application papers use the word "profile" more broadly than the foundation does. The affect paper introduces "profile-shape disturbances" (Section 7.6 of `differentiated_affect_v1_0_2_patched.md`) and provides a comparison table among five such disturbances; the agency paper introduces an attribution profile $AP_{m,t;a}$ (ten components), an empirical interpretation profile $EIP_p$, a prediction profile $PP_i$, and a framework translation profile $FTP_f$, each with its own analytical role; the temporal phenomenology paper invokes "cognitive profiles" varying across I's. These are application-level structures that build on the foundation's $P^\rho_{m,t}$ but are not identical to it.

This distinction matters for profile-comparison. The foundation's job is to provide the comparison apparatus for the $P^\rho_{m,t}$ family (and the derivable structures: lived-I, shells, mode-vector, full-coordinate). The application papers introduce additional profile objects whose comparison may require additional structure beyond what the foundation supplies. v0.2 takes the position that the foundation should commit only to comparison apparatus for objects the foundation defines, and that application-level profile-comparison is a downstream consumer of the foundation's apparatus rather than something the foundation should specify directly.

The use-case analysis in §2 below distinguishes these two levels and identifies what the foundation needs to supply.

### 1.3 Why the question remains open

The v0.1 paper identified three sources of openness: conceptual (different applications need different notions of similarity), technical (candidate metrics behave differently on disjoint or near-disjoint domains), and empirical (any specific metric makes commitments about what aspects of profile-difference are operationally salient). v0.2 sustains this analysis and adds a fourth source: scope (the foundation should not commit to comparisons of objects it does not itself define).

---

## 2. Use cases from the application papers (consultation summary)

The v0.1 use-case table was constructed a-priori; this section reports the result of consulting the actual application papers and refines the table accordingly. The consultation is summarized in five subsections, one per application paper.

### 2.1 Temporal phenomenology (`6_temporal_phenomenology.md`)

**What the paper does.** Develops the integration-content account of subjective-time-flow rate, with claims about how the *rate at which integration is accumulating* tracks the experiential rate of time-flow. Section 4 ("integration-content shifts") makes the central comparison claim: "the integration-content of ten minutes at age five and ten minutes at age fifty have shifted" — that is, the rate of new integration per unit clock time decreases over an I's lifespan.

**Implicit profile-comparison structure.** The paper compares $P^\rho_{m, t}$ and $P^\rho_{m, t + \Delta t}$ for small and large $\Delta t$, asking about the *rate of profile change* per unit clock time. The relevant quantity is something like a temporal derivative $\partial_t d(P^\rho_{m,t}, P^\rho_{m,t+\Delta t}) / \Delta t$ for small $\Delta t$.

**Foundation needs.** A pointwise distance that is *continuous in $t'$* for small $\Delta t$ so that the temporal derivative is well-defined. The subdomain-restriction approach satisfies this when the domain is stable; discontinuities at domain-change events are themselves significant. Also useful: a *cumulative* comparison $d(P^\rho_{m, t_0}, P^\rho_{m, t_1})$ for long time-scales.

**Recommended foundation metric.** $d^\infty_{\text{sh}}$ (or $L^p$ variants for finer-grained continuity).

### 2.2 Agency (`agency_paper_v0_3_0_patched.md`)

**What the paper does.** Develops the agency taxonomy with seventeen variation families, the live-option construction lemma, the will/trying/effort apparatus, the decision-event structure with order-asymmetric Mode B reflective availability, the ten-component attribution profile $AP_{m,t;a}$, and the empirical interpretation profile $EIP_p$ mapping Libet-class, Wegner-class, and Soon-class paradigms to architectural objects.

**Implicit profile-comparison structure.** Three distinct comparison structures appear. First, *counterfactual profile comparison*: comparing $P^\rho_{m,t}$ at the actual choice to $P^\rho_{m,t}$ under a counterfactual alternative selection. The agency paper uses this for the live-option construction lemma's failure-modes. Second, *attribution-profile comparison*: comparing $AP_{m,t;a}$ values across cases (e.g. Examples 1, 2, 3 in Section 11 — same variation-family, different condition-overlays). Third, *condition-profile comparison*: comparing the six-condition values of free-choice-proper across cases.

**Foundation needs.** The first (counterfactual) requires the same $P^\rho$-comparison apparatus as temporal phenomenology, with the parameter being a counterfactual selection rather than a time difference. The second and third are application-level: they compare application-introduced profile objects (the ten-component AP, the six-condition tuple), not the foundation's $P^\rho$.

**Recommended foundation metric.** For the counterfactual case: $d^\infty_{\text{sh}}$ with an extension that handles counterfactually-introduced contents (likely the union form $d^\infty_{\text{un}}$). For attribution and condition profile comparison: not a foundation responsibility; the agency paper should specify its own comparison structure for $AP_{m,t;a}$ and the condition tuple.

### 2.3 Free will (`free_will_paper_v0_3_0_patched.md`)

**What the paper does.** Builds on the agency paper and adds the *deliberation-time profile evolution*: the trajectory of $P^\rho_{m,t}$ during the deliberation interval as the decision approaches. The seventeen variation families are tracked through this trajectory.

**Implicit profile-comparison structure.** Same as temporal phenomenology (intra-$m$ intertemporal $P^\rho$ comparison) plus inter-counterfactual at a chosen moment. The paper does not introduce additional profile objects beyond those of the agency paper.

**Foundation needs.** Same as temporal phenomenology and agency.

**Recommended foundation metric.** $d^\infty_{\text{sh}}$ for the trajectory; $d^\infty_{\text{un}}$ for counterfactual-comparison at decision time.

### 2.4 Differentiated affect (`differentiated_affect_v1_0_2_patched.md`)

**What the paper does.** Develops a structural taxonomy of differentiated affect from love-as-definitional-anchor, with five clusters (connection, self, threat, boundary, embodied) and five named *profile-shape disturbances*: dissolution, severe depression, learned helplessness, chronic boredom, anhedonia (Section 7.6 and the "profile-shape comparison table" in the changelog).

**Implicit profile-comparison structure.** Two distinct comparison structures. First, *moment-to-moment affect-state comparison*: how a healthy affective state and its pathological counterpart differ in $P^\rho$-distribution. Second, *profile-shape disturbance comparison*: structural-shape features of the lived-I network and the projection-apparatus that systematically differ across the five named disturbances. The second is the more distinctive structure and is what the paper's table compares.

**Foundation needs.** The first is a gross-distribution claim ("dissolution involves $\rho$-mass redistributing away from the cogito-extension region"; "severe depression involves $\rho$-mass concentrating on adversarial self-evaluation"). This is the natural use case for Wasserstein-style transport distance on the ρ-value distribution. The second is structural: it requires comparison of *invariants of the lived-I network* (which substructures are damaged, which apparatus components are compromised). This is the natural use case for the lived-I topological-invariant approach.

**Recommended foundation metric.** Wasserstein-1 on the normalized ρ-distribution for gross-redistribution claims; lived-I topological invariants for profile-shape-disturbance comparison.

### 2.5 Religiously charged experience (`religiously_charged_experience_v0_3_1.md`)

**What the paper does.** Compares pre-experience, within-experience, and post-experience profiles of an I undergoing religiously charged experience, with attention to the structural transformations the experience effects on the I's lived-I network.

**Implicit profile-comparison structure.** Combines temporal phenomenology's intra-$m$ intertemporal comparison (for the experience's temporal course) with the affect paper's structural-shape comparison (for the transformations).

**Foundation needs.** Both subdomain-restriction (for the temporal course) and topological invariants (for the structural transformation) are needed. No additional foundation apparatus is required beyond what serves temporal phenomenology and affect.

**Recommended foundation metric.** Composition of $d^\infty_{\text{sh}}$ (for the experience's temporal course) and lived-I topological invariants (for the structural before/after comparison).

### 2.6 Consolidated table

| Paper | Use case | Foundation metric | Substantive requirement |
|---|---|---|---|
| Temporal phenomenology | Intra-$m$ intertemporal trajectory | $d^\infty_{\text{sh}}$ | Continuity in $t$ |
| Agency | Counterfactual profile family | $d^\infty_{\text{sh}}$ or $d^\infty_{\text{un}}$ | Handles counterfactually-introduced contents |
| Free will | Deliberation-time trajectory | $d^\infty_{\text{sh}}$ | Same as temporal phenomenology |
| Affect (gross redistribution) | Affect-state comparison | $W_1$ on normalized ρ-distribution | Captures gross mass redistribution |
| Affect (shape disturbance) | Profile-shape comparison | Lived-I topological invariants | Captures structural shape |
| Religious experience | Pre/post experience | $d^\infty_{\text{sh}}$ ∘ topological invariants | Compositional |

The foundation therefore needs three families of comparison apparatus: subdomain-restriction (variants), Wasserstein on ρ-distribution, and lived-I topological invariants. No single family suffices; the foundation should provide all three.

### 2.7 Application-level profile objects

The application papers' application-level profile objects (attribution profile $AP_{m,t;a}$, empirical interpretation profile $EIP_p$, prediction profile $PP_i$, framework translation profile $FTP_f$, condition-tuple) require their own comparison structures, which are not in this paper's scope. The foundation should *not* commit to a unified metric across all application-level profile objects; each application paper should specify the comparison structure appropriate to its own objects. The foundation's contribution is to ensure that whenever an application-level profile object is built from the $P^\rho$ family, foundation-level $P^\rho$-comparison is available as a building block.

---

## 3. The structural challenge (recap from v0.1)

Section 3 of v0.1 is preserved without change: the non-monotone domain (§3.1 of v0.1) and the persistence-equivalence lift (§3.2 of v0.1) remain the two technical obstacles. Section 5 below addresses them in foundation-ready form.

---

## 4. Notation (recap from v0.1)

Throughout this paper we fix a modeling I $m$ and consider profile comparison at this fixed $m$ unless otherwise noted. For two times $t, t' \in T_m$, write $A := \mathsf{A}^m_t$, $A' := \mathsf{A}^m_{t'}$, and define the scalar profile functions

$$f_t : A \to [0, 1], \quad f_t(x) := \rho_{m, t}(\pi^m_t(x)),$$
$$f_{t'} : A' \to [0, 1], \quad f_{t'}(x) := \rho_{m, t'}(\pi^m_{t'}(x)).$$

The shared subdomain is $D_{t, t'} := A \cap A'$ and the union domain is $U_{t, t'} := A \cup A'$.

---

## 5. The subdomain-restriction $L^\infty$ shared form: foundation-ready development

This section develops the subdomain-restriction $L^\infty$ shared form to foundation-ready level. The development consists of: a precise definition with signature (§5.1), a derived pseudo-metric structure with proofs (§5.2), connections to existing rigorous-edition structures (§5.3), behavior under the dynamics (§5.4), and remaining open sub-questions at the foundation level (§5.5).

### 5.1 Definition with foundation signature

**Definition 5.1.1** (subdomain-restriction $L^\infty$ shared distance, intra-$m$).

Fix a modeling I $m$. The *subdomain-restriction $L^\infty$ shared distance on $P^\rho$* is the partial function

$$d^\infty_{\text{sh}, m} : T_m \times T_m \rightharpoonup [0, 1],$$

$$d^\infty_{\text{sh}, m}(t, t') := \sup_{x \in D_{t, t'}} \, |f_t(x) - f_{t'}(x)|,$$

where $D_{t, t'} = \mathsf{A}^m_t \cap \mathsf{A}^m_{t'}$ and the supremum is over the (possibly infinite) shared subdomain. The convention for empty intersection is

$$d^\infty_{\text{sh}, m}(t, t') := +\infty \quad \text{if } D_{t, t'} = \emptyset.$$

The codomain $[0, 1]$ is the natural target since $f_t(x), f_{t'}(x) \in [0, 1]$ implies $|f_t(x) - f_{t'}(x)| \in [0, 1]$, so the supremum (when finite) lies in $[0, 1]$. The convention $+\infty$ for empty intersection is a choice; alternative conventions are $0$ (degenerate) or "undefined" (genuine partial function). The $+\infty$ convention is recommended because it preserves the intuition that two profiles with no overlap are "infinitely far apart" in the structural sense.

**Remark 5.1.2** (well-definedness of the supremum). The supremum is over a subset of $[0, 1]$, which is bounded above by $1$. The supremum therefore exists in $[0, 1]$ as long as $D_{t, t'} \ne \emptyset$. No further well-definedness conditions are needed.

**Remark 5.1.3** (relationship to the v0.3.1 rigorous edition). Definition 5.1.1 is a candidate addition to §4.1.5 of the rigorous edition, which currently states: *"Two base profiles $P^\rho_{m,t}$ and $P^\rho_{m',t'}$ are equal iff $\mathsf{A}^m_t = \mathsf{A}^{m'}_{t'}$ as sets and $\rho_{m,t} \circ \pi^m_t = \rho_{m',t'} \circ \pi^{m'}_{t'}$ pointwise. ... Comparison of profiles across $(m, t)$ pairs requires a notion of restriction or matching of domains, which is open question `oq:profile-comparison`."* The candidate addition would replace the last sentence with a reference to the definition above and to its companions in §6 and §7 of this paper.

### 5.2 Pseudo-metric structure

**Proposition 5.2.1** (non-negativity). For every $t, t' \in T_m$, $d^\infty_{\text{sh}, m}(t, t') \ge 0$.

*Proof.* The supremum is over $|f_t(x) - f_{t'}(x)| \ge 0$. The $+\infty$ convention also yields a non-negative value. ∎

**Proposition 5.2.2** (symmetry). For every $t, t' \in T_m$, $d^\infty_{\text{sh}, m}(t, t') = d^\infty_{\text{sh}, m}(t', t)$.

*Proof.* $D_{t, t'} = D_{t', t}$ by commutativity of intersection, and $|f_t(x) - f_{t'}(x)| = |f_{t'}(x) - f_t(x)|$ by commutativity of $|\cdot|$. Therefore the suprema are equal. The empty-intersection convention gives $+\infty$ on both sides. ∎

**Proposition 5.2.3** (reflexivity). For every $t \in T_m$, $d^\infty_{\text{sh}, m}(t, t) = 0$.

*Proof.* $D_{t, t} = \mathsf{A}^m_t \cap \mathsf{A}^m_t = \mathsf{A}^m_t$, which is non-empty (assuming the apparatus is non-degenerate at $t$). For every $x \in \mathsf{A}^m_t$, $f_t(x) - f_t(x) = 0$. Therefore the supremum is $0$. ∎

**Proposition 5.2.4** (identity of indiscernibles, partial form). $d^\infty_{\text{sh}, m}(t, t') = 0$ iff $f_t \equiv f_{t'}$ on $D_{t, t'}$ (i.e., $\rho$-values agree on the shared subdomain).

*Proof.* The supremum of non-negative quantities is $0$ iff every quantity is $0$. Therefore $\sup_{x \in D} |f_t(x) - f_{t'}(x)| = 0$ iff $f_t(x) = f_{t'}(x)$ for every $x \in D$. ∎

**Remark 5.2.5** (this is a pseudo-metric, not a metric). Proposition 5.2.4 says that zero distance is equivalent to agreement on the shared subdomain, *not* to overall profile equality (which would also require $A = A'$ and agreement on the full domain). Therefore $d^\infty_{\text{sh}, m}$ does not satisfy the full identity-of-indiscernibles axiom of a metric. It is a *pseudo-metric* (in the strict mathematical sense): two distinct profiles can be at distance zero.

This pseudo-metric character is a feature, not a defect: the architecture distinguishes "content $x$ has $\rho = 0$" from "content $x$ is not in the domain", and the shared form respects this distinction. Applications that need a genuine metric should use the union form $d^\infty_{\text{un}, m}$ instead (see §5.2.7 below).

**Proposition 5.2.6** (qualified triangle inequality). For $t_1, t_2, t_3 \in T_m$ with $D_{t_1, t_2}, D_{t_2, t_3}, D_{t_1, t_3}$ all non-empty and *coinciding* (i.e., $D_{t_1, t_2} = D_{t_2, t_3} = D_{t_1, t_3} =: D$), the triangle inequality

$$d^\infty_{\text{sh}, m}(t_1, t_3) \le d^\infty_{\text{sh}, m}(t_1, t_2) + d^\infty_{\text{sh}, m}(t_2, t_3)$$

holds.

*Proof.* When the shared subdomains coincide as $D$, the distances are all suprema of $|f_{t_i}(x) - f_{t_j}(x)|$ over $x \in D$. For each $x \in D$:

$$|f_{t_1}(x) - f_{t_3}(x)| \le |f_{t_1}(x) - f_{t_2}(x)| + |f_{t_2}(x) - f_{t_3}(x)|$$

by the triangle inequality for $|\cdot|$. Taking the supremum on the right and using sub-additivity of supremum, the inequality follows. ∎

**Counterexample 5.2.7** (triangle inequality can fail when shared subdomains don't coincide). Let $\mathsf{A}^m_{t_1} = \{x_1, x_2\}$ with $f_{t_1}(x_1) = 0, f_{t_1}(x_2) = 1$; let $\mathsf{A}^m_{t_2} = \{x_1, x_3\}$ with $f_{t_2}(x_1) = 0, f_{t_2}(x_3) = 0$; let $\mathsf{A}^m_{t_3} = \{x_2, x_3\}$ with $f_{t_3}(x_2) = 0, f_{t_3}(x_3) = 0$. Then $D_{t_1, t_2} = \{x_1\}, D_{t_2, t_3} = \{x_3\}, D_{t_1, t_3} = \{x_2\}$. The distances are $d^\infty_{\text{sh}}(t_1, t_2) = 0, d^\infty_{\text{sh}}(t_2, t_3) = 0, d^\infty_{\text{sh}}(t_1, t_3) = |1 - 0| = 1$. Triangle inequality fails: $1 \not\le 0 + 0$.

**Remark 5.2.8** (consequence). The pseudo-metric $d^\infty_{\text{sh}, m}$ is *not* a pseudo-metric in the usual mathematical sense: it satisfies non-negativity, symmetry, and reflexivity but the triangle inequality is only conditional. Applications that need a triangle inequality should restrict to a sub-collection of times where the shared subdomain is stable (e.g., a "stable window" during which $\mathsf{A}^m_t$ is constant), or use the union form $d^\infty_{\text{un}, m}$.

### 5.2bis The union form $d^\infty_{\text{un}, m}$

**Definition 5.2bis.1** (subdomain-restriction $L^\infty$ union distance, intra-$m$).

$$d^\infty_{\text{un}, m}(t, t') := \sup_{x \in U_{t, t'}} \, |\tilde f_t(x) - \tilde f_{t'}(x)|,$$

where $U_{t, t'} = \mathsf{A}^m_t \cup \mathsf{A}^m_{t'}$ and the extensions are

$$\tilde f_t(x) := \begin{cases} f_t(x) & x \in A \\ 0 & x \in A' \setminus A, \end{cases} \quad \tilde f_{t'}(x) := \begin{cases} f_{t'}(x) & x \in A' \\ 0 & x \in A \setminus A'. \end{cases}$$

**Proposition 5.2bis.2** (full pseudo-metric properties). $d^\infty_{\text{un}, m}$ is non-negative, symmetric, reflexive, satisfies identity of indiscernibles (zero distance iff $\tilde f_t \equiv \tilde f_{t'}$), and satisfies the unqualified triangle inequality.

*Proof.* Non-negativity, symmetry, reflexivity, and identity of indiscernibles as in Propositions 5.2.1–5.2.4 applied to the extended functions on the (variable but always-non-empty) union domain. Triangle inequality: for $t_1, t_2, t_3$, the supremum is over $U_{t_1, t_2, t_3} := A_1 \cup A_2 \cup A_3$, on which all three extensions are defined; the pointwise triangle inequality holds and propagates to the supremum. ∎

**Remark 5.2bis.3** (interpretation). $d^\infty_{\text{un}, m}$ is a genuine pseudo-metric on the function space of zero-extended profiles. It conflates "content $x$ is in domain with $\rho = 0$" and "content $x$ is not in domain", which is a substantive conflation; applications that depend on the distinction should use $d^\infty_{\text{sh}, m}$ accepting the conditional triangle inequality.

### 5.3 Connections to existing rigorous-edition structures

The subdomain-restriction distances interact with three other rigorous-edition structures: the shell partition, the lived-I network, and the persistence-equivalence projection.

**Proposition 5.3.1** (shell-stratified distance bound). Let $r_0 = 1 > r_1 > \cdots > r_5 > 0$ be the shell thresholds (Definition 4.3.1 of the rigorous edition). For every $t, t' \in T_m$ and every $x \in D_{t, t'}$, if $x$ is in $\mathsf{Sh}_i(m, t)$ and $\mathsf{Sh}_j(m, t')$ for some $i, j$:

$$|f_t(x) - f_{t'}(x)| \le \max(|r_{i-1} - r_j|, |r_i - r_{j-1}|),$$

with the boundary conventions $r_{-1} = 1$ (cogito) and $r_6 = 0$.

*Proof.* By Definition 4.3.1, $f_t(x) \in [r_i, r_{i-1})$ and $f_{t'}(x) \in [r_j, r_{j-1})$. The maximum possible distance between values in these intervals is the maximum of $|r_{i-1} - r_j|$ and $|r_i - r_{j-1}|$. ∎

**Corollary 5.3.2** (shell-stable distance vanishes asymptotically). If $f_t$ and $f_{t'}$ agree on shell membership for every $x \in D_{t, t'}$ (i.e., $\mathsf{Sh}_i(m, t) \cap D = \mathsf{Sh}_i(m, t') \cap D$ for every $i$), then $d^\infty_{\text{sh}, m}(t, t') \le \max_i (r_{i-1} - r_i)$.

*Proof.* Apply Proposition 5.3.1 with $i = j$ for every shared-subdomain content. The bound becomes $\max_i (r_{i-1} - r_i)$. ∎

**Proposition 5.3.3** (lived-I restricted distance). The lived-I network $\mathfrak{L}^m_t$ at time $t$ is $\{x \in \mathsf{A}^m_t : f_t(x) > 0\}$ (Definition 4.2.1 of the rigorous edition). Define the *lived-I-restricted* shared distance

$$d^{\infty, \text{liv}}_{\text{sh}, m}(t, t') := \sup_{x \in D_{t, t'} \cap (\mathfrak{L}^m_t \cup \mathfrak{L}^m_{t'})} |f_t(x) - f_{t'}(x)|.$$

Then $d^{\infty, \text{liv}}_{\text{sh}, m}(t, t') \le d^\infty_{\text{sh}, m}(t, t')$ with equality when no content in $D \setminus (\mathfrak{L}^m_t \cup \mathfrak{L}^m_{t'})$ contributes the supremum-attaining value. Lived-I-restriction is appropriate when comparing the lived-I structures specifically, ignoring contents in the asymptotic field with $\rho = 0$ in both compared moments.

**Proposition 5.3.4** (persistence-class lift). Under the content-to-history projection $\pi^m_t$ (Definition 1.7.4 of the rigorous edition), each content $x \in \mathsf{A}^m_t$ corresponds to a persistence class $[(t, x)] \in \mathsf{H}^m_t$. The persistence-class-level distance is

$$d^\infty_{\text{sh}, m}(t, t')^{[\cdot]} := \sup_{h \in \mathsf{H}^m_t \cap \mathsf{H}^m_{t'}} |\rho_{m, t}(h) - \rho_{m, t'}(h)|,$$

where the intersection is taken under the directed-system inclusion of Proposition 1.2 (treating earlier $\mathsf{H}^m_t$ as a sub-poset of later $\mathsf{H}^m_{t'}$). When the directed-system inclusion is the identity on contents whose persistence class is stable, $d^\infty_{\text{sh}, m}(t, t')^{[\cdot]} = d^\infty_{\text{sh}, m}(t, t')$. Persistence-class lift is recommended when comparing across long time-scales where persistence histories vary.

### 5.4 Behavior under the dynamics

The architecture's update rule (Definition 5.4 of the rigorous edition) is continuous in the integration-graph edge weights $w_{s+} = \Pi_{[0,1]}((1-\beta)w_{s-} + \alpha(1-w_{s-}))$. Max-flow is continuous in edge weights for a fixed graph topology (by the standard max-flow-min-cut duality and continuity of the LP solution). Therefore $\rho^{m, k}_t(x)$ is continuous in $t$ for any fixed vertex $x$, *as long as the graph topology does not change*.

**Proposition 5.4.1** (continuity on stable windows). Suppose $[t_0, t_1] \subset T_m$ is a *domain-stable window*: for every $t \in [t_0, t_1]$, $\mathsf{A}^m_t = \mathsf{A}^m_{t_0}$ and the integration-graph topology is fixed. Then the function $t' \mapsto d^\infty_{\text{sh}, m}(t_0, t')$ is continuous on $[t_0, t_1]$.

*Proof sketch.* On a domain-stable window, $D_{t_0, t'} = \mathsf{A}^m_{t_0}$ is constant. The function $t' \mapsto |f_{t_0}(x) - f_{t'}(x)|$ is continuous for each $x$ by continuity of $\rho^{m,k}_{t'}$ in $t'$. The supremum of a continuous family of functions on a fixed domain is upper-semicontinuous; under additional finite-vertex or finite-support assumptions it is continuous. ∎

**Proposition 5.4.2** (discontinuity at domain-change events). At a time $t^*$ where $\mathsf{A}^m_t$ changes (a content enters or leaves the asymptotic field), $d^\infty_{\text{sh}, m}(t_0, t')$ may jump. The size of the jump is bounded above by $\sup_x |\rho^*(x)|$ where $\rho^*$ ranges over the values at the departing or arriving contents.

**Remark 5.4.3** (substantive content). These continuity properties match the temporal phenomenology paper's claims about moment-to-moment continuity of experience and the occurrence of phenomenological discontinuities. The architecture predicts that domain-change events are themselves phenomenologically marked; Proposition 5.4.2 makes this concrete: $d^\infty_{\text{sh}, m}$ exhibits jumps at exactly those events. The size of the jumps tracks the $\rho$-value of the entering/leaving content, which the architecture would predict is itself a marker of the event's phenomenological salience.

### 5.5 Remaining foundation-level open sub-questions

Three sub-questions remain at the foundation level after the development above.

**Open sub-question 5.5.1** (norm choice). $L^\infty$ is the most tractable but other choices ($L^1, L^2$, shell-categorical) preserve different information. Recommendation: $L^\infty$ as the foundation's primary commitment; the others as derived structures available to applications.

**Open sub-question 5.5.2** (lived-I restriction by default). Should the foundation's primary distance restrict to the lived-I or to the full asymptotic domain? Recommendation: full asymptotic domain for the base distance; lived-I-restriction as a derived option (per §5.3.3).

**Open sub-question 5.5.3** (persistence-class lift integration). Should the foundation's distance be at the content level or the persistence-class level? Recommendation: content level for the base distance; persistence-class as a derived option (per §5.3.4). The persistence-class level depends on a resolution of `oq:persistence-construction`.

---

## 6. Wasserstein-style transport distance: tightened sketch

This section tightens the v0.1 Wasserstein sketch with explicit type signatures and identifies the foundation commitments.

### 6.1 Setup with explicit measure

For each $(m, t)$ with a chosen measure $\nu^m_t$ on $\mathsf{A}^m_t$, define the *ρ-value distribution*

$$\mu^\rho_{m,t}(B) := \nu^m_t(\{x \in \mathsf{A}^m_t : f_t(x) \in B\}) \quad \text{for } B \in \mathcal{B}([0, 1]).$$

This is the pushforward $\mu^\rho_{m,t} = (f_t)_* \nu^m_t$ as a measure on $[0, 1]$ with the Borel $\sigma$-algebra. The choice of $\nu^m_t$ is part of the open sub-question `oq:wasserstein-measure`.

Candidate choices for $\nu^m_t$:

- *Counting measure* $\nu^m_t := \#_{\mathsf{A}^m_t}$, available when $\mathsf{A}^m_t$ is countable (which is granted by the locally-finite finite-flow regime committed in v0.3).
- *Probe-measure pushforward* $\nu^m_t := (\text{eval}_t)_* \mu^m_t$, where $\text{eval}_t : Q^m_t \to \mathsf{A}^m_t$ is the measurable probe-to-content evaluation map (committed in v0.3 at §0.15) and $\mu^m_t$ is the probe measure. This carries salience-weighting.
- *Shell-weighted measure*: assign weight $w_i$ to contents in shell $\mathsf{Sh}_i$. This is closer to an application-level choice.

### 6.2 Wasserstein-1 distance

**Definition 6.2.1** (Wasserstein-1 distance on ρ-distributions). For two ρ-value distributions $\mu, \nu$ on $[0, 1]$ with finite first moments,

$$W_1(\mu, \nu) := \inf_{\gamma \in \Pi(\mu, \nu)} \int_{[0, 1] \times [0, 1]} |a - b| \, d\gamma(a, b),$$

where $\Pi(\mu, \nu)$ is the set of probability couplings with marginals $\mu$ and $\nu$ (or finite measure couplings if working with unnormalized measures).

**Proposition 6.2.2** (Kantorovich-Rubinstein duality on $[0, 1]$). For $\mu, \nu$ probability measures on $[0, 1]$,

$$W_1(\mu, \nu) = \sup_{\phi \in \text{Lip}_1([0, 1])} \left( \int \phi \, d\mu - \int \phi \, d\nu \right),$$

where $\text{Lip}_1([0, 1])$ is the set of 1-Lipschitz functions on $[0, 1]$.

This duality is well-known in optimal-transport theory. It gives an alternative computational handle on $W_1$.

### 6.3 Foundation type signature

**Signature 6.3.1.** Given a modeling I $m$, a choice of measure family $(\nu^m_t)_t$, and two times $t, t'$, the Wasserstein-1 distance on ρ-distributions is

$$d^W_{m, \nu}(t, t') := W_1\big((f_t)_* \nu^m_t,\ (f_{t'})_* \nu^m_{t'}\big).$$

The signature depends on $\nu$. The foundation should declare the signature parametrically in $\nu$, allowing applications to instantiate as needed. A canonical foundation choice (counting measure if domain is finite, probe-measure pushforward if domain is infinite) would simplify but commits to `oq:wasserstein-measure`.

### 6.4 Foundation commitments and open sub-questions

**Required commitments for foundation support of $d^W$.**

1. The probe space and probe measure are well-defined, with measurable evaluation (already committed in v0.3 §0.15).
2. The asymptotic content domain $\mathsf{A}^m_t$ is countable, so counting measure is available (granted by the locally-finite finite-flow regime).
3. The ρ-value distribution is well-defined as a pushforward (immediate from measurable structure).

**Open sub-questions.**

1. *Measure choice* (cf. `oq:wasserstein-measure`): which $\nu^m_t$ does the foundation commit to? Recommendation: parametric in $\nu$ at the foundation, with applications committing to specific choices.
2. *Wasserstein order*: $W_1, W_2$, or $W_\infty$? Recommendation: $W_1$.
3. *Normalization*: probability or unnormalized? Recommendation: both supported, with applications choosing.

---

## 7. Lived-I topological invariants: tightened sketch

This section tightens the v0.1 topological-invariant sketch.

### 7.1 Five canonical invariants

The foundation should commit to making the following five invariants well-defined on the lived-I network $\mathfrak{L}^m_t$ for arbitrary modeling I $m$ and time $t$. Each is a function from $(m, t)$ to a metric space $\mathcal{I}_\alpha$, with the corresponding profile distance $d^{\text{top}, \alpha}_m(t, t') := d_{\mathcal{I}_\alpha}(I_\alpha(m, t), I_\alpha(m, t'))$.

**Invariant 7.1.1** (shell-count vector). $I_{\text{shell}}(m, t) := (c_0, c_1, \ldots, c_6) \in \mathbb{N}_{\ge 0}^7$ where $c_i = |\mathsf{Sh}_i(m, t) \cap \mathfrak{L}^m_t|$. Metric on $\mathcal{I}_{\text{shell}}$: Euclidean (or $L^1$ for additive interpretation).

**Invariant 7.1.2** (cogito-component-count). $I_{\text{ccc}}(m, t) := $ number of connected components of $\mathfrak{L}^m_t$ (treated as an undirected graph induced from $G^{m, k}_t$ for a specified mode $k$, or aggregated over modes) that contain the cogito. The cogito-component-count is in $\mathbb{N}_{> 0}$.

**Invariant 7.1.3** (spectral gap). $I_{\text{spec}}(m, t) := \lambda_2(L(\mathfrak{L}^m_t))$, the second-smallest eigenvalue of the graph Laplacian of $\mathfrak{L}^m_t$ as an undirected weighted graph. The codomain is $\mathbb{R}_{\ge 0}$.

**Invariant 7.1.4** (max-flow-to-cogito distribution). $I_{\text{flow}}(m, t) := $ the probability distribution on $[0, \infty)$ obtained by counting (or weighting) vertices $x \in \mathfrak{L}^m_t$ by their max-flow value $C^{m, k}_t(x)$ to the cogito. The codomain is the space of probability measures on $[0, \infty)$ with Wasserstein-1 distance.

**Invariant 7.1.5** (persistent homology of the ρ-filtration). $I_{\text{PH}}(m, t) := $ the persistence diagram of the filtered complex $(\mathfrak{L}^{m, \ge r}_t)_{r \in [0, 1]}$, where $\mathfrak{L}^{m, \ge r}_t := \{x : f_t(x) \ge r\}$. The codomain is the space of persistence diagrams with the bottleneck distance.

### 7.2 Comparison structure

For each invariant $\alpha$, the induced profile distance $d^{\text{top}, \alpha}_m(t, t')$ is the metric-space distance between the invariants. Different invariants capture different structural features:

- Shell-count: gross distribution across shells, sensitive to mass migrations between shells but blind to within-shell rearrangement.
- Cogito-component-count: connectedness of lived-I around cogito, sensitive to fragmentation.
- Spectral gap: overall connectivity strength.
- Max-flow distribution: gross strength of integration with cogito.
- Persistent homology: multi-scale topology, most informative but computationally expensive.

### 7.3 Foundation commitments and open sub-questions

**Required commitments for foundation support.**

1. Integration graph is locally finite (committed in v0.3).
2. Lived-I network is well-defined (committed in v0.3 §4.2).
3. Shell partition is well-defined (committed in v0.3 §4.3).
4. Graph Laplacian and persistent homology are computable (mathlib and computational-topology libraries available).

**Open sub-questions.**

1. *Vector form*: should the foundation supply $I_{\text{topo}}(m, t) := (I_{\text{shell}}, I_{\text{ccc}}, I_{\text{spec}}, I_{\text{flow}})$ as a single composite invariant? Recommendation: yes; applications can project to individual components.
2. *Persistent homology in foundation*: should $I_{\text{PH}}$ be a foundation commitment? Recommendation: defer to application papers; persistent homology is computationally substantial and may not be needed for most application-level claims.

---

## 8. Synthesis: which metric for which use case (v0.2 refined)

The v0.1 table is refined here based on the application-paper consultation in §2. Each row identifies the application use case, the recommended foundation metric, and the substantive requirement the metric is designed to satisfy.

| Application paper | Use case | Foundation metric | Substantive requirement |
|---|---|---|---|
| Temporal phenomenology | Intra-$m$ intertemporal trajectory | $d^\infty_{\text{sh}, m}$ | Continuity in $t$ on stable windows; discontinuity at domain-change events |
| Agency | Counterfactual profile family | $d^\infty_{\text{un}, m}$ | Handles counterfactually-introduced contents via zero-extension; full triangle inequality |
| Free will | Deliberation-time trajectory | $d^\infty_{\text{sh}, m}$ | Same as temporal phenomenology |
| Affect (gross redistribution) | Affect-state comparison | $d^W_{m, \nu}$ | Captures gross mass redistribution; $\nu$ instantiated per application |
| Affect (shape disturbance) | Profile-shape comparison | $d^{\text{top}, \alpha}_m$ for various $\alpha$ | Captures structural shape; $\alpha$ depends on which structural feature the disturbance affects |
| Religious experience | Pre/post and during-experience | Composition of $d^\infty_{\text{sh}, m}$ and $d^{\text{top}, \alpha}_m$ | Combines temporal-course and structural-transformation analysis |

The recommendation against a single unified foundation metric is sustained from v0.1 and reinforced by the application-paper consultation: each paper's use case has a natural fit with a specific candidate, and the candidates are genuinely different in what they preserve.

---

## 9. Path to foundation integration (v0.2 recommendation)

The v0.1 paper identified three integration paths (minimal, structured agnosticism, full commitment) and recommended structured agnosticism. v0.2 sustains this recommendation and crystallizes the specific commitment.

### 9.1 Recommended foundation commitment

The foundation (v0.4 of the rigorous edition) should commit to:

1. **Definition 5.1.1**: the subdomain-restriction $L^\infty$ shared distance $d^\infty_{\text{sh}, m}$, with its pseudo-metric properties (Propositions 5.2.1–5.2.6 above) and connections to shell, lived-I, and persistence structures (§5.3).

2. **Definition 5.2bis.1**: the union form $d^\infty_{\text{un}, m}$ as a companion structure with full pseudo-metric properties.

3. **Signature 6.3.1**: the Wasserstein-1 distance signature, parametric in the measure $\nu$, with `oq:wasserstein-measure` left open.

4. **§7.1 invariants 7.1.1–7.1.4**: shell-count vector, cogito-component-count, spectral gap, and max-flow-to-cogito distribution as foundation-level lived-I topological invariants. (Persistent homology, 7.1.5, deferred to applications.)

5. A composite invariant $I_{\text{topo}}(m, t)$ aggregating the four invariants in (4), with applications free to project.

### 9.2 What this commitment does not do

It does not commit to a single canonical profile-comparison metric. It does not commit to the measure choice for Wasserstein. It does not commit to a single preferred topological invariant. It does not address inter-$m$ comparison (which remains open pending `oq:inside-projection-specification`). It does not address application-level profile objects (which remain the application papers' responsibility).

### 9.3 Effect on Gap 12

After this commitment, Gap 12 (`oq:profile-comparison`) would move from open-theoretical to `signature-declared, application-calibrated`. The foundation supplies the comparison apparatus signatures; applications calibrate the specific instances. Gap 12 would not be considered fully closed until both the application-paper consultation (§2 of this paper) is incorporated and a v0.5 reduction commits to specific functional forms for the open sub-questions (§5.5, §6.4, §7.3 above).

### 9.4 Section-level integration in the rigorous edition

The commitment in §9.1 would be added to the rigorous edition as follows:

- §4.1.5 (profile equality and comparison): cite the new commitments; replace the deferral sentence with a forward reference to the new section.
- §4.4 (a new section, *profile-comparison apparatus*): contains Definitions 5.1.1 and 5.2bis.1, Propositions 5.2.1–5.2.6, Signature 6.3.1, and the §7.1 invariants.
- §7.2.2 (open question entry): update `oq:profile-comparison` status to `signature-declared, application-calibrated`.

The integration would change one paragraph of §4.1.5 and add roughly 80 lines to the file, plus the section-7 status update.

---

## 10. Lean encoding targets for the subdomain-restriction approach

This section proposes Lean encoding targets for the subdomain-restriction $L^\infty$ form (the most tractable of the three candidate families). The encoding extends the existing `TLICA` Lean project from the v0.3.2 verification milestone.

### 10.1 Module structure

Three new Lean modules would extend the project:

- `TLICA.Profile`: encodes the base profile $P^\rho_{m, t}$ as a Lean structure or function, parameterized by a content domain type and a profile function.
- `TLICA.ProfileComparison.Pointwise`: encodes the subdomain-restriction $L^\infty$ shared and union distances with their pseudo-metric properties.
- `TLICA.ProfileComparison.ShellRefinement`: encodes the shell-stratified bound (Proposition 5.3.1) and the shell-stable distance vanishing corollary.

### 10.2 Core types and definitions

In `TLICA.Profile`:

```
namespace TLICA.Profile

variable {α : Type*}
-- α is the content-domain type for a given (m, t).

/-- A scalar identity-correlation profile on domain α is a function
    α → [0, 1] (encoded as a function to the closed unit interval). -/
structure ScalarProfile (α : Type*) where
  toFun : α → ℝ
  toFun_nonneg : ∀ x, 0 ≤ toFun x
  toFun_le_one : ∀ x, toFun x ≤ 1

instance : CoeFun (ScalarProfile α) (fun _ => α → ℝ) := ⟨ScalarProfile.toFun⟩

end TLICA.Profile
```

In `TLICA.ProfileComparison.Pointwise`:

```
namespace TLICA.ProfileComparison.Pointwise

open TLICA.Profile

variable {α : Type*}

/-- Definition 5.1.1 (subdomain-restriction L^∞ shared distance).
    For two profiles f, g on possibly different subsets A, A' of α,
    the shared distance is the supremum of |f x - g x| over A ∩ A',
    with convention +∞ on empty intersection. -/
noncomputable def dInfShared
    (A A' : Set α) (f : ScalarProfile A) (g : ScalarProfile A') : ℝ≥0∞ :=
  if h : (A ∩ A' : Set α).Nonempty then
    ⨆ x : ↥(A ∩ A'), ‖f.toFun ⟨x.val, x.property.1⟩ - g.toFun ⟨x.val, x.property.2⟩‖₊
  else ⊤

/-- Proposition 5.2.1 (non-negativity). -/
theorem dInfShared_nonneg
    (A A' : Set α) (f : ScalarProfile A) (g : ScalarProfile A') :
    0 ≤ dInfShared A A' f g := by
  -- ℝ≥0∞-valued, so non-negativity is by typing.
  exact bot_le

/-- Proposition 5.2.2 (symmetry). -/
theorem dInfShared_symm
    (A A' : Set α) (f : ScalarProfile A) (g : ScalarProfile A') :
    dInfShared A A' f g = dInfShared A' A g f := by
  unfold dInfShared
  split_ifs with h
  · -- Both non-empty: rename the supremum index.
    congr 1
    ext x
    simp [abs_sub_comm]
  · -- Both empty: both sides ⊤.
    rfl

end TLICA.ProfileComparison.Pointwise
```

(Sketch only; production Lean would need additional infrastructure for the `Set.Nonempty` split and the supremum reduction.)

### 10.3 Pseudo-metric property proofs

The proofs of Propositions 5.2.1, 5.2.2, 5.2.3, and 5.2.4 are short and follow the pattern established in the existing `TLICA.NonReducibility` module (split on supremum domain non-emptiness, reduce to pointwise inequalities, close with `linarith` or `nlinarith`). The qualified triangle inequality (Proposition 5.2.6) requires a sub-lemma stating that shared-subdomain coincidence allows the triangle inequality to lift through the supremum, which is a standard fact in mathlib.

### 10.4 Union form

The union form (Definition 5.2bis.1) is encoded similarly, with the zero-extension constructed explicitly:

```
noncomputable def zeroExtend (A : Set α) (f : ScalarProfile A) : α → ℝ :=
  fun x => if h : x ∈ A then f.toFun ⟨x, h⟩ else 0
```

The full pseudo-metric structure (Proposition 5.2bis.2) follows by routine adaptation of the shared-form proofs, with the additional triangle-inequality step that the supremum is over the full union and the pointwise triangle inequality applies uniformly.

### 10.5 Shell-stratified bound

The shell-stratified bound (Proposition 5.3.1) and the shell-stable distance vanishing corollary (Proposition 5.3.2) require a Lean encoding of the shell partition (Definition 4.3.1 of the rigorous edition), which is not yet in the Lean project. The natural way to add it: extend `TLICA.Profile` with a shell-partition structure parameterized by the threshold sequence $(r_0, r_1, \ldots, r_5)$. The bound proof is then a routine calculation.

### 10.6 What is not yet recommended for Lean

The Wasserstein-1 distance encoding is *not* recommended for the next round, because mathlib's optimal-transport library is less mature than its order-theoretic and topological libraries; encoding $W_1$ would itself be a substantial undertaking. The topological invariants are partially encodable (shell-count vector is trivial; spectral gap requires the graph Laplacian, which mathlib supports; persistent homology requires non-mathlib infrastructure). The first natural Lean target after the subdomain-restriction encoding is the shell-count vector invariant.

### 10.7 Estimated effort

The subdomain-restriction Lean encoding (modules 1 and 2 of §10.1, definitions and propositions 5.2.1–5.2.4 of §5) is estimated at one compile-iteration round of Claude-Code work, comparable in size to the v0.3.2 round-2 Dynamics completion. The full §5 development including Propositions 5.2.6, 5.3.1, and 5.3.2 is estimated at two compile-iteration rounds. The shell-count topological invariant is one additional round.

---

## 11. Open sub-questions surfaced or sustained by v0.2

The following sub-questions are open after v0.2. Items marked (v0.1) are sustained from the v0.1 paper; items marked (v0.2) are newly surfaced.

**oq:profile-comparison-norm** (v0.1). Among $L^\infty, L^1, L^2$, and shell-categorical: foundation primary norm? Recommendation (v0.2): $L^\infty$.

**oq:profile-comparison-domain-form** (v0.1). Shared (pseudo-metric) or union (genuine pseudo-metric): foundation primary form? Recommendation (v0.2): both, with applications choosing.

**oq:profile-comparison-persistence-refinement** (v0.1). Content level or persistence-class level? Recommendation (v0.2): content-level base; persistence-class as derived option. Depends on `oq:persistence-construction`.

**oq:wasserstein-measure** (v0.1). Which measure on the content domain for the Wasserstein pushforward? Recommendation (v0.2): parametric in $\nu$ at the foundation. Depends on `oq:probe-measure`.

**oq:cross-i-correspondence** (v0.1). Inter-$m$ content correspondence? Recommendation (v0.2): leave open at the foundation; depends on `oq:inside-projection-specification`.

**oq:profile-comparison-foundation-commitment** (umbrella, v0.1). Integration path? Recommendation (v0.2): structured agnosticism per §9.1.

**oq:profile-comparison-triangle-restriction** (v0.2, new). Should the foundation introduce a notion of *domain-stable window* (per Proposition 5.4.1) as a derived structure so that triangle-inequality-equipped sub-collections of times are available? Recommendation: yes; the notion is useful for both the subdomain-restriction approach and for the continuity claims of temporal phenomenology.

**oq:topological-invariant-vector** (v0.2, new). Should the foundation commit to the composite invariant $I_{\text{topo}} = (I_{\text{shell}}, I_{\text{ccc}}, I_{\text{spec}}, I_{\text{flow}})$ as a unified structure? Recommendation: yes, per §9.1.4.

**oq:persistent-homology-foundation** (v0.2, new). Should persistent homology of the ρ-filtration be a foundation commitment or an application tool? Recommendation: application tool; not in foundation v0.4.

---

## 12. Closing note

v0.2 of this working paper has accomplished its four specified tasks. The subdomain-restriction $L^\infty$ shared and union forms have been developed to foundation-ready level, with explicit pseudo-metric structure, qualified triangle inequality, connections to the shell partition and lived-I network, and continuity-on-stable-windows behavior matching the temporal phenomenology paper's claims. The Wasserstein and topological-invariant approaches have been tightened with explicit signatures parametric in their open sub-questions. The application-paper consultation has confirmed the multi-metric strategy, refined the use-case table, and surfaced the foundation/application distinction as a structural feature of the problem. Lean encoding targets have been specified at module-design level with estimated effort.

The next phase of work is v0.3 of this paper, which would: (i) carry out the recommended Lean encoding of §10 in the existing `TLICA` Lean project, producing a TLICA round-3 verification milestone; (ii) draft the candidate addition to §4.1.5 and the new §4.4 of the rigorous edition (per §9.4 above); (iii) consult the application papers a second time to confirm the v0.2 use-case recommendations and identify any application-specific extensions that should also lift to the foundation; (iv) commit to (or refine) the parametric Wasserstein measure choice if the application papers have converged on a preferred form.

v0.3 of this paper, when complete, would close the foundation-level development of Gap 12, leaving only the application-calibration step (which is structurally an application-paper responsibility). The architecture's strategy of deferring metric choice to application papers is preserved; what changes is that the deferral now has explicit structure rather than being a structural silence.

---

*End of profile comparison working paper v0.2.*
