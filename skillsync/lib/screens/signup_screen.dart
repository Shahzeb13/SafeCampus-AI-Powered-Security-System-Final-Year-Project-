import "package:flutter/material.dart";
import 'package:skillsync/utils/validators.dart';


class SignupScreen extends StatefulWidget{
  
  
  @override
  _SignupScreenState createState() => _SignupScreenState();
  bool debugShowCheckedModeBanner = false;
}



class _SignupScreenState extends State<SignupScreen>{


  @override
  Widget build(BuildContext  context){
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameControler = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
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

    return Scaffold(
      body: Stack(
        children: [
          // Top Circle Decoration
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Bottom Circle Decoration
          Positioned(
            bottom: -120,
            left: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Signup Form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Card(
                elevation: 10,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Icon(Icons.person_add, color: Color(0xFF2193b0), size: 70),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A3C6D),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Sign in to continue to your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 35),

                        // Username Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _usernameControler,
                            validator: validateUsername,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.people, color: Color(0xFF2193b0)),
                              hintText: "Username",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email_outlined, color: Color(0xFF2193b0)),
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            validator: validatePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock_outline, color: Color(0xFF2193b0)),
                              hintText: "Type Your Password Here",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Signup Button using InkWell
                        InkWell(
                          onTap: submitForm,
                          borderRadius: BorderRadius.circular(15),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: const Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already Have an Account!",
                            style: TextStyle(color: Colors.black),
                          
                          ),
                          SizedBox(width: 5,),


                        GestureDetector(
                          onTap: () {

                            print("Back To Login page");

                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color(0xFF2193b0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),



                        )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
