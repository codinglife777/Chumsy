import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';

class HelpCenterSupport extends StatefulWidget {
  const HelpCenterSupport({
    super.key,
  });

  @override
  State<HelpCenterSupport> createState() => _HelpCenterSupportState();
}

class _HelpCenterSupportState extends State<HelpCenterSupport> {
  int countWords = 0;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
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
                          Text(
                            l.supportTypeMsg,
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
                            placeholder: l.writeYourMessage,
                            placeholderStyle: smallStyle,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              // color: textColor.withOpacity(
                              //   0.05,
                              // ),
                              color: const Color(0xffeeeef0),
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
                        children: [
                          Text(
                            l.send,
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
          EventAppBar2(
            title: l.support,
          ),
        ],
      ),
    );
  }
}
