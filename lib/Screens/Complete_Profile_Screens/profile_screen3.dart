import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/Complete_Profile_Screens/profile_screen4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Functions/cupertino_action_sheet.dart';
import '../../Controllers/image_controller.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';

class CreateProfile3 extends StatefulWidget {
  const CreateProfile3({super.key});

  @override
  State<CreateProfile3> createState() => _CreateProfile3State();
}

class _CreateProfile3State extends State<CreateProfile3> {
  final ImageController imageController = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
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
        body: Obx(
          () => Column(
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
                    width: screenWidth / 3,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: neonColor2,
                    ),
                  )
                ],
              ),
              spacingBox,
              spacingBox,
              spacingBox,
              spacingBox,
              spacingBox,
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      spacingBoxExtended,
                      const Center(
                        child: Text(
                          "Upload your\nprofile picture",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          height: screenHeight / 2.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              imageController.image.value.path != ""
                                  ? CircleAvatar(
                                      radius: screenWidth / 8,
                                      backgroundColor: whiteColor,
                                      child: CircleAvatar(
                                        backgroundColor: whiteColor,
                                        foregroundImage: FileImage(
                                            imageController.image.value),
                                        radius: screenWidth / 8 - 2,
                                      ),
                                    )
                                  : Image.asset(
                                      imageController.showImage.value
                                          ? "assets/register/avatar.png"
                                          : "assets/register/upload_photo.png",
                                      width: screenWidth / 3,
                                      height: screenWidth / 3,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      if (imageController.showImage.value)
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          color: transparentColor,
                          onPressed: () {
                            showActionSheet(
                                context, imageController, "Take a Photo");
                          },
                          child: Container(
                            height: 51,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              border: Border.all(
                                color: whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "CHANGE A PHOTO",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              imageController.showImage.value
                                  ? "NEXT"
                                  : "CHOOSE A PHOTO",
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          if (imageController.showImage.value) {
                            Get.to(() => const CreateProfile4());
                          } else {
                            showActionSheet(
                                context, imageController, "Take a Photo");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
