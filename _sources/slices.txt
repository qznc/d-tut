Slices
======

The basic array type in D is called a slice.
In C an array is just syntactic sugar for a pointer,
which means that length checks must be handled by the user.
Higher-level languages like Java provide an referenced data structure,
which necessarily means a double indirection.
D slices are in between.
They know their size,
so boundary checks are implicit.
However,
there is only one indirection to the data.


.. seealso::

   `Detailed article about slices <http://dlang.org/d-array-article.html>`_,
   `Language Reference: Arrays <http://dlang.org/arrays.html>`_
