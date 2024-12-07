import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(0xFF8AA6A3),
          child: Column(
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
                        "Quiz",
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
              Container(
                width: 350,
                height: 200,
                child: Center(
                    child: Text(
                  "Test",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF10403B),
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF10403B),
                              ),
                              child: Center(
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF10403B),
                              ),
                              child: Center(
                                child: Text(
                                  "B",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF10403B),
                              ),
                              child: Center(
                                child: Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF10403B),
                              ),
                              child: Center(
                                child: Text(
                                  "D",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF167369),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_left_rounded,
                                size: 140,
                                color: Color(0xFFBFBFBF),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF167369),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_right_rounded,
                                size: 140,
                                color: Color(0xFFBFBFBF),
                              )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: 140,
              width: 140,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: Color(0xFF167369),
                onPressed: () {
                  // Action when FAB is pressed
                  print('FAB Pressed');
                },
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 34, color: Color(0xFFBFBFBF)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
