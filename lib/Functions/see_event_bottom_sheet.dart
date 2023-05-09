import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Controllers/map_screen_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../Widgets/Extra Widgets/gradient_widget.dart';
import '../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../Widgets/Extra Widgets/simple_button_widget.dart';
import '../Widgets/options_list.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'open_options_bottom_sheet.dart';

Future<void> seeEventBottomSheet(
    BuildContext context,
    MapScreenControllers mapScreenControllers,
    String bgImage,
    String dp,
    String tite,
    String name,
    String age,
    String location) {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      backdropEnabled: true,
      maxHeight: screenHeight / 1.5,
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
      minHeight: 490,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  mapScreenControllers.toggleInfoWindow();
                },
                onPanDown: (details) {
                  mapScreenControllers.toggleInfoWindow();
                },
                onTapDown: (details) {
                  mapScreenControllers.toggleInfoWindow();
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
                  openOptionsBottomSheet(context);
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
              children: [
                Row(
                  children: [
                    Text(
                      tite,
                      style: headingStyle24,
                    ),
                    horizontalSpacingBox,
                    const Icon(
                      CupertinoIcons.bookmark,
                      color: blackColor,
                      size: 23,
                    ),
                  ],
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
                  height: 23,
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
                    SizedBox(
                      width: 5.9,
                    ),
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
                  children: [
                    Expanded(
                      flex: 0,
                      child: Image.asset(
                        "assets/home/distance@2x.png",
                        width: 11.45,
                        height: 14.1,
                      ),
                    ),
                    const SizedBox(
                      width: 8.55,
                    ),
                    const Expanded(
                      flex: 1,
                      child: AutoSizeText(
                        "500m",
                        style: smallStyle,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.9,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChipSets(
                      islarge: false,
                      listOfChips: options,
                    ),
                  ],
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
                          children: const [
                            Text(
                              "SHARE",
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
                      width: 15.5,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "APPLY",
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
