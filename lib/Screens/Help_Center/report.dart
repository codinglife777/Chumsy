import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';

class HelpCenterReport extends StatefulWidget {
  const HelpCenterReport({
    super.key,
  });

  @override
  State<HelpCenterReport> createState() => _HelpCenterReportState();
}

class _HelpCenterReportState extends State<HelpCenterReport> {
  int countWords = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacingBoxExtended,
                          const Text(
                            "Run into an issue while using Chumsy or found a missing feature you need? Let us know here!",
                            style: regularStyle,
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          CupertinoTextField(
                            maxLines: 15,
                            maxLength: 500,
                            onChanged: (value) {
                              setState(() {
                                countWords = value.length;
                              });
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            placeholder: "Write your message...",
                            placeholderStyle: smallStyle,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: textColor.withOpacity(
                                0.13,
                              ),
                            ),
                          ),
                          spacingBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "$countWords/ 500",
                                style: smallStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.add_circled,
                                color: blackColor,
                                size: 32,
                              ),
                              horizontalSpacingBox,
                              Text(
                                "Add a screenshot",
                                style: regularStyleBold.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 40,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "SEND",
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
          const EventAppBar2(
            title: "Report a bug",
          ),
        ],
      ),
    );
  }
}
