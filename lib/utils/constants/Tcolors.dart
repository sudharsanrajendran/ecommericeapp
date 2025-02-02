
import 'package:flutter/cupertino.dart';

class Tcolors{
  Tcolors._();
  //gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
      Color(0xFFDA9E9E),
      Color(0xFFF8C3C3),
  Color(0xFFEFD2D2),

      ]);


  //appbar
  static const Color appbar_primary=Color(0xFF4B68FF);
  static const Color appbar_secondary=Color(0xFFFFE74B);
  static const Color appbar_accent=Color(0xFFB2D9F8);

//text
  static const Color text_primary=Color(0xFF000000);
  static const Color text_secondary=Color(0x5FFFFFFF);
  static const Color text_accent=Color(0xE5FFFFFF);

//background
  static const Color background_primary=Color(0xFFFFFFFF);
  static const Color background_secondary=Color(0x00ffffff);
  static const Color background_accent=Color(0xFFFFFFFF);
//container
  static const Color light=Color(0xFAFFFFFF);
  static const Color dark=Color(0x00ffffff);

//button
  static const Color button_primary=Color(0xFF4B68FF);
  static const Color button_secondary=Color(0x5FFFFFFF);
  static const Color button_accent=Color(0xA9FFFFFF);
//border
  static const Color border_secondary=Color(0xFFFFFFFF);
  static const Color border_accent=Color(0xFFFFFFFF);


  //error
  static const Color error=Color(0xFFFF4B4B);
  static const Color succss=Color(0xFF5DFF4B);
  static const Color warning=Color(0xFFFFA54B);
  static const Color info=Color(0xAB4BB4FF);
  //neutral shades
  static const Color black=Color(0x00ffffff);
  static const Color darkergray=Color(0x5FFFFFFF);
  static const Color darkgray=Color(0x2DFFFFFF);
  static const Color grey=Color(0xFFFFFFFF);
  static const Color softgrey=Color(0xFF9C9B9B);
  static const Color lightgray=Color(0xE5FFFFFF);
  static const Color white=Color(0xFFFFFFFF);

}