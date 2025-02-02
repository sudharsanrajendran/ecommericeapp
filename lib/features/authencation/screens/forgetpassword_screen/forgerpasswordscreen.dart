import 'package:ecommericeapp/features/authencation/screens/forgetpassword_screen/passwordresetscreen.dart';
import 'package:ecommericeapp/utils/constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/Tsize.dart';
class forgetpasswordscreen extends StatefulWidget {
  const forgetpasswordscreen({super.key});

  @override
  State<forgetpasswordscreen> createState() => _forgetpasswordscreenState();
}

class _forgetpasswordscreenState extends State<forgetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: ()=>Get.back(), icon:Icon(Icons.cancel))
      ],
    ),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(Tsize.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(const_text.forgetpasswordtitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: Tsize.spacebtwsections,),
              Text(const_text.forgetpasswordsubtitle,style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: Tsize.spacebtwsections,),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: const_text.email),
              ),
              const SizedBox(height: Tsize.spacebtwsections,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=>Get.to(()=>password_reset_screen()), child: Text('submit')))
            ],
          ),
        ),
      ) ,
    );
  }
}
