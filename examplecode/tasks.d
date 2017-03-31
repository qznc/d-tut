import std.algorithm, std.parallelism, std.range;

immutable n = 1_000_000_000;
immutable delta = 1.0 / n;

real getTerm(int i)
{
	immutable x = ( i - 0.5 ) * delta;
	return delta / ( 1.0 + x * x ) ;
}

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

    immutable pi = 4.0 * taskPool.reduce!"a + b"(
        std.algorithm.map!getTerm(iota(n))
    );
}
 
