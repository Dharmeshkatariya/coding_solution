class Product {
  String name;
  double price;
  bool inStock;

  Product(this.name, this.price, this.inStock);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'inStock': inStock,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'] as String,
      json['price'] as double,
      json['inStock'] as bool,
    );
  }

  @override
  String toString() {
    return '$name (\$${price.toStringAsFixed(2)}) - ${inStock ? "In Stock" : "Out of Stock"}';
  }
}

void main() {
  // Create a list of Product objects
  List<Product> products = [
    Product('Laptop', 999.99, true),
    Product('Phone', 499.99, false),
    Product('Tablet', 299.99, true),
    Product('Headphones', 149.99, true),
    Product('Keyboard', 79.99, false),
  ];

  // Map products to a list of their names
  List<String> productNames = products.map((product) => product.name).toList();
  print('Product Names: $productNames');

  // Filter products that are in stock
  List<Product> inStockProducts = products.where((product) => product.inStock).toList();
  print('\nIn Stock Products:');
  inStockProducts.forEach(print);

  // Calculate the total cost of in-stock products
  double totalCost = inStockProducts.map((product) => product.price).reduce((a, b) => a + b);
  print('\nTotal Cost of In-Stock Products: \$${totalCost.toStringAsFixed(2)}');
}
