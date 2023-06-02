import 'package:chumsy_app/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/sizes.dart';
import '../Screens/Community_Screens/mng_bottom_bar.dart';

Widget buildProfileSettingsRow(String leftText, VoidCallback vcb) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: vcb,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: regularStyleBold.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            CupertinoIcons.right_chevron,
            color: blackColor,
          ),
        ],
      ),
    ),
  );
}

Widget buildProfileFriendRow(String title, String subTitlle, String image) {
  return GestureDetector(onTap: (){
    Get.to(
          () => ViewFriendPage(
            dp: image,
            location: "Warsaw, Poland",
            nameAndAge: "$title, 26",
            isProfile: true,
          ),
        );
  }, child: Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 40,
    ),
    child: SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: CupertinoListTile(
              padding: EdgeInsets.zero,
              leadingSize: 45,
              leading: CircleAvatar(
                foregroundImage: AssetImage(image),
                backgroundColor: neonColor,
              ),
              title: Text(
                title,
                style: regularStyleBold.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                subTitlle,
                style: smallStyle,
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: Icon(
              CupertinoIcons.right_chevron,
              color: blackColor,
            ),
          ),
        ],
      ),
    ),
  ));
}
