Idiomatic D
===========

The D community is relatively young and small,
so there is not that much experience about best practices.
Nevertheless, due to runtime and standard library
certain characteristics can be considered idiomatic.

Constness
---------

D provides ``const`` and ``immutable`` keywords.
While const means, I cannot change the value,
immutable means nobody can change the value,
which is a stronger guarantee.

You can cast immutable to const, but not in reverse.
Also, you can cast mutable to const.
This means functions taking const arguments,
take mutable and immutable values.

In contrast to C, ``const`` is transitive,
which means anything you get out of a const is also const.

When to use what?
Aim for const input and immutable output.
Struct fields should be mutable,
so the user can decide about mutability,
but referencing immutable or const value is fine.

.. seealso::

   `Const FAQ <http://dlang.org/const-faq.html>`_

Purity
------

Try to make your functions ``pure`` and ``nothrow`` and ``@safe``.

Ranges
------

Instead of iterators,
D promotes ranges,
which can be described as a pair of iterators.
Ranges capture the concept of sequential access,
which is available for arrays, lists, files, and sockets.
There are various kinds of ranges,
depending, for example, on whether random access is possible.

For an example,
consider the expression ``sort(chain(a,b,c))``,
where ``sort`` and ``chain`` are ordinary functions from the standard library.
Like the name suggests,
``sort`` is the sorting function
and ``chain`` wraps multiples range into one.
If ``a``, ``b``, and ``c`` are random access arrays,
then ``sort`` can perform in-place over three distinct arrays.

This tutorial will not explore ranges deeper,
because the topic is quite big.
Instead, there are a few links.

   I think ranges are really cool, and well deserving of a book treatment. Someone should write it.
   – `Andrei Alexandrescu <http://www.reddit.com/r/IAmA/comments/1nl9at/i_am_a_member_of_facebooks_hhvm_team_a_c_and_d/ccjly9n>`_


.. seealso::
  `std.range <http://dlang.org/phobos/std_range.html>`_,
  `On Iteration <http://www.informit.com/articles/printerfriendly.aspx?p=1407357&rll=1>`_,
  `Component Programming with Ranges <http://wiki.dlang.org/Component_programming_with_ranges>`_,
  `Ranges by Ali Çehreli <http://ddili.org/ders/d.en/ranges.html>`_

Compile Time Function Evaluation
--------------------------------

Since D allows to call certain D code at compile time,
a library write should enable her functions for compile time evaluation.
This often means to write code according to the functional programming paradigm.

Scope Guards
------------
