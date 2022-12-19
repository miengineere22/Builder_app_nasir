import 'package:buildapp/Screens/home_and_general_screen/Bids_full_detiles.dart';
import 'package:buildapp/Screens/home_and_general_screen/detial_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final currentUser = FirebaseAuth.instance;
  final auth = FirebaseAuth.instance;
  final postRef = FirebaseDatabase.instance.reference().child('Posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          borderOnForeground: true,
          child: Column(children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Bits").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(""),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            InkWell(
                              onTap: (() {
                                Get.to(DetailScreen(
                                  email: snapshot.data!.docs[index]["_pPrice"],
                                  phone: snapshot.data!.docs[index]["_pPhone"],
                                ));
                                // Card(
                                //   child: ListTile(
                                //     leading: Text(snapshot.data!.docs[index]["_pPrice"]),
                                //     title: Text(snapshot.data!.docs[index]["_uEmail"]),
                                //   ),
                                // );
                              }),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]["_pTitle"],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          snapshot.data!.docs[index]["_pPrice"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'Assets/Images/building.jpg',
                                        image: snapshot.data!.docs[index]
                                            ["_pImage"],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]
                                          ["_pDescription"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // // Text(snapshot.child('_pTitle').value.toString()),
                            // Text(snapshot.child('_pLocation').value.toString()),
                            // Text(snapshot.child('_pCategory').value.toString()),
                            // Text(snapshot.child('_pPrice').value.toString()),
                            // Text(snapshot.child('_pPhone').value.toString()),
                            // Text(snapshot.child('_pDescription').value.toString()),
                          ]);
                        });
                  }
                })
          ]),
        ),
      ),
    );
  }
}
                
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: const Text(''),
    //     automaticallyImplyLeading: false,
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    //     child: Card(
    //       // color: Colors.white,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       borderOnForeground: true,
    //       child: Column(children: [
    //         Expanded(
    //           child: FirebaseAnimatedList(
    //               query: postRef.child('Post List'),
    //               defaultChild: const Text('Loading'),
    //               itemBuilder: (BuildContext context, DataSnapshot snapshot,
    //                   Animation<double> animation, index) {
    //                 return Column(children: [
    //                   InkWell(
    //                     onTap: (() {
    //                       Get.to(DetailScreen(
    //                         email:
    //                             snapshot.child('_pUserEmail').value.toString(),
    //                         phone: snapshot.child('_pPhone').value.toString(),
    //                       ));

    //                       // Get.defaultDialog(
    //                       //   title: 'Contact Info ⬇',
    //                       //   textCancel: 'Cancel',
    //                       //   cancelTextColor: Colors.deepPurple,
    //                       //   buttonColor: Colors.deepPurple,
    //                       //   content: SingleChildScrollView(
    //                       //     child: Container(
    //                       //       width: 300,
    //                       //       child: Column(
    //                       //         children: [
    //                       //           Container(
    //                       //             child: Column(
    //                       //               crossAxisAlignment:
    //                       //                   CrossAxisAlignment.start,
    //                       //               mainAxisAlignment:
    //                       //                   MainAxisAlignment.start,
    //                       //               children: [
    //                       //                 Row(
    //                       //                   children: [
    //                       //                     CircleAvatar(
    //                       //                       backgroundColor:
    //                       //                           Colors.deepPurple,
    //                       //                       child: Icon(
    //                       //                         Icons.account_box,
    //                       //                         color: Colors.white,
    //                       //                       ),
    //                       //                     ),
    //                       //                     SizedBox(
    //                       //                       width: 20,
    //                       //                     ),
    //                       //                     Text(
    //                       //                       (snapshot
    //                       //                           .child('_pUserName')
    //                       //                           .value
    //                       //                           .toString()),
    //                       //                       style: TextStyle(
    //                       //                           fontWeight:
    //                       //                               FontWeight.bold),
    //                       //                     ),
    //                       //                   ],
    //                       //                 ),
    //                       //                 SizedBox(
    //                       //                   height: 10,
    //                       //                 ),
    //                       //                 Row(
    //                       //                   children: [
    //                       //                     CircleAvatar(
    //                       //                       backgroundColor:
    //                       //                           Colors.deepPurple,
    //                       //                       child: Icon(
    //                       //                         Icons.mail_outline_rounded,
    //                       //                         color: Colors.white,
    //                       //                       ),
    //                       //                     ),
    //                       //                     TextButton(
    //                       //                         child: Text(
    //                       //                           snapshot
    //                       //                               .child('_pUserEmail')
    //                       //                               .value
    //                       //                               .toString(),
    //                       //                           style: TextStyle(
    //                       //                               fontWeight:
    //                       //                                   FontWeight.bold),
    //                       //                         ),
    //                       //                         onPressed: () async {
    //                       //                           var currentUserEmail =
    //                       //                               snapshot
    //                       //                                   .child(
    //                       //                                       '_pUserEmail')
    //                       //                                   .value
    //                       //                                   .toString();
    //                       //                           String usermail =
    //                       //                               "mailto:$currentUserEmail";
    //                       //                           if (await canLaunch(
    //                       //                               usermail)) {
    //                       //                             await launch(usermail);
    //                       //                           } else {
    //                       //                             throw "Error occured trying to mail that account.";
    //                       //                           }
    //                       //                         }

    //                       //                         // child: Icon(Icons.call)
    //                       //                         ),
    //                       //                   ],
    //                       //                 ),
    //                       //                 SizedBox(
    //                       //                   height: 10,
    //                       //                 ),
    //                       //                 Row(
    //                       //                   children: [
    //                       //                     CircleAvatar(
    //                       //                       backgroundColor:
    //                       //                           Colors.deepPurple,
    //                       //                       child: Icon(
    //                       //                         Icons.call,
    //                       //                         color: Colors.white,
    //                       //                       ),
    //                       //                     ),
    //                       //                     TextButton(
    //                       //                         child: Text(
    //                       //                           snapshot
    //                       //                               .child('_pPhone')
    //                       //                               .value
    //                       //                               .toString(),
    //                       //                           style: TextStyle(
    //                       //                               fontWeight:
    //                       //                                   FontWeight.bold),
    //                       //                         ),
    //                       //                         onPressed: () async {
    //                       //                           var telephoneNumber =
    //                       //                               snapshot
    //                       //                                   .child('_pPhone')
    //                       //                                   .value
    //                       //                                   .toString();
    //                       //                           String telephoneUrl =
    //                       //                               "tel:$telephoneNumber";
    //                       //                           if (await canLaunch(
    //                       //                               telephoneUrl)) {
    //                       //                             await launch(
    //                       //                                 telephoneUrl);
    //                       //                           } else {
    //                       //                             throw "Error occured trying to call that number.";
    //                       //                           }
    //                       //                         }

    //                       //                         // child: Icon(Icons.call)
    //                       //                         ),
    //                       //                   ],
    //                       //                 ),
    //                       //                 SizedBox(
    //                       //                   height: 10,
    //                       //                 ),
    //                       //                 Row(
    //                       //                   children: [
    //                       //                     CircleAvatar(
    //                       //                       backgroundColor:
    //                       //                           Colors.deepPurple,
    //                       //                       child: Icon(
    //                       //                         Icons.whatsapp,
    //                       //                         color: Colors.white,
    //                       //                       ),
    //                       //                     ),
    //                       //                     TextButton(
    //                       //                         child: Text(
    //                       //                           snapshot
    //                       //                               .child('_pPhone')
    //                       //                               .value
    //                       //                               .toString(),
    //                       //                           style: TextStyle(
    //                       //                               fontWeight:
    //                       //                                   FontWeight.bold),
    //                       //                         ),
    //                       //                         onPressed: () async {
    //                       //                           var telephoneNumber =
    //                       //                               snapshot
    //                       //                                   .child('_pPhone')
    //                       //                                   .value
    //                       //                                   .toString();
    //                       //                           String telephoneUrl =
    //                       //                               "https://wa.me/$telephoneNumber";
    //                       //                           if (await canLaunch(
    //                       //                               telephoneUrl)) {
    //                       //                             await launch(
    //                       //                                 telephoneUrl);
    //                       //                           } else {
    //                       //                             throw "Error occured trying to call that number.";
    //                       //                           }
    //                       //                         }

    //                       //                         // child: Icon(Icons.call)
    //                       //                         ),
    //                       //                   ],
    //                       //                 ),
    //                       //                 SizedBox(
    //                       //                   height: 10,
    //                       //                 ),
    //                       //                 Row(
    //                       //                   children: [
    //                       //                     CircleAvatar(
    //                       //                       backgroundColor:
    //                       //                           Colors.deepPurple,
    //                       //                       child: Icon(
    //                       //                         Icons.location_on,
    //                       //                         color: Colors.white,
    //                       //                       ),
    //                       //                     ),
    //                       //                     SizedBox(
    //                       //                       width: 20,
    //                       //                     ),
    //                       //                     Text(
    //                       //                       (snapshot
    //                       //                           .child('_pLocation')
    //                       //                           .value
    //                       //                           .toString()),
    //                       //                       style: TextStyle(
    //                       //                           fontWeight:
    //                       //                               FontWeight.bold),
    //                       //                     ),
    //                       //                   ],
    //                       //                 ),
    //                       //               ],
    //                       //             ),
    //                       //           ),
    //                       //         ],
    //                       //       ),
    //                       //     ),
    //                       //   ),
    //                       // );
    //                     }),
    //                     child: Container(
    //                       child: Column(
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Text(
    //                                 snapshot.child('_pTitle').value.toString(),
    //                                 style: TextStyle(
    //                                     fontSize: 20,
    //                                     fontWeight: FontWeight.bold),
    //                               ),
    //                               const Spacer(),
    //                               Text(
    //                                 snapshot.child('_pPrice').value.toString(),
    //                                 style: TextStyle(
    //                                     fontSize: 15,
    //                                     fontWeight: FontWeight.bold),
    //                               ),
    //                             ],
    //                           ),
    //                           ClipRRect(
    //                             borderRadius: BorderRadius.circular(10),
    //                             child: FadeInImage.assetNetwork(
    //                               placeholder: 'Assets/Images/building.jpg',
    //                               image: snapshot
    //                                   .child("_pImage")
    //                                   .value
    //                                   .toString(),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 8,
    //                           ),
    //                           SizedBox(
    //                             height: 8,
    //                           ),
    //                           Text(
    //                             snapshot
    //                                 .child('_pDescription')
    //                                 .value
    //                                 .toString(),
    //                             style: TextStyle(
    //                                 fontSize: 20, fontWeight: FontWeight.bold),
    //                           ),
    //                           SizedBox(
    //                             height: 15,
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),

    //                   // // Text(snapshot.child('_pTitle').value.toString()),
    //                   // Text(snapshot.child('_pLocation').value.toString()),
    //                   // Text(snapshot.child('_pCategory').value.toString()),
    //                   // Text(snapshot.child('_pPrice').value.toString()),
    //                   // Text(snapshot.child('_pPhone').value.toString()),
    //                   // Text(snapshot.child('_pDescription').value.toString()),
    //                 ]);
    //               }),
    //         ),
    //       ]),
    //     ),
    //   ),
    // );
  

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//   _DishboardState createState() => _DishboardState();
// }

// class _DishboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: GridView.extent(
//           primary: false,
//           padding: const EdgeInsets.all(16),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           maxCrossAxisExtent: 200.0,
//           children: <Widget>[
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Nasir',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.63k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.fitWidth),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ismail',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.26k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Naseem',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.32k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ali',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.28k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Yasir',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.53k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ahmad',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
