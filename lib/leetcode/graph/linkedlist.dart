class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val);
}

class LinkedList {
  ListNode? head;

  void insert(int val) {
    ListNode newNode = ListNode(val);
    newNode.next = head;
    head = newNode;
  }

  bool search(int val) {
    ListNode? current = head;
    while (current != null) {
      if (current.val == val) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void delete(int val) {
    if (head == null) {
      return;
    }

    if (head!.val == val) {
      head = head!.next;
      return;
    }

    ListNode? current = head;
    while (current!.next != null) {
      if (current.next!.val == val) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList();
  linkedList.insert(1);
  linkedList.insert(2);
  linkedList.insert(3);
  linkedList.insert(4);

  print("Search for 3: ${linkedList.search(3)}");
  print("Search for 5: ${linkedList.search(5)}");

  linkedList.delete(2);
  print("After deleting 2: Search for 2: ${linkedList.search(2)}");
}
