class Question {
  final String title;
  final String chapter;
  final String question;
  final List<Option> options;

  Question({
    required this.title,
    required this.chapter,
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsFromJson = json['options'] as List;
    List<Option> optionList = optionsFromJson.map((option) => Option.fromJson(option)).toList();

    return Question(
      title: json['title'],
      chapter: json['chapter'],
      question: json['question'],
      options: optionList,
    );
  }
}

class Option {
  final String text;
  final bool isCorrect;
  final String letter;

  Option({
    required this.text,
    required this.isCorrect,
    required this.letter,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['text'],
      isCorrect: json['isCorrect'],
      letter: json['letter'],
    );
  }
}