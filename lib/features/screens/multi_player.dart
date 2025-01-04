// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../components/my_alert_dialog.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';

class MultiPlayer extends StatefulWidget {
  const MultiPlayer({super.key});

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  String _currentPlayer = 'X';
  List<String?> _board = List.generate(9, (_) => null);
  List<Color?> _boxColors = List.generate(9, (_) => null);

  final List<List<int>> _winningCombinations = [
    // horiozntal
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // vertical
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // diagonal
    [0, 4, 8],
    [2, 4, 6],
  ];

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
      final winner = _checkWinner();
      if (winner != null) {
        _showWinnerDialog(winner);
      } else if (_checkDraw()) {
        _showDrawDialog();
      }
    }
  }

  String? _checkWinner() {
    for (var combination in _winningCombinations) {
      final player = _board[combination[0]];
      if (player != null &&
          combination.every((index) => _board[index] == player)) {
        return player;
      }
    }
    return null;
  }

  bool _checkDraw() {
    return _board.every((cell) => cell != null);
  }

  void _showWinnerDialog(String winner) {
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
    setState(() {
      _board = List.generate(9, (_) => null);
      _boxColors = List.generate(9, (_) => null);
      _currentPlayer = 'X';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text("Player vs Player")),
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
        ],
      ),
    );
  }
}
