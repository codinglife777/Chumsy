import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';


typedef SelectCallback = Function(int key);

class CreateEventGender extends StatefulWidget {
  const CreateEventGender({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventGender> createState() => _CreateEventGenderState();
}

class _CreateEventGenderState extends State<CreateEventGender> {
  void clear() {}

  bool selectAll = false;
  List<bool> selectGenders = [false, false, false];

  void onSelect (int index) {
    if (index == 3) {
      setState(() {
        selectAll = !selectAll;
        if (selectAll) {
          selectGenders[0] = selectGenders[1] = selectGenders[2] = false;
        }
      });
    } else {
      setState(() {
        selectGenders[index] = !selectGenders[index];
        if (selectGenders[0] && selectGenders[1] && selectGenders[2]) {
          selectAll = true;
          selectGenders[0] = selectGenders[1] = selectGenders[2] = false;
        } else {
          selectAll = false;
        }
      });
    }
  }

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
                            isSelcted: selectAll,
                            index: 3,
                            onSelect: onSelect,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.male,
                            isSelcted: selectGenders[0],
                            index: 0,
                            onSelect: onSelect,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.female,
                            isSelcted: selectGenders[1],
                            index: 1,
                            onSelect: onSelect,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.nonBinary,
                            isSelcted: selectGenders[2],
                            index: 2,
                            onSelect: onSelect,
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
    required this.payType, required this.isSelcted, required this.index, required this.onSelect,
  });
  final String payType;
  final bool isSelcted;
  final int index;
  final SelectCallback onSelect;

  @override
  State<LevelTile> createState() => _LevelTileState();
}


class _LevelTileState extends State<LevelTile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        widget.onSelect(widget.index);
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
            if (widget.isSelcted)
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
          ],
        ),
      ),
    );
  }
}
