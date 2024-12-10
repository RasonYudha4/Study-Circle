import 'package:authentication_repository/authentication_repository.dart';
import 'package:study_circle/class/views/pages/class_page.dart';

class Group {
  String id;
  String name;
  String description;
  String date;

  Group(
      {required this.id,
      required this.name,
      required this.date,
      required this.description});

  Group copyWith({
    String? uid,
    String? name,
    String? date,
    String? description,
    List<User>? members,
    List<Quiz>? quizzes,
  }) {
    return Group(
        id: uid ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        description: description ?? this.description);
  }
}
