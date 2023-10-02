import 'dart:io';

void main() {
  print('Welcome to the Inventory Management System!');
  Map<String, int> inventory = {};

  while (true) {
    print('\nChoose an option:');
    print('1. Add an item');
    print('2. View inventory');
    print('3. Update item quantity');
    print('4. Remove an item');
    print('5. Exit');

    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        addItem(inventory);
        break;
      case '2':
        viewInventory(inventory);
        break;
      case '3':
        updateQuantity(inventory);
        break;
      case '4':
        removeItem(inventory);
        break;
      case '5':
        print('Goodbye!');
        exit(0);
        break;
      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}

void addItem(Map<String, int> inventory) {
  print('Enter the item name:');
  String itemName = stdin.readLineSync() ?? '';
  print('Enter the quantity:');
  int quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (quantity <= 0) {
    print('Invalid quantity. Please enter a positive number.');
    return;
  }

  if (inventory.containsKey(itemName)) {
    print('Item already exists. Updating quantity.');
    inventory[itemName] = quantity;
  } else {
    inventory[itemName] = quantity;
  }

  print('Item added/updated: $itemName - Quantity: ${inventory[itemName]}');
}

void viewInventory(Map<String, int> inventory) {
  if (inventory.isEmpty) {
    print('Inventory is empty.');
  } else {
    print('Inventory:');
    inventory.forEach((itemName, quantity) {
      print('$itemName - Quantity: $quantity');
    });
  }
}

void updateQuantity(Map<String, int> inventory) {
  if (inventory.isEmpty) {
    print('Inventory is empty. Nothing to update.');
    return;
  }

  print('Enter the item name to update quantity:');
  String itemName = stdin.readLineSync() ?? '';

  if (!inventory.containsKey(itemName)) {
    print('Item not found in the inventory.');
    return;
  }

  print('Current quantity: ${inventory[itemName]}');
  print('Enter the new quantity:');
  int newQuantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (newQuantity < 0) {
    print('Invalid quantity. Please enter a non-negative number.');
  } else {
    inventory[itemName] = newQuantity;
    print('Quantity updated: $itemName - New Quantity: ${inventory[itemName]}');
  }
}

void removeItem(Map<String, int> inventory) {
  if (inventory.isEmpty) {
    print('Inventory is empty. Nothing to remove.');
    return;
  }

  print('Enter the item name to remove:');
  String itemName = stdin.readLineSync() ?? '';

  if (!inventory.containsKey(itemName)) {
    print('Item not found in the inventory.');
  } else {
    inventory.remove(itemName);
    print('Item removed: $itemName');
  }
}
