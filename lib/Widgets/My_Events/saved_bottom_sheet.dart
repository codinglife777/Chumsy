import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Controllers/bnb_controller.dart';
import '../../Screens/Chat_screens/chatting_screen.dart';
import '../../Screens/Events/bottom_manage.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../../Widgets/Extra Widgets/simple_button_widget.dart';
import '../../Widgets/options_list.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'share_bottom_sheet.dart';

Future<void> savedEventBottomSheet(BuildContext context, String bgImage,
    String dp, String tite, String name, String age, String location,
    {bool isCommunity = true}) {
  AppLocalizations l = AppLocalizations.of(context)!;
  PanelController controller = PanelController();
  bool panelCLosed = false;
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      controller: controller,
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
      minHeight: isCommunity ? 530 : 600,
      maxHeight: screenHeight / 1.2,
      onPanelClosed: () {
        if (!panelCLosed) {
          Get.back();
          panelCLosed = true;
        }
      },
      // onPanelSlide: (position) {
      //   Get.off(() => const MapEventsMng());
      // },
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
                // onTap: () {
                //   Get.back();
                // },
                // onPanDown: (details) {
                //   Get.back();
                // },
                // onTapDown: (details) {
                //   Get.back();
                // },
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
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
                  openShareBottomSheet(context, isMyEvents: false);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          tite,
                          style: headingStyle24,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CupertinoButton(
                            child: Image.asset(
                              'assets/extras/icons/Path 5490@3x.png',
                              width: 16,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      onPressed: () {
                        Get.to(() => const ChattingScreen(
                              image: 'assets/register/avatar@3x.png',
                              name: 'Alexandra',
                              surName: 'Pawluczuk',
                            ));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              neonColor,
                              blueColor,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/home/chat_bottom@2x.png",
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              isCommunity ? l.deleteC : l.shareC,
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
