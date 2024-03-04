import 'package:fff/Utils/themes/widget_theme/appbar_theme.dart';
import 'package:fff/Utils/themes/widget_theme/bottom_sheet_theme.dart';
import 'package:fff/Utils/themes/widget_theme/checkbox_theme.dart';
import 'package:fff/Utils/themes/widget_theme/elevated_button_theme.dart';
import 'package:fff/Utils/themes/widget_theme/outlined_buttom_theme.dart';
import 'package:fff/Utils/themes/widget_theme/text_field_theme.dart';
import 'package:fff/Utils/themes/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    // textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    scaffoldBackgroundColor: Colors.white,
    //chipTheme: TChipTheme.lightChipTheme
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    // textButtonTheme: TTextButtonTheme.darkTextButtonTheme
    //chipTheme: TChipTheme.darkChipTheme
  );
}
