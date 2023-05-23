import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

Future<void> openShareBottomSheet(BuildContext context,
    {bool isMyEvents = true}) {
  AppLocalizations l = AppLocalizations.of(context)!;
  bool isPanelClosed = false;
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          30,
        ),
        topRight: Radius.circular(
          30,
        ),
      ),
      onPanelClosed: () {
        if (!isPanelClosed) {
          Get.back();
          isPanelClosed = true;
        }
      },
      minHeight: isMyEvents ? 100 : 300,
      panel: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              isMyEvents
                  ? const SizedBox()
                  : CupertinoListTile(
                      onTap: () {
                        Get.back();
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      leading: Image.asset(
                        "assets/extras/icons/alert@2x.png",
                      ),
                      title: Text(
                        l.report,
                        style: regularStyleBold,
                      ),
                      subtitle: AutoSizeText(
                        l.somethingNotRight,
                        style: regularStyle,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
              isMyEvents
                  ? const SizedBox()
                  : CupertinoListTile(
                      onTap: () {
                        Share.share("Chumsy").then((value) => Get.back());
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      leading: Image.asset(
                        "assets/extras/icons/Path 5490@2x.png",
                      ),
                      title: Text(
                        l.saveL,
                        style: regularStyleBold,
                      ),
                      subtitle: AutoSizeText(
                        l.youCanSavetheEventforLater,
                        style: regularStyle,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
              CupertinoListTile(
                onTap: () {
                  Share.share("Chumsy").then((value) => Get.back());
                },
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                leading: Image.asset(
                  "assets/extras/icons/share (5)@2x.png",
                ),
                title: Text(
                  l.shareEvent,
                  style: regularStyleBold,
                ),
                subtitle: AutoSizeText(
                  l.youCanSharetheEventWithAnyone,
                  style: regularStyle,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
              spacingBoxExtended,
            ],
          ),
        ],
      ),
    ),
  );
}
