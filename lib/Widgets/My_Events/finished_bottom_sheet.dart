import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

Future<void> finishedEventBottomSheet(BuildContext context, String bgImage,
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
      minHeight: 450,
      panel: Column(
        children: [
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
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
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
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    onPressed: () {},
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
                          width: 21,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                  height: 14,
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
                        "Korty Tenisowe Warszawianka Piaseczynska 71.00-765 Warszawa. Polska",
                        style: smallStyle,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  children: const [
                    Text(
                      'Photos',
                      style: smallStyleBold,
                    ),
                    horizontalSpacingBox,
                    Icon(
                      CupertinoIcons.add_circled,
                      color: blackColor,
                    )
                  ],
                ),
                spacingBox,
                spacingBox,
                SizedBox(
                  width: screenWidth,
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Image.asset("assets/extras/gallery1.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Image.asset("assets/extras/gallery2.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Image.asset("assets/extras/gallery3.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Image.asset("assets/extras/gallery4.png"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
