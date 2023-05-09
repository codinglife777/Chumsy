import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';

void showEmailPasswordAlert(String message) {
  Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) => Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        title: const Text(
          "Error",
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: blackColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: const Text("Ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    ),
  );
}
