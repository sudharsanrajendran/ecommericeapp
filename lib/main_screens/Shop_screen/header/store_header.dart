import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/Tsize.dart';
import '../../Home_screen/Header/seachbar/Seachbar_code.dart';
import 'brand_grid_view/brands_grid_view.dart';
class storeheader extends StatefulWidget {
  const storeheader({super.key});

  @override
  State<storeheader> createState() => _storeheaderState();
}

class _storeheaderState extends State<storeheader> {
  @override
  Widget build(BuildContext context) {
    final dark= Thelper.isdarkmode(context);
    return Padding(
      padding:const EdgeInsets.all(Tsize.defaultspace-20),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            seachbar(
               color: dark?Colors.grey:Colors.grey.withOpacity(0.2),
              hint_text:'Search..',
            ),
            SizedBox(height: 10,),
            SizedBox(
                child: Brands()),

        ],
      ),
      ),
    );
  }
}
