Memory Management
=================

D use garbage collection for heap allocated data by default.
This provides a safe default
and you can program without memory worries like in Java.
However, (after careful profiling!) you might find the garbage collector to be the bottleneck.
In this case D provides various ways to fix this.

You could avoid allocation in the hot spots of your code.
This is probably a good idea,
no matter what kind of memory management you use.

You can disable garbage collection temporarily.

.. code-block:: d
    std.gc.disable()
    // no garbage collection in here, only allocation
    std.gc.enable()

The reverse solution would be to adapt the garbage collector to the application.
D allows to replace the garbage collector by the application
to optimize for specific scenarios.
The current garbage collector is not as good as e.g. the Hotspot JVMs.


If all those approaches do not help,
you can use still use manual memory management.
However, most of the standard library requires garbage collection.

There is ``delete`` for manual deallocation.
You could also access ``malloc`` and ``free`` from libc directly
and thus circumvent the garbage collector.
D provides all mechanisms for RAII like C++.
There is no compiler/language support for Reference Counting.

.. seealso::
   http://dlang.org/memory.html
