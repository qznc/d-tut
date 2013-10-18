Meta Programming
================

From safe to powerful.

Templates
---------

D features templates like C++.
They provide a good foundation for generic programming.

For Java programmers,
the semantics are subtely different,
because a generic function is not compiled to a single function in the binary.
Instead it is instantiated multiple times for different arguments.
This allows the compiler to optimize each instance specifically,
but produces more code.

Traits
------

D provides a wealth of convenience functions for meta programming called traits.
Some come `from the compiler <http://dlang.org/traits.html>`_
and some `from the standard library <http://dlang.org/phobos/std_traits.html>`_.

String Mixins
-------------

The most powerful mechanism for compile-time programming are string mixins.
Since D can evaluate functions at compile time,
you can generate strings at compile time.
A string mixin includes a generate string into source code
for further compilation.

.. code-block:: d

   template GenStruct(string Name, string M1)
   {
     const char[] GenStruct =
       "struct " ~ Name ~ "{ int " ~ M1 ~ "; }";
   }

   mixin(GenStruct!("Foo", "bar"));

This generates (or is equivalent to) the following.

.. code-block:: d

   struct Foo { int bar; }

An advanced example of such meta programming
would be the `Pegged parser generator <https://github.com/PhilippeSigaud/Pegged>`_.
You can provide a grammar and at compile time an efficient parser is generated.

.. code-block:: d

    mixin(grammar(`
      Arithmetic:
      Term     < Factor (Add / Sub)*
      Add      < "+" Factor
      Sub      < "-" Factor
      Factor   < Primary (Mul / Div)*
      Mul      < "*" Primary
      Div      < "/" Primary
      Primary  < Parens / Neg / Pos / Number / Variable
      Parens   < "(" Term ")"
      Neg      < "-" Primary
      Pos      < "+" Primary
      Number   < ~([0-9]+)

      Variable <- identifier
    `));

Another great example of meta programming is `LuaD <http://jakobovrum.github.io/LuaD/>`_.
It integrates the Lua scripting language into D.
In contrast to the C interface, the Lua stack operations are hidden with meta programming.
Effectively, Lua objects can be used like D objects
instead explicit push/pop calls.

.. code-block:: d

   auto print = lua.get!LuaFunction("print");
   print("Hello, world!");

.. seealso::

   `Templates in D explained <http://nomad.so/2013/07/templates-in-d-explained/>`_
