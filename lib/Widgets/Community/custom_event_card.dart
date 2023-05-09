import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:flutter/cupertino.dart';

import '../../Constants/sizes.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({
    super.key,
    required this.nameAndAge,
    required this.time,
    required this.dateText,
    required this.activity,
    required this.imageLocation,
  });
  final String nameAndAge, time, dateText, activity, imageLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              imageLocation,
              width: screenWidth / 4,
            ),
            SizedBox(
              width: screenWidth / 4,
              height: 50,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  width: 76,
                  height: 21,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(
                        100,
                      ),
                      right: Radius.zero,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: smallStyleBold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 26,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              activity,
              style: regularStyleBold.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            spacingBox,
            Row(
              children: [
                const Icon(
                  CupertinoIcons.time,
                  size: 14.1,
                  color: blackColor,
                ),
                horizontalSpacingBoxSmall,
                Text(
                  dateText,
                  style: smallStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              nameAndAge,
              style: subHeadingStyle,
            ),
          ],
        ),
      ],
    );
  }
}
