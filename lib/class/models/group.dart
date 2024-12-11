import 'dart:ffi';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:study_circle/class/views/pages/class_page.dart';

class Group {
  String? id;
  int invCode;
  String name;
  String description;
  String date;

  Group(
      {this.id,
      required this.invCode,
      required this.name,
      required this.date,
      required this.description});

  Group copyWith({
    String? id,
    int? invCode,
    String? name,
    String? date,
    String? description,
    List<User>? members,
    List<Quiz>? quizzes,
  }) {
    return Group(
        id: id ?? this.id,
        invCode: invCode ?? this.invCode,
        name: name ?? this.name,
        date: date ?? this.date,
        description: description ?? this.description);
  }
}
