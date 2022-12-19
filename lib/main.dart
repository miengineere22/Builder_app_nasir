import 'dart:io';
import 'package:buildapp/Screens/home_and_general_screen/Bids_full_detiles.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Screens/auth/sign_up.dart';
import 'package:buildapp/Screens/home_and_general_screen/profile.dart';
// import 'package:buildapp/decisions_tree.dart';
import 'package:buildapp/pages/LoginScreen.dart';
import 'package:buildapp/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCtjV7K1W6h8HLWctNp0HS39NVs8CjUm1E", // Your apiKey
    appId: "1:770415048808:android:6308802c549fb316d2a3dd", // Your appId
    messagingSenderId: "770415048808", // Your project number
    projectId: "build-app-b327a",
    databaseURL:
        "https://build-app-b327a-default-rtdb.firebaseio.com/", //your realtime database
    storageBucket: "gs://build-app-b327a.appspot.com", //your storage url
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Build App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:

          // ChatScreenPage(
          // title: 'ChatScreen', name: 'Nasir', profession: 'Developer'),
          // HomScreen(),
          // SignUp(),
          // SignIn(),
          // ContractorList(),
          // MyBids(),

          // Chat(),
          // CreateBids(),

          // ProfileScreen(),
          // SignUp(),
          //  MyDrawar(title: ""),
          // BottomNavigationBarScreen(),
          // DecisionsTree()
          // LoginScreen(),
          // ForgotPass(),
          // HomeScreen(),

          LaunchScreen(),
    );
  }
}
