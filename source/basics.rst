Basics
======

You already know how to program,
but lets cover the basics quickly.
In addition comes some specific comparisons to other programming languages.

Syntactically, D looks very much like C/C++/C#/Java.
There are the keywords like
``if``, ``while``, ``class``, ``struct``, ``int``, ``double``, ``private``
with unsurprising semantics.

For C (and C++) Programmers
---------------------------

D has no preprocessor,
but equivalent meta programming mechanisms.

Syntactically, most C code is actually valid D.
It should be noted that D defines a lot of things,
which are undefined (or architecture-, implementation-defined) in C.
For example, integer overflows wrap around in D,
because that is what practically every architecture today does.

For Java Programmers
--------------------

D provides classes, interfaces, modules, packages, and a garbage collector.
This should make you feel at home quickly.

D programmers care a lot more about efficiency,
which means there is a lot of machinery to improve performance.

Instead of Java Generics, you have D Templates,
which cover similar problems,
but have different syntax and semantics.
Read about that carefully.

For C++ Programmers
-------------------

You should generally feel at home.
If you enjoyed the C++11 innovations,
you will find similar stuff in D.
D even has things which were dropped from C++11.

Prepare for some syntax changes, though.
D is not burdened by C-Syntax-Compatibility.
However, you can link C and C++ libraries,
if the header files are ported.

For C# Programmers
------------------

Lots of similarities and various differences.
While you should feel at home,
D does various things different and that will take some time to adopt.

Instead of a syntax extension like LINQ,
D provides a lots of similar mechanisms in the standard library.
Instead of ``using``, D provides scope guards.

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
