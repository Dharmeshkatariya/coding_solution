import 'dart:async';

class Vehicle {
  String make;
  String model;
  int year;

  Vehicle(this.make, this.model, this.year);

  void start() {
    print('$year $make $model is starting.');
  }

  @override
  String toString() {
    return '$year $make $model';
  }
}

class Car extends Vehicle {
  Car(String make, String model, int year) : super(make, model, year);

  void drive() {
    print('$year $make $model is driving.');
  }
}

Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched successfully!');
}

void main() async {
  // Simulate fetching data asynchronously
  await fetchData();

  // Create instances of Car
  final car1 = Car('Toyota', 'Camry', 2022);
  final car2 = Car('Honda', 'Civic', 2021);

  // Demonstrate inheritance and method calls
  car1.start();
  car1.drive();

  car2.start();
  car2.drive();

  // Create a list of vehicles
  List<Vehicle> vehicles = [car1, car2, Vehicle('Ford', 'Focus', 2020)];

  // Print information about all vehicles
  print('\nList of Vehicles:');
  vehicles.forEach((vehicle) {
    print(vehicle);
  });

  // Filter vehicles made in or after 2021
  List<Vehicle> newerVehicles = vehicles.where((vehicle) => vehicle.year >= 2021).toList();
  print('\nNewer Vehicles (2021 and later):');
  newerVehicles.forEach((vehicle) {
    print(vehicle);
  });
}
