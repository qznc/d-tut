Philosophy
==========

To describe D in one sentence:

   D is what C++ wanted to be.

The strong focus on C++ means to inherit parts of its philosophy.
Like C++, D provides powerful abstraction mechanisms
without sacrificing performance.
If you are looking for a better C++,
you should feel at home with D.
If you dislike C++,
you might like D for being C++ done right.

The `D Website <http://dlang.org>`_ proclaims:

   Modern convenience. Modeling power. Native efficiency.

By modern convenience D means
little boilerplate for type declarations,
garbage collection,
resource management through scope, and
syntax for array operations.
Power refers to the multi-paradigm approach,
control of mutability for safer concurrency, and
a wealth of features for any task.
Efficiency means
compilation to native code,
escape hatches for unsafe features like inline assembly and pointer arithmetic, and
additional safety annotations.

Critique
--------

Sometimes D is criticised,
because it is not *simple* language,
in contrast to Go, Rust, Lisp, or Scala.
However, a D programmer sees no problem
and actually likes his big toolbox.

   It's like a professional handyman having the smallest possible possible
   toolbox with only the barest essentials, versus a big super-toolbox that
   has all the *right* tools he might need. Just because it's there doesn't
   mean it has to be used, but if I were a handyman and had to remove a
   phillips-head screw, I'd want to be able to reach for a forward/reverse
   drill and an appropriately-sized phillips-head bit, and not have to pry it
   out with the bare minimum (the back of a hammer, or a
   sort-of-sized-similarly manual flathead screwdriver), and also not have to
   put one specialized mini-toolbox back and switch to a
   differently-specialized mini-toolbox for every different task.
   -- `Nick Sabalausky <http://forum.dlang.org/thread/ha4qpi$189h$1@digitalmars.com?page=3#post-ha8e27:242af:241:40digitalmars.com>`_

D targets programmers,
who write code every day.
Learning that big toolbox pays off quite quickly in this scenario.
If you only occasionally write short one-off programs,
then D might not be the right tool for you.

Nevertheless the size is not a design goal of D as a language.

   We want a comprehensive language, not a big/complex/perfect one.
   -- `Andrei Alexandrescu <http://www.youtube.com/watch?v=4M-0LFBP9AU>`_

.. seealso::

   `D Overview <http://dlang.org/overview.html>`_,
   `Rationale for some D design decisions <http://dlang.org/rationale.html>`_
