import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Controllers/bnb_controller.dart';
import 'package:chumsy_app/Screens/Community_Screens/view_friend.dart';
import 'package:chumsy_app/Screens/My_Profile_Screens/profile_edit_screen.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:chumsy_app/Screens/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/bottom_nav_items.dart';
import '../My_Profile_Screens/profile_screen.dart';
import 'add_contact_screen.dart';

class ViewFriendPage extends StatefulWidget {
  const ViewFriendPage(
      {Key? key,
      required this.dp,
      required this.nameAndAge,
      required this.location})
      : super(key: key);
  final String dp, nameAndAge, location;
  @override
  State<ViewFriendPage> createState() => _ViewFriendPageState();
}

class _ViewFriendPageState extends State<ViewFriendPage> {
  final BNBController _bnbCont = Get.put(BNBController());

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Obx(
      () => CupertinoTabScaffold(
        backgroundColor: whiteColor,
        tabBar: CupertinoTabBar(
          onTap: (val) {
            Get.off(() => const LandingPage());
            _bnbCont.changeIndex(val);
          },
          backgroundColor: whiteColor,
          currentIndex: _bnbCont.currentIndex.value,
          activeColor: blackColor,
          inactiveColor: blackColor,
          items: bottomNavItems(context, _bnbCont),
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return LayoutBuilder(builder: (context, constraints) {
                return IndexedStack(
                  index: _bnbCont.currentIndex.value,
                  children: [
                    MapScreen(
                      constraints: constraints,
                    ),
                    Center(
                      child: Text(l.chats),
                    ),
                    ViewFriendProfile(
                      dp: widget.dp,
                      location: widget.location,
                      nameAndAge: widget.nameAndAge,
                    ),
                    Center(
                      child: Text(l.myEvents),
                    ),
                    ProfileScreen(
                      constraints: constraints,
                    ),
                  ],
                );
              });
            },
          );
        },
      ),
    );
  }
}

class FindFriendPage extends StatefulWidget {
  const FindFriendPage({Key? key}) : super(key: key);
  @override
  State<FindFriendPage> createState() => _FindFriendPageState();
}

class _FindFriendPageState extends State<FindFriendPage> {
  final BNBController _bnbCont = Get.put(BNBController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CupertinoTabScaffold(
        backgroundColor: whiteColor,
        tabBar: CupertinoTabBar(
          onTap: (val) {
            Get.off(() => const LandingPage());
            _bnbCont.changeIndex(val);
          },
          backgroundColor: whiteColor,
          currentIndex: _bnbCont.currentIndex.value,
          activeColor: blackColor,
          inactiveColor: blackColor,
          items: bottomNavItems(_bnbCont),
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return LayoutBuilder(builder: (context, constraints) {
                return IndexedStack(
                  index: _bnbCont.currentIndex.value,
                  children: [
                    MapScreen(
                      constraints: constraints,
                    ),
                    const Center(
                      child: Text('Chats'),
                    ),
                    const AddContactScreen(),
                    const Center(
                      child: Text('My Events'),
                    ),
                    ProfileScreen(
                      constraints: constraints,
                    ),
                  ],
                );
              });
            },
          );
        },
      ),
    );
  }
}
