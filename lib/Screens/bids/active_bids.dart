import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActiveBids extends StatefulWidget {
  const ActiveBids({Key? key}) : super(key: key);
  _ActiveBidsState createState() => _ActiveBidsState();
}

class _ActiveBidsState extends State<ActiveBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Bits")
            .where("_uId",
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
                  child: ListTile(
                    leading: Text(snapshot.data!.docs[index]["_pPrice"]),
                    title: Text(snapshot.data!.docs[index]["_uEmail"]),
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
