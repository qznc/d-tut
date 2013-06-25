Documentation
=============

As a programmer, you are probably used to API documentations,
like JavaDoc, or DoxyGen.
The D compiler has this functionality built in with the ``-D`` switch.

Unittest as Examples
--------------------

Unittests with comments also show up in the documentation.
They serve as examples.
In contrast to examples within the doc-comment,
these examples are executed as part of the testing process,
which means they are actually checked for errors.

.. code-block:: d

   /** @returns the argument times two */
   int twice(int x) { return x+x; }

   /** for example */
   unittest {
      assert (twice(-1) == -2);
      assert (twice(2) == 4);
   }

