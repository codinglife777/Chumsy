import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';

class HelpCenterFaqAns extends StatefulWidget {
  const HelpCenterFaqAns({
    super.key,
    required this.question,
  });
  final String question;
  @override
  State<HelpCenterFaqAns> createState() => _HelpCenterFaqAnsState();
}

class _HelpCenterFaqAnsState extends State<HelpCenterFaqAns> {
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacingBox,
                          spacingBox,
                          spacingBox,
                          Text(
                            widget.question,
                            style: subHeadingStyle,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. totam rem aperiam. eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt- Neque porro quisquam est. qui dolorem ipsum quia dolor Sit amet. consectetur. adipisci velit. sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem",
                            style: regularStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Didn't find an answer to your question?",
                        style: regularStyleBold,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 40,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          AutoSizeText(
                            "CONTACT SUPPORT",
                            style: regularStyleBold,
                            maxLines: 1,
                            softWrap: true,
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
            title: "FAQ",
          ),
        ],
      ),
    );
  }
}
