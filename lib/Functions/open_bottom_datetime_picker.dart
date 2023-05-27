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
  AppLocalizations l = AppLocalizations.of(context)!;
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
                    child: Text(
                      l.done,
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
          panel: const DatePickerWidget()),
    ),
  );
}

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final months = [
      AppLocalizations.of(context)!.january,
      AppLocalizations.of(context)!.february,
      AppLocalizations.of(context)!.march,
      AppLocalizations.of(context)!.april,
      AppLocalizations.of(context)!.may,
      AppLocalizations.of(context)!.june,
      AppLocalizations.of(context)!.july,
      AppLocalizations.of(context)!.august,
      AppLocalizations.of(context)!.september,
      AppLocalizations.of(context)!.october,
      AppLocalizations.of(context)!.novemeber,
      AppLocalizations.of(context)!.december,
    ];

    DateTime _date = DateTime.now();
    // TODO: implement build
    return Column(
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
                    months: months,
                    backgroundColor: whiteColor,
                    minDate: DateTime.now().add(const Duration(seconds: -5)),
                    maxDate: DateTime(DateTime.now().year + 100),
                    selectedDate: _date,
                    selectionOverlay: const SizedBox(
                      width: double.infinity,
                      height: 50,
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
                    onSelectedItemChanged: (date) {
                      if (date.compareTo(DateTime.now()) < 0) {
                        print("OKOK");
                        setState(() {
                          _date = DateTime.now();
                        });
                      }
                    },
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
