import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(shape: StadiumBorder(),padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16))
      )
    );
  }
}
