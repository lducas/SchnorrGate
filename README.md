# SchnorrGate
## Testing Schnorr's factoring Claim in Sage

[Sch21]
*Fast Factoring Integers by SVP Algorithms*
_Claus Peter Schnorr_
https://eprint.iacr.org/2021/232

Note: This follows the version of March 3, not the one of March 1. The latter is much easier to implement with existing lattice reduction software, as it only requires solving SVP in dimension 48 for a 400 bits number to be factored (the previous version mentionned dimensions unreachable by currently known techniques).

Command Line Interface
```
sage fac.sage b n t
```
where `b` is the bit-size of the number to be factored, `n` the number of elements in the factor basis, and `t` the number of trials. Passing no parameters or invalid integers will results in default values `b=400`, `n=47`, `t=100` following the claim of Schnorr.

Experimental results (modulo implementation mistakes):
Running `b=400, n=47, t=1000`, we obtained `0 Factoring Relation found out of 1000 trials`. Closer inspection of typical shortest showed that the vector `e` is typically very sparse, say a single `1` and a single `-1`.

Running `b=10, n=47, t=1000`, we obtained `353 Factoring Relation found out of 1000 trials`. 
Running `b=20, n=47, t=1000`, we obtained `65 Factoring Relation found out of 1000 trials`. 
Running `b=40, n=47, t=1000`, we obtained `0 Factoring Relation found out of 1000 trials`. 

This suggest that the approach may be sensible, but that not all short vectors give rise to factoring relations, and that obtaining a sufficient success rate requires much larger lattice dimension than claimed in [Sch21]. 

Personnal study (unfortunately, never written down cleanly) of this approach suggested me that this approach requires solving SVP in dimensions beyond reasonable, leading to a factorization algorithm much slower than the state of the art. My impression is that this is the consensus among experts having spent some time on it as well. I wish to recall that this approach is not particularly new.
