import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Screens/Community_Screens/friend_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_profile_settings_row.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Functions/chat_bottom_sheet.dart';
import '../Chat_screens/chatting_screen.dart';
import 'eveents_screen.dart';

class ViewFriendProfile extends StatefulWidget {
  const ViewFriendProfile({
    super.key,
    required this.dp,
    required this.nameAndAge,
    required this.location,
  });
  final String dp, nameAndAge, location;

  @override
  State<ViewFriendProfile> createState() => _ViewFriendProfileState();
}

class _ViewFriendProfileState extends State<ViewFriendProfile> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      backgroundColor: whiteColor,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      neonColor,
                      blueColor,
                    ],
                  ),
                ),
                child: FractionalTranslation(
                  translation: const Offset(
                    0.0,
                    0.25,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: CircleAvatar(
                        foregroundImage: AssetImage(widget.dp),
                        radius: 53,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 63,
              ),
              Text(
                widget.nameAndAge,
                style: headingStyle24,
              ),
              spacingBoxSmall,
              Text(
                widget.location,
                style: smallStyle,
              ),
              spacingBox,
              CupertinoButton(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(
                  100,
                ),
                onPressed: () {
                  Get.to(() => ChattingScreen(name: widget.nameAndAge,surName: '',image: widget.dp,));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        neonColor,
                        blueColor,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/home/chat_bottom@2x.png",
                      width: 15,
                    ),
                  ),
                ),
              ),
              spacingBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProfileSettingsRow(l.events,
                      () => Get.to(() => const ProfileEventsScreen())),
                  spacingBoxExtended,
                  buildProfileSettingsRow(l.posts, () => Get.to(() => const FriendPosts())),
                  const SizedBox(
                    height: 23,
                  ),
                  Divider(
                    thickness: 2,
                    color: textColor.withOpacity(
                      0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      l.friends,
                      style: subHeadingStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  buildProfileFriendRow(
                      "Dee McRobie", "Warsaw", "assets/extras/dp_2.jpg"),
                  const SizedBox(
                    height: 17,
                  ),
                  buildProfileFriendRow(
                      "Luke Edison", "London", "assets/extras/dp_4.jpg"),
                  spacingBox,
                ],
              ),
            ],
          ),
          Column(
            children: [
              topAppBarSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.more_horiz_outlined,
                      color: blackColor,
                    ),
                    onPressed: () {
                      showChatBottomSheet(context, true);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
