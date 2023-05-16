import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/Complete_Profile_Screens/profile_screen3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';

class CreateProfile2 extends StatefulWidget {
  const CreateProfile2({super.key});

  @override
  State<CreateProfile2> createState() => _CreateProfile2State();
}

class _CreateProfile2State extends State<CreateProfile2> {
  List<String> genders = ["Male", "Female", "Non-binary"];
  int selected = 0;
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
          toolbarHeight: 55,
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
            spacingBox,
            spacingBox,
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Column(
                  children: [
                    spacingBoxExtended,
                    const Center(
                      child: Text(
                        "What is your sex?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: screenHeight / 2,
                          child: CupertinoPicker(
                            itemExtent: 35,
                            backgroundColor: transparentColor,
                            selectionOverlay: Container(
                              color: transparentColor,
                            ),
                            onSelectedItemChanged: (value) {},
                            offAxisFraction: 0,
                            squeeze: 1,
                            diameterRatio: 1,
                            magnification: 1.05,
                            scrollController: FixedExtentScrollController(
                              initialItem: 1,
                            ),
                            children: genders
                                .map(
                                  (e) => Text(
                                    e,
                                    style: const TextStyle(
                                      color: whiteColor,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: SizedBox(
                            height: screenHeight / 2.06,
                            child: Center(
                              child: Container(
                                height: 51,
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  border: Border.all(
                                    color: neonColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: screenHeight / 2,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       for (int i = 0; i < genders.length; i++)
                    //         GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               selected = i;
                    //             });
                    //           },
                    //           child: Container(
                    //             width: screenWidth / 3,
                    //             height: 50,
                    //             decoration: BoxDecoration(
                    //               border: selected == i
                    //                   ? Border.all(
                    //                       color: neonColor,
                    //                       width: 2,
                    //                     )
                    //                   : Border.all(
                    //                       width: 0,
                    //                       color: transparentColor,
                    //                     ),
                    //               borderRadius: BorderRadius.circular(
                    //                 100,
                    //               ),
                    //             ),
                    //             padding: const EdgeInsets.symmetric(
                    //               horizontal: 15,
                    //               vertical: 10,
                    //             ),
                    //             child: Center(
                    //               child: Text(
                    //                 genders[i],
                    //                 style: const TextStyle(
                    //                   color: whiteColor,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    CustomGradientButtonWidget(
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
                        Get.to(() => const CreateProfile3());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
