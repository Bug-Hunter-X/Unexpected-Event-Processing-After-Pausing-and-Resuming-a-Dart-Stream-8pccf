```dart
import 'dart:async';

Future<void> main() async {
  final streamController = StreamController<int>();

  // Listen to the stream with a buffer for events
  final streamSubscription = streamController.stream.listen((event) {
    print('Event received: $event');
  }, onDone: () {
    print('Stream closed');
  }, onError: (error) {
    print('Error: $error');
  });

  // Add some events
  streamController.add(1);
  streamController.add(2);
  streamController.add(3);

  //Pause the stream
  await streamSubscription.pause(Future.value(true));
  print('Stream paused');

  //Resume the stream
  await streamSubscription.resume();
  print('Stream resumed');
  
  // Add more events after pausing and resuming
  streamController.add(4);
  streamController.add(5);

  // Close the stream
  await streamController.close();
}
```