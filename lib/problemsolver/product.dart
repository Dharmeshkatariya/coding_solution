class Product {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  String toString() {
    return '$name (\$${price.toStringAsFixed(2)})';
  }
}

void main() {
  List<Product> products = [
    Product('Laptop', 999.99),
    Product('Phone', 499.99),
    Product('Tablet', 299.99),
    Product('Headphones', 149.99),
    Product('Keyboard', 79.99),
  ];

  // Filter products with a price less than $200
  List<Product> affordableProducts = products.where((product) => product.price < 200).toList();
  print('Affordable Products: $affordableProducts');

  // Calculate the total cost of affordable products
  double totalCost = affordableProducts.map((product) => product.price).reduce((a, b) => a + b);
  print('Total Cost of Affordable Products: \$${totalCost.toStringAsFixed(2)}');

  // Find the most expensive product
  Product mostExpensiveProduct = products.reduce((a, b) => a.price > b.price ? a : b);
  print('Most Expensive Product: $mostExpensiveProduct');

  // Create a map of product names to their prices
  Map<String, double> productPrices = {};
  products.forEach((product) {
    productPrices[product.name] = product.price;
  });
  print('Product Prices: $productPrices');

  // Check if there is a product with the word 'Phone' in its name
  bool hasPhone = products.any((product) => product.name.contains('Phone'));
  print('Is there a product with the word "Phone" in its name? $hasPhone');
}
