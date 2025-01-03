// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';
import '../components/player_box.dart';

class MultiPlayer extends StatefulWidget {
  const MultiPlayer({super.key});

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  String _currentPlayer = 'X';
  List<String?> _board = List.generate(9, (_) => null);
  List<Color?> _boxColors = List.generate(9, (_) => null);

  void _handleTap(int index) {
    if (_board[index] == null) {
      setState(() {
        _board[index] = _currentPlayer;
        if (_currentPlayer == 'X') {
          _currentPlayer = 'O';
          _boxColors[index] = Theme.of(context).colorScheme.primary;
        } else {
          _currentPlayer = 'X';
          _boxColors[index] = Theme.of(context).colorScheme.secondary;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text("Player vs Player")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlayerBox(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MyBox(
                      borderColor: _boxColors[index],
                      onTap: () => _handleTap(index),
                      child: Center(
                        child: Text(
                          _board[index] ?? '',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    );
                  },
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ),
            ),
          ),
          PlayerBox(),
        ],
      ),
    );
  }
}
