class Student {
  String name;
  int age;
  double gpa;

  Student(this.name, this.age, this.gpa);

  @override
  String toString() {
    return '$name, $age years old, GPA: $gpa';
  }
}

void main() {
  List<Student> students = [
    Student('Alice', 20, 3.9),
    Student('Bob', 22, 3.5),
    Student('Charlie', 21, 3.8),
    Student('David', 19, 3.2),
    Student('Eve', 23, 4.0),
  ];

  // Filter students who are older than 21 and have a GPA of 3.5 or higher
  List<Student> filteredStudents = students
      .where((student) => student.age > 21 && student.gpa >= 3.5)
      .toList();

  print('Students older than 21 with a GPA of 3.5 or higher:');
  filteredStudents.forEach(print);

  // Calculate the average GPA of all students
  double totalGPA = students.map((student) => student.gpa).reduce((a, b) => a + b);
  double averageGPA = totalGPA / students.length;

  print('\nAverage GPA of all students: $averageGPA');

  // Create a map of student names to their ages
  Map<String, int> nameToAgeMap = {};
  students.forEach((student) {
    nameToAgeMap[student.name] = student.age;
  });

  print('\nMap of student names to ages: $nameToAgeMap');
}
