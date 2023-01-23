import 'package:buildapp/Screens/home_and_general_screen/Bottom_Navigation/detial_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favorites'),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Favorite")
            .where("userId", isEqualTo: auth!.uid.toString())
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
                            title: snapshot.data!.docs[index]["title"] ?? "",
                            phone: snapshot.data!.docs[index]["phone"] ?? "",
                            price: snapshot.data!.docs[index]["price"] ?? "",
                            image: snapshot.data!.docs[index]["imageUrl"] ?? "",
                            email: snapshot.data!.docs[index]["email"] ?? "",
                            description:
                                snapshot.data!.docs[index]["description"] ?? "",
                            location:
                                snapshot.data!.docs[index]["location"] ?? "",
                            name: snapshot.data!.docs[index]["name"] ?? "",
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
                                        ["imageUrl"],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]["price"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const Spacer(),
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
                                    snapshot.data!.docs[index]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
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
    );
  }
}
