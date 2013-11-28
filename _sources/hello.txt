
Hello World
===========

Syntactically, D looks very much like C/C++/C#/Java.
There are the keywords like
``if``, ``while``, ``class``, ``struct``, ``int``, ``double``, ``private``
with unsurprising semantics.
Here is the canonical Hello World application.

.. literalinclude:: ../examplecode/helloworld.d
   :language: d

The reason to start with this,
is to test the build setup.
`Download and install the dmd compiler <http://dlang.org/download.html>`_.
Put the code above into a file called ``hello.d``.
Then compile and execute.

.. code-block:: sh

   $ dmd hello.d
   $ ./hello
   Hello World!

If you cannot get this to run,
you should ask for help
at the `D Learn Forum <http://forum.dlang.org/group/digitalmars.D.learn>`_
or in the ``#d`` IRC channel on Freenode.

Convenience
-----------

For a more convenient interface,
the ``rdmd`` wrapper allows to compile-and-execute directly.

.. code-block:: sh

   $ rdmd hello.d
   Hello World!

The nice fact about ``rdmd`` is that it finds additional files automatically
and compiles them in,
whereas ``dmd`` only compiles the arguments.
Hence, ``rdmd`` serves as a simplistic build tool,
such that you might not even need something like a Makefile.

The compiler is quite fast,
so it might feel like using a scripting language.
You could even put the invocation into the file as a shebang on UNIX
and use D for small scripts.

.. code-block:: sh

    #!/usr/bin/env rdmd
