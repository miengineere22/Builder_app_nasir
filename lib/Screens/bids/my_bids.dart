import 'package:buildapp/Screens/bids/active_bids.dart';
import 'package:buildapp/Screens/bids/deativated_bids.dart';
// import 'package:buildapp/Screens/bids/deleted_bids.dart';

import 'package:flutter/material.dart';

class MyBids extends StatefulWidget {
  // const MyBids({Key? key}) : super(key: key);
  _MyBidsState createState() => _MyBidsState();
}

class _MyBidsState extends State<MyBids> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('My Bids'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Active Bids'),
              Tab(text: 'Deactive Bids'),
              // Tab(text: 'Deleted Bids'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveBids(),
            DeactiveBids(),
            // DeletedBids(),
          ],
        ),
      ),
    );
  }
}
