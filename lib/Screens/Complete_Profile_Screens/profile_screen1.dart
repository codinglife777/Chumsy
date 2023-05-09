import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/Complete_Profile_Screens/profile_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
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
        body: SingleChildScrollView(
          child: Column(
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
                    width: screenWidth / 6,
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    spacingBoxExtended,
                    const Center(
                      child: Text(
                        "What is your age?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: SizedBox(
                            height: screenHeight / 2,
                            child: CupertinoTheme(
                              data: const CupertinoThemeData(
                                brightness: Brightness.dark,
                                textTheme: CupertinoTextThemeData(
                                  dateTimePickerTextStyle: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              child: CupertinoDatePicker(
                                minuteInterval: 1,
                                backgroundColor: Colors.transparent,
                                dateOrder: DatePickerDateOrder.dmy,
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (val) {},
                              ),
                            ),
                          ),
                        ),
                        // IgnorePointer(
                        //   ignoring: true,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       border: Border(
                        //         top: BorderSide(
                        //           color: blackColor,
                        //           width: screenHeight / 10.5,
                        //         ),
                        //         bottom: BorderSide(
                        //           color: blackColor,
                        //           width: screenHeight / 10.5,
                        //         ),
                        //       ),
                        //     ),
                        //     width: screenWidth + 50,
                        //     height: screenHeight / 2,
                        //     child: Center(
                        //       child: Container(
                        //         height: double.infinity,
                        //         width: screenWidth * 1.5,
                        //         decoration: const BoxDecoration(
                        //           border: Border(
                        //             bottom: BorderSide(
                        //               color: blackColor,
                        //               width: 5,
                        //             ),
                        //             top: BorderSide(
                        //               color: blackColor,
                        //               width: 5,
                        //             ),
                        //           ),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               blurRadius: 20,
                        //               spreadRadius: 40,
                        //               color: blackColor,
                        //               // inset: true,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        IgnorePointer(
                          ignoring: true,
                          child: SizedBox(
                            height: screenWidth / 2,
                            width: screenWidth / 2,
                            child: Center(
                              child: Container(
                                height: 43,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 55,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                  border: Border.all(
                                    color: neonColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spacingBoxExtended,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: CustomGradientButtonWidget(
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "NEXT",
                              style: regularStyleBold,
                            ),
                          ],
                        ),
                        onTapFunction: () {
                          Get.to(() => const CreateProfile2());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
