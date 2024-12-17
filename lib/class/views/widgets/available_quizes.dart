import 'package:flutter/material.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class AvailableQuizes extends StatelessWidget {
  const AvailableQuizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, top: 10),
          child: Text(
            "Available quizes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 140,
          width: 380,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  AvailableQuiz(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
