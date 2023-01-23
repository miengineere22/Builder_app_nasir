import 'dart:developer';

import 'package:buildapp/Screens/home_and_general_screen/Bottom_Navigation/detial_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBids extends StatefulWidget {
  const MyBids({Key? key}) : super(key: key);
  _MyBidsState createState() => _MyBidsState();
}

class _MyBidsState extends State<MyBids> {
  final database = FirebaseFirestore.instance.collection("Favorite");

  final myBits = FirebaseFirestore.instance.collection("Bits");

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

  final databasedelete = FirebaseFirestore.instance.collection("Mybid");

  deleteBid(String? docId) async {
    print(docId.toString());
    try {
      await myBits.doc(docId).delete();
    } catch (e) {
      log("error in delete data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bids'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Bits")
              .where("uId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
              .snapshots(),
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
                  return Card(
                    child: Column(
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
                                Container(
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'Assets/Images/building.jpg',
                                      image: snapshot.data!.docs[index]
                                          ["pImage"],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["pPrice"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    // IconButton(
                                    //   icon: Icon(Icons.favorite_outline),
                                    //   onPressed: () async {
                                    //     favoriteData(
                                    //         snapshot.data!.docs[index]);
                                    //   },
                                    // )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["pTitle"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    PopupMenuButton(
                                        onSelected: (value) {
                                          if (value == 1) {
                                            deleteBid(
                                                snapshot.data!.docs[index].id);
                                          } else {
                                            // log("Edite");
                                          }
                                        },
                                        icon: Icon(Icons.more_vert),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: Text("Delete"),
                                                value: 1,
                                              )
                                            ])
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
