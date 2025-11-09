import 'package:flutter/material.dart';
import 'package:skillsync/screens/HomeScreen.dart';
// import 'package:skillsync/screens/HomeScreen.dart';

import 'package:skillsync/screens/login_screen.dart';
import 'package:skillsync/screens/signup_screen.dart';
import 'package:skillsync/screens/dashboard.dart';
import 'package:skillsync/screens/Profile.dart';
// import 'package:skillsync/screen/NotFoundScreen.dart';
void main(){
  
  runApp(const SkillSync());
}


class SkillSync extends StatelessWidget{
  const SkillSync({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login' : (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => Profile()

      },

      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => NotFoundScreen());
      // },
    );
  }
}
