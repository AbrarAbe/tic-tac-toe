import 'dart:math';
import 'package:flutter/material.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';
import '../components/my_alert_dialog.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  String _currentPlayer = 'X';
  List<String?> _board = List.generate(9, (_) => null);
  List<Color?> _boxColors = List.generate(9, (_) => null);
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

  void _handleTap(int index) {
    if (_board[index] == null) {
      setState(() {
        _board[index] = _currentPlayer;
        _boxColors[index] = Theme.of(context).colorScheme.primary;
      });
      final winner = _checkWinner();
      if (winner != null) {
        _showWinnerDialog(winner);
      } else if (_checkDraw()) {
        _showDrawDialog();
      } else {
        _computerMove();
      }
    }
  }

  Future<void> _computerMove() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final bestMove = _getBestMove();
    if (bestMove != null) {
      setState(() {
        _board[bestMove] = 'O';
        _boxColors[bestMove] = Theme.of(context).colorScheme.secondary;
      });
      final winner = _checkWinner();
      if (winner != null) {
        _showWinnerDialog(winner);
      } else if (_checkDraw()) {
        _showDrawDialog();
      }
    }
  }

  int? _getBestMove() {
    // Prioritas 1: Menang
    final winningMove = _findWinningMove('O');
    if (winningMove != null) {
      return winningMove;
    }
    // Prioritas 2: Blokir Pemain
    final blockingMove = _findWinningMove('X');
    if (blockingMove != null) {
      return blockingMove;
    }
    // Prioritas 3: Pilih Cell Kosong Acak
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

  int? _findWinningMove(String player) {
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
      appBar: MyAppBar(title: const Text("Singe Player")),
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
