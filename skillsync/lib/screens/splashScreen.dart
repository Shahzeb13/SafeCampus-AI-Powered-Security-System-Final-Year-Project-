import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget{
    const Splashscreen({super.key});


    State<Splashscreen> createState() => _SplashScreenState();


}



class _SplashScreenState extends State<Splashscreen>{


@override
  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
          
          
          child: Container(
           width: double.infinity,


           decoration: BoxDecoration(
            gradient: LinearGradient(
              // colors: [Colors.red, Colors.white],
              colors: [Colors.red, Colors.pinkAccent, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
    //           begin: Alignment.topLeft,
    // end: Alignment.bottomRight,
            )
           )
          ,
            // color: Colors.blue,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width:100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:Colors.white,
                    // borderRadius: BorderRadius.circular(20)
                  ),
                  child: Icon(
                     Icons.shield,
                     color: Colors.red,
                     size: 50
                  ) ,
                ) ,

                SizedBox(height:10),
                Padding(padding: EdgeInsets.all(5) ,
                child: 
                Text("SafeCampus" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25 , color:Colors.white),)
                )
                ,
                 Padding(padding: EdgeInsets.all(2) ,
                child: 
                Text("Your Safety , Our Priority" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12 , color: Colors.white),)
                )
              ],




            ),
          )
        
        
        
        )



    );

  }



}