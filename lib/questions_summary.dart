import 'package:flutter/material.dart';

/// A widget that displays a summary of the questions. It will display the
/// chosen and the correct answer for each question.
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  /// The data to display in the summary.
  final List<Map<String, Object>> summaryData;

  /// Returns the color of the answer based on whether it is correct or not.
  Color getAnswerColor(Map<String, Object> data) {
    if (data['user_answer'] == data['correct_answer']) {
      return const Color.fromARGB(100, 6, 182, 175);
    } else {
      return const Color.fromARGB(100, 31, 50, 99);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 7, color: getAnswerColor(data))),
                      color: getAnswerColor(data)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            style: const TextStyle(color: Colors.white54)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(color: Colors.white70))
                      ]),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
