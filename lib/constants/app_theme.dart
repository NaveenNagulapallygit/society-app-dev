import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',

    primaryColor: AppColors.primary,

    scaffoldBackgroundColor:
    AppColors.lightBackground,

    cardColor:
    AppColors.lightCard,

    dividerColor:
    AppColors.lightDivider,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightTextSecondary,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightCard,

      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(15),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: AppColors.primary,

    scaffoldBackgroundColor:
    AppColors.darkBackground,

    cardColor:
    AppColors.darkCard,

    dividerColor:
    AppColors.darkDivider,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkTextSecondary,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCard,

      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(15),
      ),
    ),
  );
}