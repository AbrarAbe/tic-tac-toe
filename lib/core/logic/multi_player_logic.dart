import 'package:flutter/material.dart';

class MultiPlayerLogic {
  String _currentPlayer = 'X';
  List<String?> _board = List.generate(9, (_) => null);
  List<Color?> _boxShadow = List.generate(9, (_) => null);
  List<Color?> _boxColors = List.generate(9, (_) => null);
  List<Color?> _textColors = List.generate(9, (_) => null);
  final List<List<int>> _winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void handleTap(
    int index,
    BuildContext context,
    Function(void Function()) setState,
    Function(String?) showWinnerDialog,
    Function() showDrawDialog,
  ) {
    if (_board[index] == null) {
      setState(() {
        _board[index] = _currentPlayer;
        if (_currentPlayer == 'X') {
          _currentPlayer = 'O';
          _boxShadow[index] = Theme.of(context).colorScheme.primary;
          _boxColors[index] = Theme.of(context).colorScheme.primary;
          _textColors[index] = Theme.of(context).colorScheme.primary;
        } else {
          _currentPlayer = 'X';
          _boxShadow[index] = Theme.of(context).colorScheme.secondary;
          _boxColors[index] = Theme.of(context).colorScheme.secondary;
          _textColors[index] = Theme.of(context).colorScheme.secondary;
        }
      });
      final winner = checkWinner();
      if (winner != null) {
        showWinnerDialog(winner);
      } else if (checkDraw()) {
        showDrawDialog();
      }
    }
  }

  String? checkWinner() {
    for (var combination in _winningCombinations) {
      final player = _board[combination[0]];
      if (player != null &&
          combination.every((index) => _board[index] == player)) {
        return player;
      }
    }
    return null;
  }

  bool checkDraw() {
    return _board.every((cell) => cell != null);
  }

  void resetGame(Function(void Function()) setState) {
    setState(() {
      _board = List.generate(9, (_) => null);
      _boxShadow = List.generate(9, (_) => null);
      _boxColors = List.generate(9, (_) => null);
      _textColors = List.generate(9, (_) => null);
      _currentPlayer = 'X';
    });
  }

  List<String?> get board => _board;
  List<Color?> get boxShadow => _boxShadow;
  List<Color?> get boxColors => _boxColors;
  List<Color?> get textColors => _textColors;
}
