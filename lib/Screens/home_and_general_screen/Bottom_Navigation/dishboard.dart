import 'dart:developer';

import 'package:buildapp/Screens/home_and_general_screen/Bottom_Navigation/detial_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final database = FirebaseFirestore.instance.collection("Favorite");

  final auth = FirebaseAuth.instance.currentUser;
  favoriteData(DocumentSnapshot? snpashot) async {
    try {
      print(snpashot!.id);

      Map map = snpashot.data() as Map<String, dynamic>;

      print(map);

      await database.add({
        "name": map["pUserName"],
        "Date":
            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "email": map["pUserEmail"],
        "imageUrl": map["pImage"],
        "price": map["pPrice"],
        "title": map["pTitle"],
        "phone": map["pPhone"],
        "description": map["pDescription"],
        "location": map["pLocation"],
        "userId": auth!.uid,
      });
    } catch (e) {
      log("error in upload data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Bits").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(""),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(DetailScreen(
                              title: snapshot.data!.docs[index]["pTitle"] ?? "",
                              phone: snapshot.data!.docs[index]["pPhone"] ?? "",
                              price: snapshot.data!.docs[index]["pPrice"] ?? "",
                              image: snapshot.data!.docs[index]["pImage"] ?? "",
                              email: snapshot.data!.docs[index]["pUserEmail"] ??
                                  "",
                              description: snapshot.data!.docs[index]
                                      ["pDescription"] ??
                                  "",
                              location:
                                  snapshot.data!.docs[index]["pLocation"] ?? "",
                              name:
                                  snapshot.data!.docs[index]["pUserName"] ?? "",
                            ));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 99,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage.assetNetwork(
                                          // fit: BoxFit.fill,
                                          placeholder:
                                              'Assets/Images/building.jpg',
                                          image: snapshot.data!.docs[index]
                                              ["pImage"],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["pPrice"],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.favorite_outline),
                                      onPressed: () async {
                                        favoriteData(
                                            snapshot.data!.docs[index]);
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  snapshot.data!.docs[index]["pTitle"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //       height: 5,
                            //     ),
                          ),
                        )
                      ],
                    ),
                  ]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
