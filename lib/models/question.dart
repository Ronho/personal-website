class Question {
  final String id;
  final String question;
  final String answer;

  Question({
    required this.id,
    required this.answer,
    required this.question
  });

  factory Question.fromJson(Map<dynamic, dynamic> json) {
    return Question(
      id: json['id'].toString(),
      question: json['question'].toString(),
      answer: json['answer'].toString(),
    );
  }
}
