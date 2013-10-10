Standard Library: Short Tour
============================

This is a brief overview over the standard library Phobos,
so you have an idea what is available.

Basics
------

Basic algorithms like those in the standart template library of C++
are found in `std.algorithm <http://dlang.org/phobos/std_algorithm.html>`_.
For example, ``sort``, ``find``, and ``map``.
Then there is `std.functional <http://dlang.org/phobos/std_functional.html>`_
with ``curry``, ``memoize`` and other helpers for functional programming.
Useful helper functions ilike ``split`` for the builtin arrays can be found in
`std.array <http://dlang.org/phobos/std_array.html>`_.

File Formats
------------

The standard library contains the tools to handle various formats like
`JSON <http://dlang.org/phobos/std_json.html>`_,
`XML <http://dlang.org/phobos/std_xml.html>`_,
`CSV <http://dlang.org/phobos/std_csv.html>`_,
`Zip <http://dlang.org/phobos/std_zip.html>`_,
`Base64 <http://dlang.org/phobos/std_base64.html>`_.
Especially, for XML you might want to check out
`Tango's XML parser <http://siegelord.github.io/Tango-D2/tango.text.xml.SaxParser.html>`_ or
`look for bindings <http://forum.dlang.org/post/lzeqryvbhwescvxqdwbq@forum.dlang.org>`_
to your favorite C XML library.

Dates and Times and Durations
-----------------------------

Basically, everything related to time is in
`std.datetime <http://dlang.org/phobos/std_datetime.html>`_:
Dates, times, intervals, differences,
parsing and formatting dates,
even measuring and benchmarking.

Networking
----------

For the basics, there is
`std.net.curl <http://dlang.org/phobos/std_net_curl.html>`_
with bindings to the venerable
`libcurl <http://curl.haxx.se/libcurl/>`_.
