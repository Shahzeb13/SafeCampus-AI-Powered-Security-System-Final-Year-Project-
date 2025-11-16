import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skillsync/screens/HomeScreen.dart';
// import 'package:skillsync/screens/HomeScreen.dart';

import 'package:skillsync/screens/login_screen.dart';
import 'package:skillsync/screens/signup_screen.dart';
import 'package:skillsync/screens/dashboard.dart';
import 'package:skillsync/screens/Profile.dart';
import 'package:skillsync/screens/splashScreen.dart';
// import 'package:skillsync/screen/NotFoundScreen.dart';
void main(){
  //  debugPaintSizeEnabled = true;
  runApp(const SkillSync());
}


class SkillSync extends StatelessWidget{
  const SkillSync({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Splashscreen(),
      routes: {
        '/home': (context) => Splashscreen(),
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
