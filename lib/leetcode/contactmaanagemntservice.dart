import 'dart:io';

class Contact {
  String name;
  String phoneNumber;

  Contact(this.name, this.phoneNumber);

  @override
  String toString() {
    return 'Name: $name\nPhone: $phoneNumber';
  }
}

void main() {
  List<Contact> contacts = [];

  while (true) {
    print("\nContact Management System");
    print("1. Add Contact");
    print("2. View Contacts");
    print("3. Search Contact");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        stdout.write("Enter contact name: ");
        String name = stdin.readLineSync() ?? '';
        stdout.write("Enter phone number: ");
        String phoneNumber = stdin.readLineSync() ?? '';
        Contact contact = Contact(name, phoneNumber);
        contacts.add(contact);
        print("Contact added successfully!");
        break;

      case '2':
        if (contacts.isEmpty) {
          print("No contacts to display.");
        } else {
          print("\nContacts:");
          for (int i = 0; i < contacts.length; i++) {
            print("\nContact ${i + 1}:\n${contacts[i]}");
          }
        }
        break;

      case '3':
        stdout.write("Enter contact name to search: ");
        String searchName = stdin.readLineSync() ?? '';
        bool found = false;
        for (int i = 0; i < contacts.length; i++) {
          if (contacts[i].name.toLowerCase().contains(searchName.toLowerCase())) {
            print("\nSearch result for '$searchName':\n${contacts[i]}");
            found = true;
          }
        }
        if (!found) {
          print("Contact not found for '$searchName'.");
        }
        break;

      case '4':
        print("Goodbye!");
        return;

      default:
        print("Invalid choice. Please enter a valid option.");
    }
  }
}
