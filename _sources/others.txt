Other Languages
===============

You already know how to program,
which means you are coming from some other language to D.
Here is why you might prefer D.

For C Programmers
-----------------

D has no preprocessor,
but equivalent meta programming mechanisms.
Syntactically, lots of C code is actually valid D.
Some people consider the D compiler a nice C compiler.

  I'm writing my C code with DMD.
  When tested and tweaked I do a final compile with C compiler.
  – `ed <http://forum.dlang.org/post/ibnfbsvxqzjxyfpnzseh@forum.dlang.org>`_

It should be noted that D defines a lot of things,
which are undefined (or architecture-, implementation-defined) in C.
For example, integer overflows wrap around in D,
because that is what practically every architecture today does.

Why would you prefer D?
The meta programming of D allows higher-level abstractions
and thus smaller programs.
D has less pitfalls and is safer,
thanks to more type safety, less undefined behavior,
and automatic memory management.

For Java Programmers
--------------------

D provides classes, interfaces, modules, packages, and a garbage collector.
This should make you feel at home quickly.
Instead of Java Generics, you have D Templates.

Why would you prefer D?
The meta programming of D allows higher-level abstractions
and thus smaller programs.
If CPU or memory is a bottleneck,
D gives you much more control and room for optimization.

For C++ Programmers
-------------------

You should generally feel at home.
If you enjoyed the C++11 innovations,
you will find similar stuff in D.
D even has things which were dropped from C++11.
Prepare for some syntax changes, though.
D is not burdened by C-Syntax-Compatibility.
However, you can link C and C++ libraries,
when the header files are ported.

Why would you prefer D?
D has much less historical baggage.
D has less pitfalls and is safer,
thanks to less undefined behavior,
and automatic memory management.

For C# Programmers
------------------

Lots of similarities and various differences.
While you should feel at home,
D does various things different and that will take some time to adopt.
Instead of a syntax extension like LINQ,
D provides lots of similar mechanisms in the standard library.
Instead of ``using``, D provides scope guards.

Why would you prefer D?
D does not require a virtual machine,
which makes it also suited for embedded jobs.

For Node.js Programmers
-----------------------

Syntactically, D looks familiar.
Note though, Javascripts ``function`` is ``delegate`` in D,
and Ds ``function`` is a lightweight variant without state.
D is statically typed,
but keeps the boilerplate low.
Here is `a Rosettacode example <http://rosettacode.org/wiki/Look-and-say_sequence#D>`_,
which shows a D program can be short and concise
or highly optimized.

Why would you prefer D?
If CPU or memory is a bottleneck,
D gives you much more control and room for optimization.
Look at `Vibe.d <http://vibed.org/>`_
"for easily building fast, scalable network applications".
This D framework is
"lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices."

For Clojure Programmers
-----------------------

D is no Lisp.
However, its meta programming is equally powerful and nearly as easy as Lisp macros.
D supports immutable data structures,
although the standard library is not that rich yet.
D is natively compiled and does not run on the JVM.

Why would you prefer D?
If CPU or memory is a bottleneck,
D gives you much more control and room for optimization.
The richer syntax of D might be more intuitive than Lisp expressions.

For Scala Programmers
---------------------

Like Scala,
D is multi-paradigm and combines object-oriented with functional concepts.
You can "construct elegant class hierarchies for maximum code reuse and extensibility, implement their behavior using higher-order functions" in D as well.

Why would you prefer D?
If CPU or memory is a bottleneck,
D gives you much more control and room for optimization.
Compiling D is much faster
and the speed of code-compile-test iterations is important for productivity.

For Go Programmers
------------------

Like Go,
D is natively compiled.
However, D has a much richer `feature set <http://dlang.org/comparison.html>`_.
This means,
where Go restricts you to carefully chosen selection of features,
D provides you the lower level building blocks.
The goroutine is called a
`fiber <http://dlang.org/phobos/core_thread.html#.Fiber>`_ in D
and `Vibe.d <http://vibed.org/>`_ is a nice framework around them.
Likewise,
a Go channel can be built using primitives from
`std.concurrency <http://dlang.org/phobos/std_concurrency.html>`_.
The structural typing of Go interfaces,
can be replicated with
`wrap and unwrap <http://dlang.org/phobos/std_typecons.html#.wrap>`_
from Ds standard library.

Why would you prefer D?
D supports generic programming,
which means less code and more type safety.
D provides a bigger toolbox to choose the right tool for the job.
Compiling D is as fast as compiling Go.

For Python-Ruby-Perl-Javascript-Lua Programmers
------------------------------------------

D is statically typed,
which probably takes some time to get used to.
However, D really tries to let you skip boilerplate.
Declare your variables with ``auto`` or ``const``.

.. code-block:: d

   auto x = 42;
   const y = "yes";

Also there is `Variant <http://dlang.org/phobos/std_variant.html>`_,
which can be used to put anything into a variable.

The D standard library strives to come with all batteries included.
Unfortunately, D is not as mature as Python.
While it is possible to be as terse in D,
often the libraries are missing for small scripting jobs.
You can use C/C++ libraries,
but that does not feel like batteries-included.
