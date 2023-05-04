import 'package:flutter/cupertino.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

GestureDetector buildRow(String leftText, String rightText, VoidCallback cb) {
  return GestureDetector(
    onTap: cb,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: regularStyleBold.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: cb,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rightText != "" ? rightText : "              ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
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
