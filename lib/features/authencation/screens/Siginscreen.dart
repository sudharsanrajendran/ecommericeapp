import 'package:ecommericeapp/features/authencation/screens/varification_screens/email_verification_screen.dart';
import 'package:ecommericeapp/utils/constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/Tcolors.dart';
import '../../../utils/constants/Tsize.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/helpers/helper_functions.dart';
class Siginscreen extends StatefulWidget {
  const Siginscreen({super.key});

  @override
  State<Siginscreen> createState() => _SiginscreenState();
}

class _SiginscreenState extends State<Siginscreen> {
  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsize.defaultspace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(const_text.siguptitle,style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: Tsize.spacebtwsections,),
              Form(child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child:   TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.personalcard),labelText: const_text.firstname),
                      ),),
                      SizedBox(width:  Tsize.spacebrwitems,),
                      Expanded(child:   TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.personalcard),labelText: const_text.lastname),
                      ),)
                    ],
                  ),
                  SizedBox(height: Tsize.spacebtwsections,),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: const_text.username),
                  ),
                  SizedBox(height: Tsize.spacebtwsections,),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct),labelText: const_text.email),
                  ),
                  SizedBox(height: Tsize.spacebtwsections,),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call),labelText: const_text.phonenumber),
                  ),
                  SizedBox(height: Tsize.spacebtwsections,),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check),labelText: const_text.password),
                  ),

                ],

              )),
              SizedBox(height: Tsize.spacebtwsections,),
              Row(
                children: [
                  Checkbox(value: true, onChanged:(value){

                  },),
                  Text.rich(TextSpan(
                    children:
                      [
                        TextSpan(text: const_text.isagreeto,style: Theme.of(context).textTheme.bodySmall),

                     TextSpan(text: const_text.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                       color: dark?Tcolors.white:Colors.blue,
                       decoration: TextDecoration.underline,
                       decorationColor:dark?Tcolors.white:Tcolors.text_primary

                     )),
                        TextSpan(text:'and ',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: const_text.termsofuse ,style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark?Tcolors.white:Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor:dark?Tcolors.white:Tcolors.text_primary

                        )),
                      ]
                  ))
                ],
              ),
              SizedBox(height: Tsize.spacebtwsections,),
              SizedBox(
                  width:double.infinity,
                  child: ElevatedButton(onPressed: ()=>Get.to(()=>emailverification_screen()), child:Text(const_text.CreatedAccount))),
              const SizedBox(height: Tsize.spacebtwsections),



              Row(
                children: [
                  Flexible(child: Divider(color: dark?Tcolors.darkgray:Tcolors.black,thickness: 0.5,indent: 60,endIndent: 5,))
                  ,Text(const_text.orsiginupwith.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
                  Flexible(child: Divider(color: dark?Tcolors.darkgray:Tcolors.grey,thickness: 0.5,indent: 5,endIndent: 60,))
                ],
              ),
              //siginoptions
              SizedBox(height: Tsize.spacebtwsections,),

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

          ),
        ),
      ),
    );
  }
}
