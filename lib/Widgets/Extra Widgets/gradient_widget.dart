import 'package:flutter/cupertino.dart';

import '../../Constants/colors.dart';
import '../../Styles/styles.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  const CustomGradientButtonWidget({
    super.key,
    required this.buttonWidget,
    required this.onTapFunction,
  });
  final Widget buttonWidget;
  final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: transparentColor,
      onPressed: onTapFunction,
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            100,
          ),
          border: Border.all(
            color: blackColor,
            width: 2,
          ),
          gradient: Styles.primaryGradient(),
        ),
        child: buttonWidget,
      ),
    );
  }
}
