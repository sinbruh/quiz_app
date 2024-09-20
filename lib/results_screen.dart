import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/score_methods.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, this.showScoreboard,
      {super.key});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  final void Function() showScoreboard;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData =
        ScoreMethods(chosenAnswers).summaryData;

    final numTotalQuestions = questions.length;
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
