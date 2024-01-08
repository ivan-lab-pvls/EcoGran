import 'package:ecogrand_bank/data/models/quiz/answer.dart';
import 'package:ecogrand_bank/data/models/quiz/person.dart';

class Question {
  const Question({
    required this.text,
    required this.person,
    required this.date,
    required this.answers,
  });

  final String text;
  final Person person;
  final DateTime date;
  final List<Answer> answers;
}
