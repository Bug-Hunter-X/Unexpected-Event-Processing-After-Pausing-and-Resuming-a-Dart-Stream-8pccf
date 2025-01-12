# Unexpected Event Processing After Pausing and Resuming a Dart Stream

This repository demonstrates a subtle but important behavior of Dart streams related to pausing and resuming subscriptions.  The code in `bug.dart` shows a scenario where events added to a stream *before* pausing the subscription are still processed after the stream is resumed. This might lead to unexpected side effects or race conditions in applications that don't account for this behavior.

The solution in `bugSolution.dart` shows how to avoid this problem. The solution might involve adding error handling and buffering events to only process them when resumed.