import 'package:chumsy_app/Controllers/map_screen_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Functions/open_options_bottom_sheet.dart';
import '../Functions/see_event_bottom_sheet.dart';
import '../Constants/colors.dart';
import '../Constants/sizes.dart';
import '../Constants/spacing.dart';
import 'Extra Widgets/gradient_widget.dart';
import 'Extra Widgets/list_set_of_widgets.dart';
import 'options_list.dart';

class MapBottomContainer extends StatelessWidget {
  const MapBottomContainer({
    super.key,
    required this.mapScreenControllers,
  });
  final MapScreenControllers mapScreenControllers;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Column(
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
                    size: 40,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                right: 30,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Mike, 26 ",
                        style: headingStyle24,
                      ),
                      Text(
                        " 500m",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14,
                        ),
                      ),
                      horizontalSpacingBox,
                      Icon(
                        CupertinoIcons.bookmark,
                        color: blackColor,
                        size: 23,
                      ),
                    ],
                  ),
                  spacingBox,
                  const Text(
                    "Looking for a tennis Chumsy",
                    style: regularStyleBold,
                  ),
                  spacingBox,
                  ChipSets(
                    islarge: false,
                    listOfChips: options,
                  ),
                  spacingBox,
                  CustomGradientButtonWidget(
                    buttonWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "SEE DETAILS",
                          style: regularStyleBold,
                        ),
                      ],
                    ),
                    onTapFunction: () {
                      seeEventBottomSheet(
                          context,
                          mapScreenControllers,
                          "assets/extras/bottomBack1.png",
                          "assets/extras/dp_2.jpg",
                          "Tennis",
                          "Mike",
                          "26",
                          "Poland, Warsaw");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
