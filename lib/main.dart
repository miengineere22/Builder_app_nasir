import 'dart:io';
import 'package:buildapp/splash.dart';
import 'package:firebase_core/firebase_core.dart';
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

          // MyBids(),

          // CreateBids(),

          // ProfileScreen(),
          // SignUp(),
          // BottomNavigationBarScreen(),
          // LoginScreen(),
          // ForgotPass(),
          // HomeScreen(),

          LaunchScreen(),
    );
  }
}
