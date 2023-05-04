import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Functions/build_event_row.dart';
import '../../Functions/open_bottom_datetime_picker.dart';
import '../../Constants/spacing.dart';

class CreateEventTime extends StatefulWidget {
  const CreateEventTime({super.key});

  @override
  State<CreateEventTime> createState() => _CreateEventTimeState();
}

class _CreateEventTimeState extends State<CreateEventTime> {
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
                          buildRow("Beginning",
                              "Today at ${DateTime.now().hour}:${DateTime.now().minute}",
                              () {
                            openDatePicker(context);
                          }),
                          buildRow("Duration", "30 min", () {
                            openTimePicker(context);
                          }),
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
                        children: const [
                          Text(
                            "SAVE",
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
                    const Text(
                      "Time",
                      style: subHeadingStyle,
                    ),
                    const CupertinoButton(
                      onPressed: null,
                      child: Text(
                        "",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 12,
                        ),
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
