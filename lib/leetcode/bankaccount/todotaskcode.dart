import 'dart:io';

class TodoList {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    print('Task added: $task');
  }

  void viewTasks() {
    if (tasks.isEmpty) {
      print('Your to-do list is empty.');
    } else {
      print('Your to-do list:');
      for (int i = 0; i < tasks.length; i++) {
        print('$i. ${tasks[i]}');
      }
    }
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      String removedTask = tasks.removeAt(index);
      print('Task removed: $removedTask');
    } else {
      print('Invalid task index.');
    }
  }
}

void main() {
  TodoList todoList = TodoList();

  while (true) {
    print('Todo List Application');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Remove Task');
    print('4. Exit');
    print('Enter your choice: ');

    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        print('Enter task description: ');
        String taskDescription = stdin.readLineSync() ?? '';
        todoList.addTask(taskDescription);
        break;
      case '2':
        todoList.viewTasks();
        break;
      case '3':
        print('Enter the task index to remove: ');
        int taskIndex = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        todoList.removeTask(taskIndex);
        break;
      case '4':
        print('Exiting Todo List Application.');
        return;
      default:
        print('Invalid choice. Please select a valid option (1/2/3/4).');
    }
  }
}
