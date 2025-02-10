import 'package:ecommericeapp/bottom_navigation_bar.dart';
import 'package:ecommericeapp/controllers/onboardingcontroller.dart';
import 'package:ecommericeapp/utils/constants/Tcolors.dart';
import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:ecommericeapp/utils/constants/const_texts.dart';
import 'package:ecommericeapp/utils/constants/images.dart';
import 'package:ecommericeapp/utils/devies/devies_utility.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class startscreen extends StatefulWidget {
  const startscreen({super.key});

  @override
  State<startscreen> createState() => _startscreenState();
}

class _startscreenState extends State<startscreen> {
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(onboradingcontroller());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageindicator,
            children: [
              onboradringscreen1(image: Timages.sammy_seach, title1: const_text.onboradingtitle1, title2: const_text.subonboradingtitle1),
              onboradringscreen1(image: Timages.sammy_develivery, title1: const_text.onboradingtitle2, title2: const_text.subonboradingtitle2),
              onboradringscreen1(image: Timages.sammy_shopping, title1: const_text.onboradingtitle3, title2: const_text.subonboradingtitle3)
            ],
          ),
          skipwiget(),
          onboardingsmoth_indicator(),
          iconsbutton()
        ],
      ),
    );
  }
}

class iconsbutton extends StatelessWidget {
  const iconsbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);
    return Positioned(

        right: Tsize.defaultspace,bottom: Tdevices.getbottomnavigationbarheight(),child:IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNav()));

    },style:IconButton.styleFrom(shape:CircleBorder(),backgroundColor:dark?Tcolors.background_primary:Colors.black ), icon: Icon(Icons.arrow_forward_ios_sharp,color:dark?Colors.black:Tcolors.background_primary,)));
  }
}

class onboardingsmoth_indicator extends StatelessWidget {
  const onboardingsmoth_indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =onboradingcontroller.instance;
    final dark = Thelper.isdarkmode(context);
    return Positioned(

        bottom: Tdevices.getbottomnavigationbarheight()+25,
        left: Tsize.defaultspace,
        child: SmoothPageIndicator(controller: controller.pagecontroller,
          onDotClicked: controller.dotnavgitaionclick,
          count: 3,effect:ExpandingDotsEffect(activeDotColor: dark?Tcolors.light:Colors.black,dotHeight: 6),));
  }
}

class skipwiget extends StatelessWidget {
  const skipwiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Positioned(top:Tdevices.getappbarheight(),right:Tsize.defaultspace,child: TextButton(onPressed: ()=>onboradingcontroller.instance.skippage(), child: Text('Skip',style:Theme.of(context).textTheme.titleSmall,)));
  }
}
class onboradringscreen1 extends StatelessWidget {
  const onboradringscreen1({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
  });

  final dynamic image;
  final dynamic title1;
  final dynamic title2;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Column(
          children: [
            Image(
                width: Thelper.screenwidth()*0.8,
                height: Thelper.screenhight()*0.6,
                image:AssetImage(image)),
            Text(title1,style: Theme.of(context).textTheme.headlineMedium,textAlign:TextAlign.center,),
            const SizedBox(height: Tsize.spacebrwitems,),
            Text(title2,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)
          ],
        )
      ],
    );
  }
}




