import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

typedef SelectCallback = Function(int key);

class CreateEventWIthWhom extends StatefulWidget {
  const CreateEventWIthWhom({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventWIthWhom> createState() => _CreateEventWIthWhomState();
}

class _CreateEventWIthWhomState extends State<CreateEventWIthWhom> {
  bool select1 = false;
  bool select2 = false;

  void clear() {}

  void onSelect(int index) {
    setState(() {
      select1 = index == 0;
      select2 = !select1;
    });
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
                            payType: l.friends,
                            index: 0,
                            cb: onSelect,
                            selected: select1,
                          ),
                          spacingBox,
                          LevelTile(
                            payType: l.public,
                            index: 1,
                            cb: onSelect,
                            selected: select2,
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
            title: l.withWhom,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}

class WithWhomTypes extends StatelessWidget {
  const WithWhomTypes({
    super.key,
    required this.payType,
  });
  final String payType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          Text(
            payType,
            style: regularStyleBold.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
    required this.selected,
    required this.index,
    required this.cb,
  });
  final String payType;
  final bool selected;
  final int index;
  final SelectCallback cb;

  @override
  State<LevelTile> createState() => _LevelTileState();
}

class _LevelTileState extends State<LevelTile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        widget.cb(widget.index);
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
            if (widget.selected)
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
