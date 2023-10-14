class QuestionDeck {
  final String name;
  final List<Question> questions;

  QuestionDeck({
    required this.name,
    required this.questions
  });

  factory QuestionDeck.fromJson(Map<dynamic, dynamic> json) {
    List<Question> questions = [];
    for (dynamic question in json['questions']) {
      questions.add(Question.fromJson(question));
    }

    return QuestionDeck(
      name: json['name'].toString(),
      questions: questions,
    );
  }
}

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
