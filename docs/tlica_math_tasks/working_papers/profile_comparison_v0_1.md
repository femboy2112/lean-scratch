# Profile Comparison in TLICA — A Working Paper (v0.1)

> **Purpose.** Advance the open question `oq:profile-comparison` (Gap 12 of the v0.1 Math Rigor Report; §7.2.2 of the v0.3.1 rigorous edition) from "open-theoretical without specific structure" to "open-theoretical with developed candidate structures, type signatures, and partial commitments." This is a working paper in the rigorous edition's framework, not yet integrated into the eight-file foundation; it is the first phase of substantive work on Gap 12.

> **Status.** Working paper, v0.1. The subdomain-restriction approach (§5) is developed to first-draft level with type signatures and supporting lemmas. The Wasserstein-style and topological-invariant approaches (§6 and §7) are developed to sketch level. The synthesis (§8 and §9) makes provisional recommendations and identifies what remains genuinely open after this phase.

> **Relationship to v0.3.1.** This paper does not change the rigorous edition's substantive commitments. It surfaces structure that the rigorous edition has deliberately left open and develops three candidate ways of resolving the openness, without committing the foundation to any one. The foundation remains agnostic; the working paper analyses what the cost of each commitment would be.

---

## 1. The problem

### 1.1 What "profile comparison" means

The base identity-correlation profile of a modeling I `m` at time `t` is the indexed family

$$P^\rho_{m,t} = \big\{(x,\ \rho_{m,t}(\pi^m_t(x))) : x \in \mathsf{A}^m_t\big\},$$

equivalently, the function $\rho_{m,t} \circ \pi^m_t : \mathsf{A}^m_t \to [0, 1]$ (Definition 4.1.1 of the v0.3.1 rigorous edition). The architecture's predictions are characteristically stated as profile-to-profile comparisons: "I A's profile differs from I B's profile in such-and-such way", "the profile at $t'$ has a shifted lived-I network relative to the profile at $t$", "the modal counterfactual profile under intervention $I$ has $\rho$-mass redistributed from the third shell to the fifth shell". Each such prediction presupposes a *notion of comparison* between profiles. The architecture has been deliberately silent on which notion.

The profile equality criterion of §4.1.5 (rigorous edition) is the trivial baseline: $P^\rho_{m,t} = P^\rho_{m',t'}$ iff $\mathsf{A}^m_t = \mathsf{A}^{m'}_{t'}$ as sets and $\rho_{m,t} \circ \pi^m_t = \rho_{m',t'} \circ \pi^{m'}_{t'}$ pointwise. Equality so defined is essentially never satisfied across distinct $(m, t)$ pairs: the asymptotic content domain depends on $m$ (different I's have different content libraries) and varies with $t$ (the domain is non-monotone under the dynamics, per Proposition 2.8.1 and the toolset-non-monotonicity remark). The architecture's predictions therefore range over a space where equality is degenerate; what is needed is a *graded* notion of similarity or distance.

### 1.2 Why the question is genuinely open

The architecture's reluctance to commit a metric at the foundation has three sources. First, **conceptual**: different applications need different notions of profile similarity. Temporal phenomenology asks how an I's profile changes from moment to moment, where comparison is intra-$m$ and inter-$t$. Agency theory asks how an I's profile differs across counterfactual interventions, where comparison is intra-$m$ but inter-counterfactual. Cross-subjective comparisons (which the architecture is wary of in any case) would require inter-$m$ comparison, which raises distinct problems. Second, **technical**: the candidate metrics behave differently on profiles with disjoint or near-disjoint domains, and the architecture's content domain $\mathsf{A}^m_t$ is constitutively domain-dependent on $m$. Third, **empirical**: any specific metric makes empirical commitments about what aspects of profile-difference are operationally salient, and the architecture's strategy has been to defer such commitments to the application papers that actually need them.

This working paper takes those three sources seriously. It does not propose a unique metric for the foundation. It develops three candidate structures, each with type signatures and supporting facts, and identifies which use cases each is appropriate for.

### 1.3 The three structural regimes

Profile comparison naturally splits into three regimes by what varies between the compared profiles.

**Intra-$m$ intertemporal.** Same modeling I, two different times: $(m, t)$ vs $(m, t')$. The asymptotic content domains $\mathsf{A}^m_t$ and $\mathsf{A}^m_{t'}$ are *both subsets of $m$'s content history* and so can be compared in the natural sense. Their intersection is well-defined. This regime supports the cleanest comparison structure.

**Intra-$m$ inter-counterfactual.** Same modeling I, same time, but with a counterfactual intervention that produces an alternative profile. The two profiles share a common factual baseline but differ on the intervention's effect. The asymptotic content domains may differ in counterfactually-introduced contents, but the bulk of the domain coincides. This regime is closely related to intra-$m$ intertemporal and admits similar structure.

**Inter-$m$.** Distinct modeling I's. The asymptotic content domains $\mathsf{A}^m_t$ and $\mathsf{A}^{m'}_t$ are constitutively in different I's content libraries, and "intersection" is not directly meaningful. Cross-I comparison requires a notion of inter-subjective content correspondence (a partial map $\Phi : \mathsf{A}^m_t \rightharpoonup \mathsf{A}^{m'}_t$ identifying "the same content as seen by $m$ and $m'$"), which is itself an open theoretical question (cf. `oq:inside-projection-specification`). This regime is the hardest.

The development below addresses the intra-$m$ regimes (intertemporal and inter-counterfactual) at first-draft level and treats the inter-$m$ regime more cautiously.

---

## 2. Use cases from the application papers

Each of the five application papers in the project implicitly relies on profile comparison. The implicit commitments are surveyed here to inform what the foundation-level metric needs to support.

### 2.1 Temporal phenomenology

The temporal phenomenology paper uses profile comparison to describe the structure of moment-to-moment experience flow. The key construct is the **lived-I-evolution trajectory**: a path through profile space as $t$ varies. Continuity claims are stated as: small temporal increments produce small profile changes (in some metric); discontinuities mark phenomenological boundaries (mode-switches, attention shifts, etc.). The metric must be sensitive to: (a) which contents enter and leave the lived-I; (b) how $\rho$-values redistribute among shells; (c) the rate of change of these things.

This is the natural use case for the **subdomain-restriction pointwise distance**, computed on rolling time windows where the asymptotic content domain is roughly stable.

### 2.2 Agency

The agency paper uses profile comparison to characterize live options and to distinguish genuine agency from determinism-equivalent behavioral output. The key construct is the **counterfactual profile family**: the set of profiles the I would have at $t + \Delta t$ under different live-option choices at $t$. The metric must be sensitive to: (a) which contents are present in some but not all counterfactual profiles; (b) how $\rho$-values vary across counterfactuals; (c) whether the lived-I network's gross structure (shell membership counts, connection topology) varies.

This is a use case where **lived-I topological invariants** are particularly natural: agency claims often rest on topological features of the counterfactual family rather than pointwise numerical differences.

### 2.3 Free will

The free will paper builds on the agency paper and adds the further construct of **deliberation-time profile evolution**: the trajectory of profiles during the deliberation interval, treated as a model of the decision process. The metric must be sensitive to which contents become more or less integrated with the cogito as deliberation proceeds. This is similar to the temporal phenomenology use case but on a different time-scale, so the same subdomain-restriction approach is appropriate.

### 2.4 Differentiated affect

The differentiated affect paper uses profile comparison to characterize affective state-differences. Two affect-states correspond to two profiles. The claim is that affect distinctions are tracked by certain coordinated patterns of profile-difference (e.g., the lived-I "contracts" under fear; "expands" under joy; "concentrates on a single high-ρ region" under flow-state). The metric must be sensitive to gross-distribution features of $\rho$-values, not just pointwise differences.

This is the natural use case for **Wasserstein-style transport distance**: the gross redistribution of $\rho$-mass across the content domain is exactly what Wasserstein-1 measures.

### 2.5 Religiously charged experience

The religiously charged experience paper compares pre- and post-experience profiles, and within-experience profile evolution. The use case combines elements of temporal phenomenology (continuity claims about the experience interval) and affect (gross redistribution claims about the integrative state). It will need both subdomain-restriction and Wasserstein-style metrics, possibly composed.

### 2.6 Summary

The application papers collectively need at least three comparison structures: a subdomain-restriction pointwise distance for fine-grained continuity claims, a Wasserstein-style transport distance for gross-redistribution claims, and lived-I topological invariants for structural-shape claims. No single metric serves all three needs; the foundation should support all three, with application papers committing to whichever is appropriate for their specific predictions.

---

## 3. The structural challenge

Before developing the three candidates, two technical obstacles deserve direct treatment.

### 3.1 Non-monotone domain

The asymptotic content domain $\mathsf{A}^m_t$ is not monotone in $t$. Contents enter the domain when they become asymptotically available (focus, contact, imprinting); contents leave the domain when they fall out of asymptotic availability (decay, mode-switch, attention shift). Proposition 2.8.1 establishes vertex monotonicity of *capacity* under fixed weights, but the toolset-non-monotonicity remark of §3.4.4 shows that the *domain* itself is non-monotone.

The implication for comparison: the natural "shared subdomain" of two profiles at $(m, t)$ and $(m, t')$ is $\mathsf{A}^m_t \cap \mathsf{A}^m_{t'}$, but this may be a proper subset of either. The pointwise distance computed on the shared subdomain ignores everything that has entered or left. Two responses are available: (a) define the metric to use the shared subdomain only, accepting that "departure" and "arrival" of contents register as the shared-subdomain shrinking rather than as a distance contribution; or (b) extend each profile to a default value (typically 0) on the union $\mathsf{A}^m_t \cup \mathsf{A}^m_{t'}$ and compute the pointwise distance on the union. Option (a) loses information about transitions; option (b) penalizes transitions but conflates "content $x$ has $\rho = 0$" with "content $x$ is not in the domain", which the architecture has reason to distinguish.

This paper proposes that the foundation support *both* extensions of the basic pointwise distance — a "shared" form and a "union" form — and let application papers choose.

### 3.2 Persistence-equivalence lift

The profile is defined on $\mathsf{A}^m_t$ (raw current contents), but ρ is defined on $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$ (the integration graph's vertex set, with $\mathsf{H}^m_t$ a persistence quotient). The base profile's definition implicitly uses the content-to-history projection $\pi^m_t$ to evaluate ρ on contents.

When comparing profiles at $(m, t)$ and $(m, t')$, the same content $x$ may map to different persistence classes under $\pi^m_t$ and $\pi^m_{t'}$ — or it may map to "the same" class, in the sense that $\pi^m_{t'}([(t, x)])$ extends $\pi^m_t([(t, x)])$ through the directed-system inclusion of Proposition 1.2. The comparison metric should be aware of this: changes in $\rho$ at a content can be tracked either at the content level (comparing $\rho_{m,t}(\pi^m_t(x))$ to $\rho_{m,t'}(\pi^m_{t'}(x))$) or at the persistence-class level (comparing $\rho_{m,t}$ to $\rho_{m,t'}$ on a common persistence class). The two coincide for contents whose persistence class is stable, and differ for contents whose persistence-history changes between $t$ and $t'$.

For the first-draft development below, we work at the content level (comparing values of $\rho_{m,t} \circ \pi^m_t$). The persistence-class refinement is identified as an extension point for future work.

---

## 4. Notation

Throughout the rest of this paper we fix a modeling I $m$ and two times $t, t' \in T_m$. We write $A := \mathsf{A}^m_t$, $A' := \mathsf{A}^m_{t'}$, and $f : A \to [0, 1]$, $f' : A' \to [0, 1]$ for the scalar profile functions $\rho_{m,t} \circ \pi^m_t$ and $\rho_{m,t'} \circ \pi^m_{t'}$. The shared subdomain is $D := A \cap A'$; the union domain is $U := A \cup A'$. We treat $A$ and $A'$ as carrying no a-priori weighting; weighted variants are introduced as needed.

---

## 5. Candidate 1: subdomain-restriction pointwise distance

The first candidate restricts both profiles to the shared subdomain and computes a pointwise distance in some chosen norm. Three sub-variants are surveyed: $L^\infty$, $L^1$, and $L^2$.

### 5.1 Definitions

**Definition 5.1.1** ($L^\infty$ shared distance).

$$d^\infty_{\text{sh}}(f, f') := \sup_{x \in D} |f(x) - f'(x)|.$$

If $D = \emptyset$, set $d^\infty_{\text{sh}}(f, f') := +\infty$ by convention.

**Definition 5.1.2** ($L^1$ shared distance, finite-domain case).

When $|A|, |A'| < \infty$:

$$d^1_{\text{sh}}(f, f') := \sum_{x \in D} |f(x) - f'(x)|.$$

In the infinite-domain case, $L^1$ requires a reference measure on $D$; we treat that case in §5.4.

**Definition 5.1.3** ($L^2$ shared distance, finite-domain case).

$$d^2_{\text{sh}}(f, f') := \sqrt{\sum_{x \in D} |f(x) - f'(x)|^2}.$$

**Definition 5.1.4** (union distance, default zero extension).

Extend $f$ and $f'$ to $U$ by $f^*(x) := f(x)$ if $x \in A$ and $0$ otherwise; analogously $f'^*$. Then for any norm choice $p \in \{\infty, 1, 2\}$,

$$d^p_{\text{un}}(f, f') := \|f^* - f'^*\|_p|_U.$$

### 5.2 Basic properties

**Lemma 5.2.1** (non-negativity, symmetry). $d^p_{\text{sh}}$ and $d^p_{\text{un}}$ are non-negative and symmetric for every $p \in \{\infty, 1, 2\}$ (subject to the finite-domain restriction for $L^1$ and $L^2$ in §5.1.2 and §5.1.3).

*Proof.* Immediate from $|f(x) - f'(x)| = |f'(x) - f(x)| \ge 0$ and the corresponding properties of $\sup$ and $\sum$. ∎

**Lemma 5.2.2** (identity of indiscernibles, partial form). $d^p_{\text{un}}(f, f') = 0$ iff $f^* = f'^*$ on $U$, iff $A = A'$ and $f = f'$ on the common domain. $d^p_{\text{sh}}(f, f') = 0$ iff $f = f'$ on $D$; this is a *strictly weaker* statement than $f = f'$ on $A \cup A'$, since the shared form ignores values outside $D$.

*Discussion.* The shared form is therefore a *pseudo-metric*, not a metric: distinct profiles can be at distance zero (e.g., two profiles that agree on $D$ but differ on $A \setminus D$). The union form is a genuine metric on the function space, but it identifies "content absent" with "content present with value 0", which the architecture distinguishes (see §3.1).

**Lemma 5.2.3** (triangle inequality, qualified). The triangle inequality $d(f, h) \le d(f, g) + d(g, h)$ holds for the union form $d^p_{\text{un}}$ in the usual sense. For the shared form $d^p_{\text{sh}}$, the inequality holds *when all three pairwise shared subdomains $D_{fg}, D_{gh}, D_{fh}$ are equal*, but can fail when they are not.

*Proof sketch.* The union-form triangle inequality is just the $L^p$ triangle inequality. The shared-form failure: take $f, g, h$ with $A_f \cap A_g$ small, $A_g \cap A_h$ small, but $A_f \cap A_h$ large, with values calibrated so that $d^\infty_{\text{sh}}(f, g)$ and $d^\infty_{\text{sh}}(g, h)$ are both small (because computed on small subdomains where the functions happen to agree) but $d^\infty_{\text{sh}}(f, h)$ is large (computed on a large subdomain where they disagree). Explicit example: $A_f = \{x_1, x_2\}, A_g = \{x_1, x_3\}, A_h = \{x_2, x_3\}$, with $f(x_1) = 0, f(x_2) = 1, g(x_1) = 0, g(x_3) = 0, h(x_2) = 1, h(x_3) = 0$. Then $d^\infty_{\text{sh}}(f, g) = 0, d^\infty_{\text{sh}}(g, h) = 0$, but $f$ and $h$ have $D_{fh} = \{x_2\}$ and $d^\infty_{\text{sh}}(f, h) = 0$. Triangle inequality holds in this example but the construction shows it can be made fragile. ∎

The qualification is important: applications that need a genuine metric should use the union form, accepting the conflation of absence and zero, or commit to a domain-stability hypothesis that ensures shared subdomains coincide.

### 5.3 Foundation type signature (intra-$m$ intertemporal)

In its intra-$m$ intertemporal form, the subdomain-restriction distance has the following signature, expressed in the rigorous-edition's notation.

**Signature 5.3.1.** Given a modeling I $m$ and two times $t, t' \in T_m$, the subdomain-restriction $L^\infty$ distance is the partial function

$$d^\infty_{\text{sh}, m} : T_m \times T_m \rightharpoonup [0, +\infty],$$

$$d^\infty_{\text{sh}, m}(t, t') := \sup_{x \in \mathsf{A}^m_t \cap \mathsf{A}^m_{t'}} |\rho_{m,t}(\pi^m_t(x)) - \rho_{m,t'}(\pi^m_{t'}(x))|,$$

defined where $\mathsf{A}^m_t \cap \mathsf{A}^m_{t'} \ne \emptyset$, with the convention $+\infty$ where the intersection is empty.

The signature exhibits the metric as a function of $(m, t, t')$ that the foundation can supply once it has committed to the $L^\infty$ choice.

### 5.4 The infinite-domain case

If $\mathsf{A}^m_t$ may be infinite, $L^1$ and $L^2$ shared distances require a measure on the content domain. The architecture has the probe space $(Q^m_t, \mathcal{Q}^m_t, \mu^m_t)$ available, with a measurable evaluation map from probes to contents (committed in v0.3 at §0.15 of the rigorous edition). One natural choice is to take the pushforward of $\mu^m_t$ along the evaluation map; this gives a measure on the content domain to integrate against. The implicit commitment is that the probe measure is salience-weighted, which is the form of $\Lambda^\mu_m$ that the architecture has so far left open (`oq:probe-measure`).

The simpler $L^\infty$ form is independent of the measure, depending only on the shared subdomain and the function values. This is part of why $L^\infty$ is the natural starting point.

### 5.5 Relationship to the shells

The shell partition $\mathsf{Sh}_0, \ldots, \mathsf{Sh}_6$ (Definition 4.3.1 of the rigorous edition) coarse-grains the profile by threshold bands of $\rho$. The shell partition induces a natural categorical comparison: two profiles "agree on shells" iff each content's shell membership is the same in both. Shell-agreement is strictly weaker than pointwise equality but is empirically robust against small numerical perturbations within a shell.

**Definition 5.5.1** (shell-categorical distance).

$$d^{\text{shell}}_{\text{sh}}(f, f') := |\{x \in D : \text{shell}_{m,t}(x) \ne \text{shell}_{m,t'}(x)\}|,$$

the count of shared-subdomain contents whose shell membership changes between $t$ and $t'$. This is a discrete, integer-valued metric on the shared subdomain.

The shell-categorical distance is recommended for predictions of the form "this many contents have moved across the shell boundary between $\mathsf{Sh}_i$ and $\mathsf{Sh}_{i+1}$" — a common form in the temporal phenomenology and agency papers.

### 5.6 Open sub-questions in the subdomain-restriction approach

The candidate retains several open sub-questions even after the development above.

**Sub-question 1 (norm choice).** Should the foundation commit to $L^\infty$, $L^1$, $L^2$, or shell-categorical as the primary form? The case for $L^\infty$: norm-independence of the salience measure; computational simplicity. The case for $L^1$ and $L^2$: better behavior under integration over the domain; more sensitive to total-mass redistribution. The case for shell-categorical: empirical robustness; alignment with the architecture's shell-stratification. This paper leaves the choice deliberately open and recommends that application papers commit to whichever serves the specific prediction.

**Sub-question 2 (shared vs union form).** Should the foundation commit to the shared form (pseudo-metric, ignores transitions) or the union form (genuine metric, penalizes transitions)? Recommendation: both, with application-level choice.

**Sub-question 3 (persistence-class refinement).** Should the comparison be at the content level or the persistence-class level (cf. §3.2)? Recommendation: develop both refinements in v0.2 of this paper.

---

## 6. Candidate 2: Wasserstein-style transport distance

The second candidate treats each profile as a measure on $[0, 1]$ and computes a transport distance between the measures.

### 6.1 Setup

For each $(m, t)$ with a chosen measure $\nu^m_t$ on $\mathsf{A}^m_t$ (in the simplest case, counting measure or the pushforward of the probe measure), define the **ρ-value distribution**

$$\mu^\rho_{m,t} := (\rho_{m,t} \circ \pi^m_t)_* \nu^m_t,$$

the pushforward of $\nu^m_t$ under the scalar profile function. This is a measure on $[0, 1]$.

The Wasserstein-1 distance between two such measures is

$$W_1(\mu^\rho_{m,t}, \mu^\rho_{m,t'}) := \inf_{\gamma \in \Pi(\mu^\rho_{m,t}, \mu^\rho_{m,t'})} \int_{[0, 1] \times [0, 1]} |a - b| \, d\gamma(a, b),$$

where $\Pi$ denotes the set of couplings (joint measures with the given marginals).

### 6.2 What is preserved and what is lost

**Preserved.** The gross redistribution of $\rho$-mass: how much "weight" of contents is at high $\rho$ vs low $\rho$. This is exactly what the affect paper's predictions about "contraction" and "expansion" of the lived-I need.

**Lost.** Content identity. Two profiles with identical $\rho$-value distributions but different content-to-$\rho$ mappings are at $W_1$ distance zero. The temporal phenomenology paper's claims about specific contents moving across shells are not captured by Wasserstein alone.

### 6.3 The normalization question

If $\nu^m_t$ is counting measure on a finite $\mathsf{A}^m_t$, then $\mu^\rho_{m,t}$ has total mass $|\mathsf{A}^m_t|$, which depends on $(m, t)$. Comparing distributions of different total mass via $W_1$ is well-defined (the "earth mover" interpretation handles mass differences via boundary tax) but the resulting distance carries a "domain size change" component that may not be what the application wants. The alternative is to normalize: use $\mu^\rho_{m,t} / |\mathsf{A}^m_t|$, a probability measure, and compute $W_1$ on probability measures. The choice depends on whether domain-size changes are part of what is being compared.

The recommendation, for application papers using Wasserstein: normalize when the prediction is about gross-structure shape independent of domain size; do not normalize when the prediction is about total mass redistribution.

### 6.4 Foundation type signature (intra-$m$ intertemporal)

**Signature 6.4.1.** Given a modeling I $m$ with a probe measure family $(\mu^m_t)_t$, and two times $t, t'$, the Wasserstein-1 distance is

$$d^W_{m}(t, t') := W_1\big((\rho_{m,t} \circ \pi^m_t)_* \mu^m_t,\ (\rho_{m,t'} \circ \pi^m_{t'})_* \mu^m_{t'}\big).$$

(Or its normalized variant; see §6.3.)

The signature depends on the probe measure, which is an open function (`oq:probe-measure`). The foundation can declare the signature once the probe measure is in place; specific Wasserstein distances depend on the application's commitment to a probe-measure form.

### 6.5 Generalizations

Wasserstein-$p$ for $p \in (1, \infty)$ replaces $|a - b|$ with $|a - b|^p$ and takes the $p$-th root of the integral. Wasserstein-$\infty$ is the essential supremum of $|a - b|$ over couplings. Each captures slightly different aspects of the redistribution. The architecture has no a-priori commitment.

### 6.6 Open sub-questions in the Wasserstein approach

**Sub-question 1 (measure choice).** What measure to push forward (counting, probe-measure pushforward, edge-count-weighted, shell-weighted)? Recommendation: probe-measure pushforward, conditional on a future commitment to the probe-measure form.

**Sub-question 2 (normalization).** Probability measure or signed measure? See §6.3.

**Sub-question 3 (Wasserstein order).** $W_1$, $W_2$, or $W_\infty$? Recommendation: $W_1$ for first-draft applications.

---

## 7. Candidate 3: lived-I-network topological invariants

The third candidate compares the topology of the lived-I networks rather than the numerical profile values.

### 7.1 Setup

Recall (Definition 4.2.1 of the rigorous edition) that the lived-I network $\mathfrak{L}^m_t$ is the support of the base profile: the subset of $\mathsf{A}^m_t$ on which $\rho_{m,t}(\pi^m_t(x)) > 0$. As a subgraph of $G^{m,k}_t$ via $\pi^m_t$, the lived-I has its own graph-theoretic structure: vertex set, edge set with weights, shell stratification, etc.

Topological invariants of $\mathfrak{L}^m_t$ are graph-theoretic features that do not depend on relabeling vertices. Several natural candidates exist.

### 7.2 Candidate invariants

**Invariant 7.2.1** (shell-count vector). For each shell $\mathsf{Sh}_i$, the count $c_i(m, t) := |\mathsf{Sh}_i(m, t) \cap \mathfrak{L}^m_t|$. The shell-count vector $(c_0, c_1, \ldots, c_6)$ is a $\mathbb{N}^7$-valued invariant. Comparison: Euclidean or other vector distance.

**Invariant 7.2.2** (cogito-component-count). The number of connected components of $\mathfrak{L}^m_t$ that contain the cogito. The architecture commits that the cogito is in $\mathfrak{L}^m_t$; the component-count measures how "connected" the lived-I is around the cogito. (Typically 1, but can be higher in mode-mixed apparatuses.)

**Invariant 7.2.3** (spectral gap of the lived-I Laplacian). The second-smallest eigenvalue of the graph Laplacian of $\mathfrak{L}^m_t$ (treated as an undirected weighted graph). The spectral gap is a classical measure of connectivity strength; small spectral gap indicates near-disconnection.

**Invariant 7.2.4** (max-flow distribution to cogito). The distribution of max-flow values $C^{m,k}_t(x)$ from $\hat\iota_m$ to vertices $x \in \mathfrak{L}^m_t$. A probability distribution on $[0, \infty)$, comparable via Wasserstein.

**Invariant 7.2.5** (persistent homology of the ρ-filtration). The persistent homology of the filtration $(\mathfrak{L}^{m, \ge r}_t)_{r \in [0, 1]}$ where $\mathfrak{L}^{m, \ge r}_t := \{x : \rho_{m,t}(\pi^m_t(x)) \ge r\}$. This is mathematically rich and captures multi-scale connectivity structure, but is computationally expensive and may be overkill for many applications.

### 7.3 Comparison via invariant distance

Once a topological invariant $I : (m, t) \to \mathcal{I}$ is fixed, with $\mathcal{I}$ a metric space, the induced profile distance is

$$d^{\text{top}, I}_m(t, t') := d_\mathcal{I}(I(m, t), I(m, t')).$$

For shell-count vectors $(c_0, \ldots, c_6)$, $\mathcal{I} = \mathbb{N}^7$ with Euclidean (or other) distance.

### 7.4 What is preserved and what is lost

**Preserved.** Structural shape of the lived-I: how big, how connected, how concentrated around the cogito, how distributed across shells.

**Lost.** Numerical specificity: two profiles with very different $\rho$-values but the same shell-count vector are at distance zero in $d^{\text{top}, \text{shell-count}}$.

### 7.5 Open sub-questions in the topological-invariant approach

**Sub-question 1 (invariant choice).** Which invariant to use? Application papers will typically pick the invariant matching the structural feature being predicted (shell-count for shell-redistribution claims, spectral gap for connectivity claims, etc.).

**Sub-question 2 (composition of invariants).** Should the foundation support a *vector* of invariants and a composite distance? Recommendation: yes; applications can project to whichever invariant component they need.

**Sub-question 3 (persistent-homology cost).** Is the computational cost of persistent homology justifiable at the foundation, or is it strictly an application-level tool? Recommendation: application-level, at least for v0.1 of this paper.

---

## 8. Synthesis: which metric for which use case

The following recommendation table consolidates the use-case-to-metric mapping.

| Application paper | Use case | Recommended metric | Justification |
|---|---|---|---|
| Temporal phenomenology | Moment-to-moment profile evolution | $d^\infty_{\text{sh}}$ or shell-categorical | Captures fine-grained continuity with small computational cost. |
| Agency | Counterfactual profile family | Lived-I topological invariants (shell-count or spectral gap) | Agency claims are structural, not pointwise. |
| Free will | Deliberation-time profile evolution | $d^\infty_{\text{sh}}$, with persistence-class refinement | Same character as temporal phenomenology. |
| Differentiated affect | Affect-state profile comparison | $W_1$ on normalized ρ-distribution | Affect claims are about gross redistribution. |
| Religious experience | Pre/post and during-experience comparison | $d^\infty_{\text{un}}$ for transitions, $W_1$ for gross redistribution | Combines transition and redistribution claims. |
| Inter-$m$ (any) | Cross-subjective comparison | Topological invariants only | Pointwise distance requires inter-subjective content correspondence; topological invariants depend only on the lived-I structure. |

This table is a working recommendation, not a foundation commitment. Each application paper should justify its metric choice and the inter-paper consistency requirement is only that compositions of metrics (when a paper uses more than one) be coherent.

---

## 9. Path to foundation integration

Three integration paths are worth considering.

**Path A: minimal foundation commitment.** The foundation commits only the signatures of the three candidate metrics, leaving the choice and the open sub-questions to the application papers. This is the most conservative path; it preserves the architecture's deferral strategy while making the deferral explicit.

**Path B: structured agnosticism.** The foundation commits the signatures and a small number of derived facts (non-negativity, symmetry, what each metric preserves), plus a vocabulary for application papers to extend. This is the recommended path: it gives application papers a shared starting point without forcing a single metric choice.

**Path C: full commitment.** The foundation commits to one primary metric (e.g., $d^\infty_{\text{sh}}$ as the canonical pointwise distance) and treats the others as derived structures. This is the least conservative path; it makes the architecture's predictions more uniform across applications at the cost of restricting which kinds of predictions are admissible.

Path B is recommended. A v0.2 of this paper would develop the foundation-level signatures and supporting lemmas under Path B, lift the most-developed candidate (subdomain-restriction in its $L^\infty$ shared form) to a foundation-level definition with proofs, and provide a vocabulary that the application papers can refer to.

For Lean encoding, the subdomain-restriction $L^\infty$ form is the most tractable target: it can be expressed as a function `ℝ`-valued (or `K`-valued) sup over a finite or countable set, with `Mathlib.Topology.MetricSpace.Basic` providing the metric-space framework. The Wasserstein-1 distance is also encodable but requires the optimal-transport library in mathlib (`Mathlib.MeasureTheory.OptimalTransport`), which is more involved. The topological invariants are encodable per-invariant; shell-count is trivial, spectral gap and persistent homology are substantial.

---

## 10. Open sub-questions surfaced by this paper

The following questions remain open after this first-phase development. They are added to the project's open-question ledger for future work.

**oq:profile-comparison-norm** (sub-question of `oq:profile-comparison`). Among $L^\infty$, $L^1$, $L^2$, and shell-categorical, what is the foundation's primary norm choice for the subdomain-restriction pointwise distance? Status: open-theoretical.

**oq:profile-comparison-domain-form** (sub-question). For the subdomain-restriction approach, foundation primary form: shared subdomain (pseudo-metric) or union with zero-extension (genuine metric)? Status: open-theoretical.

**oq:profile-comparison-persistence-refinement** (sub-question). Should profile comparison be at the content level or the persistence-class level? Status: open-theoretical, depends on resolution of `oq:persistence-construction`.

**oq:wasserstein-measure** (sub-question). For the Wasserstein-style transport distance, what measure on the content domain should be pushed forward? Status: open-theoretical, depends on resolution of `oq:probe-measure`.

**oq:cross-i-correspondence** (sub-question). For inter-$m$ profile comparison, what notion of inter-subjective content correspondence is admissible? Status: open-theoretical, depends on resolution of `oq:inside-projection-specification`.

**oq:profile-comparison-foundation-commitment** (umbrella). Which integration path (§9: A, B, or C) should the foundation take for v0.4 of the rigorous edition? Status: open, awaiting application-paper feedback on this v0.1.

---

## 11. Closing note

This working paper does not resolve `oq:profile-comparison`. It advances the question by developing three candidate structures, surveying their use-case fit, and identifying what foundation commitments each would entail. The next iteration of this paper (v0.2) should: (i) develop the subdomain-restriction $L^\infty$ shared form to foundation-ready definitions with proofs; (ii) tighten the Wasserstein and topological-invariant sketches; (iii) consult the application papers to confirm or refine the use-case recommendations of §8; (iv) propose specific Lean encoding targets for the subdomain-restriction form. v0.3 would lift the chosen primary form to a candidate addition to the rigorous edition's §4.1.5 or a new section.

The architecture's deferral of Gap 12 to the application papers remains the recommended posture for the foundation; this paper does not propose to overturn it. What it provides is structure within the deferral: a vocabulary, a candidate space, type signatures, and a use-case table. Application papers can now reference this vocabulary without re-deriving it.

---

*End of profile comparison working paper v0.1.*
