import 'package:study_circle/class/models/question.dart';

class Quiz {
  String id;
  String title;
  List<Question> question;
  Map<String, int> scores;

  Quiz(
      {required this.id,
      required this.title,
      required this.question,
      required this.scores});
}
