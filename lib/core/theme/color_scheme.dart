import 'package:flutter/material.dart';

class AppColorScheme {
  // Primary Colors
  static const Color primaryColor = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);
  
  // Secondary Colors
  static const Color secondaryColor = Color(0xFF10B981); // Emerald
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);
  
  // Tertiary Colors
  static const Color tertiaryColor = Color(0xFFF59E0B); // Amber
  
  // Status Colors
  static const Color successColor = Color(0xFF10B981);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color infoColor = Color(0xFF3B82F6);
  
  // Neutral Colors
  static const Color neutralLight = Color(0xFFF9FAFB);
  static const Color neutralLighter = Color(0xFFF3F4F6);
  static const Color neutral = Color(0xFFD1D5DB);
  static const Color neutralDark = Color(0xFF6B7280);
  static const Color neutralDarker = Color(0xFF374151);
  static const Color neutralDarkest = Color(0xFF1F2937);
  
  // Background Colors
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color darkBg = Color(0xFF0F172A);
  static const Color darkBgSecondary = Color(0xFF1E293B);
}

class AppLightTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColorScheme.primaryColor,
        secondary: AppColorScheme.secondaryColor,
        tertiary: AppColorScheme.tertiaryColor,
        error: AppColorScheme.errorColor,
        surface: AppColorScheme.lightBg,
        background: AppColorScheme.lightBg,
      ),
      scaffoldBackgroundColor: AppColorScheme.lightBg,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorScheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorScheme.lightBg,
        selectedItemColor: AppColorScheme.primaryColor,
        unselectedItemColor: AppColorScheme.neutralDark,
        elevation: 8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorScheme.neutralLighter,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.neutral,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.neutral,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.primaryColor,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColorScheme.primaryColor,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColorScheme.lightBg,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColorScheme.neutral,
          ),
        ),
      ),
    );
  }
}

class AppDarkTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColorScheme.primaryLight,
        secondary: AppColorScheme.secondaryLight,
        tertiary: AppColorScheme.tertiaryColor,
        error: AppColorScheme.errorColor,
        surface: AppColorScheme.darkBgSecondary,
        background: AppColorScheme.darkBg,
      ),
      scaffoldBackgroundColor: AppColorScheme.darkBg,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorScheme.darkBgSecondary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorScheme.darkBgSecondary,
        selectedItemColor: AppColorScheme.primaryLight,
        unselectedItemColor: AppColorScheme.neutralDark,
        elevation: 8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorScheme.darkBgSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.neutralDarker,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.neutralDarker,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorScheme.primaryLight,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.primaryLight,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColorScheme.primaryLight,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColorScheme.darkBgSecondary,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColorScheme.neutralDarker,
          ),
        ),
      ),
    );
  }
}
