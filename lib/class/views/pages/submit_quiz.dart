import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_circle/class/class.dart';
import 'package:study_circle/class/models/quiz.dart';
import 'package:study_circle/class/views/pages/pages.dart';

class SubmitQuiz extends StatefulWidget {
  final Quiz quiz;
  const SubmitQuiz({super.key, required this.quiz});

  @override
  _SubmitQuizState createState() => _SubmitQuizState();
}

class _SubmitQuizState extends State<SubmitQuiz> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Map<int, String?> _selectedOptions = {};

  late List<Map<String, dynamic>> _questions;

  @override
  void initState() {
    super.initState();
    _loadSelectedOptions();

    _questions = widget.quiz.questions.map((q) {
      return {
        "question": q.question,
        "options": q.options,
        "correctAnswer": q.correctAnswer
      };
    }).toList();
  }

  void _calculateScore() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedOptions[i] == _questions[i]["correctAnswer"]) {
        score++;
      }
    }
    print('Calculated score: $score');
    _showScoreDialog(score);
  }

  void _showScoreDialog(int score) {
    _showCustomDialog(
      title: "Your Score",
      content: "You scored $score out of ${_questions.length}.",
    );
  }

  Future<void> _loadSelectedOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _questions.length; i++) {
      String? option = prefs.getString('selected_option_$i');
      if (option != null) {
        _selectedOptions[i] = option;
      }
    }
    setState(() {});
  }

  Future<void> _saveSelectedOption(int questionIndex, String option) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_option_$questionIndex', option);
  }

  void _goToNextPage() {
    if (_currentPage < _questions.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _selectOption(String option) {
    setState(() {
      _selectedOptions[_currentPage] = option;
    });
    _saveSelectedOption(_currentPage, option);
    print('Selected option: $option for question ${_currentPage + 1}');
  }

  bool _allQuestionsAnswered() {
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedOptions[i] == null) {
        return false;
      }
    }
    return true;
  }

  void _showConfirmationDialog() {
    if (_allQuestionsAnswered()) {
      _showCustomDialog(
        title: "Confirmation",
        content: "Are you sure you want to submit your answers?",
        onConfirm: () {
          Navigator.of(context).pop();
          _calculateScore();
        },
      );
    } else {
      _showIncompleteDialog();
    }
  }

  void _showIncompleteDialog() {
    _showCustomDialog(
      title: "Incomplete",
      content: "Please answer all questions before submitting.",
    );
  }

  void _showCustomDialog(
      {required String title,
      required String content,
      VoidCallback? onConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (onConfirm != null) {
                          onConfirm();
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Quiz",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(), // Disable swipe
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 350,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _questions[index]["question"],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF10403B),
                                  fontWeight: FontWeight.bold),
                            ),
                            ..._questions[index]["options"]
                                .map<Widget>((option) {
                              return Text(
                                option,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF10403B),
                                    fontWeight: FontWeight.bold),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Static option buttons
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () => _selectOption("A"),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: _selectedOptions[_currentPage] == "A"
                                    ? Colors.green
                                    : Color(0xFF10403B),
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
                            onTap: () => _selectOption("B"),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: _selectedOptions[_currentPage] == "B"
                                    ? Colors.green
                                    : Color(0xFF10403B),
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
                            onTap: () => _selectOption("C"),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: _selectedOptions[_currentPage] == "C"
                                    ? Colors.green
                                    : Color(0xFF10403B),
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
                            onTap: () => _selectOption("D"),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: _selectedOptions[_currentPage] == "D"
                                    ? Colors.green
                                    : Color(0xFF10403B),
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
                            onTap: _goToPreviousPage,
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
                            onTap: _goToNextPage,
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
            padding: const EdgeInsets.only(top: 140),
            child: Container(
              height: 140,
              width: 140,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: Color(0xFF167369),
                onPressed: _showConfirmationDialog,
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
