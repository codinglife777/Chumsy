import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

Future<void> openOptionsBottomSheet(BuildContext context) {
  AppLocalizations l = AppLocalizations.of(context)!;
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          30,
        ),
        topRight: Radius.circular(
          30,
        ),
      ),
      minHeight: 280,
      panel: Column(
        children: [
          Divider(
            endIndent: screenWidth / 4.5,
            indent: screenWidth / 4.5,
            color: blackColor,
            thickness: 4,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              CupertinoListTile(
                onTap: () => Get.back(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                leading: Image.asset(
                  "assets/extras/icons/alert@2x.png",
                  width: 28.05,
                  height: 25.17,
                ),
                title: Text(
                  l.report,
                  style: regularStyleBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AutoSizeText(
                  l.somethingNotRight,
                  style: smallStyle,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
              CupertinoListTile(
                onTap: () => Get.back(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                leading: Image.asset(
                  "assets/extras/icons/Path 5490@2x.png",
                  width: 28.05,
                  height: 25.17,
                ),
                title: Text(
                  l.saveL,
                  style: regularStyleBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AutoSizeText(
                  l.youCanSavetheEventforLater,
                  style: smallStyle,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
              CupertinoListTile(
                onTap: () => Get.back(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                leading: Image.asset(
                  "assets/extras/icons/Group 7388@2x.png",
                  width: 28.05,
                  height: 25.17,
                ),
                title: Text(
                  l.addToFriends,
                  style: regularStyleBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AutoSizeText(
                  l.inviteToBecomeFriends,
                  style: smallStyle,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
