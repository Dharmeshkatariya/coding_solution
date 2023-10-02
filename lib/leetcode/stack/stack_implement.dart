class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw StateError("Stack is empty");
    }
    return _items.removeLast();
  }

  T peek() {
    if (_items.isEmpty) {
      throw StateError("Stack is empty");
    }
    return _items.last;
  }

  bool isEmpty() {
    return _items.isEmpty;
  }

  int size() {
    return _items.length;
  }
}

void main() {
  Stack<int> stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print("Stack: ${stack.peek()}, Size: ${stack.size()}");
  stack.pop();
  print("Popped, New Top: ${stack.peek()}, Size: ${stack.size()}");
}
