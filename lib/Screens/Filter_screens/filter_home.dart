import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Screens/Create_Event/create_gender_screen.dart';
import 'package:chumsy_app/Screens/Create_Event/create_level_screen.dart';
import 'package:chumsy_app/Screens/Create_Event/create_type_screen.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/custom_switch.dart';
import '../Create_Event/create_price_screen.dart';
import '../Create_Event/create_with_whom_screen.dart';
import 'filter_category_screen.dart';
import 'filter_time_screen.dart';

class FilterHome extends StatefulWidget {
  const FilterHome({super.key});

  @override
  State<FilterHome> createState() => _FilterHomeState();
}

class _FilterHomeState extends State<FilterHome> {
  int numberChumsys = 1;
  bool showLocationSlider = false;
  bool showAgeSlider = false;
  bool isAdvanced = false;
  SfRangeValues ageRange = const SfRangeValues(25.1, 45.2);
  bool needMaster = false;
  double locationSlider = 50;
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
                            Get.to(() => const FilterCategory());
                          }),
                          buildRow("Time", "Choose", () {
                            Get.to(() => const FilterTime());
                          }),
                          buildRow("Location", "Warsaw", () {
                            setState(() {
                              showLocationSlider = !showLocationSlider;
                            });
                          }),
                          if (showLocationSlider)
                            SizedBox(
                              height: 70,
                              width: screenWidth,
                              child: SfSlider(
                                min: 0,
                                max: 500,
                                tooltipShape: const SfPaddleTooltipShape(),
                                activeColor: activeColor,
                                inactiveColor: blackColor,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  formattedText =
                                      "+${double.parse(formattedText).floor().toString()}";
                                  return formattedText;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    locationSlider = value;
                                  });
                                },
                                value: locationSlider,
                              ),
                            ),
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
                                            isDarkBtn: false,
                                            isLight: true,
                                            changeColor: true,
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
                                            btnText: "APPLY",
                                          ));
                                    }),
                                    buildRow("Level", "Choose", () {
                                      Get.to(() => const CreateEventLevel(
                                            btnText: "APPLY",
                                          ));
                                    }),
                                    buildRow("Type", "Choose", () {
                                      Get.to(() => const CreateEventType(
                                            btnText: "APPLY",
                                          ));
                                    }),
                                    buildRow("Gender", "Choose", () {
                                      Get.to(() => const CreateEventGender(
                                            btnText: "APPLY",
                                          ));
                                    }),
                                    buildRow("Age",
                                        "${ageRange.start.floor()}-${ageRange.end.floor()}",
                                        () {
                                      setState(() {
                                        showAgeSlider = !showAgeSlider;
                                      });
                                    }),
                                    if (showAgeSlider)
                                      SizedBox(
                                        height: 70,
                                        width: screenWidth,
                                        child: SfRangeSlider(
                                          values: ageRange,
                                          min: 1,
                                          max: 120,
                                          interval: 1,
                                          tooltipShape:
                                              const SfPaddleTooltipShape(),
                                          activeColor: activeColor,
                                          inactiveColor: blackColor,
                                          enableTooltip: true,
                                          tooltipTextFormatterCallback:
                                              (actualValue, formattedText) {
                                            formattedText =
                                                double.parse(formattedText)
                                                    .floor()
                                                    .toString();
                                            return formattedText;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              ageRange = value;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 55),
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
                            "APPLY FILTERS",
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
            title: "Filters",
          ),
        ],
      ),
    );
  }
}
