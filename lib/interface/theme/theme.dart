import 'package:flutter/material.dart';

abstract class ITheme {
  ThemeData get theme;
  ColorScheme get colorScheme;
  ElevatedButtonThemeData get elevatedButton;
}
