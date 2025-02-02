import 'package:ecommericeapp/comman/styles/space_style.dart';
import 'package:ecommericeapp/features/authencation/screens/Siginscreen.dart';
import 'package:ecommericeapp/utils/constants/Tcolors.dart';
import 'package:ecommericeapp/utils/constants/const_texts.dart';
import 'package:ecommericeapp/utils/constants/images.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../bottom_navigation_bar.dart';
import '../../../utils/constants/Tsize.dart';
import 'forgetpassword_screen/forgerpasswordscreen.dart';
class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: tspace_style.paddingwithappbarheight,
        child: Column(
          children: [
            Column(
              //header
              children: [
                Image(
                    height:150,
        image: AssetImage(dark?Timages.logo:Timages.logo)),
                Text(const_text.logintitle,style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(height:Tsize.sm,),
                Text(const_text.loginsubtitle,style: Theme.of(context).textTheme.bodyMedium,),

              ],
            ),
            SizedBox(height: 20,),

            Container(
              child: Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Tsize.spacebtwsections,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: const_text.email),
                    ),
                    const SizedBox(height: Tsize.spacebtwinputfields,),
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check),labelText: const_text.password,suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const SizedBox(height: Tsize.spacebtwinputfields,),
                    //rember me

                    Row(
                      children: [
                        Checkbox(value: true, onChanged:(value){
                        },),
                        Text(const_text.rememberme),
                        Spacer(),
                        GestureDetector(
                        onTap: ()=>Get.to(()=>forgetpasswordscreen()),child: Text(const_text.forgetpassword))




                      ],
                    ),
                    SizedBox(
                        width:double.infinity,
                        child: ElevatedButton(onPressed: ()=>Get.off(()=>BottomNav()), child:Text(const_text.sigin))),
                    const SizedBox(height: Tsize.spacebrwitems),
                    SizedBox(
                        width:double.infinity,
                        child: OutlinedButton(onPressed: ()=>Get.to(()=>Siginscreen()), child:Text(const_text.CreatedAccount)))
                  ],

                ),
              )),
            ),
//divider
            Row(
              children: [
                Flexible(child: Divider(color: dark?Tcolors.darkgray:Tcolors.black,thickness: 0.5,indent: 60,endIndent: 5,))
              ,Text(const_text.orsiginupwith.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
                Flexible(child: Divider(color: dark?Tcolors.darkgray:Tcolors.grey,thickness: 0.5,indent: 5,endIndent: 60,))
              ],
            ),
            //siginoptions

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Tcolors.grey),borderRadius: BorderRadius.circular(100)),
                  child: IconButton(onPressed: (){}, icon:CircleAvatar(backgroundImage:AssetImage(Timages.googleicon),)),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Tcolors.grey),borderRadius: BorderRadius.circular(100)),
                  child: IconButton(onPressed: (){}, icon:CircleAvatar(backgroundImage:AssetImage(Timages.facbookicon),)),
                )
              ],
            )


          ],
        ),),
      ),
    );
  }
}
