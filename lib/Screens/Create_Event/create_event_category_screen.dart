import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../Complete_Profile_Screens/qualification_items_list.dart';

class CreateEventCategory extends StatefulWidget {
  const CreateEventCategory({super.key});

  @override
  State<CreateEventCategory> createState() => _CreateEventCategoryState();
}

class _CreateEventCategoryState extends State<CreateEventCategory> {
  String selected = "Sports";
  int dataCount = 0;
  final TextEditingController searchCont = TextEditingController();
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
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacingBox,
                          Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            ),
                            padding: const EdgeInsets.all(
                              3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: ["Sports", "Lifestyle", "Name it!"]
                                  .map(
                                    (e) => Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          gradient: selected.contains(e)
                                              ? const LinearGradient(
                                                  colors: [
                                                    neonColor,
                                                    blueColor,
                                                  ],
                                                )
                                              : const LinearGradient(
                                                  colors: [
                                                    blackColor,
                                                    blackColor,
                                                  ],
                                                ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selected = e;
                                            });
                                          },
                                          child: Center(
                                            child: Text(
                                              e,
                                              style: regularStyleBold.copyWith(
                                                color: selected.contains(e)
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          spacingBox,
                          spacingBox,
                          Container(
                            decoration: BoxDecoration(
                              color: textColor.withOpacity(
                                0.2,
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
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
                                    controller: searchCont,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    placeholder: 'Search',
                                    placeholderStyle: const TextStyle(
                                      color: greyIconColor,
                                    ),
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
                          spacingBox,
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: screenHeight / 1.6,
                            ),
                            child: selected.contains("Name it!")
                                ? Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Name the event",
                                            style: smallStyleBold,
                                          ),
                                          spacingBox,
                                          CupertinoTextField(
                                            onChanged: (value) {
                                              setState(() {
                                                dataCount = value.length;
                                              });
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            placeholder:
                                                "Choose the name of your event",
                                            placeholderStyle: smallStyle,
                                            maxLength: 24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: textColor.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                          ),
                                          spacingBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "$dataCount/ 24",
                                                style: smallStyle,
                                              ),
                                            ],
                                          ),
                                          spacingBox,
                                          Image.asset(
                                            "assets/extras/pexels-olya-kobruseva-5428836@3x.png",
                                            width: screenWidth / 1.5,
                                          ),
                                          spacingBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                CupertinoIcons.add_circled,
                                                color: blackColor,
                                              ),
                                              horizontalSpacingBox,
                                              Text(
                                                "Change a picture",
                                                style: smallStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : ListView(
                                    shrinkWrap: true,
                                    addRepaintBoundaries: false,
                                    children: [
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items1,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items2,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items3,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items4,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items5,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items6,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items3,
                                      ),
                                      ChipSets(
                                        islarge: true,
                                        listOfChips: items4,
                                      ),
                                    ],
                                  ),
                          ),
                          spacingBox,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 40,
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
          const EventAppBar(
            title: "Category",
          ),
        ],
      ),
    );
  }
}
