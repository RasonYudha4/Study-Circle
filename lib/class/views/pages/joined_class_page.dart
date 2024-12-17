import 'package:flutter/material.dart';
import 'package:study_circle/class/views/pages/quiz_page.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class JoinedClassPage extends StatelessWidget {
  const JoinedClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF8AA6A3),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 250,
            decoration: BoxDecoration(
                color: Color(0xFF127369),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Text(
                          "Class",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 15, bottom: 25, left: 15),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFBFBFBF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AvailableQuizes(),
                      MeetUps(),
                      QuizReviews(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
