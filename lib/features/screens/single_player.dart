import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: Text("Singe Player")),
      body: Center(
        child: Text('Play with Bot'),
      ),
    );
  }
}
