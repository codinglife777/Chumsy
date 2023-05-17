import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Functions/build_event_row.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/sizes.dart';

class EventGoingOn extends StatefulWidget {
  const EventGoingOn({super.key});

  @override
  State<EventGoingOn> createState() => _EventGoingOnState();
}

bool showOptions = false;

class _EventGoingOnState extends State<EventGoingOn> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/extras/screenBack.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: screenHeight,
      width: screenWidth,
      child: CupertinoPageScaffold(
        backgroundColor: transparentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topAppBarSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.back,
                        color: blackColor,
                      ),
                    ),
                    onPressed: () => Get.back(),
                  ),
                  if (!showOptions)
                    CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      child: Theme(
                        data: ThemeData.light().copyWith(
                          dropdownMenuTheme: const DropdownMenuThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: whiteColor,
                            ),
                          ),
                        ),
                        child: PullDownButton(
                          itemBuilder: (context) => [
                            PullDownMenuItem(
                              icon: CupertinoIcons.arrow_down_to_line,
                              iconColor: blackColor,
                              title: l.share,
                              onTap: () {},
                            ),
                            const PullDownMenuDivider(),
                            PullDownMenuItem(
                              icon: CupertinoIcons.delete,
                              iconColor: blackColor,
                              title: l.delete,
                              onTap: () {},
                            ),
                          ],
                          position: PullDownMenuPosition.automatic,
                          buttonBuilder: (context, showMenu) => CupertinoButton(
                            onPressed: showMenu,
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              Icons.more_horiz,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            !showOptions
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 50),
                    child: CustomGradientButtonWidget(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l.next,
                            style: smallStyleBold,
                          ),
                        ],
                      ),
                      onTapFunction: () {
                        setState(() {
                          showOptions = true;
                        });
                      },
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                      ),
                      height: screenHeight / 1.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            spacingBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l.addDescription,
                                  style: smallStyleBold,
                                ),
                                spacingBox,
                                spacingBox,
                                CupertinoTextField(
                                  maxLines: 5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  placeholder: l.thisEventWas,
                                  placeholderStyle: smallStyle,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: textColor.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            spacingBox,
                            buildRow(l.tagPeople, l.choose, () {}),
                            spacingBox,
                            buildRow(l.shareWith, l.friends, () {}),
                            spacingBox,
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 40,
                                top: 50,
                              ),
                              child: CustomGradientButtonWidget(
                                buttonWidget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      l.shareWithCommunity,
                                      style: smallStyleBold,
                                    ),
                                  ],
                                ),
                                onTapFunction: () {
                                  Get.generalDialog(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        Theme(
                                      data: ThemeData.light().copyWith(
                                        dialogTheme: const DialogTheme(
                                          surfaceTintColor: whiteColor,
                                        ),
                                      ),
                                      child: CupertinoAlertDialog(
                                        title: Text(
                                          l.postedSuccess,
                                          style: smallStyleBold,
                                        ),
                                        content: Text(
                                          l.yourPhotoWasShared,
                                          style: smallStyle,
                                        ),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text(l.ok_c),
                                            onPressed: () {
                                              Get.back();
                                              Get.back();
                                              setState(() {
                                                showOptions = false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
