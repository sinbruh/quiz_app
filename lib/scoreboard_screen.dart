import 'package:flutter/material.dart';
import 'package:quiz_app/scoreboard.dart';

/// The scoreboard screen widget. This widget displays the scores of the quiz.
/// The scores are displayed in descending order. The user can restart the quiz.
class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen(this.scores, this.restartQuiz, {super.key});

  /// The list of scores.
  final List<int> scores;
  /// Callback function to restart the quiz.
  final void Function() restartQuiz;

  @override
  State<StatefulWidget> createState() {
    return _ScoreboardState();
  }
}

class _ScoreboardState extends State<ScoreboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Scoreboard!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Scoreboard(widget.scores),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: widget.restartQuiz,
                  label: const Text(
                    "Restart Quiz!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}
