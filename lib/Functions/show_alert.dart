import 'package:chumsy_app/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

openDialog(BuildContext context, String url) {
  AppLocalizations l = AppLocalizations.of(context)!;
  Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) => Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        title: Text(
          l.chumsyWantstoUse(url),
        ),
        content: Text(
          l.doYouAllowTouseYourInfo,
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(l.cancel),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: Text(l.allow),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    ),
  );
}
