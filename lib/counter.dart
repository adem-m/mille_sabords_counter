import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Stream<void> resetStream;

  const Counter({Key? key, required this.resetStream}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int score = 0;

  @override
  void initState() {
    super.initState();

    widget.resetStream.listen((_) {
      setState(() {
        print("score reset");
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
      color: const Color.fromARGB(100, 100, 100, 111),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: downScore,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(15),
            ),
          ),
          Text(
            score.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: upScore,
          ),
        ],
      ),
    );
  }
}
