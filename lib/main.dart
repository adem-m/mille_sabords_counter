import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mille_sabords_counter/add_player.dart';
import 'package:mille_sabords_counter/player_item.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> playerItems = List.empty(growable: true);
  StreamController<void> resetStream = StreamController.broadcast();

  void addPlayer(String name) {
    setState(() {
      playerItems.add(
        PlayerItem(
          name: name,
          onLongPress: removePlayer,
          resetStream: resetStream.stream,
        ),
      );
    });
  }

  void removePlayer(PlayerItem playerItem) {
    setState(() {
      playerItems.remove(playerItem);
    });
  }

  showResetAlert(BuildContext context) {
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        resetScores();
        Navigator.of(context).pop();
      },
    );
    Widget noButton = TextButton(
      child: const Text("No"),
      onPressed: () => Navigator.of(context).pop(),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Reset scores"),
      content: const Text("Are you sure you want to reset the scores ?"),
      actions: [
        yesButton,
        noButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void resetScores() {
    resetStream.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mille Sabords"),
        actions: [
          IconButton(
            onPressed: () => showResetAlert(context),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: playerItems,
            ),
            AddPlayer(onTap: addPlayer),
          ],
        ),
      ),
    );
  }
}
