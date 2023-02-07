

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/app.dart';
 
void main(){
   runApp(
    MyApp()
   );
}class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
           splash: Image.asset("assets/images/l.png", height: 900, width:900 ,), nextScreen: AppScreen(),
        
            splashTransition: SplashTransition.fadeTransition,
        
           backgroundColor: Colors.black,
        duration: 3000,
        ),

    );
  }
}