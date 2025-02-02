class Tvalidator{
  
  static String?validateEmail(String?value){
    if(value == null ||value.isEmpty){
      return 'Email is required';
    }


    final emailregExP=RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if(emailregExP.hasMatch(value)){
      return 'Invalid email address';
    }
    return null;
  }


static String ?validatepassword(String ?value){
  if(value == null ||value.isEmpty){
    return 'Password is required';
  }
  if(value.length<8){
    return 'Password must be higher then 8 Characters';
  }
  return null;
}

static String?validatePhonenumber(String ?value)
{
  if(value == null ||value.isEmpty){
    return 'phonenumber is required';
  }


  final emailregExP=RegExp(r'^\+?[1-9]\d{1,14}$');
  if(emailregExP.hasMatch(value)){
    return 'Invalid phone number format(10 digits required)';
  }
  return null;


}
}