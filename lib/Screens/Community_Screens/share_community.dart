import 'dart:io';

import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';

class ShareCommunity extends StatefulWidget {
  const ShareCommunity({super.key, required this.bgImg});
  final File bgImg;
  @override
  State<ShareCommunity> createState() => _ShareCommunityState();
}

class _ShareCommunityState extends State<ShareCommunity> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.file(
            widget.bgImg,
          ).image,
          fit: BoxFit.cover,
        ),
      ),
      height: screenHeight,
      width: screenWidth,
      child: CupertinoPageScaffold(
        backgroundColor: transparentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topAppBarSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.back,
                        color: blackColor,
                      ),
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            const SizedBox(
              height: 130,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: whiteColor,
                ),
                height: screenHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      spacingBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.addText,
                            style: smallStyleBold,
                          ),
                          spacingBox,
                          spacingBox,
                          CupertinoTextField(
                            maxLines: 5,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            placeholder: l.thisEventWas,
                            placeholderStyle: smallStyle,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: const Color(0xffeeeef0),
                            ),
                          ),
                        ],
                      ),
                      spacingBox,
                      topAppBarSpacing,
                      buildRow(l.tagPeople, l.choose, () {}),
                      spacingBox,
                      buildRow(l.shareWith, l.friends, () {}),
                      spacingBox,
                      topAppBarSpacing,
                      topAppBarSpacing,
                      topAppBarSpacing,
                      Container(
                        width: screenWidth,
                        height: 51,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: CustomGradientButtonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l.shareWithCommunity,
                                style: regularStyleBold,
                              ),
                            ],
                          ),
                          onTapFunction: () => Get.back(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
