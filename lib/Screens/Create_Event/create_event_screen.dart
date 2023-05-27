import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/custom_slider_tooptip.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int numberChumsys = 1;
  bool isAdvanced = false;
  bool needMaster = false;
  bool showAgeSlider = false;
  bool ageChanged = false;
  SfRangeValues ageRange = const SfRangeValues(16.0, 100.0);

  void clear() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
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
                          buildRow(AppLocalizations.of(context)!.category,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(() => const CreateEventCategory());
                          }),
                          buildRow(AppLocalizations.of(context)!.time,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(() => const CreateEventTime());
                          }),
                          buildRow(AppLocalizations.of(context)!.location,
                              AppLocalizations.of(context)!.choose, () {
                            Get.to(() => const CreateEventLocation());
                          }),
                          buildRow(AppLocalizations.of(context)!.price,
                              AppLocalizations.of(context)!.choose, () {
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
                                  l.numberOfChumsys,
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
                                      child: Text(numberChumsys.toString(),
                                          style: regularStyleBold),
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
                                          Text(
                                            l.needAMaster,
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
                                                    .choose,
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
                                              min: 16.0,
                                              max: 100.0,
                                              interval: 1.0,
                                              tooltipShape:
                                                  const CustomTooltipShape(),
                                              // activeColor: activeColor,
                                              // inactiveColor: blackColor,
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
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .addDescription,
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
                                          placeholder:
                                              AppLocalizations.of(context)!
                                                  .thisEventWillBe,
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
                                        const SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    top: 55,
                                  ),
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
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.createAnEventCC,
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
            title: AppLocalizations.of(context)!.createAnEvent,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}
