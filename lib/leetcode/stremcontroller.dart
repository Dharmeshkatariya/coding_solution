import 'dart:async';

void main() {
  final streamController = StreamController<int>();

  final streamSubscription = streamController.stream
      .where((number) => number % 2 == 0)
      .listen((data) {
    print("Even number: $data");
  });

  for (var i = 1; i <= 10; i++) {
    streamController.sink.add(i);
  }

  streamController.close();
  streamSubscription.cancel();
}
