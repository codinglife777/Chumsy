import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';

Future<void> showMapBottomSheet(BuildContext context) {
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
      minHeight: screenHeight / 2.5,
      // onPanelClosed: () {},
      panel: const MapEventBottomPanel(),
    ),
  );
}

class MapEventBottomPanel extends StatefulWidget {
  const MapEventBottomPanel({Key? key}) : super(key: key);

  @override
  State<MapEventBottomPanel> createState() => _MapEventBottomPanel();
}

class _MapEventBottomPanel extends State<MapEventBottomPanel> {
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
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
                onTap: () {
                  setState(() {
                    idx = 0;
                  });
                },
                title: Row(
                  children: [
                    Text(
                      l.distance1,
                      style: regularStyleBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    idx == 0
                        ? Text(
                            String.fromCharCode(
                                CupertinoIcons.up_arrow.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: CupertinoIcons.check_mark.fontFamily,
                              package: CupertinoIcons.check_mark.fontPackage,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                trailing: idx == 0
                    ? Text(
                        String.fromCharCode(
                            CupertinoIcons.check_mark.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: CupertinoIcons.check_mark.fontFamily,
                          package: CupertinoIcons.check_mark.fontPackage,
                        ),
                      )
                    : const SizedBox(),
              ),
              CupertinoListTile(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                onTap: () {
                  setState(() {
                    idx = 1;
                  });
                },
                title: Row(
                  children: [
                    Text(
                      l.disciplineAlphabetic,
                      style: regularStyleBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    idx == 1
                        ? Text(
                            String.fromCharCode(
                                CupertinoIcons.up_arrow.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: CupertinoIcons.check_mark.fontFamily,
                              package: CupertinoIcons.check_mark.fontPackage,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                trailing: idx == 1
                    ? Text(
                        String.fromCharCode(
                            CupertinoIcons.check_mark.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: CupertinoIcons.check_mark.fontFamily,
                          package: CupertinoIcons.check_mark.fontPackage,
                        ),
                      )
                    : const SizedBox(),
              ),
              CupertinoListTile(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                onTap: () {
                  setState(() {
                    idx = 2;
                  });
                },
                title: Row(
                  children: [
                    Text(
                      l.startingTime,
                      style: regularStyleBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    idx == 2
                        ? Text(
                            String.fromCharCode(
                                CupertinoIcons.up_arrow.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: CupertinoIcons.check_mark.fontFamily,
                              package: CupertinoIcons.check_mark.fontPackage,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                trailing: idx == 2
                    ? Text(
                        String.fromCharCode(
                            CupertinoIcons.check_mark.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: CupertinoIcons.check_mark.fontFamily,
                          package: CupertinoIcons.check_mark.fontPackage,
                        ),
                      )
                    : const SizedBox(),
              ),
              CupertinoListTile(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                onTap: () {
                  setState(() {
                    idx = 3;
                  });
                },
                title: Row(
                  children: [
                    Text(
                      l.duration,
                      style: regularStyleBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    idx == 3
                        ? Text(
                            String.fromCharCode(
                                CupertinoIcons.up_arrow.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: CupertinoIcons.check_mark.fontFamily,
                              package: CupertinoIcons.check_mark.fontPackage,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                trailing: idx == 3
                    ? Text(
                        String.fromCharCode(
                            CupertinoIcons.check_mark.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: CupertinoIcons.check_mark.fontFamily,
                          package: CupertinoIcons.check_mark.fontPackage,
                        ),
                      )
                    : const SizedBox(),
              ),
              CupertinoListTile(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                onTap: () {
                  setState(() {
                    idx = 4;
                  });
                },
                title: Row(
                  children: [
                    Text(
                      l.level,
                      style: regularStyleBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    idx == 4
                        ? Text(
                            String.fromCharCode(
                                CupertinoIcons.up_arrow.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: CupertinoIcons.check_mark.fontFamily,
                              package: CupertinoIcons.check_mark.fontPackage,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                trailing: idx == 4
                    ? Text(
                        String.fromCharCode(
                            CupertinoIcons.check_mark.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: CupertinoIcons.check_mark.fontFamily,
                          package: CupertinoIcons.check_mark.fontPackage,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
