import 'package:flutter/material.dart';

class CreateQuizForm extends StatefulWidget {
  const CreateQuizForm({super.key});

  @override
  State<CreateQuizForm> createState() => _CreateQuizFormState();
}

class _CreateQuizFormState extends State<CreateQuizForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _quizTitleController = TextEditingController();
    TextEditingController _question1Controller = TextEditingController();
    TextEditingController _question2Controller = TextEditingController();
    TextEditingController _question3Controller = TextEditingController();
    TextEditingController _question4Controller = TextEditingController();
    TextEditingController _question5Controller = TextEditingController();
    TextEditingController _option1Question1Controller = TextEditingController();
    TextEditingController _option2Question1Controller = TextEditingController();
    TextEditingController _option3Question1Controller = TextEditingController();
    TextEditingController _option4Question1Controller = TextEditingController();
    TextEditingController _option1Question2Controller = TextEditingController();
    TextEditingController _option2Question2Controller = TextEditingController();
    TextEditingController _option3Question2Controller = TextEditingController();
    TextEditingController _option4Question2Controller = TextEditingController();
    TextEditingController _option1Question3Controller = TextEditingController();
    TextEditingController _option2Question3Controller = TextEditingController();
    TextEditingController _option3Question3Controller = TextEditingController();
    TextEditingController _option4Question3Controller = TextEditingController();
    TextEditingController _option1Question4Controller = TextEditingController();
    TextEditingController _option2Question4Controller = TextEditingController();
    TextEditingController _option3Question4Controller = TextEditingController();
    TextEditingController _option4Question4Controller = TextEditingController();
    TextEditingController _option1Question5Controller = TextEditingController();
    TextEditingController _option2Question5Controller = TextEditingController();
    TextEditingController _option3Question5Controller = TextEditingController();
    TextEditingController _option4Question5Controller = TextEditingController();
    TextEditingController _ans1Controller = TextEditingController();
    TextEditingController _ans2Controller = TextEditingController();
    TextEditingController _ans3Controller = TextEditingController();
    TextEditingController _ans4Controller = TextEditingController();
    TextEditingController _ans5Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF127369),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3, top: 25),
                    child: Text(
                      "Create Quiz",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Color(0xFFBFBFBF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: _quizTitleController,
                        decoration: InputDecoration(
                          hintText: "Enter Quiz Title",
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Input(
                    questionNumber: "1",
                    question: _question1Controller,
                    option1: _option1Question1Controller,
                    option2: _option2Question1Controller,
                    option3: _option3Question1Controller,
                    option4: _option4Question1Controller,
                    ans: _ans1Controller,
                  ),
                  Input(
                    questionNumber: "2",
                    question: _question2Controller,
                    option1: _option1Question2Controller,
                    option2: _option2Question2Controller,
                    option3: _option3Question2Controller,
                    option4: _option4Question2Controller,
                    ans: _ans2Controller,
                  ),
                  Input(
                    questionNumber: "3",
                    question: _question3Controller,
                    option1: _option1Question3Controller,
                    option2: _option2Question3Controller,
                    option3: _option3Question3Controller,
                    option4: _option4Question3Controller,
                    ans: _ans3Controller,
                  ),
                  Input(
                    questionNumber: "4",
                    question: _question4Controller,
                    option1: _option1Question4Controller,
                    option2: _option2Question4Controller,
                    option3: _option3Question4Controller,
                    option4: _option4Question4Controller,
                    ans: _ans4Controller,
                  ),
                  Input(
                    questionNumber: "5",
                    question: _question5Controller,
                    option1: _option1Question5Controller,
                    option2: _option2Question5Controller,
                    option3: _option3Question5Controller,
                    option4: _option4Question5Controller,
                    ans: _ans5Controller,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            color: Color(0xFF127369),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  print("Quiz added");
                  print("Question 1 : ${_question1Controller.text}");
                  print("ans 1 : ${_ans1Controller.text}");
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFF8AA6A3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Create Quiz",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Input extends StatefulWidget {
  final String questionNumber;
  final TextEditingController question;
  final TextEditingController option1;
  final TextEditingController option2;
  final TextEditingController option3;
  final TextEditingController option4;
  final TextEditingController ans;
  const Input({
    Key? key,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.ans,
    required this.questionNumber,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 380,
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.question,
                decoration: InputDecoration(
                  hintText: "Enter Question ${widget.questionNumber}",
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 60,
            width: 380,
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.option1,
                decoration: InputDecoration(
                  hintText: "Enter Option 1",
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 60,
            width: 380,
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.option2,
                decoration: InputDecoration(
                  hintText: "Enter Option 2",
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 60,
            width: 380,
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.option3,
                decoration: InputDecoration(
                  hintText: "Enter Option 3",
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 60,
            width: 380,
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.option4,
                decoration: InputDecoration(
                  hintText: "Enter Option 4",
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CorrectAnsButton(
              ans: widget.ans,
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}

class CorrectAnsButton extends StatefulWidget {
  final TextEditingController ans;
  const CorrectAnsButton({
    Key? key,
    required this.ans,
  }) : super(key: key);

  @override
  State<CorrectAnsButton> createState() => _CorrectAnsButtonState();
}

class _CorrectAnsButtonState extends State<CorrectAnsButton> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Correct Answer : ",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedValue = 'A';
              widget.ans.text = _selectedValue!;
            });
            print("selected Value : ${_selectedValue}");
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
                color: _selectedValue == 'A'
                    ? Color(0xFF8AA6A3)
                    : Color(0xFFBFBFBF),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "A",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedValue = 'B';
              widget.ans.text = _selectedValue!;
            });
            print("selected Value : ${_selectedValue}");
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
                color: _selectedValue == 'B'
                    ? Color(0xFF8AA6A3)
                    : Color(0xFFBFBFBF),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "B",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedValue = 'C';
              widget.ans.text = _selectedValue!;
            });
            print("selected Value : ${_selectedValue}");
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
                color: _selectedValue == 'C'
                    ? Color(0xFF8AA6A3)
                    : Color(0xFFBFBFBF),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "C",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedValue = 'D';
              widget.ans.text = _selectedValue!;
            });
            print("selected Value : ${_selectedValue}");
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
                color: _selectedValue == 'D'
                    ? Color(0xFF8AA6A3)
                    : Color(0xFFBFBFBF),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "D",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
