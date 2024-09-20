import 'data/questions.dart';

/// A class that provides methods to calculate the score of the quiz.
class ScoreMethods {
  ScoreMethods(this.chosenAnswers);

  /// The list of chosen answers.
  final List<String> chosenAnswers;

  /// Returns the summary data of the quiz. This includes the question, the
  /// correct answer, and the user's answer for each question. The data is
  /// returned as a list of maps.
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }
}
