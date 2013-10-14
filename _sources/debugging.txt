Debugging
=========

Compile-time Errors
-------------------

Since D is comprehensive language,
you will probably run into error messages from the compiler.
Here are some explanations about their meaning.

Error: T is used as a type
^^^^^^^^^^^^^^^^^^^^^^^^^^

This T thing is not a type, but is used as such.
Usually, this happens with templates.
A template is not a type.
You probably must instantiate T like `T!int` to fix the error.

Run-time Errors
---------------

Run-time errors means that the compiled program
does not behave like intended.

Stack-traces
^^^^^^^^^^^^

D has exceptions and you get a stack trace,
if an exception is not caught.
Of course, being a system language,
you can break the type system for arbitrary effects,
but most parts of the language are safe
and you should get good error message.


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

Useful (and probably necessary) is the ``text`` function
from `std.conv <http://dlang.org/phobos/std_conv.html>`_,
which converts anything to a string.

Logging
^^^^^^^

Unfortunately, there is no logging module in the standard library so far.

Debugger
^^^^^^^^

The dmd compiler provides the ``-g`` switch,
which enables you to use gdb or whatever debugger you like.
The debugger should then know about names,
variable values, etc.

.. seealso::

   `Wiki: Debuggers <http://wiki.dlang.org/Debuggers>`_
