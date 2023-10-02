import 'dart:isolate';

void isolateFunction(SendPort sendPort) {
  sendPort.send("Message from isolate");
}

void main() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(isolateFunction, receivePort.sendPort);

  receivePort.listen((message) {
    print("Received: $message");
    receivePort.close();
    isolate.kill();
  });
}
