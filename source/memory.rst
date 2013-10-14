Memory Management
=================

D use garbage collection for heap allocated data by default.
This provides a safe default
and you can program without memory worries like in Java.

.. warning::

   Since you are reading this tutorial,
   you are obviously not an experienced D programmer.
   **Use the garbage collector!**
   The rest of this section is provided
   to show possibilities.

Garbage Collector Tuning
-------------------------

However, (after careful profiling!) you might find the garbage collector to be the bottleneck.
In this case D provides various ways to fix this.

You could avoid allocation in the hot spots of your code.
This is probably a good idea,
no matter what kind of memory management you use.

  I avoid the GC in D too, and never had any major problems, only inconvenience. Used strategically, it can be a convenience in certain situations, and just as in C++, if your specific use case prohibits use of the GC, it can be avoided. My practical experience with D has shown that I can always achieve identical performance to C++
  – `Manu Evans <http://www.reddit.com/r/programming/comments/1nxs2i/the_state_of_rust_08/ccnefe7>`_

You can disable garbage collection temporarily.

.. code-block:: d

    std.gc.disable()
    // no garbage collection in here, only allocation
    std.gc.enable()

The reverse solution would be to adapt the garbage collector to the application.
D allows to replace the garbage collector by the application
to optimize for specific scenarios.
The current garbage collector is not as good as e.g. the Hotspot JVMs.

Manual Memory Management
------------------------

If all those approaches do not help,
you can use still use manual memory management.
However, most of the standard library requires garbage collection.

There is ``destroy`` for manual deallocation.
You could also access ``malloc`` and ``free`` from libc directly
and thus circumvent the garbage collector.
D provides all mechanisms for RAII like C++.

There is no compiler/language support for Reference Counting.
However, you could implement the necessary boilerplate with structs yourself.

.. seealso::
   `Memory Management <http://dlang.org/memory.html>`_,
   `std.typecons.RefCounted <http://dlang.org/phobos/std_typecons.html#.RefCounted>`_
