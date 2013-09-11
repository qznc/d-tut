Multicores
==========

Since computers with multiple cores are the norm today,
let us discuss how this can be exploited with D.

While concurrency and parallelism are actually different concepts,
we will not discuss them separately,
because programmers usually encounter them at same time anyways.
However, this means we only provide an overview here.

Threads
-------

The basic mechanism for threads managed by the operating system
(PThread) is provided by ``std.concurrency``.

.. code-block:: d

    import std.stdio;
    import std.concurrency;

    void spawnedFunc(Tid tid)
    {
        // Receive a message from the owner thread.
        receive(
            (int i) { writeln("Received the number ", i);}
        );

        // Send a message back to the owner thread
        // indicating success.
        send(tid, true);
    }

    void main()
    {
        // Start spawnedFunc in a new thread.
        auto tid = spawn(&spawnedFunc, thisTid);

        // Send the number 42 to this new thread.
        send(tid, 42);

        // Receive the result code.
        auto wasSuccessful = receiveOnly!(bool);
        assert(wasSuccessful);
        writeln("Successfully printed number.");
    }

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

.. code-block:: d

    import std.algorithm, std.parallelism, std.range;

    void main() {
        // Parallel reduce can be combined with
        // std.algorithm.map to interesting effect.
        // The following example (thanks to Russel Winder)
        // calculates pi by quadrature  using
        // std.algorithm.map and TaskPool.reduce.
        // getTerm is evaluated in parallel as needed by
        // TaskPool.reduce.
        //
        // Timings on an Athlon 64 X2 dual core machine:
        //
        // TaskPool.reduce:       12.170 s
        // std.algorithm.reduce:  24.065 s

        immutable n = 1_000_000_000;
        immutable delta = 1.0 / n;

        real getTerm(int i)
        {
            immutable x = ( i - 0.5 ) * delta;
            return delta / ( 1.0 + x * x ) ;
        }

        immutable pi = 4.0 * taskPool.reduce!"a + b"(
            std.algorithm.map!getTerm(iota(n))
        );
    }



