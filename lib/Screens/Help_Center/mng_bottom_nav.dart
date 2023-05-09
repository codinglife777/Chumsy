import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Controllers/bnb_controller.dart';
import 'package:chumsy_app/Screens/Help_Center/report.dart';
import 'package:chumsy_app/Screens/Help_Center/support.dart';
import 'package:chumsy_app/Screens/My_Profile_Screens/profile_edit_screen.dart';
import 'package:chumsy_app/Screens/My_Profile_Screens/profile_screen.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:chumsy_app/Screens/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/bottom_nav_items.dart';
import 'faq.dart';
import 'faq_answer.dart';
import 'front_screen.dart';

class MngHelpPages extends StatefulWidget {
  const MngHelpPages({Key? key}) : super(key: key);

  @override
  State<MngHelpPages> createState() => _MngHelpPagesState();
}

class _MngHelpPagesState extends State<MngHelpPages> {
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
                    const HelpCenterMain(
                        // constraints: constraints,
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

class MngFaqPage extends StatefulWidget {
  const MngFaqPage({Key? key}) : super(key: key);

  @override
  State<MngFaqPage> createState() => _MngFaqPageState();
}

class _MngFaqPageState extends State<MngFaqPage> {
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
                    const HelpCenterFaq(
                        // constraints: constraints,
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

class MngFaqAnswerPage extends StatefulWidget {
  const MngFaqAnswerPage({Key? key, required this.question}) : super(key: key);
  final String question;
  @override
  State<MngFaqAnswerPage> createState() => _MngFaqAnswerPageState();
}

class _MngFaqAnswerPageState extends State<MngFaqAnswerPage> {
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
                    HelpCenterFaqAns(
                      question: widget.question,
                      // constraints: constraints,
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

class MngReportPage extends StatefulWidget {
  const MngReportPage({Key? key}) : super(key: key);

  @override
  State<MngReportPage> createState() => _MngReportPagetate();
}

class _MngReportPagetate extends State<MngReportPage> {
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
                    const HelpCenterReport(
                        // constraints: constraints,
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

class MngSupportPage extends StatefulWidget {
  const MngSupportPage({Key? key}) : super(key: key);

  @override
  State<MngSupportPage> createState() => _MngSupportPageState();
}

class _MngSupportPageState extends State<MngSupportPage> {
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
                    const HelpCenterSupport(
                        // constraints: constraints,
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
