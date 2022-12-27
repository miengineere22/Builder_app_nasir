import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The APP is develope in Flutter by Abdul Nasir and Muhammad Ismail,Students of BS Software Engineering Islamia college university peshawar',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          child: Text(
                            'abdulnasiricp@gmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          onPressed: () async {
                            var currentUserEmail = 'abdulnasiricp@gmail.com';

                            String usermail = "mailto:$currentUserEmail";
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
                            '03429107173',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          onPressed: () async {
                            var telephoneNumber = '03429107173';

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
