class Graph {
 final int vertices;
 final List<List<int>> adjacencyList;

 Graph(this.adjacencyList,this.vertices) ;

 bool hasCycle() {
   List<bool> visited = List.filled(vertices, false);
   List<bool> recStack = List.filled(vertices, false);

   for (int i = 0; i < vertices; i++) {
     if (!_hasCycleUtil(i, visited, recStack)) {
       return true;
     }
   }

   return false;
 }



  void addEdge(int start, int end) {
    adjacencyList[start].add(end);
    adjacencyList[end].add(start); // For an undirected graph
  }
 bool _hasCycleUtil(int vertex, List<bool> visited, List<bool> recStack) {
   if (!visited[vertex]) {
     visited[vertex] = true;
     recStack[vertex] = true;

     for (int neighbor in adjacencyList[vertex]) {
       if (!visited[neighbor] && _hasCycleUtil(neighbor, visited, recStack)) {
         return true;
       } else if (recStack[neighbor]) {
         return true;
       }
     }
   }

   recStack[vertex] = false;
   return false;
 }
  void dfs(int start) {
    var visited = List.filled(vertices, false);
    _dfsRecursive(start, visited);
  }

  void _dfsRecursive(int vertex, List<bool> visited) {
    visited[vertex] = true;
    print("Visited node: $vertex");

    for (int neighbor in adjacencyList[vertex]) {
      if (!visited[neighbor]) {
        _dfsRecursive(neighbor, visited);
      }
    }
  }

 List<List<int>> findConnectedComponents() {
   List<bool> visited = List.filled(vertices, false);
   List<List<int>> connectedComponents = [];

   for (int v = 0; v < vertices; v++) {
     if (!visited[v]) {
       List<int> component = [];
       _dfs(v, visited, component);
       connectedComponents.add(component);
     }
   }

   return connectedComponents;
 }




 ///  topologicl soring in fdart grpah travelling flutter dart
 ///
 List<int> topologicalSort() {
   List<bool> visited = List.filled(vertices, false);
   List<int> stack = [];

   for (int i = 0; i < vertices; i++) {
     if (!visited[i]) {
       _topologicalSortUtil(i, visited, stack);
     }
   }

   return stack.reversed.toList();
 }

 ////  topoloigcal soring algorithm to crewtw  and wrote code for me  that use 
 void _topologicalSortUtil(int vertex, List<bool> visited, List<int> stack) {
   visited[vertex] = true;

   for (int neighbor in adjacencyList[vertex]) {
     if (!visited[neighbor]) {
       _topologicalSortUtil(neighbor, visited, stack);
     }
   }

   stack.add(vertex);
 }

 void _dfs(int vertex, List<bool> visited, List<int> component) {
   visited[vertex] = true;
   component.add(vertex);

   for (int neighbor in adjacencyList[vertex]) {
     if (!visited[neighbor]) {
       _dfs(neighbor, visited, component);
     }
   }
 }
  void bfs(int start) {
    var visited = List.filled(vertices, false);
    List<int> queue = [];

    visited[start] = true;
    queue.add(start);

    while (queue.isNotEmpty) {
      int current = queue.removeAt(0);
      print("Visited node: $current");

      for (int neighbor in adjacencyList[current]) {
        if (!visited[neighbor]) {
          visited[neighbor] = true;
          queue.add(neighbor);
        }
      }
    }
  }
}

void dtaamain() {
  int vertices = 6;
  List<List<int>> adjacencyList = [] ;
  Graph graph = Graph(adjacencyList, vertices) ;

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 3);
  graph.addEdge(2, 4);
  graph.addEdge(3, 5);

  print("Depth-First Search:");
  graph.dfs(0);

  print("Breadth-First Search:");
  graph.bfs(0);
}
