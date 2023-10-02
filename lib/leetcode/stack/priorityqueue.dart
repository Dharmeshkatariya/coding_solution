class PriorityQueue<T> {
  List<T> _items = [];

  void enqueue(T item) {
    _items.add(item);
    _items.sort();
  }

  T dequeue() {
    if (isEmpty()) {
      throw StateError("Priority queue is empty");
    }
    return _items.removeAt(0);
  }

  bool isEmpty() {
    return _items.isEmpty;
  }

  int size() {
    return _items.length;
  }
}

void main() {
  PriorityQueue<int> pq = PriorityQueue<int>();
  pq.enqueue(3);
  pq.enqueue(1);
  pq.enqueue(2);
  pq.enqueue(4);
  print("Dequeued: ${pq.dequeue()}");
  print("Dequeued: ${pq.dequeue()}");
}
