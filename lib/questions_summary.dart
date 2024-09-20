import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color getAnswerColor(Map<String, Object> data) {
    if (data['user_answer'] == data['correct_answer']) {
      return Color.fromARGB(100, 6, 182, 175);
    } else {
      return Color.fromARGB(100, 31, 50, 99);
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
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  decoration: ShapeDecoration(
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 7, color: getAnswerColor(data))),
                      color: getAnswerColor(data)),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            style: TextStyle(color: Colors.white54)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String,
                            style: TextStyle(color: Colors.white70))
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
