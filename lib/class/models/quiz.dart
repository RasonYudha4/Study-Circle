import 'package:study_circle/class/models/question.dart';

class Quiz {
  String? id;
  String title;
  String description;
  List<Question> questions;
  Map<String, int> scores;
  String groupId;

  Quiz(
      {this.id,
      required this.description,
      required this.groupId,
      required this.title,
      required this.questions,
      required this.scores});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((q) => q.toMap()).toList(),
      'scores': scores,
      'groupId': groupId,
      'description': description
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map, {String? id}) {
    return Quiz(
      id: id,
      groupId: map['groupId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      questions: (map['questions'] as List<dynamic>)
          .map((q) => Question.fromMap(q as Map<String, dynamic>))
          .toList(),
      scores: Map<String, int>.from(map['scores'] as Map<dynamic, dynamic>),
    );
  }
}
