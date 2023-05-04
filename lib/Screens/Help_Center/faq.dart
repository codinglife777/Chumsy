import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import 'faq_answer.dart';

class HelpCenterFaq extends StatefulWidget {
  const HelpCenterFaq({
    super.key,
  });

  @override
  State<HelpCenterFaq> createState() => _HelpCenterFaqState();
}

class _HelpCenterFaqState extends State<HelpCenterFaq> {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacingBox,
                          spacingBox,
                          const Text(
                            "How can we help you?",
                            style: subHeadingStyle,
                          ),
                          spacingBox,
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(
                                color: blackColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                horizontalSpacingBox,
                                Expanded(
                                  flex: 0,
                                  child: Icon(
                                    CupertinoIcons.search,
                                    color: blackColor,
                                  ),
                                ),
                                horizontalSpacingBox,
                                Expanded(
                                  flex: 1,
                                  child: CupertinoTextField(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    placeholder: 'Search',
                                    placeholderStyle: TextStyle(
                                      color: greyIconColor,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question:
                                "Excepteur sint occaecat cupidatat non proident",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question: "Sed ut perspiciatis unde omnis iste",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question: "Ut enim ad minima veniam",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question:
                                "Excepteur sint occaecat cupidatat non proident",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question: "Sed ut perspiciatis unde omnis iste",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question: "Ut enim ad minima veniam",
                          ),
                          QuestionTile(
                            onTapFunction: () {},
                            question:
                                "Excepteur sint occaecat cupidatat non proident",
                          ),
                        ],
                      ),
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

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.onTapFunction,
    required this.question,
  });
  final VoidCallback onTapFunction;
  final String question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        HelpCenterFaqAns(
          question: question,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.5,
        ),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: AutoSizeText(
                  question,
                  maxLines: 2,
                  softWrap: true,
                  style: regularStyleBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                CupertinoIcons.right_chevron,
                color: blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
