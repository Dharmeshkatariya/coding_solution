class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val);
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  ListNode dummy = ListNode(0);
  dummy.next = head;

  ListNode? first = dummy;
  ListNode? second = dummy;

  for (int i = 0; i <= n; i++) {
    first = first!.next;
  }

  while (first != null) {
    first = first.next;
    second = second!.next;
  }

  second!.next = second.next!.next;

  return dummy.next;
}

void main() {
  ListNode node1 = ListNode(1);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(3);
  ListNode node4 = ListNode(4);
  ListNode node5 = ListNode(5);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;

  int n = 2;
  ListNode? modifiedList = removeNthFromEnd(node1, n);

  print("Modified List after removing $n-th node from the end:");
  ListNode? current = modifiedList;
  while (current != null) {
    print(current.val);
    current = current.next;
  }
}
