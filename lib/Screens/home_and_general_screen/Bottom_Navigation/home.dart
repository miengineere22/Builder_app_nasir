// import 'package:buildapp/Screens/home_and_general_screen/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Color(0xfff69ce7),
//       //   // title: Text('Home'),
//       //   centerTitle: true,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           // width: MediaQuery.of(context).size.width,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Center(
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Build',
//                             style: TextStyle(
//                                 fontSize: 45,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'App',
//                             style: TextStyle(
//                                 fontSize: 45,
//                                 color: Color(0xffb90c48),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ]),
//                   ),
//                   Text(
//                     'Welcome To BuildApp!',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     'Before you begin, Select why you are here.\n Are you a contractor or a home owner?',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Center(
//                     child: Text(
//                       'Please Select below',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.43,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(),
//                             color: Colors.white),
//                         // width: 160,
//                         height: 400,
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "Assets/Images/home owner.PNG",
//                               width: 350,
//                               height: 200,
//                             ),
//                             Text(
//                               'Home Owner',
//                               style: TextStyle(
//                                   fontSize: 23, fontWeight: FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 'I am a home owner Looking for Contractor to complete My project',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             // ElevatedButton(
//                             //   onPressed: () {
//                             //     Get.to(ProfileScreen());
//                             //   },
//                             //   child: Text(
//                             //     'SELECT',
//                             //     style: TextStyle(
//                             //         fontWeight: FontWeight.bold,
//                             //         color: Colors.white),
//                             //   ),
//                             //   // color: Colors.deepPurple,
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.43,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(),
//                             color: Colors.white),
//                         // width: 160,
//                         height: 400,
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "Assets/Images/contractor.PNG",
//                               width: 350,
//                               height: 200,
//                             ),
//                             Text(
//                               'Contractor',
//                               style: TextStyle(
//                                   fontSize: 23, fontWeight: FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 '  I am a contractor Looking home owner to complete their \n       project',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             FlatButton(
//                               onPressed: () {
//                                 Get.to(ProfileScreen());
//                               },
//                               child: Text(
//                                 'SELECT',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               color: Colors.deepPurple,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
