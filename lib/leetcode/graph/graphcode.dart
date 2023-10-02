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

  String findMinimumPrefix(String query) {
    TrieNode node = root;
    String prefix = '';

    for (String char in query.split('')) {
      if (!node.children.containsKey(char)) {
        break;
      }
      node = node.children[char]!;
      prefix += char;
      if (node.isEndOfWord) {
        break;
      }
    }

    return prefix;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("appetizer");
  trie.insert("applicable");
  print("Minimum Prefix for 'app': ${trie.findMinimumPrefix("app")}"); // "app"
  print("Minimum Prefix for 'appetize': ${trie.findMinimumPrefix("appetize")}"); // "appeti"
}
