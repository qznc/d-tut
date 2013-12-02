Collections
===========

Nearly every program requires collections:
Arrays, vectors, maps, queues, lists, stacks.

Slices
------

The basic array type in D is called a slice.
In C an array is just syntactic sugar for a pointer,
which means that length checks must be handled by the user.
Higher-level languages like Java provide a referenced data structure,
which necessarily means a double indirection.
D slices are in between.
They know their size,
so boundary checks are implicit.
However,
they are low-level to be fast.
This means they might have some unexpected behavior.
I strongly advice to read
`this article <http://dlang.org/d-array-article.html>`_,
which covers everything you need to know about slices.
Proper container classes are build on top of slices.

.. seealso::

   `Detailed article about slices <http://dlang.org/d-array-article.html>`_,
   `Language Reference: Arrays <http://dlang.org/arrays.html>`_

Std.container
-------------

The standard library provides `std.container <http://dlang.org/phobos/std_container.html>`_,
which provides a few generic containers.

More
----

Everybody agrees that currently the standard library should provide more collection types.
However, the community wants to have the allocator design finished,
before collections are designed,
because allocation is an important part within collections.
Nevertheless, if you need more right now,
there are a few options.

* `Dcollections <https://github.com/schveiguy/dcollections>`_
* `Tango <https://github.com/SiegeLord/Tango-D2>`_

.. seealso::

   `Forum discussion <http://forum.dlang.org/post/xadomzylmuodqoejcgau@forum.dlang.org>`_
