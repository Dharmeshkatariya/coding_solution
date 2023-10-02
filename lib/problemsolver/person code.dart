class Person {
  String name;
  int age;
  String city;

  Person(this.name, this.age, this.city);

  @override
  String toString() {
    return '$name, $age years old, from $city';
  }
}

void main() {
  List<Person> people = [
    Person('Alice', 30, 'New York'),
    Person('Bob', 25, 'San Francisco'),
    Person('Charlie', 35, 'Los Angeles'),
    Person('David', 28, 'New York'),
    Person('Eve', 40, 'Chicago'),
  ];

  // Filter people who are older than 30 and live in New York
  List<Person> filteredPeople = people.where((person) => person.age > 30 && person.city == 'New York').toList();
  print('People older than 30 from New York: $filteredPeople');

  // Group people by city
  Map<String, List<Person>> peopleByCity = {};
  for (var person in people) {
    if (!peopleByCity.containsKey(person.city)) {
      peopleByCity[person.city] = [];
    }
    peopleByCity[person.city]!.add(person);
  }
  print('People grouped by city: $peopleByCity');

  // Find the average age of people in each city
  Map<String, double> averageAgeByCity = {};
  peopleByCity.forEach((city, peopleList) {
    final totalAge = peopleList.map((person) => person.age).reduce((a, b) => a + b);
    final averageAge = totalAge / peopleList.length;
    averageAgeByCity[city] = averageAge;
  });
  print('Average age by city: $averageAgeByCity');

  // Find the city with the highest average age
  String cityWithHighestAverageAge = averageAgeByCity.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  print('City with the highest average age: $cityWithHighestAverageAge');
}
