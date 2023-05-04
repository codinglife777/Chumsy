import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'custom_chat_time.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: whiteColor,
      child: Column(
        children: [
          topAppBarSpacing,
          spacingBox,
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Chat",
                  style: subHeadingStyle,
                ),
              ],
            ),
          ),
          spacingBox,
          const Divider(),
          spacingBox,
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // search field
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: textColor.withOpacity(
                            0.2,
                          ),
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            horizontalSpacingBox,
                            Expanded(
                              flex: 0,
                              child: Icon(
                                CupertinoIcons.search,
                                color: blackColor,
                              ),
                            ),
                            horizontalSpacingBox,
                            Expanded(
                              flex: 1,
                              child: CupertinoTextField(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                placeholder: 'Search',
                                placeholderStyle: TextStyle(
                                  color: greyIconColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      100,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    // main body
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: screenHeight / 1.25,
                        child: ListView(
                          shrinkWrap: true,
                          children: const [
                            ChatTile(
                              name: "Max Smith",
                              profileLocation: "assets/extras/dp_1.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Dee McRobie",
                              profileLocation: "assets/extras/dp_2.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Max Kowalski",
                              profileLocation: "assets/extras/dp_3.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Anna Perez",
                              profileLocation: "assets/extras/dp_4.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Luna Kith",
                              profileLocation: "assets/extras/dp_4.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Robert Johnson",
                              profileLocation: "assets/extras/dp_2.jpg",
                              message:
                                  "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                              time: "9: 36 AM",
                            ),
                            ChatTile(
                              name: "Sarah Johnson",
                              profileLocation: "assets/extras/dp_3.jpg",
                              message: "Hey there! How are you doing today?",
                              time: "10:30 AM",
                            ),
                            ChatTile(
                              name: "John Doe",
                              profileLocation: "assets/extras/dp_1.jpg",
                              message: "Can't wait for the weekend! Any plans?",
                              time: "11:15 AM",
                            ),
                            ChatTile(
                              name: "Jane Smith",
                              profileLocation: "assets/extras/dp_2.jpg",
                              message:
                                  "I'm so excited for the concert tonight!",
                              time: "1:45 PM",
                            ),
                            ChatTile(
                              name: "Mike Davis",
                              profileLocation: "assets/extras/dp_3.jpg",
                              message: "What's up?",
                              time: "3:20 PM",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
