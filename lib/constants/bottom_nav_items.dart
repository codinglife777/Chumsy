import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Controllers/bnb_controller.dart';

List<BottomNavigationBarItem> bottomNavItems(BuildContext context, BNBController bnbCont) {
  AppLocalizations l = AppLocalizations.of(context)!;
  return [
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 0
          ? Image.asset(
              "assets/home/select_map_bottom@3x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/map_bottom@3x.png",
              width: 22,
            ),
      label: l.map,
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 1
          ? Image.asset(
              "assets/home/select_chat_bottom@3x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/chat_bottom@3x.png",
              width: 22,
            ),
      label: l.chat,
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 2
          ? Image.asset(
              "assets/home/select_community_bottom@3x.png",
              width: 24,
            )
          : Image.asset(
              "assets/home/cheer@3x.png",
              width: 24,
            ),
      label: l.community,
    ),
    BottomNavigationBarItem(
      icon: bnbCont.currentIndex.value == 3
          ? Image.asset(
              "assets/home/select_event_bottom@3x.png",
              width: 22,
            )
          : Image.asset(
              "assets/home/event_bottom@3x.png",
              width: 22,
            ),
      label: l.myEvents,
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
      label: l.profile,
    )
  ];
}
