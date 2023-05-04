import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

class EventAppBar extends StatelessWidget {
  const EventAppBar({
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
                CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
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
