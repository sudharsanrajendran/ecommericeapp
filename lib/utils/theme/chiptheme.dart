import 'package:flutter/material.dart';

class chiptheme{
  chiptheme._();
  static ChipThemeData lightchiptheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: Colors.white
  );
  static ChipThemeData darkchiptheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: TextStyle(color: Colors.black),
      selectedColor: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      checkmarkColor: Colors.white
  );
}