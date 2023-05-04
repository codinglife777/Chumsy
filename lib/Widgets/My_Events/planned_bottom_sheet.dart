import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/simple_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../../Widgets/options_list.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'share_bottom_sheet.dart';

Future<void> plannedEventBottomSheet(BuildContext context, String bgImage,
    String dp, String tite, String name, String age, String location) {
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
      maxHeight: screenHeight - 30,
      minHeight: screenHeight / 1.2,
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
                  size: 40,
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
                  style: subHeadingStyle,
                ),
                spacingBox,
                CupertinoListTile(
                  padding: EdgeInsets.zero,
                  leadingSize: 40,
                  leading: CircleAvatar(
                    backgroundColor: neonColor,
                    foregroundImage: AssetImage(dp),
                  ),
                  title: Text(
                    "$name, $age ",
                    style: subHeadingStyle,
                  ),
                  subtitle: Text(
                    location,
                    style: regularStyle,
                  ),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    onPressed: () {},
                    child: Container(
                      height: 40,
                      width: 40,
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
                ),
                spacingBox,
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
                        style: regularStyle,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                spacingBox,
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
                        "Korty Tenisowe Warszawianka Piaseczynska 71.00-765 Warszawa. Polska",
                        style: smallStyle,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                spacingBox,
                const AutoSizeText(
                  "This is the event description, lorem ipsum dolor sit amet. consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: regularStyle,
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                spacingBox,
                ChipSets(
                  islarge: false,
                  listOfChips: options,
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  "Aplicants",
                  style: subHeadingStyle,
                ),
                const SizedBox(
                  height: 21,
                ),
                frientBuilder(
                    "Maggie, 26", "Warsaw", "assets/extras/dp_4.jpg", context),
                const SizedBox(
                  height: 17,
                ),
                frientBuilder(
                    "Luke, 30", "Warsaw", "assets/extras/dp_1.jpg", context),
                const SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomSimpleuttonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "CANCEL",
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          showCupertinoDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                                color: whiteColor,
                              ),
                              padding: const EdgeInsets.all(
                                2,
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: screenHeight / 4,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CupertinoButton(
                                        child: const Icon(
                                          CupertinoIcons.clear,
                                          color: blackColor,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Cancel the event",
                                    style: headingStyle24.copyWith(
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Why do you want to cancel the event?",
                                    style: regularStyleBold.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    "Choose the reason",
                                    style: smallStyle,
                                  ),
                                  const SizedBox(
                                    height: 27,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    child: CupertinoListTile(
                                      leading: Icon(
                                        Icons.radio_button_checked,
                                        color: blackColor,
                                      ),
                                      title: Text(
                                        'I can\'t make it',
                                        style: regularStyle,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                    ),
                                    child: CupertinoListTile(
                                      leading: Icon(
                                        Icons.radio_button_checked,
                                      ),
                                      title: Text(
                                        'We both want to cancel',
                                        style: regularStyle,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                    ),
                                    child: Text(
                                      "*Remember to cancel at least 1 day before or you might get a red flag!",
                                      style: TextStyle(
                                        color: Color(0XFFFF0000),
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                    ),
                                    child: CustomGradientButtonWidget(
                                      buttonWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "CANCEL",
                                            style: regularStyleBold,
                                          ),
                                        ],
                                      ),
                                      onTapFunction: () {
                                        Get.back();
                                        Future.delayed(
                                          Duration.zero,
                                          () {
                                            Get.generalDialog(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  Theme(
                                                data:
                                                    ThemeData.light().copyWith(
                                                  dialogTheme:
                                                      const DialogTheme(
                                                    surfaceTintColor:
                                                        whiteColor,
                                                  ),
                                                ),
                                                child: CupertinoAlertDialog(
                                                  title: const Text(
                                                    "Cancel the event",
                                                    style: smallStyleBold,
                                                  ),
                                                  content: const Text(
                                                    "Are you sure you want to cancel this event?",
                                                    style: smallStyle,
                                                  ),
                                                  actions: <Widget>[
                                                    CupertinoDialogAction(
                                                      child: const Text("NO"),
                                                      onPressed: () =>
                                                          Get.back(),
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: const Text("YES"),
                                                      onPressed: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "EDIT",
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          Get.back();
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

SizedBox frientBuilder(
    String nameAndAge, String location, String profile, BuildContext context) {
  return SizedBox(
    height: 45,
    child: CupertinoListTile(
      backgroundColorActivated: textColor.withOpacity(
        0.2,
      ),
      onTap: () {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
              color: whiteColor,
            ),
            padding: const EdgeInsets.all(
              2,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: screenHeight / 3.6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: const Icon(
                        CupertinoIcons.clear,
                        color: blackColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
                const Center(
                  child: Text(
                    "You have a Chumsy!",
                    style: headingStyle24,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 55,
                          foregroundImage: AssetImage(
                            profile,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              nameAndAge,
                              style: headingStyle24.copyWith(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Text(
                              "Do you want\n${nameAndAge.split(',')[0]} to take\npart in the event?",
                              style: regularStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                  ),
                  child: ChipSets(
                    islarge: false,
                    listOfChips: options,
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomSimpleuttonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "DECLINE",
                                style: regularStyleBold,
                              ),
                            ],
                          ),
                          onTapFunction: () {
                            Get.back();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomGradientButtonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "ACCEPT",
                                style: regularStyleBold,
                              ),
                            ],
                          ),
                          onTapFunction: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: neonColor,
        foregroundImage: AssetImage(profile),
      ),
      leadingSize: 45,
      title: Text(
        nameAndAge,
        style: regularStyleBold.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        location,
        style: smallStyle,
      ),
      trailing: CupertinoButton(
        child: const Icon(
          CupertinoIcons.right_chevron,
          color: blackColor,
        ),
        onPressed: () {},
      ),
    ),
  );
}
