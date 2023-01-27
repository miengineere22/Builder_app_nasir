import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Screens/home_and_general_screen/Account/about_developer.dart';
import 'package:buildapp/Screens/home_and_general_screen/Account/contractor_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(' My Profile '),
                    onTap: () async {
                      Get.to(ProfileAccount());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user_outlined),
                    title: Text(' About Developer '),
                    onTap: () {
                      Get.to(AboutPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text(' Rate us '),
                    onTap: () {
                      // Get.to(Favorites());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text(' Share With friends '),
                    onTap: () {
                      Share.share('com.example.buildapp');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.light_mode),
                    title: const Text(' Light Mode '),
                    onTap: () {
                      Get.changeTheme(ThemeData.light());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text(' Dark Mode '),
                    onTap: () {
                      Get.changeTheme(ThemeData.dark());
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('LogOut'),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut().then((value) {
                          Get.offAll(() => SignIn());
                        });
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
