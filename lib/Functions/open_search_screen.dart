import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Constants/colors.dart';

openSearchScreen(BuildContext context) {
  AppLocalizations l = AppLocalizations.of(context)!;
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
          child: Text(
            l.clear,
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
