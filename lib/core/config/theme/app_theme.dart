import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/config/config.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  TextTheme textTheme = const TextTheme(
    titleLarge:
        TextStyle(color: colorBlack, fontSize: 36, fontWeight: FontWeight.bold),
    titleMedium:
        TextStyle(color: colorBlack, fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(color: colorBlack, fontSize: 20),
    bodyLarge: TextStyle(color: colorBlack, fontSize: 18),
    bodyMedium: TextStyle(color: colorBlack, fontSize: 16),
    bodySmall: TextStyle(color: colorBlack, fontSize: 14),
  );

  TextTheme textThemeDark = const TextTheme(
    titleLarge:
        TextStyle(color: colorWhite, fontSize: 36, fontWeight: FontWeight.bold),
    titleMedium:
        TextStyle(color: colorWhite, fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(color: colorWhite, fontSize: 20),
    bodyLarge: TextStyle(color: colorWhite, fontSize: 18),
    bodyMedium: TextStyle(color: colorWhite, fontSize: 16),
    bodySmall: TextStyle(color: colorWhite, fontSize: 14),
  );

  ThemeData getTheme() => ThemeData.light().copyWith(textTheme: textTheme);

  ThemeData getThemeDark() =>
      ThemeData.dark().copyWith(textTheme: textThemeDark);

  ThemeData currentTheme() => isDarkMode ? getThemeDark() : getTheme();

  AppTheme copyWith({
    bool? isDarkMode,
  }) =>
      AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  Future<void> toggleDarkMode(bool value) async {
    state = state.copyWith(isDarkMode: value);
  }
}

final StateNotifierProvider<ThemeNotifier, AppTheme> themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());
