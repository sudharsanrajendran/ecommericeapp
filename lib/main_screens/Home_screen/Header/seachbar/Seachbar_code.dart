import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';
class seachbar extends StatelessWidget {
  const seachbar({super.key, this.hint_text, this.seachcontroller, this.color});
final hint_text;
final  seachcontroller;
final color;
  @override
  Widget build(BuildContext context) {

    final dark = Thelper.isdarkmode(context);
    return Padding(
      padding: const EdgeInsets.all(Tsize.defaultspace-20),
      child: TextFormField(
        controller: seachcontroller,
        decoration: InputDecoration(
          hintText:hint_text,
          filled: true,
          fillColor: color,
     prefixIcon: Icon(Icons.search),
          prefixIconColor:dark?Colors.white:Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

          )
        ),
      ),
    );
  }
}
