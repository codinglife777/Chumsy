import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/custom_switch.dart';
import 'create_event_category_screen.dart';
import 'create_event_location_screen.dart';
import 'create_event_time_screen.dart';
import 'create_gender_screen.dart';
import 'create_level_screen.dart';
import 'create_price_screen.dart';
import 'create_type_screen.dart';
import 'create_with_whom_screen.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int numberChumsys = 1;
  bool isAdvanced = false;
  bool needMaster = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildRow("Category", "Choose", () {
                            Get.to(() => const CreateEventCategory());
                          }),
                          buildRow("Time", "Choose", () {
                            Get.to(() => const CreateEventTime());
                          }),
                          buildRow("Location", "Choose", () {
                            Get.to(() => const CreateEventLocation());
                          }),
                          buildRow("Price", "Free", () {
                            Get.to(() => const CreateEventPrice());
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Number of Chumsys",
                                  style: regularStyleBold.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      borderRadius: BorderRadius.circular(
                                        100,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (numberChumsys > 1) {
                                            numberChumsys--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          color: const Color(0XFFF2F2F2),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.minus,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        numberChumsys.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      borderRadius: BorderRadius.circular(
                                        100,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          numberChumsys++;
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
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
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.add,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          isAdvanced
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Need a Master?",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          CustomSwitch(
                                            value: needMaster,
                                            isDarkBtn: true,
                                            isLight: true,
                                            changeColor: false,
                                            color2: neonColor,
                                            onChanged: (bool val) {
                                              setState(() {
                                                needMaster = val;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    buildRow("With whom?", "Choose", () {
                                      Get.to(() => const CreateEventWIthWhom(
                                            btnText: "SAVE",
                                          ));
                                    }),
                                    buildRow("Level", "Choose", () {
                                      Get.to(() => const CreateEventLevel(
                                            btnText: "SAVE",
                                          ));
                                    }),
                                    buildRow("Type", "Choose", () {
                                      Get.to(() => const CreateEventType(
                                            btnText: "SAVE",
                                          ));
                                    }),
                                    buildRow("Gender", "Choose", () {
                                      Get.to(() => const CreateEventGender(
                                            btnText: "SAVE",
                                          ));
                                    }),
                                    buildRow("Age", "Choose", () {}),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Add Description",
                                          style: smallStyleBold,
                                        ),
                                        spacingBox,
                                        spacingBox,
                                        CupertinoTextField(
                                          maxLines: 5,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 12,
                                          ),
                                          placeholder: "This event will be...",
                                          placeholderStyle: smallStyle,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: textColor.withOpacity(
                                              0.1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    top: 55,
                                  ),
                                  child: CupertinoButton(
                                    child: const Text(
                                      "Advanced",
                                      style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                        color: blackColor,
                                        decorationColor: blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isAdvanced = !isAdvanced;
                                      });
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 66,
                      left: 40,
                      right: 40,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "CREATE AN EVENT",
                            style: regularStyleBold,
                          ),
                        ],
                      ),
                      onTapFunction: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const EventAppBar(
            title: "Create an event",
          ),
        ],
      ),
    );
  }
}
