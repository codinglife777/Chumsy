import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Controllers/image_controller.dart';
import 'package:chumsy_app/Screens/Complete_Profile_Screens/profile_screen_qualification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/custom_switch.dart';

class CreateProfile4 extends StatefulWidget {
  const CreateProfile4({super.key});

  @override
  State<CreateProfile4> createState() => _CreateProfile4State();
}

class _CreateProfile4State extends State<CreateProfile4> {
  bool needMaster = false;
  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());
    return Theme(
      // data: const CupertinoThemeData(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: blackColor,
      //   barBackgroundColor: blackColor,
      // ),
      data: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: blackColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          toolbarHeight: 64.5,
          centerTitle: true,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.back,
              color: whiteColor,
              size: 30,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            "Complete your profile",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        // navigationBar: CupertinoNavigationBar(
        //   leading: CupertinoButton(
        //     padding: EdgeInsets.zero,
        //     child: const Icon(
        //       CupertinoIcons.back,
        //       color: whiteColor,
        //       size: 30,
        //     ),
        //     onPressed: () => Get.back(),
        //   ),
        //   middle: const Text(
        //     "Complete your profile",
        //     style: TextStyle(
        //       color: whiteColor,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 18,
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  width: screenWidth,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: neonColor2,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                children: [
                  spacingBoxExtended,
                  Obx(
                    () => Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: screenWidth / 8.6,
                                backgroundColor: whiteColor,
                                child: imageController.image.value.path != ""
                                    ? CircleAvatar(
                                        backgroundColor: whiteColor,
                                        foregroundImage: FileImage(
                                            imageController.image.value),
                                        radius: screenWidth / 8.6 - 1,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: whiteColor,
                                        foregroundImage: const AssetImage(
                                          "assets/register/avatar.png",
                                        ),
                                        radius: screenWidth / 8.6 - 1,
                                      ),
                              ),
                              if (needMaster)
                                SizedBox(
                                  height: screenWidth / 4.2,
                                  width: screenWidth / 4.2,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 31,
                                      width: screenWidth / 6.5,
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
                                        child: Text(
                                          "Master",
                                          style: regularStyleBold.copyWith(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  spacingBox,
                  spacingBox,
                  const Center(
                    child: Text(
                      "Emily Benneth, 26",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Center(
                    child: Text(
                      "Poland, Warsaw",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: screenHeight / 2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomSwitch(
                                value: needMaster,
                                isDarkBtn: false,
                                isLight: false,
                                changeColor: false,
                                color2: neonColor,
                                onChanged: (bool val) {
                                  setState(() {
                                    needMaster = val;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Are you a Master? *",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          CustomGradientButtonWidget(
                            buttonWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "CREATE ACCOUNT",
                                  style: regularStyleBold,
                                ),
                              ],
                            ),
                            onTapFunction: () {
                              Get.to(() => const CreateProfileQualification());
                            },
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          const Text(
                            "* Would you like to be able to host events as a trainer / lecturer?",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
