import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventLevel extends StatefulWidget {
  const CreateEventLevel({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventLevel> createState() => _CreateEventLevelState();
}

class _CreateEventLevelState extends State<CreateEventLevel> {
  void clear() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
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
                        children: [
                          LevelTile(
                            payType: l.beginner,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.intermediate,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.advanced,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.pro,
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
          EventAppBar(
            title: l.level,
            cbClear: clear,
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


class _LevelTileState extends State<LevelTile> {
bool _isChecked = false;
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
            Text(
              String.fromCharCode(CupertinoIcons.check_mark.codePoint),
              style: TextStyle(
                inherit: false,
                color: blackColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: CupertinoIcons.check_mark.fontFamily,
                package: CupertinoIcons.check_mark.fontPackage,
              ),
            )
              // const Icon(
              //   CupertinoIcons.check_mark,
              //   size: 18,
              //   color: blackColor,
              //   weight: 500.00,
              // ),
          ],
        ),
      ),
    );
  }
}
