import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String? email;
  final String? phone;
  final String? title;
  final String? price;
  final String? image;
  final String? description;
  final String? location;
  final String? name;

  DetailScreen({
    Key? key,
    required this.email,
    required this.phone,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.location,
    required this.name,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // final database = FirebaseFirestore.instance.collection("Favorite");

  // final auth = FirebaseAuth.instance.currentUser;
  // favoriteData(DocumentSnapshot? snpashot) async {
  //   try {
  //     print(snpashot!.id);

  //     Map map = snpashot.data() as Map<String, dynamic>;

  //     print(map);

  //     await database.add({
  //       "name": map["_pUserName"],
  //       "Date":
  //           "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
  //       "email": map["_pUserEmail"],
  //       "imageUrl": map["_pImage"],
  //       "price": map["_pPrice"],
  //       "title": map["_pTitle"],
  //       "userId": auth!.uid,
  //     });
  //   } catch (e) {
  //     log("error in upload data");
  //   }
  // }
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
                          Container(
                            height: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'Assets/Images/building.jpg',
                                image: widget.image.toString(),
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  widget.price.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                //  IconButton(
                                //           icon: Icon(Icons.favorite_outline),
                                //           onPressed: () async {
                                //             favoriteData(
                                //                 snapshot.data!.docs[index]);
                                //           },
                                //         )
                              ],
                            ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
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
                                    width: 30,
                                  ),
                                  Text(
                                    widget.name.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                  SizedBox(
                                    width: 20,
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
                                        // ignore: deprecated_member_use
                                        if (await canLaunch(usermail)) {
                                          // ignore: deprecated_member_use
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
                                  SizedBox(
                                    width: 20,
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
                                        // ignore: deprecated_member_use
                                        if (await canLaunch(telephoneUrl)) {
                                          // ignore: deprecated_member_use
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
                                    width: 30,
                                  ),
                                  Text(
                                    widget.location.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
