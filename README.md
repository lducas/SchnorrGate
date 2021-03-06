# SchnorrGate
## Testing Schnorr's factoring Claim in SageMath [Sage]

[Sch21] <br />
**Fast Factoring Integers by SVP Algorithms** <br />
_Claus Peter Schnorr_ <br />
https://eprint.iacr.org/2021/232 <br />

*Note:* This follows the version of March 3, not the one of March 1. This version is much easier to implement with existing lattice reduction software, as it only requires solving SVP in dimension 48 for a 400 bits number to be factored (the previous version mentioned dimensions unreachable by currently known techniques).<br />

_Command Line Interface_
```
sage fac.sage b n t
```
where `b` is the bit-size of the number to be factored, `n` the number of elements in the factor basis, and `t` the number of trials. Passing no parameters or invalid integers will results in default values `b=400`, `n=47`, `t=100` following the claim of Schnorr.

**Experimental results** (modulo implementation mistakes):
Running `b=400, n=47, t=1000`, we obtained ```0 Factoring Relation found out of 1000 trials```. Closer inspection of typical shortest showed that the vector `e` is typically very sparse, say a single `1` and a single `-1`.

Running `b=10, n=47, t=1000`, we obtained `353 Factoring Relation found out of 1000 trials`. <br />
Running `b=20, n=47, t=1000`, we obtained `65 Factoring Relation found out of 1000 trials`. <br />
Running `b=40, n=47, t=1000`, we obtained `0 Factoring Relation found out of 1000 trials`. <br />

This suggest that the approach may be sensible, but that not all short vectors give rise to factoring relations, and that obtaining a sufficient success rate requires much larger lattice dimension than claimed in [Sch21]. This corroborates [various](https://crypto.stackexchange.com/questions/88582/does-schnorrs-2021-factoring-method-show-that-the-rsa-cryptosystem-is-not-secur/88601#88601) [counter-analysis](https://twitter.com/inf_0_/status/1367376526300172288) of the lattice volume computation.

Personal study (unfortunately, never written down cleanly) of this approach suggested me that this approach requires solving SVP in dimensions beyond reasonable, leading to a factorization algorithm much slower than the state of the art. My impression is that this is the consensus among experts having spent some time on it as well. 

## History and Related works

I wish to recall that this claim of polynomial time factoring is not particularly new: it was announced at Eurocrypt 2009 [Sch09]. This claim has so far not been published at a peer-reviewed conference or journal. 

The approach itself is even older, dating from 1991, already from Schnorr [Sch91] (Schnorr even makes mention of  an article of Brillhard and Morrison [MB75]). It has been very influential (and hence, seriously explored, e.g. [Ver10]), but successful applications are in fact outside the realm of factoring. It is an inspiring serendipity story. 

The particular construction of lattice was further explored by Adleman [Adl95], attempting to prove that some lattice problems (SVP, the Shortest Vector Problem) are at least as hard as factoring. Ajtai [Ajt98], while attempting to complete the initial goal of Adleman, instead found a proof of a much stronger statement: namely that SVP is NP-hard.

This construction made other appearances, for example in relation to the _abc_ conjecture [Bri14]. A variant over number fields is also central to some recent study of reduction algorithm for module lattices [LPSW19]. 

Another interesting variant of this lattice construction is the following: replace real logarithm by discrete logarithm. Chor and Rivest constructed a cryptosystem based on such lattices [CR88]. Stripping out all the crypto, and studying asymptotic, Cecile Pierrot and I [DP18] reinterpreted their algorithm as a lattice decoding algorithm (BDD). It is based on the reciprocal of Schnorr's idea, namely use an easy factoring instance to solve lattice problems.

**Acknowledgments:** There is not much work behind the script itself. Most of the credit for this implementation goes to SageMath [Sage] developers and maintainers, and to the FPLLL team [fplll] for the underlying lattice reduction software. I'm also grateful to Daniele Micciancio, Curtis Bright, Damien Stehle, and Dima Pasechnik, for precious comments and references. We should also thank Len Adleman for sharing his draft [Adl95].

## References

[CR88] <br />
**A knapsack-type public key cryptosystem based on arithmetic in finite fields** <br />
_B. Chor, R.L. Rivest_ <br />
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.309.9452&rep=rep1&type=pdf

[MB75] <br />
**A method of factoring and the factorization of F7** <br />
_J. Brillhart, MA Morrison_ <br />
Math. Comp, 1975.

[Sch91] <br />
**Factoring integers and computing discrete logarithms via diophantine approximation** <br />
_C. P. Schnorr_ <br />
https://link.springer.com/chapter/10.1007/3-540-46416-6_24

[Adl95] <br />
**Factoring and Lattice Reduction** <br />
_L. Adleman_ <br />
https://raw.githubusercontent.com/lducas/SchnorrGate/main/LATFAC.pdf

[Ajt98] <br />
**The shortest vector problem in L2 is NP-hard for randomized reductions** <br />
_M. Ajtai_ <br />
https://dl.acm.org/doi/pdf/10.1145/276698.276705 <br />

[Sch09] <br />
**Average Time Fast SVP and CVP Algorithms: Factoring Integers in Polynomial Time** <br />
_C. P. Schnorr_ <br />
https://eurocrypt2009rump.cr.yp.to/e074d37e10ad1ad227200ea7ba36cf73.pdf

[Ver10] <br />
**A note on integer factorization using lattices** <br />
_A. Vera_ <br />
https://arxiv.org/pdf/1003.5461.pdf <br />

[Bri14] <br />
**Extremal examples in the abc conjecture** <br />
_C. Bright_ <br />
https://cs.uwaterloo.ca/~cbright/talks/pmath944-talk.pdf

[DP18]<br />
**Polynomial Time Bounded Distance Decoding near Minkowski’s Bound in Discrete Logarithm Lattices**<br />
_L. Ducas and C. Pierrot_ <br />
https://eprint.iacr.org/2018/146

[LPSW19] <br />
**An LLL algorithm for module lattices** <br />
_C. Lee, A. Pellet-Mary, D. Stehlé, and A. Wallet_ <br />
https://eprint.iacr.org/2019/1035

[Sage]  <br />
**SageMath, the Sage Mathematics Software System (Version 9.0.0)**  <br />
_The Sage Developers_ <br />
https://www.sagemath.org  <br />

[fplll]  <br />
**FPLLL, a lattice reduction library** <br />
_The FPLLL development team_ <br />
https://www.sagemath.org  <br />



