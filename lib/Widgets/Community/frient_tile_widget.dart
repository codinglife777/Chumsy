import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Screens/Community_Screens/mng_bottom_bar.dart';

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
          () => ViewFriendPage(
            dp: profileLocation,
            location: "Warsaw, Poland",
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

class FriendRequestTile extends StatelessWidget {
  const FriendRequestTile({
    super.key,
    required this.name,
    required this.location,
    required this.profileLocation,
  });
  final String name, location, profileLocation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CupertinoListTile(
        backgroundColorActivated: textColor.withOpacity(
          0.2,
        ),
        // onTap: () => Get.to(
        //   () => ViewFriendPage(
        //     dp: profileLocation,
        //     location: location,
        //     nameAndAge: "$name, 26",
        //   ),
        // ),
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
          location,
          style: smallStyle,
        ),
        trailing: Row(children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(
              100,
            ),
            onPressed: () {},
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  100,
                ),
                border: Border.all(color: Colors.black),
                gradient: const LinearGradient(
                  colors: [
                    neonColor,
                    blueColor,
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.clear_thick,
                  color: blackColor,
                  size: 16,
                ),
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(
              100,
            ),
            onPressed: () {},
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  100,
                ),
                border: Border.all(color: Colors.black),
                gradient: const LinearGradient(
                  colors: [
                    neonColor,
                    blueColor,
                  ],
                ),
              ),
              child: const Center(
                child: Icon(CupertinoIcons.check_mark,
                    color: blackColor, size: 16),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
