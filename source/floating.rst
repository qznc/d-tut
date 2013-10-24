Floating Point
==============

This is not strictly D specific,
but since "95% of the folks out there are completely clueless about floating-point" (James Gosling, Keynote 1998),
it might be a good idea to talk about
`IEEE 754 <http://en.wikipedia.org/wiki/IEEE_floating_point>`_.
There is an `excellent article by Don Clugston <http://dlang.org/d-floating-point.html>`_
on the D website,
which goes into the details of D floating point stuff.
For this tutorial,
I give you a few `guidelines from Kahan <http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf>`_
(page 43) applied to D:

0. All Rules of Thumb but this one are fallible.
   Good reasons to break rules arise occasionally.

1. Store data and results no more precisely than you need and trust.
   Is ``float`` enough?
   In doubt, use ``double``.

2. Local or temporary variables should be highly precise.
   In doubt, use ``real``.

3. Field types should be parsimonious (``float``?).
   Computed properties should be precise (``double`` or ``real``?).

Rule 0 applies to all content in this tutorial,
but for sake of completeness, it is listed here explicitly.
Rule 3 actually sounds like a corollary of rule 1 and 2 to me.

Differences to C
----------------

If you are coming from C/C++,
then you are (hopefully) aware of the difference between
the following two functions.

.. code-block:: c

   double a(double x, double y) {
     return y + (x - y);
   }

   double b(double x, double y) {
     double tmp = x-y;
     return y + tmp;
   }

The difference is that hardware might compute the ``x-y``
expression with higher precision than double
(e.g. 80bit on x86).
In the case of ``b``,
the compiler `must` round the ``tmp`` expression to double precision before the addition,
but not in ``a``.
This can result in different return values.
However, in D semantics those two versions are equivalent.
Hence the guideline from above to use ``real tmp``.

Also, D might evaluate such functions at compile time
with yet another precision than the hardware.

.. seealso::

  `D Basic Data Types <http://dlang.org/type.html>`_,
  `Real Close to the Machine: Floating Point in D <http://dlang.org/d-floating-point.html>`_,
  `What Every Computer Scientist Should Know About Floating-Point Arithmetic <http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html>`_
