import 'package:flutter/cupertino.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

GestureDetector buildRow(String leftText, String rightText, VoidCallback cb,
    [String? secondaryText]) {
  secondaryText ??= "";
  return GestureDetector(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftText,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              secondaryText.isEmpty
                  ? const SizedBox()
                  : Text(
                      secondaryText,
                      style: smallStyle,
                    ),
            ],
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: cb,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                rightText != ""
                    ? SizedBox(
                        width: 200,
                        child: Text(
                          rightText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: blackColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )
                    : const SizedBox(),
                const Icon(
                  CupertinoIcons.right_chevron,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
