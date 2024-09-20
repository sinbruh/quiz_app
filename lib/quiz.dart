import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/score_methods.dart';
import 'package:quiz_app/scoreboard_screen.dart';
import 'package:quiz_app/start_screen.dart';

/// The main Quiz widget. This widget is the root of the application.
/// It manages the state of the quiz and switches between different screens.
/// The screens are the start screen, the questions screen, the results screen,
/// and the scoreboard screen. The quiz widget also manages the selected answers
/// and the scores. The selected answers are used to calculate the scores.
/// The scores are displayed on the scoreboard screen. The quiz widget also
/// provides methods to switch between the screens and to restart the quiz.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /// List of selected answers.
  List<String> _selectedAnswers = [];
  /// List of scores, each score is the number of correct answers.
  List<int> scores = [];

  /// The active screen, can be 'start-screen', 'questions-screen',
  /// 'results-screen', or 'score-board'.
  String activeScreen = 'start-screen';

  /// Switches to the questions screen.
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  /// Switches to the scoreboard screen.
  void showScoreboard() {
    setState(() {
      activeScreen = 'score-board';
    });
  }

  /// Restarts the quiz.
  void restartQuiz() {
    _selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  /// Callback function to be called when an answer is selected. Adds the
  /// selected answer to the list of selected answers. If all questions have
  /// been answered, switches to the results screen and calculates the score.
  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
      calculateScore();
    }
  }

  /// Calculates the score based on the selected answers and adds the score to
  /// the list of scores. Also sorts the list of scores in descending order.
  void calculateScore() {
    scores.add(ScoreMethods(_selectedAnswers)
        .summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length);
    scores.sort((a, b) => b.compareTo(a));
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen, showScoreboard);

    /// Switches to the questions screen if the active screen is 'questions-screen'.
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    /// Switches to the results screen if the active screen is 'results-screen'.
    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(_selectedAnswers, restartQuiz, showScoreboard);
    }

    /// Switches to the scoreboard screen if the active screen is 'score-board'.
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
