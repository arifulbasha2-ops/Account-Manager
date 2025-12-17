import 'package:flutter/material.dart';
import 'color_scheme.dart';

class AppTheme {
  static ThemeData getLightTheme() => AppLightTheme.theme;
  
  static ThemeData getDarkTheme() => AppDarkTheme.theme;
  
  static Color getCategoryColor(String category) {
    switch (category) {
      case 'Groceries':
        return Colors.green;
      case 'Transportation':
        return Colors.blue;
      case 'Utilities':
        return Colors.orange;
      case 'Send Home':
        return Colors.purple;
      case 'Health':
        return Colors.red;
      case 'Shopping':
        return Colors.pink;
      case 'Eat Out':
        return Colors.amber;
      case 'Others':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
