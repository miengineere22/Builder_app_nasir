import 'package:flutter/material.dart';

class MyDrawar extends StatefulWidget {
  @override
  State<MyDrawar> createState() => _MyDrawarState();
}

class _MyDrawarState extends State<MyDrawar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),

                accountName: Text(
                  "Abdul Nasir",
                  style: TextStyle(fontSize: 20),
                ),
                accountEmail: Text("abdulnasiricp@gmail.com"),
                currentAccountPictureSize: Size.square(60),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Image.asset(
                    "Assets/Images/nasir pic.jpeg",
                    // width: 250,
                  ),
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(' Home '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(' Favorites '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text(' Messages '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add_rounded),
              title: const Text(' posted projects '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Deawer
    );
  }
}
