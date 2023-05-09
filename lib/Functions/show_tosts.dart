import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';

void showErrorToast(String msg, BuildContext context) {
  // Fluttertoast.showToast(
  //   msg: msg,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.BOTTOM,
  //   backgroundColor: Colors.red,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  Get.generalDialog(
    barrierColor: transparentColor,
    pageBuilder: (context, animation, secondaryAnimation) => IgnorePointer(
      child: Container(
        margin: EdgeInsets.only(
          top: screenHeight / 1.12,
          bottom: 50,
          right: screenWidth / 30,
          left: screenWidth / 5,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF0cb294),
              Color(0XFF8ec842),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            msg,
            style: const TextStyle(
              color: whiteColor,
            ),
          ),
        ),
      ),
    ),
  );
  Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
    () => Get.back(),
  );
}

void showSuccessToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showNotificationToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.greenAccent,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showAlertDialog(BuildContext context, String strTitle, String strDetail,
    String? strYes, String? strNo, VoidCallback? cbYes, VoidCallback? cbNo) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(strTitle),
      content: Text(strDetail),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            if (cbNo != null) cbNo();
            Navigator.pop(context);
          },
          child: Text(strNo ?? "No"),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            if (cbYes != null) cbYes();
            Navigator.pop(context);
          },
          child: Text(strYes ?? "Yes"),
        ),
      ],
    ),
  );
}

AlertDialog getAlertDlg(BuildContext context, String title) {
  Widget okButton = TextButton(
    child: const Text("ok"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: const Text("Alert"),
    content: Text(title),
    actions: [okButton],
  );
}

AlertDialog getNotificationAlertDlg(
    BuildContext context, String title, String message) {
  Widget okButton = TextButton(
    child: const Text("ok"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [okButton],
  );
}

AlertDialog getCancelReasonDlg(BuildContext context, String title) {
  final TextEditingController txtController = TextEditingController();
  Widget saveButton = TextButton(
    child: const Text("Save"),
    onPressed: () {
      if (txtController.text.isEmpty) {
        showErrorToast("Please fill reason", context);
      } else {
        Navigator.pop(context, txtController.text);
      }
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: Text(title),
    content: TextField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      controller: txtController,
    ),
    actions: [saveButton],
  );
}

AlertDialog getJobCancelDlg(
    BuildContext context, String title, String jobDescription, String content) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "No",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Yes",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(
          color: AdaptiveTheme.of(context).theme.colorScheme.onBackground),
    ),
    backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.error,
    content: SizedBox(
      height: 120,
      child: Column(children: [
        Text(
          jobDescription,
          style: TextStyle(
              color: AdaptiveTheme.of(context).theme.colorScheme.onBackground),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          content,
          style: TextStyle(
              color: AdaptiveTheme.of(context).theme.colorScheme.onBackground),
        ),
      ]),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
}

AlertDialog getConfirmDlg(BuildContext context, String title) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "No",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Yes",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: const Text("Alert"),
    content: Text(title),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
}

AlertDialog getDispatchOnOffDlg(
    BuildContext context, String title, String description, bool value) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "No",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Yes",
      style:
          TextStyle(color: AdaptiveTheme.of(context).theme.colorScheme.primary),
    ),
    onPressed: () {
      Navigator.pop(context, value);
    },
  );
  // set up the AlertDialog
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(
          color: AdaptiveTheme.of(context).theme.colorScheme.onBackground),
    ),
    backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.error,
    content: SizedBox(
      height: 120,
      child: Column(children: [
        Text(
          description,
          style: TextStyle(
              color: AdaptiveTheme.of(context).theme.colorScheme.onBackground),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
}
