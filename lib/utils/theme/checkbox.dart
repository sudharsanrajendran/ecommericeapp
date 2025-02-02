import 'package:flutter/material.dart';

class checkboxtheme{
  checkboxtheme._();
  static CheckboxThemeData checkboxlightmode= CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),


  );
  static CheckboxThemeData checkboxdarkmode= CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  checkColor: WidgetStateProperty.resolveWith((states){
  if(states.contains(WidgetState.selected)){
  return Colors.white;
  }else{
  return Colors.black;
  }
  }),
  fillColor: WidgetStateProperty.resolveWith((states){
  if(states.contains(WidgetState.selected)){
  return Colors.blue;
  }else{
  return Colors.transparent;
  }
  }));
}