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
In other words,
a const object cannot have mutable members.

When to use what?
~~~~~~~~~~~~~~~~~

Here are some guidelines.
Note the "should",
because no guideline is correct in all cases.

* Arguments should be const, so mutable and immutable values can be given.

  * However, do not copy arguments to make them mutable or immutable,
    instead declare the argument mutable or immutable from the start
    and let the caller make the copy.
  * If a function is not thread-safe due to const arguments,
    either explicitly document this or make the arguments immutable.

* Return values, which are freshly constructed, should never be const, but mutable or immutable.
* Data structures should not restrict themselves to be mutable, const, or immutable.
  The user should decide about mutability.
  Test this.
  Otherwise future changes could break users code.

.. seealso::

   `Const FAQ <http://dlang.org/const-faq.html>`_,
   `Const and Immutable <http://dlang.org/const3.html>`_,
   `Copy and Move Semantics in D, talk by Ali Çehreli <http://dconf.org/2013/talks/cehreli.html>`_,
   `Discussion on these guidelines <http://forum.dlang.org/post/sdefkajobwcfikkelxbr@forum.dlang.org>`_

Purity
------

Try to make your functions ``pure`` and ``nothrow`` and ``@safe``.

* Pure means your function does not use or change mutable global state
  except what is available from the arguments.
  If in addition the arguments are not mutable, a function is called "strongly pure".
* Nothrow means your function will never throw an exception.
* Safe means your function cannot break the type system via unsafe casts or inline assembly.

These qualifiers are required of called functions as well.
For example, a pure function can only call pure functions.

For the record,
everybody mostly agrees that these parameters should be the default
and some "impure", "throw", and "unsafe" attributes with inverse meaning would be better.
However, changing it would break too much code at this point.

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

Scope guards make try-finally (without catch!) constructs obsolete and improve upon them.
This often comes up with locks.

.. code-block:: d

   try {
     l.lock();
     // mutual exclusion stuff
   } finally {
     l.unlock();
   }

Becomes

.. code-block:: d

   {
     l.lock();
     scope (exit) l.unlock();
     // mutual exclusion stuff
   }

The improvement is two additional variants.
The `scope(failure)` statement is only executed if an exception is thrown.
The `scope(success)` statement is only executed if no exception is thrown.

.. seealso::
   `Language reference on scope guards <http://dlang.org/statement.html#ScopeGuardStatement>`_,
   `Exception safety <http://dlang.org/exception-safe.html>`_
