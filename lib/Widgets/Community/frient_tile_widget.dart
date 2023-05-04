import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Screens/Community_Screens/view_friend.dart';

class FriendTile extends StatelessWidget {
  const FriendTile({
    super.key,
    required this.name,
    required this.events,
    required this.profileLocation,
  });
  final String name, events, profileLocation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CupertinoListTile(
        backgroundColorActivated: textColor.withOpacity(
          0.2,
        ),
        onTap: () => Get.to(
          () => ViewFriendProfile(
            dp: profileLocation,
            location: "Poland. Warsaw",
            nameAndAge: "$name, 26",
          ),
        ),
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
          "$events events",
          style: smallStyle,
        ),
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.right_chevron,
            color: blackColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
