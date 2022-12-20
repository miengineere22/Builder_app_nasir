import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String? email;
  final String? phone;
  final String? title;
  final String? price;
  final String? image;
  final String? description;
  final String? location;
  final String? username;

  DetailScreen({
    Key? key,
    required this.email,
    required this.phone,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.location,
    required this.username,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                borderOnForeground: true,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'Assets/Images/building.jpg',
                              image: widget.image.toString(),
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.price.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.favorite_outline),
                                onPressed: () {},
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.title.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                borderOnForeground: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.description.toString(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  child: Icon(
                                    Icons.account_box,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.username.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                    child: Text(
                                      widget.email.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () async {
                                      var currentUserEmail =
                                          widget.email.toString();
                                      //
                                      String usermail =
                                          "mailto:$currentUserEmail";
                                      if (await canLaunch(usermail)) {
                                        await launch(usermail);
                                      } else {
                                        throw "Error occured trying to mail that account.";
                                      }
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  child: Icon(
                                    Icons.whatsapp,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                    child: Text(
                                      widget.phone.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () async {
                                      var telephoneNumber =
                                          widget.phone.toString();

                                      String telephoneUrl =
                                          "https://wa.me/$telephoneNumber";
                                      if (await canLaunch(telephoneUrl)) {
                                        await launch(telephoneUrl);
                                      } else {
                                        throw "Error occured trying to call that number.";
                                      }
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.location.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//      Scaffold(
//       appBar: AppBar(title: Text("Details")),
//       body: Center(
//           child: Column(
//         children: [
//           // Text(widget.email.toString()),
//           // Text(widget.phone.toString()),
//           Text(widget.title.toString()),
//           // Text(widget.location.toString()),
//           Text(widget.price.toString()),
//           Text(widget.description.toString()),
//           // Text(widget.username.toString()),
//           // Image(widget.image.toString()),
//         ],
//       )),
//     );
}
