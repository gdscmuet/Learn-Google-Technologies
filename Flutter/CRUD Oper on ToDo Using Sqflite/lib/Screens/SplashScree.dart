import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool check=true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
        splash: Center(
          child: Container(
            //width: 100,
           // height: 100,
            child: Image.asset('assets/agile.png',
            height: 500,
            width: 500,
            //scale: 300,
            ),
            
            ),       
            ),
        nextScreen:Homepage(),
          ),
        ),
        
        
       
      );
    
  }
}