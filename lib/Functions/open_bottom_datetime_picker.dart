import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../Widgets/Extra Widgets/custom_datepicker.dart';

void openTimePicker(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.light().copyWith(
        dialogTheme: const DialogTheme(
          surfaceTintColor: blackColor,
        ),
      ),
      child: SlidingUpPanel(
        color: whiteColor,
        backdropEnabled: true,
        minHeight: 250,
        panel: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
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
                // IgnorePointer(
                //   ignoring: true,
                //   child: Container(
                //     height: 250,
                //     width: screenWidth,
                //     decoration: BoxDecoration(
                //       border: Border.symmetric(
                //         horizontal: BorderSide(
                //           color: blackColor.withOpacity(0.9),
                //           width: 60,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
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
      data: ThemeData.light(),
      child: SlidingUpPanel(
        color: whiteColor,
        backdropEnabled: true,
        minHeight: 250,
        panel: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfff7f7f7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.done,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
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
                      child: CustomCupertinoDatePicker(
                        itemExtent: 50,
                        backgroundColor: whiteColor,
                        minDate: DateTime(DateTime.now().year - 16),
                        maxDate: DateTime(DateTime.now().year + 100),
                        selectedDate: DateTime.now(),
                        selectionOverlay: const SizedBox(
                          width: double.infinity,
                          height: 50,
                          // decoration: const BoxDecoration(
                          //   border: Border.symmetric(
                          //     horizontal: BorderSide(
                          //         color: Colors.grey, width: 1),
                          //   ),
                          // ),
                        ),
                        selectedStyle: const TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                        unselectedStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        disabledStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18,
                        ),
                        onSelectedItemChanged: (date) => {},
                      )
                      // child: CupertinoDatePicker(
                      //   minuteInterval: 1,
                      //   use24hFormat: true,
                      //   dateOrder: DatePickerDateOrder.dmy,
                      //   mode: CupertinoDatePickerMode.date,
                      //   initialDateTime: DateTime.now(),
                      //   onDateTimeChanged: (val) {},
                      // ),
                      ),
                ),
                // IgnorePointer(
                //   ignoring: true,
                //   child: Container(
                //     height: 250,
                //     width: screenWidth,
                //     decoration: BoxDecoration(
                //       border: Border.symmetric(
                //         horizontal: BorderSide(
                //           color: blackColor.withOpacity(0.8),
                //           width: 60,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
