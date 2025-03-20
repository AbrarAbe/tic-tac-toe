import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/components/background.dart';
import '../components/menu_button.dart';
import '../components/my_appbar.dart';
import '../components/theme_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundAnimation(
      child: Scaffold(
        appBar: MyAppBar(leading: ThemeButton()),
        backgroundColor: Colors.transparent,
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
                      buttonWidth: 200,
                      icon: Icons.person,
                      text: "Play Solo",
                      onTap:
                          () => Navigator.pushNamed(context, '/single_player'),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    MenuButton(
                      buttonWidth: 200,
                      icon: Icons.people,
                      text: "Play with a friend",
                      onTap:
                          () => Navigator.pushNamed(context, '/multi_player'),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
