import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Screens/My_Profile_Screens/edit_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_profile_settings_row.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../Community_Screens/eveents_screen.dart';
import 'Edit_Screens/my_posts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      height: screenHeight,
      color: whiteColor,
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
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
                    // child: FractionalTranslation(
                    //   translation: const Offset(
                    //     0.0,
                    //     0.25,
                    //   ),
                      // child: ,
                    // ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25 - 55) ,
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/register/avatar@2x.png"),
                            radius: 53,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.to(
                                () => const EditHomePage(),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                child: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 16,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: blackColor,
                                    child: Icon(
                                      CupertinoIcons.pencil,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              
              // const SizedBox(
              //   height: 63,
              // ),
              const Text(
                'Emily Benneth, 26',
                style: headingStyle24,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Warsaw, Poland',
                style: smallStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildProfileSettingsRow(l.events,
                        () => Get.to(() => const ProfileEventsScreen())),
                    const SizedBox(
                      height: 30,
                    ),
                    buildProfileSettingsRow(l.posts, () => Get.to(() => const MyPosts())),
                    const SizedBox(
                      height: 23,
                    ),
                    Divider(
                      color: textColor.withOpacity(
                        0.2,
                      ),
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
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
              ),
            ],
          ),
          Column(
            children: [
              topAppBarSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // CupertinoButton(
                  //   padding: EdgeInsets.zero,
                  //   child: const Icon(
                  //     CupertinoIcons.back,
                  //     color: blackColor,
                  //     size: 24,
                  //   ),
                  //   onPressed: () => Get.back(),
                  // ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.gear,
                      color: blackColor,
                      size: 24,
                    ),
                    onPressed: () => Get.to(
                      () => const EditHomePage(),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
