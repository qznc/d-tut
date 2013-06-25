Optimization
============

Use ``dmd -release -inline -O``.

The dmd compiler does generate good code,
but it is not in the same league as the more popular compiler backends.
Hence, for an additional 10-20% performance boost
(or more for microbenchmarks),
use LDC or GDC.
All three compiler use the same frontend,
but LDC uses LLVM and GDC the GCC backend.

Nevertheless, dmd is the reference compiler
and there are subtle differences as well as shortcomings in LDC and GDC.
