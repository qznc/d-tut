Multicores
==========

Since computers with multiple cores are the norm today,
let us discuss how this can be exploited with D.

While concurrency and parallelism are
`actually different concepts <http://stackoverflow.com/questions/1050222/concurrency-vs-parallelism-what-is-the-difference>`_,
we will not discuss them separately,
because programmers usually encounter them at same time anyways.
However, this means we only provide an overview here.

Threads
-------

The basic mechanism for threads managed by the operating system
(PThread) is provided by ``std.concurrency``.

.. literalinclude:: ../examplecode/threads.d
   :language: d

Once you use threads,
keep in mind that in D global variables are thread-local.
You can declare them global to the whole process with the ``shared`` qualifier.

.. code-block:: d

   shared int countA;  // global counter
   int countB;         // thread-local counter

Tasks
-----

This is about the lightweight thread variant,
which is managed by the program itself.
It is also called user-level threads.
Since the tasks are usually executed by a thread pool,
they are run in parallel as well.

.. literalinclude:: ../examplecode/tasks.d
   :language: d

This is the same mechanism that is used by
Google Go, Rust, Erlang, and others.
Try the `Vibe.d <http://vibed.org/>`_ web framework for an integrated environment in this style.
However, D is not specialized for this
and permits some mistakes.
If a task calls a blocking function (e.g. read a file),
the executing thread blocks.
Since the maximal parallelism is defined by number of running threads in the underlying pool,
this might leave a core idle,
even if there are more tasks to run.
Specialized languages can simply start another thread,
to compensate for the blocking.
In D pool size maintenance must be done manually
and is probably forgotten in most cases.
You are fine,
if you can restrict yourself to asynchronous IO.

Synchronization
---------------

Once you have parallelism,
usually concurrency arises and the need for synchronization.
Of course,
D provides the ususal suspects:
Locks,
semaphores,
atomic variables.

Memory Model
------------

Currently, D has no specified memory model.
However, you can assume that it will follow the intentions of C++ memory model.
This means:
Sequential consistency for data-race-free prpgrams.
In other words:
Properly synchronize your stuff with locks and stuff from the standard library
and everything will behave to your intuition.
It only becomes difficult,
if your requirements are tighter
such that lower-level mechanisms must be used.
