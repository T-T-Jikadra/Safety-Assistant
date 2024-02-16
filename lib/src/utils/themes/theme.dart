import 'package:flutter/material.dart';
import 'package:fff/src/utils/themes/widget_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // ignore: non_constant_identifier_names
  static ThemeData LightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom())
  );

  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme
  );


}
