import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Constants/colors.dart';

void openTimePicker(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark().copyWith(
        dialogTheme: const DialogTheme(
          surfaceTintColor: blackColor,
        ),
      ),
      child: SlidingUpPanel(
        color: blackColor,
        backdropEnabled: true,
        minHeight: 250,
        panel: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: blackColor.withRed(1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Done",
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: 250,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: blackColor.withOpacity(0.9),
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void openDatePicker(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark().copyWith(
        dialogTheme: const DialogTheme(
          surfaceTintColor: blackColor,
        ),
      ),
      child: SlidingUpPanel(
        color: blackColor,
        backdropEnabled: true,
        minHeight: 250,
        panel: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: blackColor.withRed(1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Done",
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      minuteInterval: 1,
                      use24hFormat: true,
                      dateOrder: DatePickerDateOrder.dmy,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (val) {},
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: 250,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: blackColor.withOpacity(0.8),
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
