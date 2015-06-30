---
layout: post
title:  Physicist's proof of Markov chain convergence
date:   2015-06-29 14:00:00
comments: true
---

While writing up a chapter on Monte Carlo methods for my thesis, I had the
chance to come back to a question that has bugged me for some time, yet I
always thought the answer was out of reach without a lot of complicated and
opaque mathematics. The types of Markov chains that I'm accustomed to dealing
with in statistical physics are mainly of a simple variety with the property of
[irreducibility][], meaning that **regardless of the present state we can reach
any other state in a finite number of steps**, and [aperiodicity][], meaning
that **the system does not necessarily return to the initial state in a finite
number of steps.** (Roughly speaking, irreducibility is equivalent to the
property of [ergodicity][] in physics, and aperiodicity is akin to
irreversibility.)

As a toy example, consider the following 3-state Markov chain,

![3-state Markov chain]({{ site.baseurl }}/images/markov.svg)

with transition matrix

$$ \Gamma =
\frac{1}{4}
\begin{pmatrix}
  3 & 1 & 0 \\
  0 & 2 & 2 \\
  3 & 0 & 1 \\
\end{pmatrix}.
$$

Notice that from each state $s$ the only possible moves are

1. $s \to s+1 \pmod{3}$, or
2. $s \to s$.

That is, we can only move "counterclockwise" or stay put at each step. Because
there is more than one possible move from each state, the process is
irreversible, or aperiodic.

Also notice that $s=0$ is the "stickiest" state since transitions out of it are
the least probable, while $s=2$ is the least "sticky". Thus we might
intuitively expect the steady state probability distribution to have the most
weight at $s=0$ and the least at $s=2$.

To find the steady state probability distribution we can start with an
arbitrary distribution (a row vector in the present convention) and repeatedly
right multiply by $\Gamma$. To see that the steady-state distribution is
independent of where we start, we compute powers of $\Gamma$ without yet
multiplying by the initial distribution:

$$
\begin{align*}
\Gamma^2 &\approx
\begin{pmatrix}
  0.56 & 0.31 & 0.13 \\
  0.38 & 0.25 & 0.38  \\
  0.75 & 0.19 & 0.06 \\
\end{pmatrix} \\[1em]
\end{align*}
$$

Observe that, although the transition matrix $\Gamma$ has some zero entries,
the entries of $\Gamma^2$ are strictly positive. This is equivalent to the
observation that, regardless of the present state, it's possible to reach any
other state in two moves. Consequently, for $n \geq 2$, the elements of
$\Gamma^n$ are strictly positive. Continuing with the iteration, we find

$$
\begin{align*}
\Gamma^3 &\approx
\begin{pmatrix}
  0.52 & 0.30 & 0.19 \\
  0.56 & 0.22 & 0.22 \\
  0.61 & 0.28 & 0.11 \\
\end{pmatrix} \\[1em]
&\vdots \\
\Gamma^{10} &\approx
\begin{pmatrix}
  0.55 & 0.27 & 0.18  \\
  0.55 & 0.27 & 0.18 \\
  0.55 & 0.27 & 0.18 \\
\end{pmatrix}.
\end{align*}
$$

The entries in each column have converged to a common value. It follows that
right multiplication of an arbitrary probability vector by a large power of
$\Gamma$ yields the column vector
$\vec{\pi} \approx \begin{pmatrix} 0.55 & 0.27 & 0.18 \end{pmatrix}^T$,
which is the steady-state distribution. What's going on here? How can we see
that this is true in general for similar Markov processes?

# Proof

We'll use the following two properties of the transition matrix, $\Gamma$:

1. *$\Gamma$ is right-stochastic.* That is, its rows all sum to one. (This is a
   simple consequence of requiring that right multiplication by $\Gamma$
   conserves probability.)

2. *$\Gamma$ represents an irreducible, aperiodic Markov chain*. That is, there
   is some number of steps $N$ such that $n \geq N$ implies that
   $\Gamma^n$ has only positive entries. 

Assuming first that $\Gamma_{ij} > 0$, consider the result when we multiply
an arbitrary matrix $A$ on the left by $\Gamma$:

$$
(\Gamma A)_{ij} = \sum_k \Gamma_{ik} A_{kj}
$$

Because of (1) and (2), each entry in the $j$th column of $\Gamma A$ is a
[convex combination][] of entries in the $j$th column of $A$. This means that
each entry in the $j$th column of $\Gamma A$ must be *strictly larger than the
smallest entry* in the $j$th column of $A$ and *strictly smaller than the
largest entry*. (Notice that *strict* inequality, which is essential for the
present argument, follows from the strict positivity of $\Gamma$). Thus **each
multiplication by $\Gamma$ *squeezes* the range of values in each column,
forcing eventual convergence  to some constant value.** It follows that
$\Gamma^n$ converges in this manner as $n \to \infty$, and that the
steady-state probabilities are just the constant values in each column.

If $\Gamma$ is not strictly positive, the above argument applies following the
substitution $\Gamma \to \Gamma^N$, the latter of which is guaranteed by
(2) to be strictly positive.

# Perron-Frobenius theorem

In some concise descriptions of the problem, the [Perron-Frobenius
theorem][PFT] is invoked to prove the convergence of Markov processes. Its
content is essentially

> A real square matrix with positive entries has a unique largest real
> eigenvalue and the corresponding eigenvector can be chosen to have strictly
> positive components.

At least for the case of an irreducible, aperiodic matrix, the theorem can be
proven by an argument similar to the above. For convenience, in what follows
we'll assume that $\Gamma$ has strictly positive entries (to generalize we can
substitute $\Gamma \to \Gamma^N$). First, note that right-stochasticity
implies that the vector of ones $\vec{1}$ is a right eigenvector of $\Gamma$
with eigenvalue one. For any vector $u$, each component of $\Gamma u$ is a
convex combination of the components of $u$, and thus can be no larger in
magnitude than the largest component of $u$. That is,

$$
\left| \sum_j \Gamma_{ij} u_j \right| \leq \max \left\{ |u_k| \right\}
$$

for all $i$. But equality for *any* $i$ implies that the components of $u$ are
all equal, or, in other words, $u$ is an element of the one-dimensional
eigenspace spanned by $\vec{1}$. Therefore $\Gamma u = \lambda u$ implies that
either $u$ is proportional to $\vec{1}$ or $|\lambda|<1$.

I've said nothing about the *rate* of convergence (which could be
infinitesimal) in the above arguments. This is a much harder problem, but one
that I hope to come back to eventually.

## References
- [Narayan and Young, 2001](http://journals.aps.org/pre/abstract/10.1103/PhysRevE.64.021104)
- [this answer](http://math.stackexchange.com/questions/40320/proof-that-the-largest-eigenvalue-of-a-stochastic-matrix-is-1) on Math.StackExchange
- Kemeny and Snell, *Finite Markov Chains*

[irreducibility]: https://en.wikipedia.org/wiki/Markov_chain#Reducibility
[ergodicity]: https://en.wikipedia.org/wiki/Ergodicity
[aperiodicity]: https://en.wikipedia.org/wiki/Markov_chain#Periodicity
[convex combination]: https://en.wikipedia.org/wiki/Convex_combination
[PFT]: https://en.wikipedia.org/wiki/Perron%E2%80%93Frobenius_theorem
