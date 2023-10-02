import 'dart:math';
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int val) {
    root = _insert(root, val);
  }

  TreeNode? _insert(TreeNode? node, int val) {
    if (node == null) {
      return TreeNode(val);
    }

    if (val < node.val) {
      node.left = _insert(node.left, val);
    } else if (val > node.val) {
      node.right = _insert(node.right, val);
    }

    return node;
  }

  bool search(int val) {
    return _search(root, val);
  }

  bool _search(TreeNode? node, int val) {
    if (node == null) {
      return false;
    }

    if (val == node.val) {
      return true;
    } else if (val < node.val) {
      return _search(node.left, val);
    } else {
      return _search(node.right, val);
    }
  }

  void delete(int val) {
    root = _delete(root, val);
  }

  TreeNode? _delete(TreeNode? node, int val) {
    if (node == null) {
      return node;
    }

    if (val < node.val) {
      node.left = _delete(node.left, val);
    } else if (val > node.val) {
      node.right = _delete(node.right, val);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }

      node.val = _minValue(node.right);
      node.right = _delete(node.right, node.val);
    }
    return node;
  }

  int _minValue(TreeNode? node) {
    int minValue = node!.val;
    while (node!.left != null) {
      minValue = node.left!.val;
      node = node.left!;
    }
    return minValue;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);

  print("Is 40 in the BST? ${bst.search(40)}");

  bst.delete(40);
  print("Is 40 in the BST after deletion? ${bst.search(40)}");
}
