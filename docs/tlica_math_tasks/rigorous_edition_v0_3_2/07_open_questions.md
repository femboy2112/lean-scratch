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
