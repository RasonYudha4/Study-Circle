import 'package:flutter/material.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class MeetUps extends StatelessWidget {
  const MeetUps({
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
            "Meet Ups",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 180,
          width: 380,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  MeetUp(),
                  MeetUp(),
                  MeetUp(),
                  MeetUp(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
