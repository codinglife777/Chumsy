import 'package:flutter/material.dart';

import '../../Constants/sizes.dart';
import '../../styles/styles.dart';

class SignupBottomSheet extends StatelessWidget {
  const SignupBottomSheet(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      Widget? bottomText})
      : bottomSheetText = bottomText,
        super(key: key);
  final String buttonText;
  final onPressed;
  final Widget? bottomSheetText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: screenWidth,
      color: Color(0xff282828),
      child: Column(
        children: [
          Container(
            height: 51,
            width: screenWidth - 57 * 2,
            decoration: Styles.gredientButtonContainer(),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: Styles.greyButtonText(),
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          bottomSheetText ??
              const SizedBox(
                height: 1,
              ),
        ],
      ),
    );
  }
}
