Unicode
=======

D is focused on utf8.
Source files are utf8.

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

Transcoding
-----------

Since not everything your program consumes is utf8,
the standard library provides the ``std.encoding`` module for conversion.

.. code-block:: d

  wstring ws;
  transcode("hello world",ws);
    // transcode from UTF-8 to UTF-16

  Latin1String ls;
  transcode(ws, ls);
    // transcode from UTF-16 to ISO-8859-1

As source files are utf8,
string literals are utf8 as well.
The ``wstring`` type is utf16,
and ``transcode`` identifies source and target encoding from the types of its arguments.
