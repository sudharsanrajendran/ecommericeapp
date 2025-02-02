import 'package:flutter/cupertino.dart';

import '../../utils/constants/Tcolors.dart';

class tshawdowstyle{
  static final verticalproductshadow= BoxShadow(
    color: Tcolors.darkgray.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
  static final horizontalproductshadow= BoxShadow(
      color: Tcolors.darkgray.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}