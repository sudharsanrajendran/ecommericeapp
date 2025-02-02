import 'package:ecommericeapp/utils/theme/Textheme.dart';
import 'package:ecommericeapp/utils/theme/bottomsheettheme.dart';
import 'package:ecommericeapp/utils/theme/buttontheme.dart';
import 'package:ecommericeapp/utils/theme/chiptheme.dart';
import 'package:ecommericeapp/utils/theme/outlinebuttontheme.dart';
import 'package:ecommericeapp/utils/theme/textfield.dart';
import 'package:flutter/material.dart';

class light_dark_theme{
  light_dark_theme._();
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    textTheme: tTexttheme.textlighttheme,
    chipTheme: chiptheme.lightchiptheme,
bottomSheetTheme: bottomsheettheme.bottomsheetlightmode,
    elevatedButtonTheme: buttons.buttonlightmode,
    outlinedButtonTheme: outlinebuttontheme.lightoutlinebutton,
    inputDecorationTheme: textfieldtheme.lightinputdecoration,
  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: tTexttheme.textdarktheme,
    chipTheme: chiptheme.darkchiptheme,
    bottomSheetTheme: bottomsheettheme.bottomsheetdarktmode,
    elevatedButtonTheme: buttons.buttondarkmode,
    outlinedButtonTheme: outlinebuttontheme.DARKoutlinebutton,
    inputDecorationTheme: textfieldtheme.darkinputdecoration,
  );
}