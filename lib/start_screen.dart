import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.showScoreboard, {super.key});

  final void Function() startQuiz;
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
