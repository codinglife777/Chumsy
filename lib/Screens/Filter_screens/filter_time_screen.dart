import 'dart:ffi';

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
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/custom_slider_tooptip.dart';

typedef FilterSetCallbak = Function(String key, Map<dynamic, dynamic> data);

class FilterTime extends StatefulWidget {
  const FilterTime({super.key, required this.setFilterData, this.filterData});
  final FilterSetCallbak setFilterData;
  final Map<dynamic, dynamic>? filterData;
  @override
  State<FilterTime> createState() => _FilterTimeState();
}

class _FilterTimeState extends State<FilterTime> {
  Map<String, String> dateTime = {'date': '', 'time': ''};
  bool showTime = false;
  late SfRangeValues timeDuration;
  bool timeChanged = false;

  @override
  void initState() {
    timeDuration = const SfRangeValues(0.0, 24.0);
    super.initState();
  }

  void clear() {}

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
                              AppLocalizations.of(context)!.date,
                              // dateTime['date'] ??
                              AppLocalizations.of(context)!.choose,
                              // : "Today at ${DateTime.now().hour}:${DateTime.now().minute}",
                              () {
                            openDatePicker(context);
                          }),
                          buildRow(
                              AppLocalizations.of(context)!.time,
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
                                      tooltipShape: const CustomTooltipShape(),
                                      values: timeDuration,
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
                                      onChanged: (SfRangeValues newValues) {
                                        setState(() {
                                          timeDuration = newValues;
                                          timeChanged = true;
                                        });
                                      })),
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
                            AppLocalizations.of(context)!.save,
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
            title: AppLocalizations.of(context)!.time,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}
