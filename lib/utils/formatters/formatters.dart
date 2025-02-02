import 'package:intl/intl.dart';

class Tformatter{
  static String formatDate(DateTime?date){
    date??=DateTime.now();
    return DateFormat('dd-mmm-yyyy').format(date);
  }

  static String formatchurrency(double amount){
    return NumberFormat.currency(locale: 'en-US',symbol: '\$').format(amount);
  }
  static String formatphonenumber(String phonenumber){
    if(phonenumber.length==10){
      return'(${phonenumber.substring(0,3)}) ${phonenumber.substring(3,6)} ${phonenumber.substring(6)}';
    }else if(phonenumber.length==11){
      return  '(${phonenumber.substring(0,4)}) ${phonenumber.substring(4,7)} ${phonenumber.substring(7)}';
    }
    return phonenumber;
  }
}