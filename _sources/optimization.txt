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
In addition, dmd is very fast,
which improves development productivity.

Profiling
---------

Since not every optimization can be performed by a compiler,
programmers often need to tune their code.
Since guessing is very often wrong,
profiling is necessary to find the hot spots in your code.
Use dmds ``-profile``.

Benchmarking
------------

When optimizing a certain hotspot,
benchmarking is essential.
D comes with ``std.datetime.benchmark`` included.
