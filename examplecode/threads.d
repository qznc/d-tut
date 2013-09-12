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
