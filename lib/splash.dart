// import 'package:buildapp/Screens/home.dart';
import 'dart:async';
// import 'dart:ffi';
import 'package:buildapp/Screens/auth/sign_in.dart';
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
  //method 1 splash screen
  // void initState() {
  //   super.initState();
  //   _navigatetohome();
  // }

  // _navigatetohome() async {
  //   await Future.delayed(
  //     const Duration(milliseconds: 9000),
  //     () {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => SignIn()));
  //     },
  //   );
  // }
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 4),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => SignIn())));
  // }

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
