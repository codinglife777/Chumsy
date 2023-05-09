import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';

openSearchScreen(BuildContext context) {
  return showAnimatedDialog(
    curve: Curves.linear,
    animationType: DialogTransitionType.slideFromBottom,
    context: context,
    builder: (context) => CupertinoPageScaffold(
      backgroundColor: whiteColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: whiteColor,
        trailing: CupertinoButton(
          onPressed: () => Get.back(),
          child: const Text(
            "Clear",
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [],
          ),
        ),
      ),
    ),
  );
}
