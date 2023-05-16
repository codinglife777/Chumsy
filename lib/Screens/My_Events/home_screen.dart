import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Screens/My_Events/update_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/spacing.dart';
import '../../Functions/update_event.dart';
import '../../Widgets/My_Events/event_card.dart';
import '../../Widgets/My_Events/event_card2.dart';

class MyEventHome extends StatefulWidget {
  const MyEventHome({
    super.key,
  });

  @override
  State<MyEventHome> createState() => _MyEventHomeState();
}

// to check ehich screen is activated
int active = 0;

class _MyEventHomeState extends State<MyEventHome> {
  void updateEvent() {
    Get.back();
    seeUpdateEvent(context);
  }

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
              spacingBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "My Events",
                    style: subHeadingStyle,
                  ),
                ],
              ),
              const Divider(),
              spacingBox,
              spacingBox,
              topButtons(),
              spacingBox,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: SizedBox(
                  height: screenHeight / 1.45,
                  child: ListView(
                    // shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    children: active == 0
                        ? [
                            CustomMyEventCard(
                              name: "You",
                              subName: "",
                              cardSubTitle: "Lazienki Park",
                              time: "9:20 AM",
                              buttonText: "MANAGE",
                              date: '25',
                              month: 'May',
                              cardTitle: "Running",
                              profileLocation: "assets/extras/dp_2.jpg",
                              updateEvent: updateEvent,
                            ),
                            spacingBox,
                            CustomMyEventCard(
                              name: "Dee McRobie",
                              subName: "Contact Dee",
                              cardSubTitle: "Address Lorem Ipsum",
                              time: "9:20 AM",
                              buttonText: "PROCEED TO PAYMENT",
                              date: '29',
                              month: 'June',
                              cardTitle: "Running",
                              profileLocation: "assets/extras/dp_4.jpg",
                              updateEvent: () {},
                            ),
                            spacingBox,
                            CustomMyEventCard(
                              name: "Luke Edison",
                              subName: "Contact Luke",
                              cardSubTitle: "Address Lorem Ipsum",
                              time: "12:20 PM",
                              buttonText: "CANCEL",
                              date: '24',
                              month: 'July',
                              cardTitle: "Running",
                              profileLocation: "assets/extras/dp_1.jpg",
                              updateEvent: () {},
                            ),
                          ]
                        : active == 1
                            ? [
                                CustomMyEventCard(
                                  name: "Max Smith",
                                  subName: "Contact Max",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:20 PM",
                                  buttonText: "SEE DETAILS",
                                  date: '21',
                                  month: 'July',
                                  cardTitle: "Running",
                                  profileLocation: "assets/extras/dp_3.jpg",
                                  updateEvent: () {},
                                ),
                                spacingBox,
                                CustomMyEventCard(
                                  name: "Dee McRob.",
                                  subName: "Contact Dee",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "01:20 PM",
                                  buttonText: "SEE DETAILS",
                                  date: '22',
                                  month: 'May',
                                  cardTitle: "Gymnastics",
                                  profileLocation: "assets/extras/dp_1.jpg",
                                  updateEvent: () {},
                                ),
                                spacingBox,
                                CustomMyEventCard(
                                  name: "Luke Edison",
                                  subName: "Contact Luke",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:00 PM",
                                  buttonText: "SEE DETAILS",
                                  date: '24',
                                  month: 'May',
                                  cardTitle: "Swimming",
                                  profileLocation: "assets/extras/dp_2.jpg",
                                  updateEvent: () {},
                                ),
                                spacingBox,
                                CustomMyEventCard(
                                  name: "Luke Edison",
                                  subName: "Contact Luke",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:20 PM",
                                  buttonText: "SEE DETAILS",
                                  date: '24',
                                  month: 'July',
                                  cardTitle: "Running",
                                  profileLocation: "assets/extras/dp_3.jpg",
                                  updateEvent: () {},
                                ),
                                spacingBox,
                              ]
                            : [
                                const CustomMyEventCard2(
                                  name: "Luke Edison",
                                  subName: "Contact Luke",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:20 PM",
                                  date: '24',
                                  month: 'July',
                                  cardTitle: "Running",
                                  profileLocation: "assets/extras/dp_3.jpg",
                                ),
                                spacingBox,
                                const CustomMyEventCard2(
                                  name: "Luke Edison",
                                  subName: "Contact Luke",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:20 PM",
                                  date: '25',
                                  month: 'MAY',
                                  cardTitle: "Running",
                                  profileLocation: "assets/extras/dp_2.jpg",
                                ),
                                spacingBox,
                                const CustomMyEventCard2(
                                  name: "Luke Edison",
                                  subName: "Contact Luke",
                                  cardSubTitle: "Address Lorem Ipsum",
                                  time: "12:20 PM",
                                  date: '21',
                                  month: 'March',
                                  cardTitle: "Running",
                                  profileLocation: "assets/extras/dp_1.jpg",
                                ),
                                spacingBox,
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
  Row topButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
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
                "Planned",
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
        horizontalSpacingBox,
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
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
                "Finished",
                style: regularStyleBold.copyWith(
                  color: active == 1 ? whiteColor : blackColor,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                maxLines: 1,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 1;
            });
          },
        ),
        horizontalSpacingBox,
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
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
                "Saved",
                style: regularStyleBold.copyWith(
                  color: active == 2 ? whiteColor : blackColor,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                maxLines: 1,
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
