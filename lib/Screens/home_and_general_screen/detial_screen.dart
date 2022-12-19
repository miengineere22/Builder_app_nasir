import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  String email;
  String? phone;

  DetailScreen({Key? key, required this.email, required this.phone})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    log(widget.phone.toString());
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Center(
          child: Column(
        children: [
          Text(widget.email.toString()),
          Text(widget.phone.toString())
        ],
      )),
    );
  }
}
