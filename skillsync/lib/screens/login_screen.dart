
import "package:flutter/material.dart";
import 'package:skillsync/screens/dashboard.dart';
import 'package:skillsync/screens/signup_screen.dart';
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
        Navigator.pushNamed(context, '/dashboard');

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

          // Login Form
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.login, color: Color(0xFF2193b0), size: 70),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome Back to SafeCampus",
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
                              hintText: "you@example.com",
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
                              hintText: "Enter your Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Login Button using InkWell
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
                                "SIGN IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Signup Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an Account! ",
                                style: TextStyle(color: Colors.black)),
                            GestureDetector(
                              onTap: () {
                                print("Sign up button clicked");
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                "Sign up",
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
