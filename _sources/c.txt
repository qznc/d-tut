C Interoperability
==================

Generate Bindings
-----------------

D can link with C libraries very easily.
However, the header files must be converted into D bindings.

Ideally, we could generate bindings from C header files automatically.
In practice, you can either use
`DStep <https://github.com/jacob-carlborg/dstep>`_
or do the conversion manually.
If DStep succeeds, you have something to work with quickly.
With the manual approach you can also port stuff like preprocessor macros
to their respective D equivalents.

Structurally, a two-level approach for bindings is recommended.
On a first level try to clone the C API as close as possible.
On the second level, you can optionally wrap convenience around,
which exploits D-specific features.

A repository of bindings is
`Deimos <https://github.com/D-Programming-Deimos>`_.
Please, submit bindings when you have created some.

.. seealso::

   `header to binding <http://dlang.org/htomodule.html>`_,
   `Dstep <https://github.com/jacob-carlborg/dstep>`_

C++ Interop
-----------

More limited than C interop, but possible to a certain extend.

.. seealso::

   `Interfacing to C++ <http://dlang.org/cpp_interface.html>`_,
   `Using D Alongside a Game Engine, DConf 2013 talk by Manu Evans <http://dconf.org/2013/talks/evans_1.html>`_


Porting Code
------------

Porting C/C++ code to D is relatively easy,
since the languages are very similar.

.. seealso::

   Converting
   `C to D <http://dlang.org/ctod.html>`_,
   `C++ to D <http://dlang.org/cpptod.html>`_,
   `C Preprocessor to D <http://dlang.org/pretod.html>`_,
