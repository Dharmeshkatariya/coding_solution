class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (String char in word.split('')) {
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode node = root;
    for (String char in word.split('')) {
      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return node.isEndOfWord;
  }

  bool startsWith(String prefix) {
    TrieNode node = root;
    for (String char in prefix.split('')) {
      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return true;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  print("Does trie contain 'apple'? ${trie.search("apple")}");
  print("Does trie contain 'app'? ${trie.search("app")}");
  print("Does trie start with 'app'? ${trie.startsWith("app")}");
}
