import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/theme_switch.dart';
import '../../core/theme/theme.dart'; // Import the theme.dart file

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  const MyAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text('Tic-Tac-Toe Game'),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<ThemeSwitch>(context, listen: false).toggleTheme();
            },
            child: Icon(
              Provider.of<ThemeSwitch>(context).themeData == darkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
