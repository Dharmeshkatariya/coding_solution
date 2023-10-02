class ProblemSolverCodeSolution{

  int longestIncreasingSubsequence(List<int> nums) {
    if (nums.isEmpty) return 0;

    int n = nums.length;
    List<int> dp = List.filled(n, 1);

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] > nums[j] && dp[i] < dp[j] + 1) {
          dp[i] = dp[j] + 1;
        }
      }
    }

    return dp.reduce((max, current) => max > current ? max : current);
  }
  int factorial(int n) {
    if (n == 0) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }




  List<int> generateFibonacci(int terms) {
    List<int> fibonacciSequence = [0, 1];

    if (terms <= 2) {
      return fibonacciSequence.sublist(0, terms);
    }

    for (int i = 2; i < terms; i++) {
      int nextFibonacci = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
      fibonacciSequence.add(nextFibonacci);
    }

    return fibonacciSequence;

  }


  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;

    if (number % 2 == 0 || number % 3 == 0) return false;

    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
    }

    return true;
  }

  List<int> findPrimesInRange(int start, int end) {
    List<int> primes = [];

    for (int i = start; i <= end; i++) {
      if (isPrime(i)) {
        primes.add(i);
      }
    }

    return primes;
  }

  void listOperations() {
    List<int> numbers = [1, 2, 3, 4, 5];

    // Sum all elements in the list
    int sum = numbers.reduce((a, b) => a + b);
    print('Sum of elements: $sum');

    // Find the maximum element in the list
    int max = numbers.reduce((a, b) => a > b ? a : b);
    print('Maximum element: $max');

    // Sort the list
    numbers.sort();
    print('Sorted list: $numbers');
  }

  void listManipulation() {
    List<int> numbers = [1, 2, 3, 4, 5];

    // Filtering elements greater than 2
    List<int> filteredList = numbers.where((element) => element > 2).toList();
    print('Filtered List: $filteredList');

    // Mapping elements to their squares
    List<int> squaredList = numbers.map((element) => element * element).toList();
    print('Squared List: $squaredList');

    // Reducing elements to find the product
    int product = numbers.reduce((a, b) => a * b);
    print('Product of elements: $product');
  }

  void complexListExample() {
    List<Product> products = [
      Product('Laptop', 999.99),
      Product('Phone', 499.99),
      Product('Tablet', 299.99),
    ];

    // Find the most expensive product
    Product mostExpensive = products.reduce((a, b) => a.price > b.price ? a : b);
    print('Most Expensive Product: ${mostExpensive.name}');

    // Calculate the total price of all products
    double totalPrice = products.map((product) => product.price).reduce((a, b) => a + b);
    print('Total Price of Products: $totalPrice');
  }


  void stringManipulation() {
    String sentence = 'Dart is a versatile language';

    // Splitting the sentence into words
    List<String> words = sentence.split(' ');
    print('Words: $words');

    // Joining words into a sentence
    String joinedSentence = words.join(' - ');
    print('Joined Sentence: $joinedSentence');

    // Checking if the sentence contains a specific word
    bool containsDart = sentence.contains('Dart');
    print('Contains "Dart": $containsDart');

    // Replacing a word in the sentence
    String replacedSentence = sentence.replaceAll('Dart', 'Flutter');
    print('Replaced Sentence: $replacedSentence');
  }

  void persondatacodefilterandmore() {
    List<Person> people = [
      Person('Alice', 30),
      Person('Bob', 25),
      Person('Charlie', 35),
      Person('David', 28),
      Person('Eve', 40),
    ];

    // Filter people who are older than 30
    List<Person> olderThan30 = people.where((person) => person.age > 30).toList();
    print('People older than 30: $olderThan30');

    // Transform the list into a map with names as keys
    Map<String, Person> nameToPersonMap = Map.fromIterable(people, key: (person) => person.name, value: (person) => person);
    print('Name to Person Map: $nameToPersonMap');

    // Find the oldest person in the list
    Person oldestPerson = people.reduce((a, b) => a.age > b.age ? a : b);
    print('Oldest person: $oldestPerson');

    // Sort people by age in ascending order
    List<Person> sortedByAge = List.from(people);
    sortedByAge.sort((a, b) => a.age.compareTo(b.age));
    print('People sorted by age: $sortedByAge');

    // Check if there's anyone named 'Charlie' in the list
    bool hasCharlie = people.any((person) => person.name == 'Charlie');
    print('Is there anyone named Charlie? $hasCharlie');
  }





}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return '$name, $age years old';
  }
}




class Product {
  String name;
  double price;

  Product(this.name, this.price);
}