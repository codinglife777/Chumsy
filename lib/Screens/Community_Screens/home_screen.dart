import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Screens/Community_Screens/mng_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/spacing.dart';
import '../../Controllers/image_controller.dart';
import '../../Functions/cupertino_action_sheet.dart';
import '../../Widgets/Community/feed_card.dart';
import '../../Widgets/Community/frient_tile_widget.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import 'add_contact_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({
    super.key,
  });

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

// to check ehich screen is activated
int active = 0;

class _CommunityScreenState extends State<CommunityScreen> {
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: whiteColor,
      child: Column(
        children: [
          Column(
            children: [
              topAppBarSpacing,
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: const Text(
                        "",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text(
                      "Community",
                      style: subHeadingStyle,
                    ),
                    CupertinoButton(
                      child: Image.asset(
                        "assets/extras/camera.png",
                        width: 22,
                      ),
                      onPressed: () {
                        showActionSheet(context, imageController,
                            "Take a Photo", 'Photo Library');
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 18,
              ),
              topButtons(),
              const SizedBox(
                height: 29,
              ),
              Container(
                height: screenHeight - (active == 1 ? 370 : 301),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  children: active == 0
                      ? [
                          const SizedBox(
                            height: 6,
                          ),
                          const CustomFeedCard(
                            name: "Max Smith",
                            time: "9:20 AM",
                            textData:
                                "Take a look at the photo from our last run together with my Chumsy! So much fun!",
                            cheers: '5',
                            comments: '3',
                            imageLocation: "assets/extras/event_image1.png",
                            profileLocation: "assets/extras/dp_2.jpg",
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          const CustomFeedCard(
                            name: "Dee McRobie",
                            time: "9:20 AM",
                            textData: "What a yoga session today!",
                            cheers: '9',
                            comments: '2',
                            imageLocation: "assets/extras/event_image2.png",
                            profileLocation: "assets/extras/dp_4.jpg",
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                        ]
                      : active == 1
                          ? [
                              const FriendTile(
                                name: "Max Smith",
                                events: "9",
                                profileLocation: "assets/extras/dp_1.jpg",
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const FriendTile(
                                name: "Dee McRobie",
                                events: "1",
                                profileLocation: "assets/extras/dp_2.jpg",
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const FriendTile(
                                name: "Max Kowalski",
                                events: "3",
                                profileLocation: "assets/extras/dp_3.jpg",
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const FriendTile(
                                name: "Anna Perez",
                                events: "1",
                                profileLocation: "assets/extras/dp_4.jpg",
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const FriendTile(
                                name: "Luna Kith",
                                events: "6",
                                profileLocation: "assets/extras/dp_4.jpg",
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const FriendTile(
                                name: "Robert Johnson",
                                events: "4",
                                profileLocation: "assets/extras/dp_2.jpg",
                              ),
                            ]
                          : [
                              const FriendRequestTile(
                                name: "Max Smith",
                                location: "Warsaw, Poland",
                                profileLocation: "assets/extras/dp_1.jpg",
                              ),
                            ],
                ),
              ),
              active == 1
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Image.asset(
                                "assets/extras/user_add.png",
                                width: 20,
                              ),
                            ),
                            horizontalSpacingBoxSmall,
                            const Expanded(
                              flex: 0,
                              child: Text(
                                "FIND FRIENDS",
                                style: regularStyleBold,
                              ),
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          Get.to(() => const FindFriendPage());
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }

// top buttons used in the UI
  Row topButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 0 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                "Feed",
                style: regularStyleBold.copyWith(
                  color: active == 0 ? whiteColor : blackColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 0;
            });
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 1 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                "Friends",
                style: regularStyleBold.copyWith(
                  color: active == 1 ? whiteColor : blackColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 1;
            });
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 2 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                "Requests",
                style: regularStyleBold.copyWith(
                  color: active == 2 ? whiteColor : blackColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 2;
            });
          },
        ),
      ],
    );
  }
}
