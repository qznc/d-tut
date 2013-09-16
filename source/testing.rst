Testing
=======

D provides a ``unittest`` keyword which enables you,
to put tests right next to functions.

.. code-block:: d

   int twice(int x) { return x+x; }

   unittest {
      assert (twice(-1) == -2);
      assert (twice(2) == 4);
   }

Those code blocks are ignored by default.
If dmd gets the ``-unittest`` argument,
the tests are compiled and executed before ``main``.

   "Who needs unittests", I told myself, "when I'm
   obviously smart enough to write code once and have it work the first
   time?" But they just kept staring at me going "hey we're right here, use
   us!" until I was shamed into actually writing a few of them. And then I
   discovered that I *wasn't* the genius programmer I thought I was, and
   that my code was actually full of bugs, typos, and all sorts of other
   problems that only show up in corner cases that, of course, I'd failed
   to test by hand the first time round.
   -- `H. S. Teoh <http://forum.dlang.org/thread/CAJ85NXAu+fKDeq22-=Bjc0jn5KPni5-dpg1EDWA3MqJwKFk+hg@mail.gmail.com#post-mailman.1371.1371919343.13711.digitalmars-d:40puremagic.com>`_

