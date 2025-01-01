import 'package:flutter/material.dart';
import 'core/theme/dark.dart';
import 'core/theme/light.dart';
import 'features/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_4),
              onPressed: () {
                // TODO: Implement theme toggle functionality
              },
            ),
          ],
        ),
        body: const HomePage(),
      ),
    );
  }
}
