import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

bool isBalanced(TreeNode? root) {
  if (root == null) {
    return true;
  }

  int leftHeight = getHeight(root.left);
  int rightHeight = getHeight(root.right);

  if (leftHeight - rightHeight > 1 || rightHeight - leftHeight > 1) {
    return false;
  }

  return isBalanced(root.left) && isBalanced(root.right);
}

int getHeight(TreeNode? node) {
  if (node == null) {
    return 0;
  }
  return 1 + max(getHeight(node.left), getHeight(node.right));
}

void main() {
  // Create a balanced binary tree
  TreeNode root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  root.left!.left = TreeNode(4);
  root.left!.right = TreeNode(5);

  print("Is the binary tree balanced? ${isBalanced(root)}");
}
