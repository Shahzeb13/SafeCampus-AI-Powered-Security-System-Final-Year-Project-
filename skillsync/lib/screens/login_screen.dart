
import "package:flutter/material.dart";
import 'package:skillsync/utils/validators.dart';


class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
  bool debugShowCheckedModeBanner = false;

}


class _LoginScreenState extends State<LoginScreen> {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController  = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


    void submitForm(){

      if(_formKey.currentState!.validate()){
        print("All validatons Passed .");

        String email = _emailController.text;
        String password = _passwordController.text;

        print("Email  :  $email" );
        print("Password  $password");


      }
      else{
        print("Validation Failed!!");
      }
    }

    

  void despose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
    }


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
        child: Center(
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
            constraints: BoxConstraints(maxWidth: 400),
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(45),
            margin: EdgeInsets.all(20),
           
          

            child: Form(
              key: _formKey,
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
                controller: _emailController,
                validator: validateEmail,
                decoration: InputDecoration(
                  // labelText: "Email",
                  hintText: "you@example.com", 
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                controller: _passwordController,
                validator: validatePassword,
                obscureText: true,
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
                      onPressed:submitForm,
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
    )
    );
  }
}