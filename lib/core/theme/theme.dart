import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ).copyWith(
    surface: Colors.grey[200]!,
    primary: Colors.deepOrangeAccent,
    secondary: Colors.blue[500],
    tertiary: Colors.grey[800],
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: "Author",
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.tealAccent,
    brightness: Brightness.dark,
  ).copyWith(
    surface: Colors.grey[900]!,
    primary: Colors.deepPurpleAccent.shade400,
    secondary: Colors.tealAccent.shade200,
    tertiary: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.redAccent.shade200,
    onError: Colors.black,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: "Author",
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
