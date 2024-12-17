import 'package:study_circle/class/models/question.dart';

class Quiz {
  String id;
  String title;
  List<Question> questions;
  Map<String, int> scores;

  Quiz(
      {required this.id,
      required this.title,
      required this.questions,
      required this.scores});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((q) => q.toMap()).toList(),
      'scores': scores,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'] as String, // Extract the id from the map
      title: map['title'] as String, // Extract the title
      questions: (map['questions'] as List<dynamic>)
          .map((q) => Question.fromMap(q as Map<String, dynamic>))
          .toList(), // Extract and convert questions
      scores: Map<String, int>.from(
          map['scores'] as Map<dynamic, dynamic>), // Extract scores
    );
  }
}
