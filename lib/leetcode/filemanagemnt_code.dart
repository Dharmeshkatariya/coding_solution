import 'dart:io';

void main() {
  while (true) {
    print("\nFile Management System");
    print("1. Create File");
    print("2. Read File");
    print("3. Update File");
    print("4. Delete File");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        stdout.write("Enter file name: ");
        String fileName = stdin.readLineSync() ?? '';
        stdout.write("Enter file content: ");
        String fileContent = stdin.readLineSync() ?? '';
        createFile(fileName, fileContent);
        break;

      case '2':
        stdout.write("Enter file name to read: ");
        String fileName = stdin.readLineSync() ?? '';
        readFile(fileName);
        break;

      case '3':
        stdout.write("Enter file name to update: ");
        String fileName = stdin.readLineSync() ?? '';
        stdout.write("Enter new content: ");
        String newContent = stdin.readLineSync() ?? '';
        updateFile(fileName, newContent);
        break;

      case '4':
        stdout.write("Enter file name to delete: ");
        String fileName = stdin.readLineSync() ?? '';
        deleteFile(fileName);
        break;

      case '5':
        print("Goodbye!");
        return;

      default:
        print("Invalid choice. Please enter a valid option.");
    }
  }
}

void createFile(String fileName, String content) {
  try {
    final file = File(fileName);
    file.writeAsStringSync(content);
    print("File '$fileName' created successfully.");
  } catch (e) {
    print("Error creating file: $e");
  }
}

void readFile(String fileName) {
  try {
    final file = File(fileName);
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      print("\nFile Content for '$fileName':\n$content");
    } else {
      print("File '$fileName' does not exist.");
    }
  } catch (e) {
    print("Error reading file: $e");
  }
}

void updateFile(String fileName, String newContent) {
  try {
    final file = File(fileName);
    if (file.existsSync()) {
      file.writeAsStringSync(newContent);
      print("File '$fileName' updated successfully.");
    } else {
      print("File '$fileName' does not exist.");
    }
  } catch (e) {
    print("Error updating file: $e");
  }
}

void deleteFile(String fileName) {
  try {
    final file = File(fileName);
    if (file.existsSync()) {
      file.deleteSync();
      print("File '$fileName' deleted successfully.");
    } else {
      print("File '$fileName' does not exist.");
    }
  } catch (e) {
    print("Error deleting file: $e");
  }
}
