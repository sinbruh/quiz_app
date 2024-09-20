import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard(this.scores, {super.key});

  final List<int> scores;

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
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
