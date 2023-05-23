import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:flutter/cupertino.dart';

import '../../Constants/sizes.dart';
import '../My_Events/saved_bottom_sheet.dart';

typedef EventCardCallback = Function(String imgLocation, String avatar,
    String title, String nameAge, String desc);

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({
    super.key,
    required this.nameAndAge,
    required this.time,
    required this.dateText,
    required this.activity,
    this.location,
    required this.imageLocation,
    this.cbClicked,
  });
  final String nameAndAge, time, dateText, activity, imageLocation;
  final String? location;
  final EventCardCallback? cbClicked;

  @override
  Widget build(BuildContext context) {
    String _location = location ?? "";

    return GestureDetector(
      onTap: () {
        if (cbClicked != null) {
          cbClicked!(
              imageLocation,
              'assets/register/avatar@2x.png',
              activity,
              nameAndAge,
              "This is the event description, lorem ipsum dolor sit amet. consectetur adipiscing elit");
        }
      },
      child: Row(
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
              _location == ""
                  ? const SizedBox()
                  : const SizedBox(
                      height: 6,
                    ),
              _location == ""
                  ? const SizedBox()
                  : Row(
                      children: [
                        Image.asset(
                          "assets/home/map_bottom@3x.png",
                          width: 12,
                        ),
                        horizontalSpacingBoxSmall,
                        Text(
                          _location,
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
      ),
    );
  }
}
