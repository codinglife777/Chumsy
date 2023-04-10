import 'package:flutter/material.dart';

import 'components/chat_user.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String time;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.time});
}

class ChatDetailPage extends StatefulWidget {
  ChatUser user;
  ChatDetailPage({super.key, required this.user});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
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
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.user.imageURL),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Kriss Benwat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 55),
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: (messages[index].messageType == "receiver"
                        //     ? Colors.grey.shade200
                        //     : Colors.blue[200]),
                        gradient: LinearGradient(colors: [
                          messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Color(0xFFD7FDCB),
                          messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Color(0xFFB3FBED)
                        ])),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      // decoration: BoxDecoration(
                      //   color: Colors.lightBlue,
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFF282828),
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 34,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 5, left: 15, right: 15),
                            hintText: "Message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
