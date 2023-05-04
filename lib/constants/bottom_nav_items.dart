import 'package:flutter/material.dart';

import '../Controllers/bnb_controller.dart';

List<BottomNavigationBarItem> bottomNavItems(BNBController bnbCont) {
  return [
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 0
          ? Image.asset(
              "assets/home/select_map_bottom@2x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/map_bottom@2x.png",
              width: 22,
            ),
      label: 'Map',
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 1
          ? Image.asset(
              "assets/home/select_chat_bottom@2x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/chat_bottom@2x.png",
              width: 22,
            ),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 2
          ? Image.asset(
              "assets/home/select_community_bottom@2x.png",
              width: 24,
            )
          : Image.asset(
              "assets/home/cheer@2x.png",
              width: 24,
            ),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 3
          ? Image.asset(
              "assets/home/select_event_bottom@2x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/event_bottom@2x.png",
              width: 22,
            ),
      label: 'My Events',
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 4
          ? const CircleAvatar(
              radius: 14,
              foregroundImage: AssetImage("assets/register/avatar@2x.png"),
            )
          : const CircleAvatar(
              radius: 14,
              foregroundImage: AssetImage("assets/register/avatar@2x.png"),
            ),
      label: 'Profile',
    )
  ];
}
