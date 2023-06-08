import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Community/custom_event_card.dart';
import '../../Widgets/custom_appbar.dart';

class ProfileEventsScreen extends StatefulWidget {
  const ProfileEventsScreen({
    super.key,
  });

  @override
  State<ProfileEventsScreen> createState() => _ProfileEventsScreenState();
}

// to check ehich screen is activated
int active = 0;

class _ProfileEventsScreenState extends State<ProfileEventsScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      height: screenHeight,
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
              topButtons(context),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: SizedBox(
                  height: screenHeight / 1.4,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    children: active == 0
                        ? [
                            const CustomEventCard(
                              nameAndAge: "Max, 26",
                              activity: "Running",
                              dateText: "April 12 | 19 hr 1 min",
                              time: "9:20 AM",
                              imageLocation: "assets/extras/event_image1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Emily, 30",
                              activity: "Swimming",
                              dateText: "May 3 | 11 hr 1 min",
                              time: "2:30 PM",
                              imageLocation: "assets/extras/event_image3.jpg",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Alex, 23",
                              activity: "Tennis",
                              dateText: "June 8 | 19 hr 1 min",
                              time: "5:00 PM",
                              imageLocation: "assets/extras/bottomBack1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Sophia, 28",
                              activity: "Yoga",
                              dateText: "July 15 | 19 hr 1 min",
                              time: "8:15 AM",
                              imageLocation: "assets/extras/event_image2.png",
                            ),
                          ]
                        : [
                            const CustomEventCard(
                              nameAndAge: "Emily, 30",
                              activity: "Swimming",
                              dateText: "May 3 | 19 hr 1 min",
                              time: "2:30 PM",
                              imageLocation: "assets/extras/event_image3.jpg",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Alex, 23",
                              activity: "Tennis",
                              dateText: "June 8 | 19 hr 1 min",
                              time: "5:00 PM",
                              imageLocation: "assets/extras/bottomBack1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Max, 26",
                              activity: "Running",
                              dateText: "April 12 | 19 hr 1 min",
                              time: "9:20 AM",
                              imageLocation: "assets/extras/event_image1.png",
                            ),
                            const SizedBox(height: 6),
                            const CustomEventCard(
                              nameAndAge: "Sophia, 28",
                              activity: "Yoga",
                              dateText: "July 15 | 19 hr 1 min",
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
