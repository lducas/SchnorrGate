The purpose of this repository is to document the precise algorithm of [Sch21, march 3rd] as is, as well as to comment on its long history.

The goal was to quickly alleviate concerns regarding a sudden "destruction" of RSA from this approach, and avoid a crypto-panic with potentially bad consequences for real-world security: an unwarranted panic-transition away from RSA sounds like a terrible outcome. Transitions takes time and care.

The SageMath script is only a small portion of that effort; the most important point is prior history of this approach.

As such, the purpose of this repo is not to include potential improvements, for which there are certainly many directions. None of which I seriously expect to live up to Schnorr's claim, unfortunately. I certainly encourage further implementation, research, and documentation efforts nevertheless, but I do warrant caution, review, and due process before public release of fantastic cryptanalytic claims.

Any PR, issue, or suggestions serving this purpose are welcomed, may it be about fixing potential mistakes in the code compared to [Sch21], historical references on this approach, or pointers to existing and new research on the matter.
