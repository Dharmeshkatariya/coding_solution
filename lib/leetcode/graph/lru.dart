// class LRUCache {
//  final int capacity;
//  final Map<int, int> cache;
//   List<int> ? keys;
//
//   LRUCache(this.cache,this.keys, this.capacity)
//
//   int get(int key) {
//     if (!cache.containsKey(key)) {
//       return -1;
//     }
//
//     // Move the accessed key to the end
//     keys.remove(key);
//     keys.add(key);
//
//     return cache[key]!;
//   }
//
//   void put(int key, int value) {
//     if (cache.length >= capacity) {
//       // Remove the least recently used key
//       int removedKey = keys.removeAt(0);
//       cache.remove(removedKey);
//     }
//
//     // Add the new key-value pair
//     cache[key] = value;
//     keys.add(key);
//   }
// }
//
// void main() {
//   LRUCache cache = LRUCache(2);
//   cache.put(1, 1);
//   cache.put(2, 2);
//   print("Get 1: ${cache.get(1)}"); // returns 1
//   cache.put(3, 3); // evicts key 2
//   print("Get 2: ${cache.get(2)}"); // returns -1 (not found)
//   cache.put(4, 4); // evicts key 1
//   print("Get 1: ${cache.get(1)}"); // returns -1 (not found)
//   print("Get 3: ${cache.get(3)}"); // returns 3
//   print("Get 4: ${cache.get(4)}"); // returns 4
// }
