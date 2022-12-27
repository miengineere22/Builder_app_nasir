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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          borderOnForeground: true,
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
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(DetailScreen(
                              title:
                                  snapshot.data!.docs[index]["_pTitle"] ?? "",
                              phone:
                                  snapshot.data!.docs[index]["_pPhone"] ?? "",
                              price:
                                  snapshot.data!.docs[index]["_pPrice"] ?? "",
                              image:
                                  snapshot.data!.docs[index]["_pImage"] ?? "",
                              email: snapshot.data!.docs[index]
                                      ["_pUserEmail"] ??
                                  "",
                              description: snapshot.data!.docs[index]
                                      ["_pDescription"] ??
                                  "",
                              location: snapshot.data!.docs[index]
                                      ["_pLocation"] ??
                                  "",
                              username: snapshot.data!.docs[index]
                                      ["_pUserName"] ??
                                  "",
                            ));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'Assets/Images/building.jpg',
                                    image: snapshot.data!.docs[index]
                                        ["_pImage"],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["_pPrice"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.favorite_outline),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                Text(
                                  snapshot.data!.docs[index]["_pTitle"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // snapshot.data!.docs[index]["_pLocation"],
                                // snapshot.data!.docs[index]["_pUserName"],
                                // snapshot.data!.docs[index]["_pEmail"],
                                // snapshot.data!.docs[index]["_pPhone"],
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
