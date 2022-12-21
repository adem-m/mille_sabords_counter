import 'package:flutter/material.dart';
import 'package:mille_sabords_counter/add_player.dart';
import 'package:mille_sabords_counter/player_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> playerItems = List.empty(growable: true);

  void addPlayer(String name) {
    setState(() {
      playerItems.add(
        PlayerItem(
          name: name,
          onLongPress: removePlayer,
        ),
      );
    });
  }

  void removePlayer(PlayerItem playerItem) {
    setState(() {
      playerItems.remove(playerItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mille Sabords"),
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
      ),
    );
  }
}
