import 'package:chumsy/ui/chat/index.dart';
import 'package:chumsy/ui/community/index.dart';
import 'package:chumsy/ui/map/index.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State {
  int pageIndex = 0;

  final List _pages = [
    const Center(
      child: MapView(),
    ),
    const Center(
      child: ChatIndex(),
    ),
    Center(
      child: CommunityPage(),
    ),
    const Center(
      child: Text("My Events"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 98,
      color: Colors.white,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).primaryColor,
      //   borderRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? Image.asset("assets/home/mylocation@1x.png")
                    : Image.asset("assets/home/map_bottom@2x.png"),
              ),
              Text(
                "Map",
                style: TextStyle(
                    color: const Color(0xff282828),
                    fontSize: 12,
                    fontWeight:
                        pageIndex == 0 ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                // enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? Image.asset("assets/home/select_chat_bottom@2x.png")
                    : Image.asset("assets/home/chat_bottom@2x.png"),
              ),
              Text(
                "Chat",
                style: TextStyle(
                    color: const Color(0xff282828),
                    fontSize: 12,
                    fontWeight:
                        pageIndex == 1 ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                // enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? Image.asset("assets/home/select_community_bottom@2x.png")
                    : Image.asset("assets/home/community_bottom@2x.png"),
              ),
              Text(
                "Community",
                style: TextStyle(
                    color: const Color(0xff282828),
                    fontSize: 12,
                    fontWeight:
                        pageIndex == 2 ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                // enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? Image.asset("assets/home/select_event_bottom@2x.png")
                    : Image.asset("assets/home/event_bottom@2x.png"),
              ),
              Text(
                "My Events",
                style: TextStyle(
                    color: const Color(0xff282828),
                    fontSize: 12,
                    fontWeight:
                        pageIndex == 3 ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                // enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                icon: pageIndex == 4
                    ? Image.asset("assets/register/avatar.png")
                    : Image.asset("assets/register/avatar.png"),
              ),
              Text(
                "Profile",
                style: TextStyle(
                    color: const Color(0xff282828),
                    fontSize: 12,
                    fontWeight:
                        pageIndex == 4 ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
        ],
      ),
    );
  }
}
