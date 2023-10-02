class Student {
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);

  @override
  String toString() {
    return '$name, $age years old, Grade: $grade';
  }
}

void main() {
  List<Student> students = [
    Student('Alice', 19, 90.5),
    Student('Bob', 20, 85.0),
    Student('Charlie', 18, 92.3),
    Student('David', 21, 88.7),
    Student('Eve', 22, 95.1),
  ];

  // Filter students who are older than 20 and have a grade greater than 90
  List<Student> filteredStudents = students.where((student) => student.age > 20 && student.grade > 90).toList();
  print('Students older than 20 with a grade > 90: $filteredStudents');

  // Calculate the average grade of all students
  double totalGrade = students.map((student) => student.grade).reduce((a, b) => a + b);
  double averageGrade = totalGrade / students.length;
  print('Average grade of all students: $averageGrade');

  // Find the student with the highest grade
  Student studentWithHighestGrade = students.reduce((a, b) => a.grade > b.grade ? a : b);
  print('Student with the highest grade: $studentWithHighestGrade');

  // Sort students by age in descending order
  List<Student> sortedByAgeDesc = List.from(students);
  sortedByAgeDesc.sort((a, b) => b.age.compareTo(a.age));
  print('Students sorted by age in descending order: $sortedByAgeDesc');

  // Check if there's anyone named 'Eve' in the list
  bool hasEve = students.any((student) => student.name == 'Eve');
  print('Is there anyone named Eve? $hasEve');
}
