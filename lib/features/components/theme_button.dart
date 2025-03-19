import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/theme_switch.dart';
import '../../core/theme/theme.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GestureDetector(
        onTap: () {
          Provider.of<ThemeSwitch>(context, listen: false).toggleTheme();
        },
        child: Icon(
          Provider.of<ThemeSwitch>(context).themeData == darkTheme
              ? Icons.light_mode
              : Icons.dark_mode,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
