import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ).copyWith(
    surface: Colors.grey[100]!,
    primary: Colors.deepPurpleAccent,
    secondary: Colors.tealAccent,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'Open Sans',
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ).copyWith(
    surface: Colors.grey[900]!,
    primary: Colors.deepPurpleAccent.shade200,
    secondary: Colors.tealAccent.shade200,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.redAccent.shade200,
    onError: Colors.black,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'Open Sans',
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
