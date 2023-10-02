// import 'dart:math';
//
// class Graph {
//   int vertices;
//   List<List<int>> adjacencyList;
//   int time;
//
//   Graph(int vertices) {
//     this.vertices = vertices;
//     adjacencyList = List.generate(vertices, (i) => []);
//     time = 0;
//   }
//
//   void addEdge(int start, int end) {
//     adjacencyList[start].add(end);
//     adjacencyList[end].add(start); // For an undirected graph
//   }
//
//   List<int> findArticulationPoints() {
//     List<bool> visited = List.filled(vertices, false);
//     List<int> disc = List.filled(vertices, 0);
//     List<int> low = List.filled(vertices, 0);
//     List<int> parent = List.filled(vertices, -1);
//     List<int> articulationPoints = [];
//
//     void dfs(int u) {
//       int children = 0;
//       visited[u] = true;
//       disc[u] = low[u] = ++time;
//
//       for (int v in adjacencyList[u]) {
//         if (!visited[v]) {
//           children++;
//           parent[v] = u;
//           dfs(v);
//
//           low[u] = min(low[u], low[v]);
//
//           if (parent[u] == -1 && children > 1) {
//             articulationPoints.add(u);
//           }
//           if (parent[u] != -1 && low[v] >= disc[u]) {
//             articulationPoints.add(u);
//           }
//         } else if (v != parent[u]) {
//           low[u] = min(low[u], disc[v]);
//         }
//       }
//     }
//
//     for (int i = 0; i < vertices; i++) {
//       if (!visited[i]) {
//         dfs(i);
//       }
//     }
//
//     return articulationPoints;
//   }
// }
//
// void main() {
//   int vertices = 7;
//   Graph graph = Graph(vertices);
//
//   graph.addEdge(0, 1);
//   graph.addEdge(0, 2);
//   graph.addEdge(1, 3);
//   graph.addEdge(2, 4);
//   graph.addEdge(3, 5);
//   graph.addEdge(4, 5);
//   graph.addEdge(4, 6);
//
//   List<int> articulationPoints = graph.findArticulationPoints();
//
//   print("Articulation Points (Cut Vertices):");
//   print(articulationPoints);
// }
