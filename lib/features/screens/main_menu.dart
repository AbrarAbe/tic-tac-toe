import 'package:flutter/material.dart';
import '../components/menu_button.dart';
import '../components/my_appbar.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "T I C",
              style: TextStyle(
                fontSize: 85,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              "T A C",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary.withValues(alpha: 99),
              ),
            ),
            Text(
              "T O E",
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary.withValues(alpha: 50),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20.0,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuButton(
                    buttonWidth: 180,
                    icon: Icons.people,
                    text: "Play with a friend",
                    onTap: () => Navigator.pushNamed(context, '/multi_player'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  MenuButton(
                    buttonWidth: 195,
                    icon: Icons.person,
                    text: "Play with Computer",
                    onTap: () => Navigator.pushNamed(context, '/single_player'),
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
