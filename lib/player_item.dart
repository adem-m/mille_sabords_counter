import 'package:flutter/material.dart';
import 'package:mille_sabords_counter/counter.dart';

class PlayerItem extends StatelessWidget {
  final String name;

  final void Function(PlayerItem) onLongPress;

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

    // set up the AlertDialog
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

  const PlayerItem({required this.name, required this.onLongPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onLongPress: () => showAlertDialog(context),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Counter(),
          ),
        ],
      ),
    );
  }
}
