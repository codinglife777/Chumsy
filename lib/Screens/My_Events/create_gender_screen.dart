import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventGender extends StatefulWidget {
  const CreateEventGender({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventGender> createState() => _CreateEventGenderState();
}

class _CreateEventGenderState extends State<CreateEventGender> {
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
                            payType: l.all,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.male,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.female,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.nonBinary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30,
                    ),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.btnText,
                            style: regularStyleBold,
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
            title: l.gender,
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

bool _selected = false;

class _LevelTileState extends State<LevelTile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _selected = !_selected;
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
            if (_selected)
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
