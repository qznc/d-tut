Ranges
======

Instead of iterators,
D promotes ranges,
which can be described as a pair of iterators.
Ranges capture the concept of sequential access,
which is available for arrays, lists, files, and sockets.
There are various kinds of ranges,
depending, for example, on whether random access is possible.

For an example,
consider the expression ``sort(chain(a,b,c))``,
where ``sort`` and ``chain`` are ordinary functions from the standard library.
Like the name suggests,
``sort`` is the sorting function
and ``chain`` wraps multiples range into one.
If ``a``, ``b``, and ``c`` are random access arrays,
then ``sort`` can perform in-place over three distinct arrays.


More to read:
`std.range <http://dlang.org/phobos/std_range.html>`_,
`On Iteration <http://www.informit.com/articles/printerfriendly.aspx?p=1407357&rll=1>`_,
`Component Programming with Ranges <http://wiki.dlang.org/Component_programming_with_ranges>`_

