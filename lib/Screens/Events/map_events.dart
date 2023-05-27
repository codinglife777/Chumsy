import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Functions/mapevent_bottom_sheet.dart';
import '../../Widgets/Community/custom_event_card.dart';
import '../../Widgets/My_Events/saved_bottom_sheet.dart';
import '../../Widgets/custom_appbar.dart';
import '../Filter_screens/filter_home.dart';

class MapEventsScreen extends StatefulWidget {
  const MapEventsScreen({
    super.key,
  });

  @override
  State<MapEventsScreen> createState() => _MapEventsScreenState();
}

// to check ehich screen is activated
int active = 0;

class _MapEventsScreenState extends State<MapEventsScreen> {
  void goDetail(String imgLocation, String avatar, String title, String nameAge,
      String desc) {
    savedEventBottomSheet(
        context, imgLocation, avatar, title, nameAge, "", desc,
        isCommunity: false);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      height: screenHeight - 100,
      width: screenWidth,
      color: whiteColor,
      child: Column(
        children: [
          Column(
            children: [
              CustomAppBar(
                title: l.events,
                isBack: true,
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: CupertinoButton(
                    child: const SizedBox(
                      height: 22,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              spacingBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showMapBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          CupertinoIcons.down_arrow,
                          size: 16,
                          weight: 600,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          // width: 185,
                          child: Text(
                            l.sort,
                            style: const TextStyle(
                                fontSize: 16,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.to(() => const FilterHome());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/home/filter@3x.png",
                          height: 13,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          // width: 185,
                          child: Text(
                            l.filter,
                            style: const TextStyle(
                                fontSize: 16,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: SizedBox(
                  height: screenHeight / 1.459,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    children: active == 0
                        ? [
                            CustomEventCard(
                              nameAndAge: "Max, 26",
                              activity: "Running",
                              dateText: "April 12 | lh",
                              time: "9:20 AM",
                              location: "4246.00km",
                              imageLocation: "assets/extras/event_image1.png",
                              cbClicked: goDetail,
                            ),
                            const SizedBox(height: 6),
                            CustomEventCard(
                              nameAndAge: "Emily, 30",
                              activity: "Swimming",
                              dateText: "May 3 | rh",
                              location: "7963.00km",
                              time: "2:30 PM",
                              imageLocation: "assets/extras/event_image3.jpg",
                              cbClicked: goDetail,
                            ),
                            const SizedBox(height: 6),
                            CustomEventCard(
                              nameAndAge: "Alex, 23",
                              activity: "Tennis",
                              dateText: "June 8 | lh",
                              location: "8218.00km",
                              time: "5:00 PM",
                              imageLocation: "assets/extras/bottomBack1.png",
                              cbClicked: goDetail,
                            ),
                            const SizedBox(height: 6),
                            CustomEventCard(
                              nameAndAge: "Sophia, 28",
                              activity: "Yoga",
                              dateText: "July 15 | rh",
                              location: "9529.00km",
                              time: "8:15 AM",
                              imageLocation: "assets/extras/event_image2.png",
                              cbClicked: goDetail,
                            ),
                          ]
                        : [
                            const CustomEventCard(
                              nameAndAge: "Emily, 30",
                              activity: "Swimming",
                              dateText: "May 3 | rh",
                              time: "2:30 PM",
                              imageLocation: "assets/extras/event_image3.jpg",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Alex, 23",
                              activity: "Tennis",
                              dateText: "June 8 | lh",
                              time: "5:00 PM",
                              imageLocation: "assets/extras/bottomBack1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Max, 26",
                              activity: "Running",
                              dateText: "April 12 | lh",
                              time: "9:20 AM",
                              imageLocation: "assets/extras/event_image1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Sophia, 28",
                              activity: "Yoga",
                              dateText: "July 15 | rh",
                              time: "8:15 AM",
                              imageLocation: "assets/extras/event_image2.png",
                            ),
                          ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

// top buttons used in the UI
  Row topButtons(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
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
              vertical: 8,
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
                l.planned,
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
              vertical: 8,
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
                l.finished,
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
      ],
    );
  }
}
