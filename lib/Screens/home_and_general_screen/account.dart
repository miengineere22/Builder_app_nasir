import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Screens/chats_screens/chats.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Screens/home_and_general_screen/contractor_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: <Widget>[
            // Expanded(
            //   child: FirebaseAnimatedList(
            //     // query: userRef.child('User List'),
            //     // .get(where("uid", isEqualTo: _auth._auth.currectUser)),
            //     // defaultChild: const Text('Loading'),
            //     itemBuilder: (BuildContext context, DataSnapshot snapshot,
            //         Animation<double> animation, index) {
            //       return Container(
            //         height: 200,
            //         decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //             colors: [
            //               Colors.deepPurpleAccent,
            //               Colors.deepPurple.shade300
            //             ],
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             stops: [0.5, 0.9],
            //           ),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: <Widget>[
            //                 CircleAvatar(
            //                   backgroundColor: Colors.white70,
            //                   minRadius: 60.0,
            //                   child: CircleAvatar(
            //                     radius: 50.0,
            //                     backgroundImage:
            //                         AssetImage('Assets/Images/nasir pic.jpeg'),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(
            //               snapshot.child('_uName').value.toString(),
            //               style: TextStyle(
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             Text(
            //               snapshot.child('_uWorkTitle').value.toString(),
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
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
                    leading: const Icon(Icons.home),
                    title: const Text(' Home '),
                    onTap: () {
                      Get.to(BottomNavigationBarScreen());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(' Favorites '),
                    onTap: () {
                      Get.to(BottomNavigationBarScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text(' Messages '),
                    onTap: () {
                      Get.to(Chat());
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
                        // _auth.signOut().then((value) {}
                        // Get.to(SignIn());
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
