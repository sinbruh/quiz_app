import 'package:flutter/material.dart';

/// The start screen of the quiz. Displays the quiz logo and the start button.
/// The user can start the quiz by pressing the start button.
/// The user can also view the scoreboard by pressing the scoreboard button.
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.showScoreboard, {super.key});

  /// Callback function to be called when the start button is pressed.
  final void Function() startQuiz;
  /// Callback function to be called when the scoreboard button is pressed.
  final void Function() showScoreboard;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Flutter Quiz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 2, color: Colors.white),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start')),
          OutlinedButton.icon(
              icon: const Icon(Icons.stacked_bar_chart),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 2, color: Colors.white),
              ),
              onPressed: showScoreboard,
              label: const Text(
                "Scoreboard",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
