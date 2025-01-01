import 'package:flutter/material.dart';
import '../components/menu_button.dart';
import '../components/my_appbar.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text("Main Menu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "T I C",
              style: TextStyle(
                fontSize: 50,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              "T A C",
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(99),
              ),
            ),
            Text(
              "T O E",
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(98),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuButton(
                    text: "Single Player",
                    onTap: () => Navigator.pushNamed(context, '/single_player'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: "Play with a friend",
                    onTap: () => Navigator.pushNamed(context, '/multi_player'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
