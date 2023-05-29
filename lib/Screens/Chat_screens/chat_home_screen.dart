import 'package:chumsy_app/Widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import 'custom_chat_time.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      // height: screenHeight,
      // width: screenWidth,
      constraints: widget.constraints,
      color: whiteColor,
      child: Column(
        children: [
          CustomAppBar(
            title: l.chat,
            isBack: false,
            suffix: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: CupertinoButton(
                onPressed: () {},
                child: const ImageIcon(
                  AssetImage('assets/extras/user_add.png'),
                  size: 22,
                ),
              ),
            ),
          ),
          spacingBox,
          // Expanded(
          //   flex: 1,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // search field
                  // Expanded(
                  //   flex: 0,
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      // color: textColor.withOpacity(
                      //   0.07,
                      // ),
                      color: const Color(0xffeeeef0),
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        horizontalSpacingBox,
                        const Expanded(
                          flex: 0,
                          child: Icon(
                            CupertinoIcons.search,
                            color: Color(0xff777777),
                          ),
                        ),
                        horizontalSpacingBox,
                        Expanded(
                          flex: 1,
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            placeholder: l.search,
                            placeholderStyle: regularStyleBold.copyWith(
                                color: const Color(0xff888888),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(3, 3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // main body
                  Container(
                    // flex: 0,
                    // child: SizedBox(
                    //   height: screenHeight,
                    constraints: BoxConstraints(
                        maxHeight: widget.constraints.maxHeight - 149),
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      children: const [
                        ChatTile(
                          name: "Alexandra",
                          surName: "Pawluczuk-Loskot",
                          profileLocation: "assets/extras/dp_1.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Dee",
                          surName: "McRobie",
                          profileLocation: "assets/extras/dp_2.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Max",
                          surName: "Kowalski",
                          profileLocation: "assets/extras/dp_3.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Anna Perez",
                          surName: "Kowalski",
                          profileLocation: "assets/extras/dp_4.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Luna",
                          surName: "Kowalski",
                          profileLocation: "assets/extras/dp_4.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Robert Johnson",
                          surName: "Kowalski",
                          profileLocation: "assets/extras/dp_2.jpg",
                          message:
                              "Nice. I don't know why peoole get all worked up about hawaiian pizza. I like it",
                          time: "9: 36 AM",
                        ),
                        ChatTile(
                          name: "Sarah",
                          surName: "Johnson",
                          profileLocation: "assets/extras/dp_3.jpg",
                          message: "Hey there! How are you doing today?",
                          time: "10:30 AM",
                        ),
                        ChatTile(
                          name: "John",
                          surName: "Kowalski",
                          profileLocation: "assets/extras/dp_1.jpg",
                          message: "Can't wait for the weekend! Any plans?",
                          time: "11:15 AM",
                        ),
                        ChatTile(
                          name: "Jane",
                          surName: "Smith",
                          profileLocation: "assets/extras/dp_2.jpg",
                          message: "I'm so excited for the concert tonight!",
                          time: "1:45 PM",
                        ),
                        ChatTile(
                          name: "Mike",
                          surName: "Davis",
                          profileLocation: "assets/extras/dp_3.jpg",
                          message: "What's up?",
                          time: "3:20 PM",
                        )
                      ],
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}
