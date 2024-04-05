import 'package:flutter/material.dart';
import 'package:prueba_evertec/core/config/config.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        ///* General
        colorSchemeSeed: colorLightGrayF2,

        //* Text
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 14),
        ),
      );
}
