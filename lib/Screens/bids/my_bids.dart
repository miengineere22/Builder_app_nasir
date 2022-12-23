import 'package:buildapp/Screens/bids/active_bids.dart';
import 'package:buildapp/Screens/bids/favorites.dart';

import 'package:flutter/material.dart';

class MyBids extends StatefulWidget {
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
              Tab(text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveBids(),
            Favorites(),
            // DeletedBids(),
          ],
        ),
      ),
    );
  }
}
