Packaging
=========

Dub seems to be the primary candidate for a canonical package manager.
It requires a simple JSON document ``package.json`` describing the project
and expects a certain structure.

* source code is in the ``source`` or ``src`` subdirectory
* main is in ``app.d`` or ``<package name>.d``
* string imports are in the ``views`` subdirectory

The main code repository is hosted on
`code.dlang.org <http://code.dlang.org/download>`_.
This is D's not quite official equivalent to CPAN, PyPI, RubyGems, NPM, etc.
There you can also find `downloads <http://code.dlang.org/download>`_.

Dub Example
-----------

For a usage example, let us look at `DDox <https://github.com/rejectedsoftware/ddox>`_,
a nice documentation generator,
which is a little bit more sophisticated than the builtin version.
Assuming you have dub installed,
this is how you can get ddox.

.. code-block:: sh

   git clone https://github.com/rejectedsoftware/ddox.git
   cd ddox
   dub build

After getting the source from Github,
the ``dub build`` command
fetches all Dub dependencies (vibe.d, libevent, libev, openssl)
and builds the application.
However, on Linux the lib* Dub packages only contain the bindings,
this means it assumes the libraries are installed on the system,
otherwise you will get linker errors.

.. seealso::

   `Primary D package index <http://code.dlang.org>`_
