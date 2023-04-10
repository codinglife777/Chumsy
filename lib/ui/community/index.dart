import 'package:chumsy/ui/community/tweets.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String time;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.time});
}

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  bool isFeed = true;

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> messages = [
      ChatMessage(
          messageContent: "Hello, Will",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "How have you been?",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "ehhhh, doing OK.",
          messageType: "receiver",
          time: "10:23 am"),
      ChatMessage(
          messageContent: "Is there any thing wrong?",
          messageType: "sender",
          time: "10:23 am"),
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(),
                    const Text("Community",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282828))),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add_alt,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    
                  ),
                )
              ],
            ),
          ),
        ),
        body: listOfTweets());
  }

  Widget listOfTweets() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return tweets[index];
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0,
        ),
        itemCount: tweets.length,
      ),
    );
  }
}
