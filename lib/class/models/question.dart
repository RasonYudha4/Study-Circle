class Question {
  String? id;
  String question;
  List<String> options;
  String correctAnswer; //Sementara

  Question(
      {this.id,
      required this.question,
      required this.correctAnswer,
      required this.options});

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctAns': correctAnswer
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String?, // Extract the id from the map
      question: map['question'] as String, // Extract the question
      options: List<String>.from(
          map['options'] as List<dynamic>), // Extract and convert options
      correctAnswer:
          map['correctAnswer'] as String, // Extract the correct answer
    );
  }
}
