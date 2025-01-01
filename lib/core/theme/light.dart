import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ).copyWith(
    surface: Colors.grey[100]!,
    primary: Colors.deepPurpleAccent,
    secondary: Colors.tealAccent,
    onPrimary: Colors.white,
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
