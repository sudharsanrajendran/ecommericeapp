import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../features/authencation/screens/Loginscreen.dart';

class onboradingcontroller extends GetxController{
  static onboradingcontroller get instance=>Get.find();
//varibles,
  final pagecontroller = PageController();
  Rx<int>currentpageIndex=0.obs;
//update current index when page scroll
void updatePageindicator(index)=>currentpageIndex.value=index;


//jump to the specific dot selected page
void dotnavgitaionclick(index)
{
currentpageIndex.value=index;
pagecontroller.jumpTo(index);

}
void nextpage(){
  if(currentpageIndex.value==2){
    Get.to(Loginscreen());
  }else{
    int page=currentpageIndex.value=1;
    pagecontroller.jumpToPage(page);
  }

}
void skippage(){
  currentpageIndex.value=2;
  pagecontroller.jumpToPage(2);

}
}