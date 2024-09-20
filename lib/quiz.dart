import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/score_methods.dart';
import 'package:quiz_app/scoreboard_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  List<int> scores = [];

  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void showScoreboard() {
    setState(() {
      activeScreen = 'score-board';
    });
  }

  void restartQuiz() {
    _selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
      calculateScore();
    }
  }

  void calculateScore() {
    scores.add(ScoreMethods(_selectedAnswers)
        .summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length);
    scores.sort((a, b) => b.compareTo(a));
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(_selectedAnswers, restartQuiz, showScoreboard);
    }

    if (activeScreen == 'score-board') {
      screenWidget = ScoreboardScreen(scores, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.indigo, Colors.teal]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
