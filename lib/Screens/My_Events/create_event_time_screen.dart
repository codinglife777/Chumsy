import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../Constants/colors.dart';
import '../../Functions/build_event_row.dart';
import '../../Functions/open_bottom_datetime_picker.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Extra Widgets/custom_slider_tooptip.dart';

class CreateEventTime extends StatefulWidget {
  const CreateEventTime({super.key});

  @override
  State<CreateEventTime> createState() => _CreateEventTimeState();
}

class _CreateEventTimeState extends State<CreateEventTime> {
  bool showTime = false;
  late SfRangeValues timeDuration;
  bool timeChanged = false;

  @override
  void initState() {
    timeDuration = const SfRangeValues(0.0, 24.0);
    super.initState();
  }

  String getTimeDuration() {
    String strTimeDuration = "";
    String strStartM = "AM";
    String strEndM = "AM";
    int start = timeDuration.start.toInt();
    int end = timeDuration.end.toInt();
    if (timeDuration.start >= 12) {
      strStartM = "PM";
      start -= 12;
    }
    if (timeDuration.end >= 12) {
      strEndM = "PM";
      end -= 12;
    }

    if (start == 0) {
      strTimeDuration += "12:00 $strStartM";
    } else if (start < 10) {
      strTimeDuration += "0$start:00 $strStartM";
    } else {
      strTimeDuration += "$start:00 $strStartM";
    }

    if (end == 0) {
      strTimeDuration += " - 12:00 $strEndM";
    } else if (end < 10) {
      strTimeDuration += " - 0$end:00 $strEndM";
    } else {
      strTimeDuration += " - $end:00 $strEndM";
    }

    return strTimeDuration;
  }

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
                    height: screenHeight / 1.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildRow(
                              l.begining, AppLocalizations.of(context)!.choose,
                              () {
                            openDatePicker(context);
                          }),
                          buildRow(
                              l.duration,
                              timeChanged
                                  ? getTimeDuration()
                                  : AppLocalizations.of(context)!.choose, () {
                            // openTimePicker(context);
                            setState(() {
                              showTime = !showTime;
                            });
                          }),
                          if (showTime)
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
                                    tooltipBackgroundColor: transparentColor,
                                    tooltipTextStyle: regularStyleBold,
                                  ),
                                  child: SfRangeSlider(
                                    min: 0.0,
                                    max: 24.0,
                                    interval: 1,
                                    values: timeDuration,
                                    enableTooltip: true,
                                    shouldAlwaysShowTooltip: true,
                                    tooltipShape: const CustomTooltipShape(),
                                    tooltipTextFormatterCallback:
                                        (actualValue, formattedText) {
                                      formattedText =
                                          double.parse(formattedText)
                                              .floor()
                                              .toString();
                                      return formattedText;
                                    },
                                    onChanged: (SfRangeValues newValues) {
                                      setState(() {
                                        timeDuration = newValues;
                                        timeChanged = true;
                                      });
                                    },
                                  )),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l.save,
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
          Container(
            color: whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topAppBarSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: const Icon(
                        CupertinoIcons.back,
                        color: blackColor,
                        size: 25,
                      ),
                      onPressed: () => Get.back(),
                    ),
                    Text(
                      l.time,
                      style: subHeadingStyle,
                    ),
                    CupertinoButton(
                      onPressed: null,
                      child: Text(
                        l.clear,
                        style: regularStyle,
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
