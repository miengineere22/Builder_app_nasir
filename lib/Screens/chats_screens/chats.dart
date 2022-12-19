import 'package:buildapp/Screens/chats_screens/chat_page.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Conversation',
          style: GoogleFonts.alata(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.6)),
        ),
        centerTitle: true,
        elevation: 0.0,
        // backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(BottomNavigationBarScreen());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent[200],
        elevation: 30,
        child: Icon(
          Icons.mode_edit,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width * 0.8,
                height: height * 0.08,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 20,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Color(0xff181717),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.08,
                      ),
                      SizedBox(
                          width: width * 0.5,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: GoogleFonts.lexendPeta(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ListView(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          trailing: Text(
                            "8:45PM",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                AssetImage('Assets/Images/profile.jpg'),
                          ),
                          title: Text(
                            'Nasir',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(0.6)),
                          ),
                          subtitle: Text(
                            "yes done,",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10,
                          thickness: 1,
                          // indent: 10,
                          // endIndent: 10,
                        ),
                        ListTile(
                          trailing: Text(
                            "6:25AM",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            'ismail',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(0.6)),
                          ),
                          subtitle: Text(
                            "All good!",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10,
                          thickness: 1,
                          // indent: 10,
                          // endIndent: 10,
                        ),
                        ListTile(
                          onTap: (() {
                            Get.to(ChatScreenPage(
                                title: 'ChatScreen',
                                name: 'Nasir',
                                profession: 'Developer'));
                          }),
                          trailing: Text(
                            "8:45PM",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            'Nasir',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(0.6)),
                          ),
                          subtitle: Text(
                            "yes done,",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10,
                          thickness: 1,
                          // indent: 10,
                          // endIndent: 10,
                        ),
                        ListTile(
                          trailing: Text(
                            "6:25AM",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            'ismail',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(0.6)),
                          ),
                          subtitle: Text(
                            "All good!",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10,
                          thickness: 1,
                          // indent: 10,
                          // endIndent: 10,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
