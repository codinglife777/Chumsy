import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Controllers/bnb_controller.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../../Widgets/Extra Widgets/simple_button_widget.dart';
import '../../Widgets/options_list.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'share_bottom_sheet.dart';

Future<void> savedEventBottomSheet(BuildContext context, String bgImage,
    String dp, String tite, String name, String age, String location) {
      AppLocalizations l = AppLocalizations.of(context)!;
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      backdropEnabled: true,
      body: Image.asset(
        bgImage,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          30,
        ),
        topRight: Radius.circular(
          30,
        ),
      ),
      minHeight: 530,
      maxHeight: screenHeight / 1.2,
      panel: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 20,
              ),
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
              CupertinoButton(
                padding: const EdgeInsets.only(right: 20),
                onPressed: () {
                  openShareBottomSheet(context);
                },
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: blackColor,
                  size: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 40,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tite,
                  style: headingStyle24,
                ),
                const SizedBox(
                  height: 11,
                ),
                CupertinoListTile(
                  padding: EdgeInsets.zero,
                  leadingSize: 50,
                  leading: CircleAvatar(
                    backgroundColor: neonColor,
                    foregroundImage: AssetImage(dp),
                  ),
                  title: Text(
                    "$name, $age ",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    location,
                    style: smallStyle,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    Expanded(
                      flex: 0,
                      child: Icon(
                        CupertinoIcons.time,
                        color: blackColor,
                      ),
                    ),
                    horizontalSpacingBox,
                    Expanded(
                      flex: 1,
                      child: AutoSizeText(
                        "Monday, April 12 | 11:00 AM. 12:00 PM",
                        style: smallStyle,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: const [
                    Expanded(
                      flex: 0,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: blackColor,
                      ),
                    ),
                    horizontalSpacingBox,
                    Expanded(
                      flex: 1,
                      child: AutoSizeText(
                        "500m",
                        style: smallStyle,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const AutoSizeText(
                  "This is the event description, lorem ipsum dolor sit amet. consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: regularStyle,
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 21,
                ),
                ChipSets(
                  islarge: false,
                  listOfChips: options,
                ),
                const SizedBox(
                  height: 31,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomSimpleuttonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l.deleteC,
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          Get.back();
                        },
                      ),
                    ),
                    horizontalSpacingBox,
                    Expanded(
                      flex: 1,
                      child: CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l.apply,
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          Get.generalDialog(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Theme(
                              data: ThemeData.light().copyWith(
                                dialogTheme: const DialogTheme(
                                  surfaceTintColor: whiteColor,
                                ),
                              ),
                              child: CupertinoAlertDialog(
                                title: Text(
                                  l.newEvent,
                                  style: smallStyleBold,
                                ),
                                content: Text(
                                 l.doYouWnatToApply,
                                  style: smallStyle,
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text(l.noC),
                                    onPressed: () => Get.back(),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(l.yesC),
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                      Get.put(BNBController()).changeIndex(0);
                                      Get.put(BNBController())
                                          .changeEventGoinOnButton();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
