// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../components/my_alert_dialog.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';
import '../../core/logic/multi_player_logic.dart';

class MultiPlayer extends StatefulWidget {
  const MultiPlayer({super.key});

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  final MultiPlayerLogic _multiPlayerLogic = MultiPlayerLogic();

  void _handleTap(int index) {
    _multiPlayerLogic.handleTap(
      index,
      context,
      setState,
      _showWinnerDialog,
      _showDrawDialog,
    );
  }

  void _showWinnerDialog(String? winner) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MyAlertDialog(
          title: "Winner!",
          content: '$winner has won the game!',
          onPressed: () {
            Navigator.of(context).pop();
            _resetGame();
          },
          buttonText: "Play Again",
        );
      },
    ).whenComplete(() => _resetGame());
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MyAlertDialog(
          title: "Draw!",
          content: 'The game is a draw!',
          onPressed: () {
            Navigator.of(context).pop();
            _resetGame();
          },
          buttonText: "Play Again",
        );
      },
    ).whenComplete(() => _resetGame());
  }

  void _resetGame() {
    _multiPlayerLogic.resetGame(setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Player with a friend!')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
                      boxShadow: _multiPlayerLogic.boxShadow[index],
                      borderColor: _multiPlayerLogic.boxColors[index],
                      onTap: () => _handleTap(index),
                      child: Center(
                        child: Text(
                          _multiPlayerLogic.board[index] ?? '',
                          style: TextStyle(
                            fontSize: 50,
                            color: _multiPlayerLogic.textColors[index],
                          ),
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
        ],
      ),
    );
  }
}
