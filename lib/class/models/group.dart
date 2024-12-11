import 'package:authentication_repository/authentication_repository.dart';
import 'package:study_circle/class/views/pages/class_page.dart';

class Group {
  String? id;
  String invCode;
  String name;
  String description;
  List<String>? date;
  List<String>? members;
  List<String>? quizzes;

  Group(
      {this.id,
      required this.invCode,
      required this.name,
      this.date,
      required this.description,
      this.members,
      this.quizzes});

  Group copyWith({
    String? id,
    String? invCode,
    String? name,
    List<String>? date,
    String? description,
    List<String>? members,
    List<String>? quizzes,
  }) {
    return Group(
        id: id ?? this.id,
        invCode: invCode ?? this.invCode,
        name: name ?? this.name,
        date: date ?? this.date,
        description: description ?? this.description,
        members: members ?? this.members,
        quizzes: quizzes ?? this.quizzes);
  }
}
