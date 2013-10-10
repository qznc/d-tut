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
Use dmds ``-profile``,
which instruments the code.
When the executable is run, a ``trace.log`` is generated.
It contains data somewhat similar to the following.

.. code-block:: txt

   ------------------
   [... bla bla many lines of raw information ...]

   === Timer Is 3579545 Ticks/Sec, Times are in Microsecs ===

      Num    Tree   Func   Per
      Calls  Time   Time   Call

      2     77773  77742  38871  std.stdio.writeln(immutable(char)[])
      1    231962  75516  75516  std.concurrency.MessageBox.get...
      1     71344  70125  70125  std.concurrency._send(...)
      1     50818  50818  50818  std.stdio.File.LockingTextWriter...

   [... bla bla more data ...]

The table shown above displays the most time consuming functions of the program.
Apparently, ``writeln`` dominates with a total of 77742 msecs over 2 calls.
A single calls took 38871 msecs on average.
The ``MessageBox.get`` took a little bit less total time,``
however the "Tree Time" is 231962 msecs,
which is the sum of the time of called functions.

Benchmarking
------------

When optimizing a certain hotspot,
benchmarking is essential.
D comes with ``std.datetime.benchmark`` and ``comparingBenchmark`` included,
which can be used for simple comparisons.

.. code-block:: d

   int a;
   void f0() {}
   void f1() {auto b = a;}
   void f2() {auto b = to!(string)(a);}
   auto r = benchmark!(f0, f1, f2)(10_000);
   writefln("Milliseconds to call fun[0] n times: %s", r[0].msecs);
