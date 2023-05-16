import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

class CustomState extends StatefulWidget {
  const CustomState({Key? key}) : super(key: key);

  @override
  State<CustomState> createState() => _CustomState();
}

class _CustomState extends State<CustomState> {
  @override
  bool cancelState1 = true;

  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
              child: const Icon(
                CupertinoIcons.clear,
                color: blackColor,
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
        Text(
          "Cancel the event",
          style: headingStyle24.copyWith(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Why do you want to cancel the event?",
          style: regularStyleBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          "Choose the reason for cancelation:",
          style: smallStyle,
        ),
        const SizedBox(
          height: 27,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CupertinoListTile(
            leading: GestureDetector(
                onTap: () {
                  setState(() {
                    cancelState1 = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border:
                          Border.all(width: 2, color: const Color(0xff282828))),
                  child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(width: 1, color: Colors.transparent),
                          color:
                              cancelState1 ? activeColor : Colors.transparent)),
                )),
            // Icon(
            //   Icons.radio_button_checked,
            //   color: activeColor,
            // ),
            title: const Text(
              'I can\'t make it',
              style: regularStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: CupertinoListTile(
            leading: GestureDetector(
                onTap: () {
                  setState(() {
                    cancelState1 = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border:
                          Border.all(width: 2, color: const Color(0xff282828))),
                  child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(width: 1, color: Colors.transparent),
                          color: !cancelState1
                              ? activeColor
                              : Colors.transparent)),
                )),
            title: const Text(
              'We both want to cancel',
              style: regularStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Text(
            "*Remember to cancel at least 1 day before or you might get a red flag!",
            style: TextStyle(
              color: Color(0XFFFF0000),
              fontSize: 14,
            ),
            maxLines: 2,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: CustomGradientButtonWidget(
            buttonWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "CANCEL",
                  style: regularStyleBold,
                ),
              ],
            ),
            onTapFunction: () {
              Get.back();
              Future.delayed(
                Duration.zero,
                () {
                  Get.generalDialog(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Theme(
                      data: ThemeData.light().copyWith(
                        dialogTheme: const DialogTheme(
                          surfaceTintColor: whiteColor,
                        ),
                      ),
                      child: CupertinoAlertDialog(
                        title: const Text(
                          "Cancel the event",
                          style: smallStyleBold,
                        ),
                        content: const Text(
                          "Are you sure you want to cancel this event?",
                          style: smallStyle,
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text("NO"),
                            onPressed: () => Get.back(),
                          ),
                          CupertinoDialogAction(
                            child: const Text("YES"),
                            onPressed: () {
                              Get.back();
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
