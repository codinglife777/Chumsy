import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Controllers/bnb_controller.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:chumsy_app/Screens/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Constants/bottom_nav_items.dart';
import 'edit_profile_screen1.dart';

class InsideEditHomePage extends StatefulWidget {
  const InsideEditHomePage({Key? key}) : super(key: key);

  @override
  State<InsideEditHomePage> createState() => _InsideEditHomePageState();
}

class _InsideEditHomePageState extends State<InsideEditHomePage> {
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
                    const Center(
                      child: Text('Chats'),
                    ),
                    const Center(
                      child: Text('Community'),
                    ),
                    const Center(
                      child: Text('My Events'),
                    ),
                    EditProfileScreen(
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
