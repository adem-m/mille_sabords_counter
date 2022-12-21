import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  final void Function(String) onTap;
  static const int MAX_PLAYER_NAME_LENGTH = 15;

  const AddPlayer({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Enter the player's name"),
            content: TextField(
              textCapitalization: TextCapitalization.words,
              onChanged: (value) => {name = value},
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Name ..."),
              onSubmitted: (_) => onNameEntered(),
            ),
            actions: [
              TextButton(
                onPressed: onNameEntered,
                child: const Text('Add'),
              )
            ],
          );
        });
  }

  String name = "";

  Future<void> onPressed(BuildContext context) async {
    await _displayDialog(context);
  }

  onNameEntered() {
    if (name != "") {
      widget.onTap(name.length > AddPlayer.MAX_PLAYER_NAME_LENGTH
          ? name.substring(0, AddPlayer.MAX_PLAYER_NAME_LENGTH)
          : name);
      _textFieldController.clear();
      name = "";
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(context),
      child: const Text(
        "Add Player",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
