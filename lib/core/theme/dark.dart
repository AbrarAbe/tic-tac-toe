import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ).copyWith(
    surface: Colors.grey[900]!,
    primary: Colors.deepPurpleAccent,
    secondary: Colors.tealAccent,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.black,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'Open Sans',
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);