import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileAccount extends StatefulWidget {
  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  final user = FirebaseAuth.instance.currentUser!;

  Map map = {};

  @override
  void didChangeDependencies() async {
    await getData();

    // await FirebaseDatabase.instance
    //     .reference()
    //     .child("Users")
    //     .child(user.uid.toString())
    //     .get()
    //     .then((value) {
    //   // log(value.value.toString());
    //   setState(() {
    //     map = value.value as Map;
    //   });

    //   // log(map["_uName"]);
    // });

    super.didChangeDependencies();
  }

  getData() async {
    try {
      log(FirebaseAuth.instance.currentUser!.uid.toString());

      print(FirebaseAuth.instance.currentUser!.uid.toString());

      await FirebaseFirestore.instance
          .collection("User Detial")
          .doc(user.uid)
          .get()
          .then((value) {
        log("=--------------------->>>>>");

        setState(() {
          map = value.data() as Map<String, dynamic>;
        });
        log(value.data().toString());
      });
    } catch (e) {
      log("error in getData");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(''),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(map["_uImage"] ?? ""),

                        // 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  map["_uName"] ?? "",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  map["_uWorkTitle"] ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    map["_uEmail"] ?? "",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    map["_uPhone"] ?? "",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    map["_uHome"] ?? "",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
