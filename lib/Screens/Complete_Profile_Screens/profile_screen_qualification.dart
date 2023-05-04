import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:get/get.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import 'qualification_items_list.dart';

class CreateProfileQualification extends StatefulWidget {
  const CreateProfileQualification({super.key});

  @override
  State<CreateProfileQualification> createState() =>
      _CreateProfileQualificationState();
}

class _CreateProfileQualificationState
    extends State<CreateProfileQualification> {
  String selected = "Sports";
  final TextEditingController searchCont = TextEditingController();
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
        //     "Qualifications",
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
            "Qualifications",
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
                  width: screenWidth,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: neonColor2,
                  ),
                )
              ],
            ),
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
                        "Because you are a Master please let us know in what categories you specialise",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        height: 51,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: ["Sports", "Lifestyle"]
                              .map(
                                (e) => Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        100,
                                      ),
                                      gradient: selected.contains(e)
                                          ? const LinearGradient(
                                              colors: [
                                                neonColor,
                                                blueColor,
                                              ],
                                            )
                                          : const LinearGradient(
                                              colors: [
                                                whiteColor,
                                                whiteColor,
                                              ],
                                            ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected = e;
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          e,
                                          style: regularStyleBold.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    spacingBox,
                    spacingBox,
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20.12,
                          ),
                          Expanded(
                            flex: 0,
                            child: Icon(
                              CupertinoIcons.search,
                              color: blackColor.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Expanded(
                            flex: 1,
                            child: CupertinoTextField(
                              controller: searchCont,
                              padding: EdgeInsets.zero,
                              placeholder: 'Search',
                              placeholderStyle: const TextStyle(
                                color: greyIconColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Stack(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: screenHeight / 2.5,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            addRepaintBoundaries: false,
                            children: [
                              ChipSets2(
                                listOfChips: items1,
                              ),
                              ChipSets2(
                                listOfChips: items2,
                              ),
                              ChipSets2(
                                listOfChips: items3,
                              ),
                              ChipSets2(
                                listOfChips: items4,
                              ),
                              ChipSets2(
                                listOfChips: items5,
                              ),
                              ChipSets2(
                                listOfChips: items6,
                              ),
                              ChipSets2(
                                listOfChips: items3,
                              ),
                              ChipSets2(
                                listOfChips: items4,
                              ),
                            ],
                          ),
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: screenHeight / 2.5,
                              minWidth: screenWidth,
                            ),
                            height: screenHeight / 2.5,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  spreadRadius: 8,
                                  offset: const Offset(
                                    -6,
                                    -20,
                                  ),
                                  inset: true,
                                  color: blackColor.withOpacity(0.8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
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
                        Get.to(() => const LandingPage());
                      },
                    ),
                    spacingBox,
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
