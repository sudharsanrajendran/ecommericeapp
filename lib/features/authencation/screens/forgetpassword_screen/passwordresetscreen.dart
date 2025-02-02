import 'package:ecommericeapp/features/authencation/screens/Loginscreen.dart';
import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:ecommericeapp/utils/constants/const_texts.dart';
import 'package:ecommericeapp/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class password_reset_screen extends StatefulWidget {
  const password_reset_screen({super.key});

  @override
  State<password_reset_screen> createState() => _password_reset_screenState();
}

class _password_reset_screenState extends State<password_reset_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon:Icon(Icons.cancel))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsize.defaultspace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    width: Thelper.screenwidth()*0.8,
                    height: Thelper.screenhight()*0.4,
                    child: Image(image: AssetImage(Timages.saamy_verification),)),
              ),
              Text(const_text.changeYourpasswordtitle,style:Theme.of(context).textTheme.headlineMedium,),

              SizedBox(height: Tsize.spacebtwsections,),
              Text(const_text.chnageyourpasswordsubtitle,style:Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: Tsize.spacebtwsections,),
              SizedBox(
                  width:double.infinity,
                  child: ElevatedButton(onPressed: ()=>Get.to(()=>Loginscreen()), child:Text('Done'))),

              SizedBox(height: Tsize.spacebtwsections,),

              Text(const_text.resendeamil,style: Theme.of(context).textTheme.bodyMedium,)

            ],

          ),
        ),
      ),
    );
  }
}
