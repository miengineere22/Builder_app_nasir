import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BidsFullDetile extends StatefulWidget {
  const BidsFullDetile({Key? key}) : super(key: key);
  _BidsFullDetileState createState() => _BidsFullDetileState();
}

class _BidsFullDetileState extends State<BidsFullDetile> {
  final currentUser = FirebaseAuth.instance;
  final auth = FirebaseAuth.instance;
  final postRef = FirebaseDatabase.instance.reference().child('Posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Card(
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          borderOnForeground: true,
          child: Column(children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: postRef.child('Post List'),
                  defaultChild: const Text('Loading'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, index) {
                    return Column(children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.child('_pTitle').value.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  snapshot.child('_pPrice').value.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'Assets/Images/building.jpg',
                                image:
                                    snapshot.child("_pImage").value.toString(),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              snapshot.child('_pDescription').value.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),

                      // // Text(snapshot.child('_pTitle').value.toString()),
                      // Text(snapshot.child('_pLocation').value.toString()),
                      // Text(snapshot.child('_pCategory').value.toString()),
                      // Text(snapshot.child('_pPrice').value.toString()),
                      // Text(snapshot.child('_pPhone').value.toString()),
                      // Text(snapshot.child('_pDescription').value.toString()),
                    ]);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
