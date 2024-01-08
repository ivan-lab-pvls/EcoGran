import 'package:ecogrand_bank/data/models/quiz/person.dart';

class Answer {
  const Answer({
    required this.text,
    required this.person,
    required this.date,
  });
  
  final String text;
  final Person person;
  final DateTime date;
}
