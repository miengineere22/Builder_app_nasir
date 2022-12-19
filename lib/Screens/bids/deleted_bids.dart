import 'package:flutter/material.dart';

class DeletedBids extends StatefulWidget {
  const DeletedBids({Key? key}) : super(key: key);
  _DeletedBidsState createState() => _DeletedBidsState();
}

class _DeletedBidsState extends State<DeletedBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Deleted bids',
          style: (TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
