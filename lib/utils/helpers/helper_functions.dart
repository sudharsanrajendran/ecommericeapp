
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Thelper{
  static Color? getcolor(String value){
    if(value =='Green'){
      return Colors.green;
    }else if(value=='red'){
      return Colors.red;
    }else if(value=='blue'){
      return Colors.blue;
    }
    else if(value=='pink'){
      return Colors.pink;
    }
    else if(value=='grey'){
      return Colors.grey;
    }
    else if(value=='purple'){
      return Colors.purple;
    }
    else if(value=='black'){
      return Colors.black;
    }
    else if(value=='white'){
      return Colors.white;
    }else if(value=='brown'){
      return Colors.brown;
    }
    else if(value=='teal'){
      return Colors.teal;
    }
    else if(value=='indigo'){
      return Colors.indigo;
    }else
      {
        return null;
      }
  }




  static void showsnaclbar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message))
    );
  }




  static void showAlert(String title,String message)
  {
    showDialog(context: Get.context!, builder:(BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('Ok'))
        ],
      );
    });

  }

static void navigatetoscreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
}

static String truncateText(String text, int Maxlength){
    if(text.length <= Maxlength){
      return text;
    }else{
      return text.substring(0,Maxlength);
    }
}
static bool isdarkmode(BuildContext context){
    return Theme.of(context).brightness==Brightness.dark;
}
static Size screensize(){
    return MediaQuery.of(Get.context!).size;
}
  static double screenhight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double screenwidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

static String getformattedDate(DateTime date,{String format='dd-mm-yyyy'}){
    return DateFormat(format).format(date);
}

static List<T>removeduplicate<T>(List<T>list){
    return list.toSet().toList();
}

static List<Widget>wrapWidgets(List<Widget>widgets,int rowSize){
    final wrapperList =<Widget>[];
    for(var i=0;i<widgets.length;i+=rowSize){
      final rowChildren = widgets.sublist(i,i+rowSize>widgets.length?widgets.length:i+rowSize);
      wrapperList.add(Row(children:rowChildren));
    }return wrapperList;
}







}