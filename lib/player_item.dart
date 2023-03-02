import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mille_sabords_counter/counter.dart';

class PlayerItem extends StatelessWidget {
  final String name;
  final void Function(PlayerItem) onLongPress;
  final Stream<void> resetStream;

  const PlayerItem(
      {required this.name,
      required this.onLongPress,
      Key? key,
      required this.resetStream})
      : super(key: key);

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
        onLongPress(this);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Delete player"),
      content: Text("Are you sure you want to delete $name ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onLongPress: () => showAlertDialog(context),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Counter(resetStream: resetStream),
          ),
        ],
      ),
    );
  }
}
