import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/custom_appbar.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({
    super.key,
  });

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

// to check ehich screen is activated
int active = 0;

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: whiteColor,
      child: Column(
        children: [
          Column(
            children: [
              CustomAppBar(
                title: l.findFriends,
                isBack: true,
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: CupertinoButton(
                    child: const Text(
                      "",
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              spacingBox,
              // spacingBox,
              topButtons(context),
              // spacingBox,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: SizedBox(
                  height: screenHeight / 1.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        l.scanContactsQ,
                        style: headingStyle24.copyWith(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      SizedBox(
                        width: screenWidth / 3,
                        child: Text(
                          l.findChumsysbyscanning,
                          style: regularStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 70,
                ),
                child: CustomGradientButtonWidget(
                  buttonWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      horizontalSpacingBoxSmall,
                      Text(
                        l.scanContacts,
                        style: regularStyleBold,
                      ),
                    ],
                  ),
                  onTapFunction: () => Get.back(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

// top buttons used in the UI
  Row topButtons(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 0 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                l.contacts,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                  color: active == 0 ? whiteColor : blackColor,
                ),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 0;
            });
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 1 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                l.email,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                  color: active == 1 ? whiteColor : blackColor,
                ),
                softWrap: true,
                maxLines: 1,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 1;
            });
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(
              right: screenWidth / 100,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: blackColor,
                width: 2,
              ),
              color: active == 2 ? blackColor : whiteColor,
            ),
            child: Center(
              child: AutoSizeText(
                l.username,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                  color: active == 2 ? whiteColor : blackColor,
                ),
                softWrap: true,
                maxLines: 1,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              active = 2;
            });
          },
        ),
      ],
    );
  }
}
