import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favorites'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Favorites',
          style: (TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
