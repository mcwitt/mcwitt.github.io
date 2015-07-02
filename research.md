---
layout: default
title: Research
---

I study [complex systems][], particularly those with disorder and
"frustration", where random interactions between a large number of parts give
rise to emergent behavior which is difficult to understand from first
principles.

Spin glasses
============

Mainly I have worked on [spin glasses][], materials containing magnetic atoms
("spins") that interact in a random way with their neighbors. Some pairs of
neighbors prefer to align in the same direction, and others in opposite
directions. To make it a bit more precise, for a pair of neighbors $$i$$ and
$$j$$, we define a "coupling" $$J_{ij}$$. If the coupling is positive, the
spins tends to align in the same direction in the absence of external
influences and we say the interaction is "ferromagnetic". If negative, the pair
tends to align in opposite directions and the interaction is
"antiferromagnetic". The magnitude of the coupling describes the strength of
the preference for alignment or anti-alignment.

In a *ferromagnet*, the couplings are all positive and thus at low-enough
temperatures all of the spins will align, giving a net magnetization. At higher
temperatures the couplings are overwhelmed by thermal fluctuations, resulting
in the spins pointing in random directions and vanishing magnetization.

In a spin glass $$J_{ij}$$ is a random variable with zero mean. In contrast to
a ferromagnet, where the spins are randomly-oriented at high temperature and
tend to align below the Curie temperature, in a spin glass the orientation of
the spins looks random at *all* temperatures. However, despite the lack of
obvious ordering, experiments show clear evidence of a "freezing transition" at
some special temperature $$T_f$$. In the "spin-glass phase" below $$T_f$$ the
system tends to a random-looking but *stable* configuration which depends on
the particular realization of the random interactions. The spin glass phase can
be viewed as an ordering of the system in *time*, analogous to the spatial
ordering seen in the ferromagnetic phase.

<figure>
  <img src="http://upload.wikimedia.org/wikipedia/commons/6/62/Spin_glass_by_Zureks.svg">
  <figcaption>
    Spin glass (top) versus ferromagnet (bottom)
    <a href="http://en.wikipedia.org/wiki/Spin_glass#/media/File:Spin_glass_by_Zureks.svg">[source]</a>
  </figcaption>
</figure>

The nature of the spin-glass phase remains controversial. Are there just two
symmetry-related thermodynamic states, analogous to the "up" and "down" states
of the ferromagnet, or is the situation more complicated for spin glasses?
Analytical results for unphysical models with infinite-range interactions
(called "mean-field" theories) actually predict *infinitely many* states, but
it's not known to what extent these results generalize. More realistic models
with only short-range interactions are much more difficult to study
analytically, and much of what we know comes from computer simulations. So far
simulations haven't shown conclusive evidence of many states in spin glasses
with short-range interactions. In two recent papers, [arXiv:1504.07709][],
[arXiv:1410.5296][], I've looked for evidence of many states in spin glasses
with long-range interactions that decay as a power law in distance.

Connection with optimization
============================

The competition between ferromagnetic and antiferromagnetic interactions in
spin glasses creates "frustration", which means that in general there is no way
of choosing an orientation for each spin that simultaneously makes every pair
"happy". The combination of disorder (i.e. random interactions) and frustration
leads to a complex, "rough" energy landscape with local minima on many scales
separated by high energy barriers. From a physical perspective the upshot is
slow dynamics and unique non-equilibrium effects. Similar behavior is seen in
contexts outside of physics, notably in the study of optimization algorithms,
which sometimes exhibit a "spin-glass phase" in certain regions of parameter
space. In these regions the cost function looks like the energy function of a
spin glass, with very many local minima of varying optimality which can make
greedy algorithms such as gradient descent ineffective at finding a good
solution. In particular, finding the ground state (lowest-energy state) of a
spin glass in more than two dimensions is an [NP-hard][] problem.

[complex systems]: http://en.wikipedia.org/wiki/Complex_system
[spin glasses]: http://en.wikipedia.org/wiki/Spin_glass
[NP-hard]: http://en.wikipedia.org/wiki/NP-hard
[arXiv:1504.07709]: http://arxiv.org/abs/1504.07709
[arXiv:1410.5296]: http://arxiv.org/abs/1401.5296

Publications
============
<a name="pubs"></a>

- The connection between statics and dynamics of spin glasses<br>
  Matthew Wittmann and A. P. Young<br>
  Phys. Rev. Lett. (submitted 4/2015)<br>
  [[arXiv]](http://arxiv.org/abs/1504.07709)

- Finite-size scaling above the upper critical dimension<br>
  Matthew Wittmann and A. P. Young<br>
  Phys. Rev. E 90 (2014)<br>
  [[arXiv]](http://arxiv.org/abs/1410.5296)
  [[DOI]](http://dx.doi.org/10.1103/PhysRevE.90.062137)

- Low-temperature behavior of the statistics of the overlap distribution in Ising spin-glass models<br>
  Matthew Wittmann, B. Yucesoy, Helmut G. Katzgraber, J. Machta, A. P. Young<br>
  Phys. Rev. B 90 (2014)<br>
  [[arXiv]](http://arxiv.org/abs/1408.2482)
  [[DOI]](http://dx.doi.org/10.1103/PhysRevB.90.134419)

- Spin glasses in the nonextensive regime<br>
  Matthew Wittmann and A. P. Young<br>
  Phys. Rev. E 85 (2012)<br>
  [[arXiv]](http://arxiv.org/abs/1201.1955)
  [[DOI]](http://dx.doi.org/10.1103/PhysRevE.85.041104)


Conferences
===========

- Distinguishing graphs with a quantum annealer using susceptibility measurements<br>
  with Itay Hen and A. P. Young<br>
  *APS March Meeting, 2014*<br>
  [[abstract]](http://meetings.aps.org/Meeting/MAR14/Session/J35.5)
  [[slides]](https://dl.dropboxusercontent.com/u/8639724/MarchMeeting2014.pdf)
  
- Low-temperature behavior of the spin overlap distribution in one-dimensional long-range diluted spin glasses<br>
  with B. Yucesoy, Helmut G. Katzgraber, J. Machta, and A. P. Young<br>
  *APS March Meeting, 2013*<br>
  [[abstract]](http://meetings.aps.org/Meeting/MAR13/Session/F29.2)

- Scheduling: a good candidate for quantum annealing?<br>
  with Itay Hen and A. P. Young<br>
  *Berkeley Mini Stat Mech Meeting, 2014*<br>

