import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/quiz/quiz_bloc.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class AvailableQuizes extends StatelessWidget {
  final String groupId;
  const AvailableQuizes({
    super.key,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<QuizBloc>().add(GetAllQuizByGroupId(groupId));
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is QuizLoadedByGroupId) {
          final quizzes = state.quizzes;

          return Container(
            height: 175,
            width: 380,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available quiz",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: quizzes.isEmpty
                          ? [
                              NoQuizzesAvailable()
                            ] // Show the empty state widget if quizzes is empty
                          : quizzes.map((quiz) {
                              return AvailableQuiz(
                                quiz: quiz,
                              );
                            }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is QuizError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No quizzes available.'));
        }
      },
    );
  }
}
