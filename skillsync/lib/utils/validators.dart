String? validateEmail(String? value){
  print('📧 Flutter automatically called validateEmail with: "$value"');
  if(value == null || value.isEmpty){
    return "Please Enter your Email";
  }
  if(!value.contains("@")){
    return "Please Enter a valid Email";
  }
}

String? validateUsername(String? value) {
  print('👤 Flutter automatically called validateUsername with: "$value"');
  if (value == null || value.isEmpty) {
    return "Please enter your username";
  }
  if (value.length < 3) {
    return "Username must be at least 3 characters";
  }
  // Add any other username validation rules here (optional)
  return null;
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

