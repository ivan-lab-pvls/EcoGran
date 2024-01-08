class Person {
  const Person({
    required this.image,
    required this.firstName,
    required this.lastName,
  });

  final String image;
  final String firstName;
  final String lastName;

  factory Person.bruno() => const Person(
        image: 'assets/persons/bruno.png',
        firstName: 'Bruno',
        lastName: 'Smith',
      );

  factory Person.buster() => const Person(
        image: 'assets/persons/buster.png',
        firstName: 'Buster',
        lastName: 'Stewart',
      );

  factory Person.dylan() => const Person(
        image: 'assets/persons/dylan.png',
        firstName: 'Dylan',
        lastName: 'Johnson',
      );

  factory Person.emma() => const Person(
        image: 'assets/persons/emma.png',
        firstName: 'Emma',
        lastName: 'Campbell',
      );

  factory Person.rachel() => const Person(
        image: 'assets/persons/rachel.png',
        firstName: 'Rachel',
        lastName: 'Turner',
      );
}
