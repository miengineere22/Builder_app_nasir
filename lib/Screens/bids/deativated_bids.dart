import 'package:flutter/material.dart';

class DeactiveBids extends StatefulWidget {
  const DeactiveBids({Key? key}) : super(key: key);
  _DeactiveBidsState createState() => _DeactiveBidsState();
}

class _DeactiveBidsState extends State<DeactiveBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Deactive bids',
          style: (TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
