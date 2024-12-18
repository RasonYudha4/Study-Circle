part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadQuizEvent extends QuizEvent {}

class DeleteAllAllQuizEvent extends QuizEvent {}

class SubmitAnswerEvent extends QuizEvent {
  final String answer;

  SubmitAnswerEvent(this.answer);

  @override
  List<Object> get props => [answer];
}

class CreateQuizEvent extends QuizEvent {
  final String title;
  final List<Map<String, dynamic>> questions;
  final String groupId;
  final String description;

  CreateQuizEvent(this.title, this.questions, this.groupId, this.description);

  @override
  List<Object> get props => [title, questions, description];
}

class GetQuizById extends QuizEvent {
  final String quizId;

  GetQuizById(this.quizId);
}

class GetAllQuizByGroupId extends QuizEvent {
  final String groupId;

  GetAllQuizByGroupId(this.groupId);
}

class UpdateQuizScoreEvent extends QuizEvent {
  final String id;
  final String userId;
  final int newScore;

  UpdateQuizScoreEvent(this.id, this.userId, this.newScore);
}
