// import 'package:buildapp/Screens/home.dart';
// import 'dart:ffi';
import 'package:buildapp/Services/splash_services.dart';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  SplashServices launchScreen = SplashServices();
  @override
  void initState() {
    launchScreen.islogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image(
        image: AssetImage('Assets/Images/splash.png'),
      )),
    );
  }
}
