import 'dart:math';

import 'package:flutter/material.dart';
import '../components/my_alert_dialog.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  String _currentPlayer = 'X';
  List<String?> _board = List.generate(9, (_) => null);
  List<Color?> _boxColors = List.generate(9, (_) => null);
  bool _gameActive = true;

  final List<List<int>> _winningCombinations = [
    // horiozntal
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // verticalabraro
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // diagonal
    [0, 4, 8],
    [2, 4, 6],
  ];

  void _handleTap(int index) {
    if (!_gameActive) return;
    if (_board[index] == null) {
      setState(() {
        _board[index] = _currentPlayer;
        _boxColors[index] =
            _currentPlayer == 'X'
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary;
      });
      final winner = _checkWinner();
      if (winner != null) {
        _gameActive = false;
        _showWinnerDialog(winner);
        return;
      } else if (_checkDraw()) {
        _gameActive = false;
        _showDrawDialog();
        return;
      }
      _togglePlayer();
      if (_currentPlayer == 'O') {
        _computerMove();
      }
    }
  }

  void _togglePlayer() {
    setState(() {
      _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
    });
  }

  void _computerMove() {
    if (!_gameActive) return;
    if (_currentPlayer == 'O') {
      final emptyCells =
          List.generate(
            9,
            (index) => index,
          ).where((index) => _board[index] == null).toList();
      if (emptyCells.isNotEmpty) {
        final randomIndex = Random().nextInt(emptyCells.length);
        final computerIndex = emptyCells[randomIndex];

        Future.delayed(const Duration(milliseconds: 200), () {
          _handleTap(computerIndex);
        });
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
    );
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
    );
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(9, (_) => null);
      _boxColors = List.generate(9, (_) => null);
      _currentPlayer = 'X';
      _gameActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text("Player vs Computer")),
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MyBox(
                      borderColor: _boxColors[index],
                      onTap: () => _handleTap(index),
                      child: Center(
                        child: Text(
                          _board[index] ?? '',
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    );
                  },
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
