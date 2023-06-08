import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class FilterPrice extends StatefulWidget {
  const FilterPrice({super.key});

  @override
  State<FilterPrice> createState() => _FilterPriceState();
}

class _FilterPriceState extends State<FilterPrice> {
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
                            payType: l.free,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.paid,
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
                            l.save,
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
            title: l.price,
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
  bool _selected = false;
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
