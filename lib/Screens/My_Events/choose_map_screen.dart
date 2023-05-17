import 'package:chumsy_app/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';

class ChooseMapScreen extends StatelessWidget {
  const ChooseMapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/extras/map.png",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: screenWidth,
              minHeight: screenHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  60,
                  16,
                  20,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: screenHeight / 3.5,
                      left: screenWidth / 8,
                      child: CupertinoButton(
                        child: Image.asset(
                          "assets/home/map_bottom@2x.png",
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 0,
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: const Icon(
                                      CupertinoIcons.question,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: screenWidth / 1.2,
                          height: 200,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CupertinoButton(
                                    child: const Text(""),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    l.pinTheLocation,
                                    style: regularStyleBold,
                                  ),
                                  CupertinoButton(
                                    child: const Icon(
                                      CupertinoIcons.clear,
                                      color: blackColor,
                                    ),
                                    onPressed: () => Get.back(),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: CupertinoListTile(
                                  onTap: () =>
                                      Get.to(() => const ChooseMapScreen()),
                                  padding: EdgeInsets.zero,
                                  leadingSize: 33.24,
                                  leading: const CircleAvatar(
                                    backgroundColor: blackColor,
                                    child: Icon(
                                      Icons.search,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                  title: Text(
                                    "Swietokrzyska 56",
                                    style: headingStyle24.copyWith(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              spacingBox,
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 57,
                                  left: 25,
                                ),
                                child: CustomGradientButtonWidget(
                                  buttonWidget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        l.confirmLocationC,
                                        style: regularStyleBold,
                                      ),
                                    ],
                                  ),
                                  onTapFunction: () {
                                    Get.back();
                                    Get.back();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
