import 'package:chumsy_app/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

openDialog(BuildContext context, String url) {
  Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) => Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        title: Text(
          "Chumsy wants to use \"$url\" to log in",
        ),
        content: const Text(
          "Do you allow to use your information for registration purposes?",
          style: TextStyle(
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
            child: const Text("Allow"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    ),
  );
}
