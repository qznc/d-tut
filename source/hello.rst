
Hello World
===========

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

If you cannot get this to run as shown,
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

Since the compiler is very fast,
this feels like using a scripting language.
You could even put the invocation into the file as a shebang on UNIX.

.. code-block:: sh

    #!/usr/bin/env rdmd
