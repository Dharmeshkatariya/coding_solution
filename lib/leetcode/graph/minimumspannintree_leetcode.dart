class Graph {
 final int vertices;
 final  List<Edge> edges;
  Graph(
      this.vertices,this.edges
      ) ;


  // Graph(int vertices) {
  //   this.vertices = vertices;
  //   edges = [];
  // }

  void addEdge(int source, int destination, int weight) {
    edges.add(Edge(source, destination, weight));
  }

  List<Edge> kruskalMST() {
    edges.sort((a, b) => a.weight.compareTo(b.weight));
    List<Edge> mst = [];
    List<int> parent = List.generate(vertices, (i) => i);

    int find(int v) {
      if (v == parent[v]) return v;
      return parent[v] = find(parent[v]);
    }

    int components = 0;
    int i = 0;

    while (components < vertices - 1) {
      Edge currentEdge = edges[i++];
      int sourceRoot = find(currentEdge.source);
      int destRoot = find(currentEdge.destination);

      if (sourceRoot != destRoot) {
        mst.add(currentEdge);
        parent[sourceRoot] = destRoot;
        components++;
      }
    }

    return mst;
  }
}

class Edge {
  int source;
  int destination;
  int weight;

  Edge(this.source, this.destination, this.weight);
}

void main() {
  int vertices = 4;
  List<Edge> edges= [] ;
  Graph graph = Graph(vertices, edges);

  graph.addEdge(0, 1, 1);
  graph.addEdge(0, 2, 3);
  graph.addEdge(1, 2, 4);
  graph.addEdge(1, 3, 2);
  graph.addEdge(2, 3, 5);

  List<Edge> mst = graph.kruskalMST();

  print("Minimum Spanning Tree (MST) Edges:");
  for (Edge edge in mst) {
    print("Edge ${edge.source} - ${edge.destination}, Weight: ${edge.weight}");
  }
}




