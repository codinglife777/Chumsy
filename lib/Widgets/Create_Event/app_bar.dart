import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

class EventAppBar extends StatelessWidget {
  const EventAppBar({super.key, required this.title, required this.cbClear});
  final String title;
  final VoidCallback cbClear;
  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 2),
      opacity: 0.1,
      child: Container(
        color: whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topAppBarSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: const Icon(
                    CupertinoIcons.back,
                    color: blackColor,
                    size: 25,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  title,
                  style: subHeadingStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: CupertinoButton(
                    onPressed: cbClear,
                    child: Text(
                      AppLocalizations.of(context)!.clear,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class EventAppBar2 extends StatelessWidget {
  const EventAppBar2({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 2),
      opacity: 0.1,
      child: Container(
        color: whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topAppBarSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Icon(
                    CupertinoIcons.back,
                    color: blackColor,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  title,
                  style: subHeadingStyle,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    "",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
