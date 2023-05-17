import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/simple_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/list_set_of_widgets.dart';
import '../../Widgets/options_list.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'share_bottom_sheet.dart';

SizedBox frientBuilder(
    String nameAndAge, String location, String profile, BuildContext context) {
      AppLocalizations l = AppLocalizations.of(context)!;
  return SizedBox(
    height: 45,
    child: CupertinoListTile(
      backgroundColorActivated: textColor.withOpacity(
        0.2,
      ),
      onTap: () {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
              color: whiteColor,
            ),
            padding: const EdgeInsets.all(
              2,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: screenHeight / 3.6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: const Icon(
                        CupertinoIcons.clear,
                        color: blackColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
                Center(
                  child: Text(
                    l.youHaveAChumsy,
                    style: headingStyle24,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 55,
                          foregroundImage: AssetImage(
                            profile,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              nameAndAge,
                              style: headingStyle24.copyWith(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Text(
                              "Do you want\n${nameAndAge.split(',')[0]} to take\npart in the event?",
                              style: regularStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                  ),
                  child: ChipSets(
                    islarge: false,
                    listOfChips: options,
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomSimpleuttonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l.decline,
                                style: regularStyleBold,
                              ),
                            ],
                          ),
                          onTapFunction: () {
                            Get.back();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomGradientButtonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l.accept,
                                style: regularStyleBold,
                              ),
                            ],
                          ),
                          onTapFunction: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: neonColor,
        foregroundImage: AssetImage(profile),
      ),
      leadingSize: 45,
      title: Text(
        nameAndAge,
        style: regularStyleBold.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        location,
        style: smallStyle,
      ),
      trailing: CupertinoButton(
        child: const Icon(
          CupertinoIcons.right_chevron,
          color: blackColor,
        ),
        onPressed: () {},
      ),
    ),
  );
}
