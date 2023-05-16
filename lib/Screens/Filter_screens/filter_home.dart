import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Functions/show_google_map.dart';
import 'package:chumsy_app/Screens/Community_Screens/add_contact_screen.dart';
import 'package:chumsy_app/Screens/Create_Event/create_gender_screen.dart';
import 'package:chumsy_app/Screens/Create_Event/create_level_screen.dart';
import 'package:chumsy_app/Screens/Create_Event/create_type_screen.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:slidable_button/slidable_button.dart';

import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Styles/styles.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/custom_slider_tooptip.dart';
import '../../Widgets/Extra Widgets/custom_switch.dart';
import '../../Widgets/Extra Widgets/google_map.dart';
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
  bool ageChanged = false;
  bool isAdvanced = false;
  SfRangeValues ageRange = const SfRangeValues(16.01, 100.01);
  bool needMaster = false;
  double locationSlider = 50;
  Map<dynamic, dynamic> filterData = {};
  ScrollController scrollController = ScrollController();

  GlobalKey ageKey = GlobalKey();

  void clear() {}

  void setFilterData(String key, Map<dynamic, dynamic> data) {
    setState(() {
      filterData[key] = data;
    });
  }

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
              controller: scrollController,
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildRow(AppLocalizations.of(context)!.category,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(() => FilterCategory(
                                  setFilterData: setFilterData,
                                ));
                          }),
                          buildRow(AppLocalizations.of(context)!.time,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(
                                () => FilterTime(setFilterData: setFilterData));
                          }),
                          buildRow(AppLocalizations.of(context)!.location,
                              AppLocalizations.of(context)!.choose,
                              // 'Wolska 62, 01-134, Mlynow, Warszawa, Polska',
                              () {
                            // setState(() {
                            //   showLocationSlider = !showLocationSlider;
                            // });
                            // showGoogleMap(context);
                            Get.to(() => const MainMap());
                          }, "Distance (km)"),
                          if (showLocationSlider)
                            SizedBox(
                              height: 70,
                              width: screenWidth,
                              child: SfSliderTheme(
                                data: SfSliderThemeData(
                                  activeTrackHeight: 4,
                                  inactiveTrackHeight: 3,
                                  activeTrackColor: activeColor,
                                  inactiveTrackColor: blackColor,
                                  thumbColor: Colors.white,
                                  thumbStrokeColor: Colors.black26,
                                  thumbStrokeWidth: 2,
                                  thumbRadius: 16,
                                  tooltipBackgroundColor: transparentColor,
                                  tooltipTextStyle: regularStyleBold,
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 100,
                                  tooltipShape: const CustomTooltipShape(),
                                  // tooltipShape: CustomSliderTooltipShape(40.0),
                                  // activeColor: activeColor,
                                  // inactiveColor: blackColor,
                                  enableTooltip: true,
                                  shouldAlwaysShowTooltip: true,
                                  tooltipTextFormatterCallback:
                                      (actualValue, formattedText) {
                                    formattedText = double.parse(formattedText)
                                        .floor()
                                        .toString();
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
                            ),
                          buildRow(AppLocalizations.of(context)!.price,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(() => const CreateEventPrice());
                          }),
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .needAMaster,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          HorizontalSlidableButton(
                                            width: 60,
                                            height: 32,
                                            buttonWidth: 34,
                                            color: Colors.white,
                                            initialPosition: needMaster
                                                ? SlidableButtonPosition.end
                                                : SlidableButtonPosition.start,
                                            // buttonColor: Theme.of(context).primaryColor,
                                            dismissible: false,
                                            label: Container(
                                              margin: const EdgeInsets.all(4),
                                              constraints:
                                                  const BoxConstraints.expand(),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  gradient: needMaster
                                                      ? Styles.primaryGradient()
                                                      : const LinearGradient(
                                                          colors: [
                                                              Colors.white,
                                                              Colors.white
                                                            ])),
                                            ),
                                            onChanged: (position) {
                                              setState(() {
                                                if (position ==
                                                    SlidableButtonPosition
                                                        .end) {
                                                  setState(
                                                      () => needMaster = true);
                                                } else {
                                                  setState(
                                                      () => needMaster = false);
                                                }
                                              });
                                            },
                                          )
                                          // CustomSwitch(
                                          //   value: needMaster,
                                          //   isDarkBtn: false,
                                          //   isLight: true,
                                          //   changeColor: true,
                                          //   color2: neonColor,
                                          //   onChanged: (bool val) {
                                          //     setState(() {
                                          //       needMaster = val;
                                          //     });
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                    buildRow(
                                        AppLocalizations.of(context)!.withWhom,
                                        AppLocalizations.of(context)!.choose,
                                        () {
                                      Get.to(() => CreateEventWIthWhom(
                                            btnText:
                                                AppLocalizations.of(context)!
                                                    .save,
                                          ));
                                    }),
                                    buildRow(
                                        AppLocalizations.of(context)!.level,
                                        AppLocalizations.of(context)!.choose,
                                        () {
                                      Get.to(() => CreateEventLevel(
                                            btnText:
                                                AppLocalizations.of(context)!
                                                    .save,
                                          ));
                                    }),
                                    buildRow(AppLocalizations.of(context)!.type,
                                        AppLocalizations.of(context)!.choose,
                                        () {
                                      Get.to(() => CreateEventType(
                                            btnText:
                                                AppLocalizations.of(context)!
                                                    .save,
                                          ));
                                    }),
                                    buildRow(
                                        AppLocalizations.of(context)!.gender,
                                        AppLocalizations.of(context)!.choose,
                                        () {
                                      Get.to(() => CreateEventGender(
                                            btnText:
                                                AppLocalizations.of(context)!
                                                    .save,
                                          ));
                                    }),
                                    buildRow(
                                        AppLocalizations.of(context)!.age,
                                        ageChanged
                                            ? "${ageRange.start.floor()}-${ageRange.end.floor()}"
                                            : AppLocalizations.of(context)!
                                                .choose, () {
                                      setState(() {
                                        showAgeSlider = !showAgeSlider;
                                      });
                                    }),
                                    if (showAgeSlider)
                                      SizedBox(
                                        key: ageKey,
                                        height: 70,
                                        width: screenWidth,
                                        child: SfRangeSliderTheme(
                                            data: SfRangeSliderThemeData(
                                              activeTrackHeight: 4,
                                              inactiveTrackHeight: 3,
                                              activeTrackColor: activeColor,
                                              inactiveTrackColor: blackColor,
                                              thumbColor: Colors.white,
                                              thumbStrokeColor: Colors.black26,
                                              thumbStrokeWidth: 2,
                                              thumbRadius: 16,
                                              tooltipBackgroundColor:
                                                  transparentColor,
                                              tooltipTextStyle:
                                                  regularStyleBold,
                                            ),
                                            child: SfRangeSlider(
                                              values: ageRange,
                                              min: 16.1,
                                              max: 100.1,
                                              interval: 1.0,
                                              tooltipShape:
                                                  const CustomTooltipShape(),
                                              enableTooltip: true,
                                              shouldAlwaysShowTooltip: true,
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
                                                  ageChanged = true;
                                                });
                                              },
                                            )),
                                      ),
                                    const SizedBox(
                                      height: 100,
                                    )
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 55),
                                  child: CupertinoButton(
                                    child: Text(
                                      AppLocalizations.of(context)!.advanced,
                                      style: const TextStyle(
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
          EventAppBar(
            title: AppLocalizations.of(context)!.filters,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}
