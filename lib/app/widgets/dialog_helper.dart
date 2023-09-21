import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //memunculkan dialog
  static void showErrorDialog(
      {String title = 'Error', String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(description),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Okay"))
          ],
        ),
      ),
    ));
  }
}
