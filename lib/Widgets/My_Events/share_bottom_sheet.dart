import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

Future<void> openShareBottomSheet(BuildContext context) {
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
      // minHeight: 280,
      panel: Column(
        children: [
          Divider(
            endIndent: screenWidth / 4.5,
            indent: screenWidth / 4.5,
            color: blackColor,
            thickness: 4,
          ),
          Column(
            children: [
              CupertinoListTile(
                onTap: () {
                  Share.share("Chumsy").then((value) => Get.back());
                },
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                leading: Image.asset(
                  "assets/extras/icons/share (5)@2x.png",
                ),
                title: const Text(
                  "Share event",
                  style: regularStyleBold,
                ),
                subtitle: const AutoSizeText(
                  "You can share the event with anyone",
                  style: regularStyle,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
              spacingBoxExtended,
            ],
          ),
        ],
      ),
    ),
  );
}
