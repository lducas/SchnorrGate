# SchnorrGate
## Testing Schnorr's factoring Claim in Sage

[Sch21] <br />
**Fast Factoring Integers by SVP Algorithms** <br />
_Claus Peter Schnorr_ <br />
https://eprint.iacr.org/2021/232 <br />

*Note:* This follows the version of March 3, not the one of March 1. The latter is much easier to implement with existing lattice reduction software, as it only requires solving SVP in dimension 48 for a 400 bits number to be factored (the previous version mentionned dimensions unreachable by currently known techniques).<br />

Command Line Interface
```
sage fac.sage b n t
```
where `b` is the bit-size of the number to be factored, `n` the number of elements in the factor basis, and `t` the number of trials. Passing no parameters or invalid integers will results in default values `b=400`, `n=47`, `t=100` following the claim of Schnorr.

Experimental results (modulo implementation mistakes):
Running `b=400, n=47, t=1000`, we obtained ```0 Factoring Relation found out of 1000 trials```. Closer inspection of typical shortest showed that the vector `e` is typically very sparse, say a single `1` and a single `-1`.

Running `b=10, n=47, t=1000`, we obtained `353 Factoring Relation found out of 1000 trials`. <br />
Running `b=20, n=47, t=1000`, we obtained `65 Factoring Relation found out of 1000 trials`. <br />
Running `b=40, n=47, t=1000`, we obtained `0 Factoring Relation found out of 1000 trials`. <br />

This suggest that the approach may be sensible, but that not all short vectors give rise to factoring relations, and that obtaining a sufficient success rate requires much larger lattice dimension than claimed in [Sch21]. 

Personnal study (unfortunately, never written down cleanly) of this approach suggested me that this approach requires solving SVP in dimensions beyond reasonable, leading to a factorization algorithm much slower than the state of the art. My impression is that this is the consensus among experts having spent some time on it as well. 

I wish to recall that this approach is not particularly new; Ajtai [Ajt98] attributes it to a (lost ?) manuscript of Adleman while Schnorr mentions an article of Brillhard and Morrison [MB75]. Recent theoretical work on the cryptanalysis of module lattices are doing very similar things over number fields [LPSW19]. Interestingly, this construction can serve other purposes than factoring. For example, Ajtai [Ajt98] used it for a NP-hardness proof. Replacing real logarithm by discrete logarithm also lead to interesting ideas; Chor and Rivest use such a variant to solve lattice problem via easy factorization instances [CR88] inside an old-school lattice-based cryptosystem (see also [DP18] for an asymptotic analysis).

[Adl95] <br />
**Factoring and Lattice Reduction** <br />
L. Adleman <br />
(Manuscript, 1995)

[MB75] <br />
**A method of factoring and the factorization of F7** <br />
_J Brillhart, MA Morrison_ <br />
Math. Comp, 1975.

[Ajt98] <br />
**The shortest vector problem in L2 is NP-hard for randomized reductions** <br />
_M. Ajtai_ <br />
https://dl.acm.org/doi/pdf/10.1145/276698.276705 <br />

[LPSW19] <br />
**An LLL algorithm for module lattices** <br />
_C Lee, A Pellet-Mary, D Stehlé, A Wallet_ <br />
https://eprint.iacr.org/2019/1035

[CR88] <br />
**A knapsack-type public key cryptosystem based on arithmetic in finite fields** <br />
_B Chor, RL Rivest_ <br />
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.309.9452&rep=rep1&type=pdf

[DP19]< br/>
**Polynomial Time Bounded Distance Decoding near Minkowski’s Bound in Discrete Logarithm Lattices**< br/>
_Léo Ducas and Cécile Pierrot_ <br />
https://eprint.iacr.org/2018/146

