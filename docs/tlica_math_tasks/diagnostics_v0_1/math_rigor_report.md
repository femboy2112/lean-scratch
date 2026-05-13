# TLICA Math Rigor Report — v0.1

> **Companion to:** `outputs/math_ledger.md`.
> **Purpose:** Identify the gaps blocking advancement of the formal apparatus from `signature-declared` to `well-defined`, ordered by load-bearing impact on the rest of the architecture. Each gap names the entries it blocks, proposes a minimal resolution, and notes whether the resolution is a theoretical commitment (requiring the author's decision) or a clean-up (no theoretical change).
> **Scope:** Foundation v5.3.3 (Files 1–5). Application papers are out of scope for this report.

## Reading the report

A gap whose resolution requires only making implicit choices explicit is marked `clean-up`. A gap whose resolution requires a substantive theoretical commitment is marked `commitment-needed`. A gap whose resolution is genuinely open in the philosophical sense — where the architecture currently has reasons not to commit — is marked `open-theoretical`.

The order of gaps is approximate load-bearing weight: resolving Gap 1 advances the largest number of downstream entries; resolving Gap 12 affects the fewest.

---

## Gap 1. Max-flow on possibly infinite networks (`oq:maxflow-infinite`)

**Status:** `commitment-needed`.

**The issue.** The integration graph $G^{m,k}_t$ has vertex set $V^m_t = \{\hat\iota_m\} \cup \mathsf{H}^m_t$. $\mathsf{H}^m_t$ accumulates over time as the history domain grows by persistence-equivalence classes of time-stamped tokens. The architecture does not bound $|V^m_t|$. As an abstract structure, the graph could be countably infinite at any time after early development.

Standard max-flow theory is stated for finite networks. On infinite networks, several non-equivalent generalizations exist. The Ford–Fulkerson construction still works on locally finite networks of arbitrary cardinality if the flow is finite. The Aharoni–Berger max-flow / min-cut theorem (2009) covers arbitrary infinite networks but uses a transfinite construction.

**What this blocks.** Every downstream entry in the ledger that uses `def:rho`: the strict bound `lem:rho-strict-bound`, the profile `def:P`, the lived-I network `def:lived-I`, the shells `def:shells`, profile-to-profile comparison (`oq:profile-comparison`), and the imprinting dynamics `def:update` (which moves edge weights on the graph).

**Proposed minimal resolution.** Adopt the locally-finite, finite-flow regime: require that $G^{m,k}_t$ be locally finite (each vertex has finitely many incident edges, even if $V^m_t$ is infinite) and that the max-flow from $\hat\iota_m$ to any other node be finite. Both conditions are operationally reasonable for any actual cognitive system at finite time, since substrate-bounded I's have finite-resource imprinting per unit time and the persistence quotient is taken over an inherently finite-rate experience stream. Under this regime, max-flow has its standard value, $C^{m,k}_t(x) < \infty$ for every non-core $x$, and $\rho^{m,k}_t(x) < 1$ holds as the architecture states. This is the recommended commitment because it is theoretically lightweight and keeps the existing formulae unchanged.

**Alternative.** Commit to the Aharoni–Berger framework, which removes the finiteness assumptions but increases the formalization overhead. Not recommended unless application papers force the issue.

**Theoretical impact.** Minimal. The text's formulae and predictions are unchanged. The only addition is a well-formed-graph predicate in the model instance.

---

## Gap 2. Verification pathway as a formal object (`oq:pathway-object`)

**Status:** `commitment-needed`.

**The issue.** The conditional depth $n_{m,t}(x)$ "counts steps along the verification pathway constructible from $\mathsf{Tools}^m_t$." The architecture treats pathways informally. Without a definite formal model of what a pathway is, $n$ is not a function but a schema.

**What this blocks.** `def:n`, `def:phi` (Tier 3), `def:epsilon` (depends on the same constructibility predicate), `def:taxonomy` (the latent / unconscious-operative distinction uses pathway constructibility), `def:Tools` (its structural role).

**Proposed minimal resolution.** Model a verification pathway for $x$ from toolset $\mathcal{T}$ as a finite sequence $\pi = (\pi_0, \ldots, \pi_n)$ where $\pi_0$ matches a universal-content member of $\mathsf{Int}$, $\pi_n = x$, and each transition $\pi_i \to \pi_{i+1}$ is justified by an operation drawn from $\mathcal{T}$. A tool is then a partial relation over contents (possibly with side conditions on $\mathsf{Tools}^m_t$ at the I's state). $n_{m,t}(x)$ is the length of the shortest such pathway, with $\inf \emptyset := +\infty$, and "constructibility" is finiteness of $n$.

This makes $n_{m,t}$ a partial function defined exactly on contents with a pathway, exactly as the architecture says, and connects neatly to existing inference-theoretic vocabulary.

**Theoretical impact.** Modest. The architecture has been agnostic on what tools "are" structurally; this commits them to being partial inferential operators. Application papers using tools as more elaborate objects (e.g. a meditative practice as a tool) need to confirm they fit this signature. The architecture's flexibility is preserved because the operation-content of a tool is unconstrained.

---

## Gap 3. The value field $\mathbb{K}$ and which features matter (`oq:K-features-required`)

**Status:** `clean-up`.

**The issue.** $\mathbb{K}$ is introduced as "an ordered field extending $\mathbb{R}$" with a positive infinitesimal $\delta$, with hyperreals as an example. The architecture is parametrized over choices of $\mathbb{K}$. Which features are load-bearing?

**What this blocks.** Every $\phi$-related entry. The bound $n\delta + \epsilon \le 1$ requires comparing an $\mathbb{R}$-valued integral $\epsilon$ with a $\mathbb{K}$-valued quantity $1 - n\delta$; this needs the canonical embedding $\mathbb{R} \hookrightarrow \mathbb{K}$.

**Proposed minimal resolution.** State the structural requirements on $\mathbb{K}$ explicitly: $\mathbb{K}$ is a totally ordered field; the natural ring map $\mathbb{Z} \to \mathbb{K}$ extends to an embedding $\mathbb{Q} \hookrightarrow \mathbb{K}$ and via Dedekind cuts or Cauchy completion to $\mathbb{R} \hookrightarrow \mathbb{K}$; there exists a positive element $\delta \in \mathbb{K}$ with $\delta < r$ for every $r \in \mathbb{R}_{>0}$. Anything that uses $\delta$ uses only its infinitesimality with respect to $\mathbb{R}$. The hyperreals or any non-Archimedean ordered field extending $\mathbb{R}$ qualifies.

**Theoretical impact.** None. This makes implicit choices explicit and lets readers verify the apparatus is independent of the specific construction.

---

## Gap 4. Formal non-reducibility as a proven proposition (`prop:nonreducibility`)

**Status:** `clean-up`.

**The issue.** §7.4 of the formal apparatus states three independence claims as bullets ("Vary $\chi_m$ while holding ... fixed: $\kappa_m$ changes; $\phi_m$ and $\rho_m$ do not"). Currently `prose-only`. The architecture treats this as definitionally evident, but formalization requires the variation argument.

**What this blocks.** The architecture's central methodological claim that critiques treating independence as statistical or causal are misreading the architecture's commitment. Without a formal independence proposition, the claim is at the level of intent rather than provable consequence.

**Proposed minimal resolution.** State and prove three formal propositions:

> **Proposition (κ-independence).** Fix $m$, $t$, the family of integration graphs $(G^{m,k}_t)_k$, the truth-profile components $(n_{m,t}, \epsilon_{m,t})$, the source map $\sigma^m_t$, and all other components of $\mathcal{M}_m$ except $\chi_m$. Let $\chi_m, \chi'_m$ be two contact interfaces. Then the induced $\kappa_{m,t}$ and $\kappa'_{m,t}$ may differ at some $n \in \mathsf{N}_m$, while $\phi_{m,t}$ and $\rho_{m,t}$ are unchanged.

The proof is immediate from the definitions: $\rho$ depends only on the graphs (not on $\chi_m$); $\phi$ depends only on $n$ and $\epsilon$ (not on $\chi_m$); $\kappa^{\mathrm{out}}_{m,t}$ depends on $\chi_m$ via the source-set supremum.

Analogous propositions for φ-independence (vary $(n, \epsilon)$, fix everything else) and for ρ-independence (vary graphs, fix everything else) have analogous one-line proofs.

The propositions cleanly distinguish *formal* independence (variation under fixed other inputs) from *dynamic* entanglement (the operating-system effects in §7.4), exactly as the architecture intends.

**Theoretical impact.** None. This is the proof obligation already discharged informally by the bullets.

---

## Gap 5. One-sided-limit structure on $T_m$ for the update rule (`def:update`)

**Status:** `clean-up`.

**The issue.** §8.4 uses $w^{m,k}_{s^-}$ and $w^{m,k}_{s^+}$ to denote pre- and post-event edge weights. This presupposes that $T_m$ has the structure to support one-sided limits, or that the event happens at a moment that admits a canonical predecessor and successor in the weight family.

**What this blocks.** `def:update`; downstream dynamics; the always-operating osmotic mechanism.

**Proposed minimal resolution.** Two equally workable options: either declare $T_m$ to be discrete (so $s^- = s$ and $s^+$ is the successor, or vice versa), or declare $T_m$ continuous with right-continuous weight functions (so $w^{m,k}_{s^-}$ is the left-limit and $w^{m,k}_{s^+} := w^{m,k}_s$). The continuous-time choice is closer to phenomenological time; the discrete-time choice is simpler to reason about.

**Recommendation.** State both regimes as supported, with the continuous-time regime as the canonical formalization and the discrete-time regime as the implementation-style approximation. Both have the same downstream consequences for the dynamics.

**Theoretical impact.** None. The architecture is implicitly continuous-time elsewhere; making this explicit costs only the statement.

---

## Gap 6. Probe-space structure and integral well-definedness (`oq:probe-measure`)

**Status:** `commitment-needed`.

**The issue.** §7.3 defines $\epsilon_{m,t}(x) = \int_{Q^m_t} (1 - q(x)) d\mu^m_t(q)$, where $Q^m_t$ is the probe set and $\mu^m_t$ a "probability weight." For the integral to be well-defined, $Q^m_t$ must carry a σ-algebra, $\mu^m_t$ must be a probability measure on it, each probe $q$ must be a measurable function with values in $[0, 1]$, and the integrand $q \mapsto 1 - q(x)$ must be measurable for each fixed $x$.

**What this blocks.** `def:epsilon`, `def:phi` (Tier 3), `def:mu` and its dependency $\Lambda^\mu_m$.

**Proposed minimal resolution.** Commit to the following structural framing: $Q^m_t$ is a measurable space; each $q \in Q^m_t$ is a Borel-measurable map $\mathsf{A}^m_t \to [0, 1]$; $\mu^m_t$ is a probability measure on the σ-algebra of $Q^m_t$ chosen such that the evaluation map $\mathrm{ev}_x : Q^m_t \to [0, 1]$, $\mathrm{ev}_x(q) = q(x)$, is measurable for every $x \in \mathsf{A}^m_t$.

**Theoretical impact.** None. The architecture's substance is unchanged; what changes is that the integral now has a definite meaning. The "open function" $\Lambda^\mu_m$ remains open at the application level — it produces a probability measure, but its specific form is unspecified.

---

## Gap 7. Domain of definition for $\phi$ (named subset)

**Status:** `clean-up`.

**The issue.** Tier-3 $\phi$ is defined on "asymptotic contents with constructible verification pathway." This domain has no explicit name and is used implicitly in §7.3, §7.5, §6.1 (the taxonomy classes).

**What this blocks.** Cleanness of `def:phi`, `def:n`, `def:epsilon`, `def:taxonomy`.

**Proposed minimal resolution.** Define $\mathrm{Verif}(m, t) := \{x \in \mathsf{A}^m_t : \exists$ verification pathway for $x$ from $\mathsf{Tools}^m_t\}$ and state the partial-function signature $\phi_{m,t} : \mathsf{Verif}(m, t) \cup \{\hat\iota_m\} \to \mathbb{K}$. This subset name should be used consistently in the formalization document.

**Theoretical impact.** None.

---

## Gap 8. Fuzziness as a formal object or not (`def:Fz`, `prop:fuzziness-tendency`)

**Status:** `commitment-needed`.

**The issue.** §8.5.4 introduces $\mathrm{Fz}_{m,t}(x)$ as a phenomenological feature. No operational definition, no codomain, no measurement procedure. The tendency claim "$D \uparrow \leadsto \mathbb{E}[\mathrm{Fz}] \uparrow$" has no formal content without these.

**What this blocks.** Anything in the formal apparatus that treats Fz as more than informal vocabulary, including the prediction-side fuzziness-tendency claim.

**Options.**

- **Option A.** Drop Fz from the formal apparatus. Keep it as application-level vocabulary in the prose. The tendency claim becomes an empirical hypothesis stated in prose, not a proposition in the formal apparatus.
- **Option B.** Define Fz operationally. One workable definition: $\mathrm{Fz}_{m,t}(x) = 1 - I(x)$, where $I(x)$ is a normalized information-theoretic measure of the propositional resolution of $x$ as accessible from $\mathsf{Tools}^m_t$ (e.g. the size of the most refined partition of contents the I can articulate about $x$). This is a substantial commitment.

**Recommendation.** Option A. The architecture explicitly disclaims fuzziness as a fourth coordinate; demoting it from formal apparatus to application-level vocabulary preserves the architecture's own framing. The tendency claim is then a prediction in §11, not a proposition in §7–8.

**Theoretical impact.** None (Option A) or substantial (Option B). Option A is cleaner.

---

## Gap 9. Osmotic mechanism formalization (`def:osmotic`)

**Status:** `clean-up`.

**The issue.** §8.7 describes osmotic imprinting in prose; the only formal content is its always-operating status. The architecture explicitly disclaims rate specification.

**What this blocks.** Nothing critical. The osmotic mechanism is intentionally underspecified.

**Proposed minimal resolution.** Add a signature commitment without rate specification. Let $b^{\mathrm{osm}}_m : T_m \to [0, \infty)$ be the osmotic bandwidth at time $t$ (open function; bandwidth zero permitted). State that osmotic updates affect graph weights $w^{m,k}_t$ via a separate event stream, with the same update-rule shape as `def:update` but with $\alpha, \beta$ determined by ambient co-occurrence rather than focused contact. This preserves the architecture's commitments while making the formal status of "always-operating" precise (the mechanism is online; the bandwidth function $b^{\mathrm{osm}}$ may take value zero on subintervals).

**Theoretical impact.** None.

---

## Gap 10. Mode-aggregation across infinite $K$ (`oq:rho-modes-K`)

**Status:** `clean-up`.

**The issue.** §7.2 says $K$ is "finite or countable." If countably infinite, the convex combination $\rho_{m,t}(x) = \sum_k a_k \rho^{m,k}_t(x)$ requires convergence. Since $a_k > 0$, $\sum a_k = 1$, and $\rho^{m,k}_t(x) \in [0, 1]$, the series converges absolutely. So this is just a clean-up.

**Proposed minimal resolution.** State the convergence one-liner.

**Theoretical impact.** None.

---

## Gap 11. Axioms on $A_{m,t}$ across time (`oq:phenomenology-status-axioms`)

**Status:** `open-theoretical`.

**The issue.** The phenomenal-availability predicate is currently exogenous. The architecture deliberately treats it as a status predicate rather than a fourth coordinate, deferring detailed development to application work (the differentiated-affect paper).

**What this blocks.** Nothing in the core (by design). Application work may need closure or coherence axioms.

**Recommendation.** Leave open. Mark in the formalization document that axioms on $A_{m,t}$ are application-level.

---

## Gap 12. Profile comparison metric (`oq:profile-comparison`)

**Status:** `open-theoretical`.

**The issue.** The architecture's predictions are stated as profile-to-profile comparisons but no specific comparison metric is committed. This is a genuine open theoretical question: whether the architecture commits to a specific metric or whether different applications use different metrics.

**What this blocks.** §11 predictions whose form is "I A's profile differs from I B's profile in such-and-such way."

**Recommendation.** Leave open at the core level; ask application papers to commit to specific comparison metrics as needed.

---

## Aggregate

Of the twelve gaps, six are `clean-up` (no theoretical change required), four are `commitment-needed` (require the author's decision between equivalent or near-equivalent formalizations), and two are `open-theoretical` (genuinely open; appropriately so).

A single concentrated pass resolving Gaps 1–7 (plus the small clean-ups 10) would lift roughly nineteen of the twenty-five `signature-declared` ledger entries to `well-defined`. The two remaining `open-theoretical` items would stay open by design.

## Recommended order for the formalization edition

The formalization document `outputs/formalization/` should be built in this order:

1. `00_signature.md` — list of all primitive types, the value field $\mathbb{K}$ and its required features, and the global namespace.
2. `01_objects.md` — the cogito, primal not-I, time, substrate, contact interface, asymptotic content domain, phenomenal-availability predicate.
3. `02_graph_theory.md` — the integration graphs $G^{m,k}_t$, local finiteness commitment, max-flow definition, persistence-token construction.
4. `03_coordinates.md` — κ, φ, ρ with explicit signatures; the formal independence proposition; the rigorous version of `def:phi` with $\mathrm{Verif}(m, t)$, pathway formalization, and probe-space structure.
5. `04_profiles.md` — the profile object, the lived I, the shells, the four-class taxonomy.
6. `05_dynamics.md` — the update rule with one-sided-limit structure; the osmotic mechanism with bandwidth signature.
7. `06_independence_lemmas.md` — formal statement and proof of the three non-reducibility propositions.
8. `07_open_questions.md` — the residual `open-theoretical` items (Gaps 11–12 plus any that emerge in writing).

The first file is short enough to draft now; I do so below as `outputs/formalization/00_signature.md`.
