part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizOperationSuccess extends QuizState {
  final String message;

  QuizOperationSuccess(this.message);
}

class QuizLoaded extends QuizState {
  final List<Quiz> questions;

  QuizLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

class QuizLoadedById extends QuizState {
  final Quiz quiz;

  QuizLoadedById(this.quiz);
}

class QuizLoadedByGroupId extends QuizState {
  final List<Quiz> quizzes;

  QuizLoadedByGroupId(this.quizzes);
  @override
  List<Object> get props => [quizzes];
}

class QuizError extends QuizState {
  final String message;

  QuizError(this.message);

  @override
  List<Object> get props => [message];
}

class QuizCreated extends QuizState {
  final String message;

  QuizCreated(this.message);

  @override
  List<Object> get props => [message];
}
