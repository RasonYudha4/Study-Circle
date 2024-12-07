import 'package:flutter/material.dart';
import 'package:study_circle/class/views/pages/quiz_page.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
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
                Quiz(),
                Quiz(),
                Quiz(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
        ),
        child: Container(
          width: 360,
          height: 150,
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
          child: Center(
            child: Text(
              "Text Panjang Banget Asli Gila",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

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

class MeetUp extends StatelessWidget {
  const MeetUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
        ),
        child: Container(
          width: 120,
          height: 150,
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
          child: Center(
            child: Text(
              "Text Panjang Banget Asli Gila",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

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
