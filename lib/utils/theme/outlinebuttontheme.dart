import 'package:flutter/material.dart';

class outlinebuttontheme{
  outlinebuttontheme._();
  static final lightoutlinebutton=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.black),
      textStyle: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );
  static final DARKoutlinebutton=OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white),
          textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
      )
  );
}