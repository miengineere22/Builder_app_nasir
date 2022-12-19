import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  userLoading() {
    // print('User Login ');
    showLoading(title: "please wait");
  }

  showLoading({String title = "Loading"}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            child: Row(children: [
              SizedBox(width: 20),
              Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              SizedBox(
                width: 20,
              ),
              Text(title),
            ]),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
