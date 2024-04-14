import 'dart:io';

// Define an interface
abstract class Animal {
  void makeSound();
}

// Define a base class using inheritance
class Mammal {
  void eat() {
    print('Mammal is eating');
  }

  void sleep() {
    print('Mammal is sleeping');
  }
}

// Define a class that implements an interface
class Dog extends Mammal implements Animal {
  @override
  void makeSound() {
    print('Woof!');
  }

  // Override an inherited method
  @override
  void sleep() {
    print('Dog is sleeping');
  }
}

// Define a class that represents data from a file
class AnimalFromFile {
  String name;
  int age;

  AnimalFromFile(this.name, this.age);

  @override
  String toString() {
    return 'Name: $name, Age: $age';
  }
}

// A method that demonstrates the use of a loop
void printNumbers(int n) {
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

void main() {
  // Demonstrate inheritance
  var dog = Dog();
  dog.eat(); // inherited method
  dog.sleep(); // overridden method

  // Demonstrate interface implementation
  dog.makeSound();

  // Initialize an instance of a class with data from a file
  var animalList = <AnimalFromFile>[];
  try {
    var file = File('animals.txt');
    var lines = file.readAsLinesSync();
    lines.forEach((line) {
      var parts = line.split(',');
      var name = parts[0];
      var age = int.parse(parts[1]);
      animalList.add(AnimalFromFile(name, age));
    });
  } catch (e) {
    print('Error reading file: $e');
  }

  // Print data from the file
  animalList.forEach((animal) {
    print(animal);
  });

  // Demonstrate a method that uses a loop
  printNumbers(5);
}
