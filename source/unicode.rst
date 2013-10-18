Unicode
=======

Source files are UTF-8,
which means identifiers can contain special characters.

.. code-block:: d

   int föö(int 蝴蝶) { return 蝴蝶 * 2; }

Strings
-------

The builtin D type ``string``
is just an immutable char array.
However, if you iterate over it,
dchar code points are returned.
Thus the following different lengths.

.. code-block:: d

   string foo = "bär";
   assert(foo.length == 4);
   assert(walkLength(foo) == 3);

..

  Wouldn't it be more consistent to have <string>.length return the
  number of UTF-8 characters as well?
  – `nickles <http://forum.dlang.org/post/phybgondilwmlwrflawx@forum.dlang.org>`_

This seems to be a weird design choice at first,
but once you learn more about Unicode
it is the only sane choice
if you also care about performance.
To understand this some background of Unicode is necessary.

Code Point
  One Unicode character, a number between 0 and 1,114,112.
  The Unicode standard defines the meaning of these numbers.

Encoding
  An encoding specifies how to represent code points in bytes.

Code Unit
  Depending on the encoding a code point might be split into multiple units.
  For example, in UTF-8 one code unit is one byte
  and the code point ``ä`` (U+00E4) above consists of two units (in hexcode) ``c3 a4``.

Grapheme
  One character as humans perceive it.
  Unicode allows to combine code points.
  For example ``ä`` (U+00E4) can also be produced with ``a`` (U+0061) followed by the
  `combining diaeresis <http://www.fileformat.info/info/unicode/char/308/index.htm>`_ code point (U+0308).
  These `combining characters <http://en.wikipedia.org/wiki/Combining_character>`_
  can be used for `crazy <http://stackoverflow.com/questions/6579844/how-does-zalgo-text-work>`_ things.

What people usually want to count are graphemes,
but this is only possible with all the knowledge of the Unicode tables.
Counting the code points only requires knowledge of the encoding.
Counting the bytes is only a lookup in D,
since array lengths are stored in memory.
To keep ``string`` consistent with the ``char``-array semantics,
the length attribute gives the number of ``char`` elements.

  The current design has "won" not only because it's the
  existing one, but also because it has good simplicity and flexibility
  advantages. At this point there is no question about changing the
  semantics of existing constructs.
  ~ `Andrei Alexandrescu <http://forum.dlang.org/post/l3h49k$b6$1@digitalmars.com>`_

Note that ``char`` is `defined <http://dlang.org/type.html>`_
as "unsigned 8 bit UTF-8"
and this is also ``ubyte`` as "unsigned 8 bits".
The "UTF-8" cements the fact that D assumes UTF-8 encoding.

Transcoding
-----------

Since not everything your program consumes is UTF-8,
D also provides ``wstring`` for UTF-16 and ``dstring`` for UTF-32.
In the case of ``dstring`` the length attribute also reflects the number of code points.
The standard library provides the `std.encoding <http://dlang.org/phobos/std_encoding.html>`_
module for conversion.

.. code-block:: d

  wstring ws;
  transcode("hello world",ws);
    // transcode from UTF-8 to UTF-16

  Latin1String ls;
  transcode(ws, ls);
    // transcode from UTF-16 to ISO-8859-1

As source files are UTF-8,
string literals are UTF-8 as well.
The ``wstring`` type is UTF-16,
and ``transcode`` identifies source and target encoding from the types of its arguments.

.. seealso::

   `The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets <http://www.joelonsoftware.com/articles/Unicode.html>`_
