import 'package:chumsy_app/Controllers/image_controller.dart';
import 'package:chumsy_app/Functions/cupertino_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Functions/chat_bottom_sheet.dart';
import '../../Widgets/Chat_Screen/custom_chat_bubble.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen(
      {super.key,
      required this.name,
      required this.surName,
      required this.image});
  final String name, surName, image;

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

var childList = <Widget>[];
ScrollController _scrollController = ScrollController();
final TextEditingController _text = TextEditingController();
bool showButton = false;

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  void initState() {
    super.initState();
    childList = [
      const Center(
        child: Text(
          "10:23 am",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const OutBubble(
        message: 'Let\'s get lunch. How about pizza?',
      ),
      const SizedBox(
        height: 11,
      ),
      const InBubble(
        message:
            'Let\'s do it! I\'m in a meeting until noon, let\'s do it after.',
      ),
      const SizedBox(
        height: 11,
      ),
      const OutBubble(
        message:
            'That\'s perfect. There\'s a new place on Main St I\'ve been wanting to check out. I hear their hawaiian pizza is off the hook!',
      ),
      const SizedBox(
        height: 11,
      ),
      const InBubble(
        message:
            'I don\'t know why people are so anti pineapple pizza. I kind of like it.',
      ),
      const SizedBox(
        height: 11,
      ),
      const OutBubble(
        message: 'Let\'s get lunch. How about pizza?',
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "Seen 12:54 pm",
            style: smallStyle,
          ),
        ],
      ),
      spacingBox,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(
                CupertinoIcons.back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
            ),
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage(widget.image),
                ),
                horizontalSpacingBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: regularStyleBold.copyWith(
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.surName,
                      style: regularStyleBold.copyWith(
                          fontWeight: FontWeight.w600),
                    ),
                    // Text(
                    //   "Online",
                    //   style: smallStyle.copyWith(
                    //     color: textColor,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(
                Icons.more_horiz_outlined,
                color: blackColor,
              ),
              onPressed: () {
                showChatBottomSheet(context);
              },
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          spacingBox,
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // main chats body
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: screenHeight / 1.25,
                      child: ListView(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: childList,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 2,
                  color: textColor.withOpacity(
                    0.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 0,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            showActionSheet(context, Get.put(ImageController()),
                                "Add a File");
                          },
                          child: const Icon(
                            CupertinoIcons.add,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CupertinoTextField(
                          controller: _text,
                          onChanged: (value) {
                            setState(() {
                              if (value != "") {
                                showButton = true;
                              } else {
                                showButton = false;
                              }
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              spacingBox;
                              childList.add(OutBubble(message: value));
                              spacingBox;
                              _scrollController.jumpTo(screenHeight);
                            });
                            _text.clear();
                          },
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            border: Border.all(
                              color: blackColor,
                              width: 2,
                            ),
                          ),
                          placeholder: 'Message...',
                          placeholderStyle: const TextStyle(
                            fontSize: 13,
                            color: blackColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      if (showButton)
                        Expanded(
                          flex: 0,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                spacingBox;
                                childList.add(OutBubble(message: _text.text));
                                spacingBox;
                                _scrollController.jumpTo(screenHeight);
                              });
                              _text.clear();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 25,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(
                                  100,
                                ),
                                gradient: const LinearGradient(
                                  colors: [
                                    neonColor,
                                    blueColor,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: const Text(
                                "Send",
                                style: smallStyleBold,
                              ),
                            ),
                          ),
                        ),
                      if (!showButton)
                        Expanded(
                          flex: 0,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showActionSheet(context,
                                  Get.put(ImageController()), "Add a File");
                            },
                            child: const Icon(
                              CupertinoIcons.camera,
                              color: blackColor,
                            ),
                          ),
                        ),
                      if (!showButton)
                        Expanded(
                          flex: 0,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: const Icon(
                              CupertinoIcons.mic,
                              color: blackColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
