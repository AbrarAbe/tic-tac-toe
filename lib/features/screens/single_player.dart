import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/components/background.dart';
import '../components/my_alert_dialog.dart';
import '../components/my_appbar.dart';
import '../components/my_box.dart';
import '../../core/logic/single_player_logic.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  final SinglePlayerLogic _singlePlayerLogic = SinglePlayerLogic();

  void _handleTap(int index) {
    _singlePlayerLogic.handleTap(
      index,
      context,
      setState,
      _showWinnerDialog,
      _showDrawDialog,
      _computerMove,
    );
  }

  Future<void> _computerMove() async {
    await _singlePlayerLogic.computerMove(
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
          content: winner == 'X' ? 'You won!' : 'Computer won!',
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
    _singlePlayerLogic.resetGame(setState);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundAnimation(
      child: Scaffold(
        appBar: MyAppBar(title: Text('Play Solo')),
        backgroundColor: Colors.transparent,
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
                        boxShadow: _singlePlayerLogic.boxShadow[index],
                        borderColor: _singlePlayerLogic.boxColors[index],
                        onTap: () => _handleTap(index),
                        child: Center(
                          child: Text(
                            _singlePlayerLogic.board[index] ?? '',
                            style: TextStyle(
                              fontSize: 50,
                              color: _singlePlayerLogic.textColors[index],
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
      ),
    );
  }
}
