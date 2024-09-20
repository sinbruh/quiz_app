import 'package:flutter/material.dart';

/// A widget that displays the scores in a list. The scores are displayed as
/// a list of numbers, each number represents the score of a user.
/// The scores are displayed in descending order.
class Scoreboard extends StatefulWidget {
  const Scoreboard(this.scores, {super.key});

  /// The list of scores.
  final List<int> scores;

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  /// The index of the score. Used to display the rank of the user.
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: widget.scores.map((score) {
            index++;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$index. $score out of 6",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
