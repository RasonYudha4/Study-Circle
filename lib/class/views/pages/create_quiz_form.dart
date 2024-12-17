import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/quiz/quiz_bloc.dart';

class CreateQuizForm extends StatefulWidget {
  const CreateQuizForm({super.key});

  @override
  State<CreateQuizForm> createState() => _CreateQuizFormState();
}

class _CreateQuizFormState extends State<CreateQuizForm> {
  final TextEditingController _quizTitleController = TextEditingController();
  final List<TextEditingController> _questionControllers =
      List.generate(5, (_) => TextEditingController());
  final List<List<TextEditingController>> _optionControllers =
      List.generate(5, (_) => List.generate(4, (_) => TextEditingController()));
  final List<TextEditingController> _answerControllers =
      List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF127369),
      body: BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizOperationSuccess) {
            // Show a SnackBar when the quiz is created successfully
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Quiz created successfully!'),
                duration: Duration(seconds: 2),
              ),
            );

            // Navigate back to the previous page after a short delay
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          } else if (state is QuizError) {
            // Show an error message if there was an error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Column(
          children: [
            SizedBox(height: 30),
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
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Class",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Spacer(),
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
                    SizedBox(height: 10),
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
                              offset: Offset(1, 3)),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _quizTitleController,
                          decoration: InputDecoration(
                              hintText: "Enter Quiz Title",
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    for (int i = 0; i < 5; i++)
                      Input(
                        questionNumber: (i + 1).toString(),
                        question: _questionControllers[i],
                        option1: _optionControllers[i][0],
                        option2: _optionControllers[i][1],
                        option3: _optionControllers[i][2],
                        option4: _optionControllers[i][3],
                        ans: _answerControllers[i],
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
                    // Gather data to create a quiz
                    String title = _quizTitleController.text;
                    List<Map<String, dynamic>> questions = [];

                    for (int i = 0; i < 5; i++) {
                      questions.add({
                        'question': _questionControllers[i].text,
                        'options': [
                          _optionControllers[i][0].text,
                          _optionControllers[i][1].text,
                          _optionControllers[i][2].text,
                          _optionControllers[i][3].text,
                        ],
                        'correctAnswer': _answerControllers[i].text,
                      });
                    }

                    // Dispatch the CreateQuizEvent
                    context
                        .read<QuizBloc>()
                        .add(CreateQuizEvent(title, questions));
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
