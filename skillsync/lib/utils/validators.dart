String? validateEmail(String? value){
  print('📧 Flutter automatically called validateEmail with: "$value"');
  if(value == null || value.isEmpty){
    return "Please Enter your Email";
  }
  if(!value.contains("@")){
    return "Please Enter a valid Email";
  }
}


String? validatePassword(String? value){
  print('🔒 Flutter automatically called validatePassword with: "$value"');
  if(value == null  || value.isEmpty){
    return "Please Enter your password";
  }
  if( value.length < 6){
    return "Password must be greater than 6 characters";
  }
  return  null;
}

