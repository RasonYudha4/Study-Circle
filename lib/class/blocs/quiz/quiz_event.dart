part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadQuizEvent extends QuizEvent {}

class DeleteAllQuizzesEvent extends QuizEvent {}

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

  CreateQuizEvent(this.title, this.questions, this.groupId);

  @override
  List<Object> get props => [title, questions];
}

class GetQuizById extends QuizEvent {
  final String quizId;

  GetQuizById(this.quizId);
}