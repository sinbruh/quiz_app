/// The model for the quiz questions.
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  /// The question text.
  final String text;
  /// The list of answers. The first answer is the correct one.
  final List<String> answers;

  /// Returns the list of answers shuffled in a random order.
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
