import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_circle/class/models/question.dart';
import 'package:study_circle/class/models/quiz.dart';
import 'package:study_circle/class/services/quiz_service.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizService _quizService;

  QuizBloc(this._quizService) : super(QuizInitial()) {
    on<LoadQuizEvent>((event, emit) async {
      try {
        emit(QuizLoading());
        final quizzes = await _quizService.getAllQuizzes();
        emit(QuizLoaded(quizzes));
      } catch (e) {
        QuizError('Failed to fetch quizzes');
      }
    });

    on<DeleteAllAllQuizEvent>(
      (event, emit) async {
        try {
          emit(QuizLoading());
          await _quizService.deleteAllQuizzes();
          emit(QuizOperationSuccess('All quizzes deleted successfully'));
        } catch (e) {
          emit(QuizError('Failed to delete all quizzes'));
        }
      },
    );

    on<GetQuizById>((event, emit) async {
      try {
        emit(QuizLoading());
        Quiz? quiz = await _quizService.getQuizById(event.quizId);
        if (quiz != null) {
          emit(QuizLoadedById(quiz));
        } else {
          emit(QuizError('Quiz not found'));
        }
      } catch (e) {
        emit(QuizError('Failed to fetch quiz'));
      }
    });

    on<GetAllQuizByGroupId>(
      (event, emit) async {
        try {
          emit(QuizLoading());
          final quizzes = await _quizService.getAllQuizByGroupId(event.groupId);
          emit(QuizLoadedByGroupId(quizzes));
        } catch (e) {
          emit(QuizError('Failed to fetch quiz'));
        }
      },
    );

    on<CreateQuizEvent>((event, emit) async {
      try {
        emit(QuizLoading());
        Quiz newQuiz = Quiz(
          id: '',
          groupId: event.groupId,
          description: event.description,
          title: event.title,
          questions: event.questions.map((q) => Question.fromMap(q)).toList(),
          scores: {},
        );
        await _quizService.createQuiz(newQuiz);
        emit(QuizOperationSuccess('Create quiz success'));
      } catch (e) {
        emit(QuizError('Failed to create quiz'));
      }
    });

    on<UpdateQuizScoreEvent>(
      (event, emit) async {
        try {
          emit(QuizLoading());
          String quizId = event.id;
          String userId = event.userId;
          int newScore = event.newScore;
          QuizService _quizService = QuizService();
          await _quizService.updateQuizScore(quizId, userId, newScore);
          emit(QuizOperationSuccess('Quiz submitted'));
        } catch (e) {
          emit(QuizError('Failed to submit quiz'));
        }
      },
    );
  }
}
