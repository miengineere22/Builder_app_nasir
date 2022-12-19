import 'package:flutter/material.dart';

class ContractorList extends StatefulWidget {
  const ContractorList({Key? key}) : super(key: key);
  _ContractorListState createState() => _ContractorListState();
}

class _ContractorListState extends State<ContractorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contractor List'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Stack(children: [
                  Image.asset(
                    "Assets/Images/nasir pic.jpeg",
                    fit: BoxFit.fill,
                    width: 250,
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white54,
                      ),
                      height: 30,
                      width: 100,
                      child: Stack(children: [
                        Center(
                            child: Text(
                          'Abdul Nasir',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Stack(children: [
                  Image.asset(
                    "Assets/Images/nasir pic.jpeg",
                    fit: BoxFit.fill,
                    width: 250,
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white54,
                      ),
                      height: 30,
                      width: 100,
                      child: Stack(children: [
                        Center(
                            child: Text(
                          'Abdul Nasir',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Stack(children: [
                  Image.asset(
                    "Assets/Images/nasir pic.jpeg",
                    fit: BoxFit.fill,
                    width: 250,
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white54,
                      ),
                      height: 30,
                      width: 100,
                      child: Stack(children: [
                        Center(
                            child: Text(
                          'Abdul Nasir',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
