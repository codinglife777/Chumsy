// import 'dart:io';

import 'dart:io';

import 'package:chumsy/ui/chat/components/chat_user.dart';
import 'package:flutter/material.dart';

class ChatIndex extends StatefulWidget {
  const ChatIndex({Key? key}) : super(key: key);

  @override
  State<ChatIndex> createState() => _ChatIndexState();
}

class _ChatIndexState extends State<ChatIndex> {
  File? profileFile;
  bool isLifestyle = false;
  final TextEditingController txtSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void search() {}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<ChatUser> chatUsers = [
      ChatUser(
          name: "Jane Russel",
          messageText: "Awesome Setup",
          imageURL: "assets/register/avatar.png",
          time: "Now"),
      ChatUser(
          name: "Glady's Murphy",
          messageText: "That's Great",
          imageURL: "assets/register/avatar.png",
          time: "Yesterday"),
      ChatUser(
          name: "Jorge Henry",
          messageText: "Hey where are you?",
          imageURL: "assets/register/avatar.png",
          time: "31 Mar"),
      ChatUser(
          name: "Philip Fox",
          messageText: "Busy! Call me in 20 mins",
          imageURL: "assets/register/avatar.png",
          time: "28 Mar"),
      ChatUser(
          name: "Debra Hawkins",
          messageText: "Thankyou, It's awesome",
          imageURL: "assets/register/avatar.png",
          time: "23 Mar"),
      ChatUser(
          name: "Jacob Pena",
          messageText: "will update you in evening",
          imageURL: "assets/register/avatar.png",
          time: "17 Mar"),
      ChatUser(
          name: "Andrey Jones",
          messageText: "Can you please share the file?",
          imageURL: "assets/register/avatar.png",
          time: "24 Feb"),
      ChatUser(
          name: "John Wick",
          messageText: "How are you?",
          imageURL: "assets/register/avatar.png",
          time: "18 Feb"),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: Container(
              alignment: Alignment.center,
              child: const Text(
                "Chat",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff282828), fontSize: 18),
              )),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            Flexible(
                flex: 7,
                fit: FlexFit.tight,
                // height: screenSize.height * 0.6,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ConversationList(
                        user: chatUsers[index],
                        isMessageRead:
                            (index == 0 || index == 3) ? true : false,
                      );
                    },
                  ),
                ))
          ],
        ));
  }
}
