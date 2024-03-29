import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import 'faq_answer.dart';
import 'mng_bottom_nav.dart';

class HelpCenterFaq extends StatefulWidget {
  const HelpCenterFaq({
    super.key, required this.isProfilePage,
  });

  final bool isProfilePage;

  @override
  State<HelpCenterFaq> createState() => _HelpCenterFaqState();
}

class _HelpCenterFaqState extends State<HelpCenterFaq> {
  static List<String> fagList = [
    "What is Chumsy for?",
    "How to create an account in the Chumsy app?",
    "What is Master Status?",
    "How to set Master status?",
    "How can I find an event that interestes me?",
    "Filtering events",
    "How can I save the event?",
    "How can I sign up for an event?",
    "What are the available payment methods for participation in paid events?..."
  ];

  List<String> filteredFaq = fagList;
  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  void onSearch() {
    String strSearch = searchController.text;
    List<String> filtered = fagList
        .where((element) =>
            element.toLowerCase().contains(strSearch.toLowerCase()))
        .toList();
    setState(() {
      filteredFaq = filtered;
    });
  }

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
                    height: screenHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacingBox,
                          spacingBox,
                          Text(
                            l.howCanWeHelpYou,
                            style: subHeadingStyle,
                          ),
                          spacingBox,
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
                              children: [
                                horizontalSpacingBox,
                                const Expanded(
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
                                    controller: searchController,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    placeholder: l.search,
                                    placeholderStyle: smallStyle,
                                    onChanged: (value) {
                                      onSearch();
                                    },
                                    decoration: const BoxDecoration(
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
                          Column(
                            children: filteredFaq
                                .map((e) => QuestionTile(
                                      onTapFunction: () {},
                                      question: e,
                                      isProfilePage: widget.isProfilePage,
                                    ))
                                .toList(),
                          ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question:
                          //       "Excepteur sint occaecat cupidatat non proident",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question: "Sed ut perspiciatis unde omnis iste",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question: "Ut enim ad minima veniam",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question:
                          //       "Excepteur sint occaecat cupidatat non proident",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question: "Sed ut perspiciatis unde omnis iste",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question: "Ut enim ad minima veniam",
                          // ),
                          // QuestionTile(
                          //   onTapFunction: () {},
                          //   question:
                          //       "Excepteur sint occaecat cupidatat non proident",
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          EventAppBar2(
            title: l.faq,
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
    required this.question, required this.isProfilePage,
  });

  final bool isProfilePage;
  final VoidCallback onTapFunction;
  final String question;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (isProfilePage) {
          Get.to(
            () => HelpCenterFaqAns(question: question),
          );
        } else {
          Get.to(
            () => MngFaqAnswerPage(question: question),
          );
        }
      },
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
