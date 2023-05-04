import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Functions/build_event_row.dart';
import '../../Functions/open_bottom_datetime_picker.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class FilterTime extends StatefulWidget {
  const FilterTime({super.key});

  @override
  State<FilterTime> createState() => _FilterTimeState();
}

class _FilterTimeState extends State<FilterTime> {
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
                            "APPLY",
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
            title: "Time",
          ),
        ],
      ),
    );
  }
}
