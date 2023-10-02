class Queue<T> {
  final List<T> _items = [];

  void enqueue(T item) {
    _items.add(item);
  }

  T dequeue() {
    if (_items.isEmpty) {
      throw StateError("Queue is empty");
    }
    return _items.removeAt(0);
  }

  T peek() {
    if (_items.isEmpty) {
      throw StateError("Queue is empty");
    }
    return _items.first;
  }

  bool isEmpty() {
    return _items.isEmpty;
  }

  int size() {
    return _items.length;
  }
}

void main() {
  Queue<int> queue = Queue<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print("Queue Front: ${queue.peek()}, Size: ${queue.size()}");
  queue.dequeue();
  print("Dequeued, New Front: ${queue.peek()}, Size: ${queue.size()}");
}
