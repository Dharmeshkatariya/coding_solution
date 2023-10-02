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

  // Use a for loop to find the most expensive product
  Product mostExpensiveProduct = products[0];
  for (int i = 1; i < products.length; i++) {
    if (products[i].price > mostExpensiveProduct.price) {
      mostExpensiveProduct = products[i];
    }
  }
  print('Most Expensive Product: $mostExpensiveProduct');

  // Use a map to group products by availability
  Map<bool, List<Product>> productsByAvailability = {};
  for (var product in products) {
    if (!productsByAvailability.containsKey(product.inStock)) {
      productsByAvailability[product.inStock] = [];
    }
    productsByAvailability[product.inStock]!.add(product);
  }

  print('\nProducts by Availability:');
  productsByAvailability.forEach((key, value) {
    print(key ? 'In Stock:' : 'Out of Stock:');
    value.forEach(print);
  });
}
