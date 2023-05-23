import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

Future<void> showChatBottomSheet(BuildContext context, bool isCommunity) {
  AppLocalizations l = AppLocalizations.of(context)!;
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
      minHeight: isCommunity ? screenHeight / 4 : screenHeight / 2.5,
      onPanelClosed: () {
        Get.back();
      },
      panel: Column(
        children: [
          spacingBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                onPanDown: (details) {
                  Get.back();
                },
                onTapDown: (details) {
                  Get.back();
                },
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            child: Column(
              children: [
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/icons/alert@2x.png"),
                  leadingSize: 28,
                  title: Text(
                    l.report,
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: AutoSizeText(
                    l.somethingNotRight,
                    style: smallStyle,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                isCommunity
                    ? const SizedBox()
                    : CupertinoListTile(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        onTap: () => Get.back(),
                        leading: Image.asset("assets/extras/icons/ban.png"),
                        leadingSize: 28,
                        title: AutoSizeText(
                          l.block,
                          style: regularStyleBold.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          softWrap: true,
                        ),
                        subtitle: Text(
                          l.youCanBlocktheUser,
                          style: smallStyle,
                        ),
                      ),
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onTap: () => Get.back(),
                  leading: Image.asset("assets/extras/user_add.png"),
                  leadingSize: 28,
                  title: Text(
                    l.addToFriends,
                    style: regularStyleBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: AutoSizeText(
                    l.inviteToBecomeFriends,
                    style: smallStyle,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                isCommunity
                    ? CupertinoListTile(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        onTap: () => Get.back(),
                        leading:
                            Image.asset("assets/extras/icons/download.png"),
                        leadingSize: 28,
                        title: Text(
                          l.downloadPhoto,
                          style: regularStyleBold.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          l.youCanDownload,
                          style: smallStyle,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      )
                    : CupertinoListTile(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        onTap: () => Get.back(),
                        leading: Image.asset("assets/extras/icons/mute.png"),
                        leadingSize: 28,
                        title: Text(
                          l.mute,
                          style: regularStyleBold.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          l.youCanMute,
                          style: smallStyle,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
