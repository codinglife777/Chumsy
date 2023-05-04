import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

class CustomFeedCard extends StatelessWidget {
  const CustomFeedCard({
    super.key,
    required this.name,
    required this.time,
    required this.cheers,
    required this.comments,
    required this.imageLocation,
    required this.profileLocation,
    required this.textData,
  });
  final String name,
      time,
      cheers,
      comments,
      imageLocation,
      profileLocation,
      textData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoListTile(
            padding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: neonColor,
              foregroundImage: AssetImage(profileLocation),
            ),
            leadingSize: 45,
            title: Text(
              name,
              style: regularStyleBold.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              time,
              style: smallStyle,
            ),
            trailing: CupertinoButton(
              child: const Icon(
                Icons.more_horiz_outlined,
                color: blackColor,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
          spacingBox,
          Text(
            textData,
            style: smallStyle,
            textAlign: TextAlign.start,
          ),
          spacingBox,
          Image.asset(
            imageLocation,
            width: screenWidth,
          ),
          spacingBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$cheers cheers",
                style: smallStyle,
              ),
              Text(
                "$comments comments",
                style: smallStyle,
              ),
            ],
          ),
          spacingBox,
          Divider(
            color: textColor.withOpacity(
              0.1,
            ),
            thickness: 2,
          ),
          SizedBox(
            width: screenWidth,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset(
                          "assets/home/Path 5340@2x.png",
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 6.7,
                      ),
                      const Expanded(
                        flex: 0,
                        child: Text(
                          "Cheer",
                          style: smallStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 26.9,
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset(
                          "assets/home/Speech_Bubble_48_@2x.png",
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 6.7,
                      ),
                      const Expanded(
                        flex: 0,
                        child: Text(
                          "Comment",
                          style: smallStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 26.9,
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset(
                          "assets/home/send@2x.png",
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 6.7,
                      ),
                      const Expanded(
                        flex: 0,
                        child: Text(
                          "Comment",
                          style: smallStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
