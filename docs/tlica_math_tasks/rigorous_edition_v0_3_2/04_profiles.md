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
