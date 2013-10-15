Documentation
=============

As a programmer, you are probably used to API documentations,
like JavaDoc or DoxyGen.
The D compiler has this Ddoc functionality built in with the ``-D`` switch.

Ddoc Examples
-------------

For Ddoc comments normal comments must be extended with one more character.
For example ``/* */`` becomes ``/** */``.
The normal comments are ignored by the documentation generator.
Since API documentation of functions is probably the most important use case,
here is an example.

.. literalinclude:: ../examplecode/ddoc_example.d
   :language: d

Ddoc also comes with a simple macro language
for advanced purposes.
It can be used as a markup language for longer explanations.
However, it is also used to generate most of the D website, for example.

Put the example above into ``foo.d``,
then ``dmd -D foo.d`` will generate a ``foo.html`` file with API documentation.
This is pretty raw, though.
For some nice looking documentation,
you have to extend the basic Ddoc templates.
Alternatively, the macros can be overriden to produce XML
or any other format.

Beautiful API Documentation
---------------------------

If you need a more refined tool to produce API documenation for your project,
then check out `ddox <https://github.com/rejectedsoftware/ddox>`_.

Unittest as Examples
--------------------

Unittests with comments also show up in the documentation.
They serve as examples.
In contrast to examples within the doc-comment,
these examples are executed as part of the testing process,
which means they are actually checked for errors.

.. literalinclude:: ../examplecode/unittestexample.d
   :language: d

.. seealso::

   `Documentation Generator <http://dlang.org/ddoc.html>`_,
   `Ddox variant of the standard library documentation <http://vibed.org/temp/d-programming-language.org/phobos/index.html>`_
