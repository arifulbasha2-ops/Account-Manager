import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  
  TextTheme get textTheme => theme.textTheme;
  
  ColorScheme get colorScheme => theme.colorScheme;
  
  double get width => MediaQuery.of(this).size.width;
  
  double get height => MediaQuery.of(this).size.height;
  
  bool get isDarkMode => theme.brightness == Brightness.dark;
  
  EdgeInsets get padding => MediaQuery.of(this).padding;
  
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}
