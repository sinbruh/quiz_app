import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/score_methods.dart';

/// The results screen widget. This widget displays the results of the quiz.
/// It displays the number of correct answers and a summary of the questions.
/// The summary includes the question, the correct answer, and the user's answer.
/// The user can restart the quiz or view the scoreboard.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, this.showScoreboard,
      {super.key});

  /// The list of chosen answers.
  final List<String> chosenAnswers;
  /// Callback function to restart the quiz.
  final void Function() restartQuiz;
  /// Callback function to show the scoreboard.
  final void Function() showScoreboard;

  @override
  Widget build(BuildContext context) {
    /// The summary data of the quiz. This includes the question, the correct
    /// answer, and the user's answer for each question.
    final List<Map<String, Object>> summaryData =
        ScoreMethods(chosenAnswers).summaryData;

    /// The total number of questions.
    final numTotalQuestions = questions.length;
    /// The number of correct questions.
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered out $numCorrectQuestions of $numTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: restartQuiz,
                  label: const Text(
                    "Restart Quiz",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              TextButton.icon(
                  icon: const Icon(Icons.stacked_bar_chart),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: showScoreboard,
                  label: const Text(
                    "Scoreboard",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}
