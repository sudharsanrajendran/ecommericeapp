import 'package:ecommericeapp/features/authencation/screens/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/Tsize.dart';
import '../../../../utils/constants/const_texts.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/helper_functions.dart';
class succssfullycreated_screen extends StatefulWidget {
  const succssfullycreated_screen({super.key});

  @override
  State<succssfullycreated_screen> createState() => _succssfullycreated_screenState();
}

class _succssfullycreated_screenState extends State<succssfullycreated_screen> {
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
                    child: Image(image: AssetImage(Timages.saamy_accreated),)),
              ),
              Text(const_text.youraccontcreated,style:Theme.of(context).textTheme.headlineMedium,),

              SizedBox(height: Tsize.spacebtwsections,),
              Text(const_text.youraccontcreatedsubtitle,style:Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: Tsize.spacebtwsections,),
              SizedBox(
                  width:double.infinity,
                  child: ElevatedButton(onPressed: ()=>Get.to(()=>Loginscreen()), child:Text('continue'))),

              SizedBox(height: Tsize.spacebtwsections,),



            ],

          ),
        ),
      ),
    );
  }
}
