import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Tdevices{

  static double getappbarheight(){
    return kToolbarHeight;
  }
  static void  hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  static Future<void>setStatusbarcolor(Color color )async{
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color)
    );
  }



  static bool islandscapeorientaion(BuildContext context){
    final viewinsets= View.of(context).viewInsets;
    return viewinsets.bottom==0;
  }

  static bool isPortraitOrientaion(BuildContext context){
    final viewinsets= View.of(context).viewInsets;
    return viewinsets.bottom!=0;
  }
  static void setfullscreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable?SystemUiMode.immersiveSticky:SystemUiMode.edgeToEdge);
  }
  static double getscreenhight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double getPixelRatio(){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }
  static double getStatusBarheight(){
    return MediaQuery.of(Get.context!).padding.top;
  }
  static double getbottomnavigationbarheight(){
    return kToolbarHeight;
  }

  static Future<bool>iskeyboardvisible()async{
    final viewinsets= View.of(Get.context!).viewInsets;
    return viewinsets.bottom>0;
  }


  static double getboardhight(){
    final viewinsets= MediaQuery.of(Get.context!).viewInsets;
    return viewinsets.bottom;
  }
  static Future<bool>isphysicaldevice()async{
    return defaultTargetPlatform==TargetPlatform.android||defaultTargetPlatform==TargetPlatform.iOS;
  }
  static void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration,()=>HapticFeedback.vibrate());
  }
  static Future<void>setpreferredorientaion(List<DeviceOrientation>orientation)async{
    await SystemChrome.setPreferredOrientations(orientation);
  }
  static void showStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }
  static Future<bool>hasInternatconnection()async{
    try{
      final result = await InternetAddress.lookup('example.com');
      return result.isEmpty&&result[0].rawAddress.isNotEmpty;
    }on SocketException catch(_){
      return false;
    }
  }
  static bool isIos(){
    return Platform.isIOS;
  }
  static bool isanroid(){
    return Platform.isAndroid;
  }
  static void laucnhUrl(String url) async{
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }else
      {
        throw 'Could not launch $url';
      }
  }



}