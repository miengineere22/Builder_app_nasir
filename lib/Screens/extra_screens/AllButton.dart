import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget allButton(String text, var PageName) {
  return ElevatedButton(
    onPressed: () {
      Get.to(PageName());
    },
    child: Text(text),
  );
}
