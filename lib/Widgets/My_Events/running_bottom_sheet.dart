import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/simple_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Screens/Complete_Profile_Screens/profile_screen3.dart';
import '../Extra Widgets/gradient_widget.dart';
import 'event_going_on_screen.dart';

Future<void> runningEventBottomSheet(BuildContext context) {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      backdropEnabled: true,
      body: Image.asset(
        "assets/extras/bottomBack3.jpg",
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
      minHeight: 600,
      maxHeight: screenHeight / 1.2,
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
                const Text(
                  "Tennis",
                  style: headingStyle24,
                ),
                const SizedBox(
                  height: 11,
                ),
                CupertinoListTile(
                  padding: EdgeInsets.zero,
                  leadingSize: 50,
                  leading: const CircleAvatar(
                    backgroundColor: neonColor,
                    foregroundImage: AssetImage("assets/extras/dp_1.jpg"),
                  ),
                  title: Text(
                    "Max Smith",
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Poland, Warsaw",
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
                    SizedBox(
                      width: 5.9,
                    ),
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
                    SizedBox(
                      width: 8.55,
                    ),
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
                  children: [
                    Text(
                      'Photos',
                      style: regularStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalSpacingBox,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        color: blackColor,
                      ),
                      height: 34,
                      width: 34,
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: whiteColor,
                        size: 19.65,
                      ),
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
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Image.asset("assets/extras/gallery1.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Image.asset("assets/extras/gallery2.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Image.asset("assets/extras/gallery3.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Image.asset("assets/extras/gallery4.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/extras/location@2x.png",
                      width: 21,
                    ),
                    horizontalSpacingBoxSmall,
                    const SizedBox(
                      width: 1,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Share.share('sharing', subject: "Sharing");
                      },
                      child: Text(
                        "Share my location",
                        style: regularStyle.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 40,
                  ),
                  child: CustomSimpleuttonWidget(
                    buttonWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "FINISH",
                          style: smallStyleBold,
                        )
                      ],
                    ),
                    onTapFunction: () {
                      Get.to(() => const EventGoingOn());
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 40,
                  ),
                  child: CustomGradientButtonWidget(
                    buttonWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "CHUMSY POWER",
                          style: smallStyleBold,
                        )
                      ],
                    ),
                    onTapFunction: () {
                      Get.to(() => const CreateProfile3());
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
}
