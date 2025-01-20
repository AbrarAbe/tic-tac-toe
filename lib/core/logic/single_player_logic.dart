import 'dart:math';
import 'package:flutter/material.dart';

class SinglePlayerLogic {
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
    Function() computerMove,
  ) {
    if (_board[index] == null) {
      setState(() {
        _board[index] = _currentPlayer;
        _boxShadow[index] = Theme.of(context).colorScheme.primary;
        _boxColors[index] = Theme.of(context).colorScheme.primary;
        _textColors[index] = Theme.of(context).colorScheme.primary;
      });
      final winner = checkWinner();
      if (winner != null) {
        showWinnerDialog(winner);
      } else if (checkDraw()) {
        showDrawDialog();
      } else {
        computerMove();
      }
    }
  }

  Future<void> computerMove(
    BuildContext context,
    Function(void Function()) setState,
    Function(String?) showWinnerDialog,
    Function() showDrawDialog,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final bestMove = getBestMove();
    if (bestMove != null) {
      setState(() {
        _board[bestMove] = 'O';
        _boxShadow[bestMove] = Theme.of(context).colorScheme.secondary;
        _boxColors[bestMove] = Theme.of(context).colorScheme.secondary;
        _textColors[bestMove] = Theme.of(context).colorScheme.secondary;
      });
      final winner = checkWinner();
      if (winner != null) {
        showWinnerDialog(winner);
      } else if (checkDraw()) {
        showDrawDialog();
      }
    }
  }

  int? getBestMove() {
    final winningMove = findWinningMove('O');
    if (winningMove != null) {
      return winningMove;
    }
    final blockingMove = findWinningMove('X');
    if (blockingMove != null) {
      return blockingMove;
    }
    final emptyCells = <int>[];
    for (int i = 0; i < _board.length; i++) {
      if (_board[i] == null) {
        emptyCells.add(i);
      }
    }
    if (emptyCells.isNotEmpty) {
      final random = Random();
      final randomIndex = random.nextInt(emptyCells.length);
      return emptyCells[randomIndex];
    }
    return null;
  }

  int? findWinningMove(String player) {
    for (final combination in _winningCombinations) {
      if (_board[combination[0]] == player &&
          _board[combination[1]] == player &&
          _board[combination[2]] == null) {
        return combination[2];
      }
      if (_board[combination[0]] == player &&
          _board[combination[2]] == player &&
          _board[combination[1]] == null) {
        return combination[1];
      }
      if (_board[combination[1]] == player &&
          _board[combination[2]] == player &&
          _board[combination[0]] == null) {
        return combination[0];
      }
    }
    return null;
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
  List<Color?> get textColors => _boxColors;
}
