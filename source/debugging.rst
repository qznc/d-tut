Debugging
=========

The dmd compiler provides the ``-g`` switch,
which enables you to use gdb or whatever debugger you like.
The debugger should then know about names,
variable values, etc.

For your own code,
there is the ``debug`` keyword together with the the ``-debug`` switch.
Consider the following code snippet.

.. code-block:: d

   writeln("Hello");
   debug writeln("World");

If compiled without ``-debug``,
it will print only "Hello".
However, compiled with ``-debug``,
it will also print "World".
