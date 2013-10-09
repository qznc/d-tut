/** Returns: argument times two */
int twice(int x) { return x+x; }

/** for example */
unittest {
  assert (twice(-1) == -2);
  assert (twice(2) == 4);
}
