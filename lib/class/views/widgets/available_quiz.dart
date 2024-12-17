import 'package:flutter/material.dart';
import 'package:study_circle/class/views/pages/quiz_page.dart';

class AvailableQuiz extends StatelessWidget {
  const AvailableQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const QuizPage();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
        ),
        child: Container(
          width: 320,
          height: 120,
          decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(1, 3),
                ),
              ]),
        ),
      ),
    );
  }
}
