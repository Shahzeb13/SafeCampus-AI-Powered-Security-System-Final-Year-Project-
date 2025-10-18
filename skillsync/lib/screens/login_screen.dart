// 1. Define Requirements:
//    - Email/Password fields
//    - Login button
//    - Validation rules
//    - Error handling
//    - Navigation flow

// 2. Choose Architecture:
//    - StatefulWidget for form state
//    - GlobalKey<FormState> for form validation
//    - TextEditingController for input handling

import "package:flutter/material.dart";



class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
  bool debugShowCheckedModeBanner = false;

}


class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context){
    return Scaffold(

     body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F2027), // deep navy
            Color(0xFF2C5364), // steel blue
            Color(0xFF00C9FF), // cyber blue
            Color(0xFF232526), // dark gray
          ],
          stops: [0.0, 0.5, 0.8, 1.0],
        ),
      ),
       child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F2027), // deep navy
                  Color(0xFF2C5364), // steel blue
                  Color(0xFF00C9FF), // cyber blue
                  Color(0xFF232526), // dark gray
                ],
                stops: [0.0, 0.5, 0.8, 1.0],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2C5364),
                  blurRadius: 14.0,
                  offset: Offset(4, 4)
                )
              ],
            ),
            
            // color: Colors.yellow[100],
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(60),
            // decoration: BoxDecoration(
            //   color: const Color.fromARGB(83, 179, 229, 252)!,
            //   borderRadius: BorderRadius.circular(20),
            //   boxShadow: [
            //     BoxShadow(
            //       color: const Color.fromARGB(120, 59, 46, 87),
            //       blurRadius: 14.0,
            //       offset: Offset(4, 4)
            //     )
            //   ]
            // ),
            child: Column(
              
            mainAxisAlignment : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
              
             children: [
              SizedBox(height:90),
              Container(
                child: Column(
                  children: [
                    Text("Welcome Back" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29 , color: Colors.white)),
                    SizedBox(height: 5,),
                    Text("Sign in to continue to your account" , style: TextStyle(fontSize: 13 , color: Colors.grey)),
              ]
              )
                  
              ),
              

              SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(
                  // labelText: "Email",
                  hintText: "you@example.com", 
                  prefixIcon: Icon(Icons.email),
                  border:OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password)
                ),
              ),
              SizedBox(height: 40,),
               Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('SIGN IN'),
                    ),
                 

               )
               ,
               SizedBox(height: 10,)
               ,
               Container(
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account!")
                    ,
                      SizedBox(width: 5,),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          print("Sign up button clicked");
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    )
                  ],
              
                )
               )



              ],
             

          
          )
        )
       )
        
       )
     ),
    );
  }
}





//  body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.lightBlue,
//             padding: EdgeInsets.all(100),
//             // height: MediaQuery.of(context).size.height,
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child:Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children  : [
//                 Container(
//                     color: Colors.blue[100],
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       'Welcome to Your App!',
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center, // 🎯 Centers text inside container
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     color: Colors.green[100],
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       'You are now a Flutter Padawan!',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//               ]
//             )
//           ),
//         ),