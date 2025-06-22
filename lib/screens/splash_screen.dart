import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      type: Transition.fade,
      curve:Curves.fastLinearToSlowEaseIn,
      navigator:const HomeScreen(),
      durationInSeconds:2,
      child:Text("Your Splash"),
    );
  }
}
