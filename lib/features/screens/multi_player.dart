import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class MultiPlayer extends StatefulWidget {
  const MultiPlayer({super.key});

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: Text("Player vs Player")),
      body: Center(
        child: Text('Player vs Player'),
      ),
    );
  }
}