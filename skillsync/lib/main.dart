import 'package:flutter/material.dart';
import 'package:skillsync/screens/login_screen.dart';
void main(){
  runApp(const SkillSync());
}


class SkillSync extends StatelessWidget{
  const SkillSync({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : LoginScreen(),
    );
  }
}