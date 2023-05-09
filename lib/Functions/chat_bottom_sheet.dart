import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

Future<void> showChatBottomSheet(BuildContext context) {
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
      minHeight: screenHeight / 2.5,
      panel: Column(
        children: [
          spacingBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                onPanDown: (details) {
                  Get.back();
                },
                onTapDown: (details) {
                  Get.back();
                },
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            child: Column(
              children: [
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/icons/alert@2x.png"),
                  leadingSize: 28,
                  title: Text(
                    "Report user",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const AutoSizeText(
                    "Something not right? We will take a look!",
                    style: smallStyle,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/icons/ban.png"),
                  leadingSize: 28,
                  title: AutoSizeText(
                    "Block",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    softWrap: true,
                  ),
                  subtitle: const Text(
                    "You can block the user",
                    style: smallStyle,
                  ),
                ),
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/user_add.png"),
                  leadingSize: 28,
                  title: Text(
                    "Add to friends",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const AutoSizeText(
                    "Invite to become friends and keep in touch!",
                    style: smallStyle,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/icons/mute.png"),
                  leadingSize: 28,
                  title: Text(
                    "Mute",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const AutoSizeText(
                    "You can mute the notifications",
                    style: smallStyle,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
