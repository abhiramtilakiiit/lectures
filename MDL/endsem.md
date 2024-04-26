# MDL Endsem short notes

## Syllabus

- Slides, for Frequent pattern mining, Classification, Clustering, Search

- ai.pdf
  - Chapter 7 (7.5) (no 'Horn Clauses' or 'Forward and Backward Chaining')
  - Chapter 13(Quantifying Uncertainty): Till the end of Section 13.5
  - Chapter 16 (Making Simple Decisions): Topic on utility theory as
    covered in MDP slides
  - Chapter 17 (Making Complex Decisions): Till the end of Section 17.2

Paper for MDP: Till the end of section 3 and a brief reading of Section 4: Paper
(Please follow the notation used in class just in case the paper uses a
different notation)

## Chapter 7 ( Logical Agents )

Humans can adapt to changes from the surroundings.

- Validity = tautologies
- deduction is when $\alpha \implies \beta$. By

  Deduction theorem states that, every valid implication sentence describes an
  inference

- Satisfiabitlity = not fallacy

Proof by contradiction is called refutation.

## Inferences

- Modus ponens - If there is a implies b and a, then b.
- Modus tollens - if there is not a implies not b, if not b then a.
- And elimination - If there is a and b, then a

## Theorem proving

We can use logic to prove any theorem, but there is a computer way of
doing it.

- Unit resolution, let's say $l_i$ and $m_j$ are complementary literals
  which or each other to give false. Then
  $$ \frac{l_i \or ... \or l_k, m_i \or ...\or m_n}{both without l_i and m_j} $$

Thus we can eleminate complementary literals to obtain more useful statements.

## Resolution based theorem prover

Resolution is only applied to clauses connected with ors, we can convert a
sentence into conjunctive normal form, and every single clause will have
resolution in them.

The resolution algorithm is just to resolve every clause until there is no
new clause (end is that it is satisfiable) or you get an empty clause, then
it is unsatisfiable.

## Completeness

Take a power set with all possible compbinations of Pi i from 1 to k.
Now if there are any two Pi, Pj which complement, then you get unsatisfiability.
Or else no other combination will give a new set (because all combinations
except {} are there in the power set), which gives satisfiability.

## Uncertainity

Theoratically you can have a model which keeps track of all its possible states.
But in a real world scenario

- That is not possible, there are infinitely many states
- May effect the performance of the model.
- If the path for achieving final state is not known, there must be some way to
  prefer one thing over another.

There is no one way to maximize things, there are usually situations where
too much is too bad, we have to thus find a common-ground.

Decision theory = probability theory + utility theory

## Maximum expected Utility

An agent is called rational only if it prefers the highest expected utility
averaged over all possible outcomes of action Maximum expected utility (MEU).

## Utility theory

Any utility function follows through the following axioms:

- Orderability - For any two lotteries a rational agent "has to" to choose
  between any of the two, (the agent cannot avoid deciding)
- Transitivity - If A is over B, and B is over C then A is over C
- If B is a lottery between A and C, then there is some p for which
  A, C are indifferent from B.
- Substituitability - if agent is indifferent between A and B then in any
  complex lottery we can substituite A and B.
- Monotonicity - if two lotteries have same outcomes, then agent must prefer the
  ones with higher probability.
- Decomposability - Compound lotteries can be reduced to simple ones. just
  multiply the consecutive ones.

If there exists a utility function, using the above axioms we can derive the
following consequences.

- Existence of utilty function - if A is preferred over B, then there exists a
  utility function which does the same U(A) > U(B)

- Expected utility (mean): it is the sum of utility of all possible outcomes
  multiplied with the probability of each outcome.

## Utility functions

In reality, an agent just needs a preference order of utility, it doesn't really
care about its numbers, this is called value function or ordinal (order related)
utility function.

Utility function is something that maps lotteries to real numbers.

### Utility assesment and scales

We need to scale utilities from 0 to 1. Called normalize utilities.
Humans to utility assesment all the time in life, its not new or immoral

Utility function needs to take care not only of profits in number, but also
profit as an idea. If i profit million dollars, betting over second million is
useless because first million is what matters.

### Expected utility

Expected utility doesn't contain how many values, it was expected over, so we
need to include probability of error to fix this.

### Human Judgement and Irrationality

Humans have certainity effect, shown above. People have ambiguity aversion.
Framing effect: Describing 90% suvival rate > 10% death rate.
We can buy a $55, worth

### Dominance

- Strict dominance - its when one state defeats the other in all attributes.
- Stochastic dominance - can be easily shown using cumulative distributions.
  if CDF for all x for A is less than CDF for all x for B then B stochasticaly
  dominates B.

### MPI ( mutual preferential independence )

If there are n-attributes, we just take the weighted sum instead of making a
table for each of them.

- Mutual Utility independent - alright so for cases where the overall utility is
  based on two of them together, we need to have a utility which takes into
  consideration, the sum of both independent utilities.
- U = $k_1U_1U_2$ + $k_2U_1$ + $k_3U_2$.

## Making comples decisions

- Markov - Remembers only previous state.
  MDP - fully observable sequencial process

- Bayesian - Remembers all states upto now.

### Problem setup

Infinite horizon is when you can just take your time and stay in your current
state instead. But infinite sequences can be made finite using discount factors.
