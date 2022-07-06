// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smr/home_screen.dart';
import 'package:smr/login_screen.dart';
class SplashScreen extends StatefulWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splashIconSize: 1000,
    duration:1500,
splash: Container(child: Lottie.asset('assets/splashscreen.json')),        
        // ignore: prefer_const_constructors
        nextScreen: Loginscreen(),
        //splashTransition: SplashTransition.rotationTransition,
        //pageTransitionType: PageTransitionType.scale,
      
    );
  
  }
}
