import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  /// The text to display on the button.
  final String answerText;
  /// The function to call when the button is tapped.
  final void Function() onTap;

  /// Builds an [ElevatedButton] with the given [answerText] and [onTap] function.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
