// event card used in finished and planned
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:chumsy_app/Widgets/My_Events/planned_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'finished_bottom_sheet.dart';

class CustomMyEventCard extends StatelessWidget {
  const CustomMyEventCard({
    super.key,
    required this.name,
    required this.time,
    required this.month,
    required this.cardTitle,
    required this.date,
    required this.profileLocation,
    required this.buttonText,
    required this.subName,
    required this.cardSubTitle,
  });
  final String name,
      time,
      month,
      cardTitle,
      date,
      profileLocation,
      buttonText,
      subName,
      cardSubTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: buttonText.contains("PAYMENT") ? eventCardColor : whiteColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 2,
                              color: blackColor,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CupertinoListTile(
                              padding: EdgeInsets.zero,
                              title: AutoSizeText(
                                cardTitle,
                                style: regularStyleBold.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                softWrap: true,
                              ),
                              subtitle: AutoSizeText(
                                cardSubTitle,
                                style: smallStyle,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                            spacingBox,
                            CupertinoListTile(
                              padding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: eventCardColor,
                                foregroundImage: AssetImage(profileLocation),
                              ),
                              leadingSize: 39,
                              title: AutoSizeText(
                                name,
                                style: regularStyleBold.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                softWrap: true,
                              ),
                              subtitle: AutoSizeText(
                                subName,
                                style: smallStyle,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            AutoSizeText(
                              month,
                              style: smallStyleBold,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            spacingBoxSmall,
                            AutoSizeText(
                              date,
                              style: headingStyle24.copyWith(
                                fontSize: 25,
                              ),
                              maxLines: 1,
                              softWrap: true,
                            ),
                            spacingBoxSmall,
                            AutoSizeText(
                              time,
                              style: regularStyleBold,
                              maxLines: 1,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                spacingBox,
                CustomGradientButtonWidget(
                  buttonWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        buttonText,
                        style: regularStyleBold,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ],
                  ),
                  onTapFunction: () {
                    if (buttonText.contains("MANAGE")) {
                      plannedEventBottomSheet(
                          context,
                          "assets/extras/bottomBack2.png",
                          profileLocation,
                          cardTitle,
                          name,
                          "26",
                          cardSubTitle);
                    } else if (buttonText.contains("SEE")) {
                      finishedEventBottomSheet(
                          context,
                          "assets/extras/bottomBack1.png",
                          profileLocation,
                          cardTitle,
                          name,
                          "26",
                          cardSubTitle);
                    }
                  },
                ),
              ],
            ),
          ),
          if (buttonText.contains("PAYMENT"))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: eventCardColor,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "\$",
                      style: regularStyleBold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
