import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventLevel extends StatefulWidget {
  const CreateEventLevel({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventLevel> createState() => _CreateEventLevelState();
}

class _CreateEventLevelState extends State<CreateEventLevel> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  spacingBox,
                  spacingBox,
                  SizedBox(
                    height: screenHeight / 1.6,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LevelTile(
                            payType: "Beginner",
                          ),
                          spacingBox,
                          LevelTile(
                            payType: "Intermediate",
                          ),
                          spacingBox,
                          LevelTile(
                            payType: "Advanced",
                          ),
                          spacingBox,
                          LevelTile(
                            payType: "Pro",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 40,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.btnText,
                            style: regularStyleBold.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onTapFunction: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const EventAppBar2(
            title: "Level",
          ),
        ],
      ),
    );
  }
}

class LevelTile extends StatefulWidget {
  const LevelTile({
    super.key,
    required this.payType,
  });
  final String payType;

  @override
  State<LevelTile> createState() => _LevelTileState();
}

bool _isChecked = false;

class _LevelTileState extends State<LevelTile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.payType,
              style: regularStyleBold.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_isChecked)
              const Icon(
                CupertinoIcons.check_mark,
                size: 18,
                color: blackColor,
              ),
          ],
        ),
      ),
    );
  }
}
