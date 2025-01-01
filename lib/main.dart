import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_switch.dart';
import 'features/screens/main_menu.dart';
import 'features/screens/single_player.dart';
import 'features/screens/multi_player.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeSwitch(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainMenu(),
      theme: Provider.of<ThemeSwitch>(context).themeData,
      routes: {
        '/single_player': (context) => const SinglePlayer(),
        '/multi_player': (context) => const MultiPlayer(),
      },
    );
  }
}
