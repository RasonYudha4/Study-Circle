import 'package:flutter/material.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class QuizReviews extends StatelessWidget {
  const QuizReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, top: 25),
          child: Text(
            "Quiz Reviews",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                QuizCard(),
                QuizCard(),
                QuizCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
