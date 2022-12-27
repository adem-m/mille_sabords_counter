import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Stream<void> resetStream;

  const Counter({Key? key, required this.resetStream}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int score = 0;
  final Color BACKGROUND_COLOR = const Color.fromARGB(255, 150, 25, 0);
  final Color FONT_COLOR = Colors.white;

  @override
  void initState() {
    super.initState();

    widget.resetStream.listen((_) {
      setState(() {
        score = 0;
      });
    });
  }

  void upScore() {
    setState(() {
      if (score < 100000) {
        score += 100;
      }
    });
  }

  void downScore() {
    setState(() {
      if (score >= 100) {
        score -= 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: BACKGROUND_COLOR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            color: FONT_COLOR,
            onPressed: downScore,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(15),
            ),
          ),
          Text(
            score.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            color: FONT_COLOR,
            onPressed: upScore,
          ),
        ],
      ),
    );
  }
}
