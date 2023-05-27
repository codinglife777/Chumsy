import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.isBack, this.suffix});
  final String title;
  final bool isBack;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    Widget _suffix = suffix ?? const SizedBox();

    return SimpleShadow(
      // offset: const Offset(0, 2),
      opacity: 0.2,
      child: Container(
        color: whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topAppBarSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isBack
                    ? CupertinoButton(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: const Icon(
                          CupertinoIcons.back,
                          color: blackColor,
                          size: 25,
                        ),
                        onPressed: () => Get.back(),
                      )
                    : CupertinoButton(onPressed: () {}, child: const Text('')),
                Text(
                  title,
                  style: subHeadingStyle,
                ),
                _suffix
              ],
            ),
            // const Divider(
            //   // height: 10,
            //   // thickness: 1,
            //   color: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}
