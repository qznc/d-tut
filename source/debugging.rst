Debugging
=========

Compile-time Errors
-------------------

Since D is comprehensive language,
you will probably run into error messages from the compiler.
Within template code,
those error messages can easily become nearly incomprehensible.

Run-time Errors
---------------

Run-time errors means that the compiled program
does not behave like intended.

Printf Debugging
^^^^^^^^^^^^^^^^

The easiest way to debug the code
is insert print commands everywhere.
From C this is called "printf debugging",
although it is "writeln debugging" in D.

There is the ``debug`` keyword together with the the ``-debug`` compiler switch.
You can disable your print commands with this switch
without deleting them.
Consider the following code snippet.

.. code-block:: d

   writeln("Hello");
   debug writeln("World");

If compiled without ``-debug``,
it will print only "Hello".
However, compiled with ``-debug``,
it will also print "World".

.. warning::

   Be careful not to put necessary code into debug,
   otherwise your release build might behave differently.

Logging
^^^^^^^

Unfortunately, there is no logging module in the standard library so far.

Debugger
^^^^^^^^

The dmd compiler provides the ``-g`` switch,
which enables you to use gdb or whatever debugger you like.
The debugger should then know about names,
variable values, etc.

