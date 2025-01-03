import 'package:flutter/material.dart';

class PlayerBox extends StatelessWidget {
  const PlayerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      // child: Container(
      // decoration: BoxDecoration(color: Colors.grey[300]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Player 1", style: TextStyle(fontSize: 20)),
          Text("Score :", style: TextStyle(fontSize: 20)),
        ],
      ),
      // ),
    );
  }
}
