import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

/// Screen that displays the questions, these questions are displayed one at
/// a time. The answers are shuffled each time a new question is displayed.
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  /// Callback function to be called when an answer is selected
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  /// Index of the current question
  var currentQuestionIndex = 0;

  /// Calls the callback function with the selected answer
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    /// The current question
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...currentQuestion.shuffledAnswers.map((item) {
                  return AnswerButton(item, () {
                    answerQuestion(item);
                  });
                })
              ],
            )));
  }
}
