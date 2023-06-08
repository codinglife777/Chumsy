import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/Registration_Screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/swipe_constants.dart';
import '../../Functions/cupertino_action_sheet.dart';
import 'signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int activatedPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<SwipItem> swipItems = [
      SwipItem(
          title: AppLocalizations.of(context)!.sport,
          imagePath: 'assets/login/sports.png'),
      SwipItem(
          title: AppLocalizations.of(context)!.lifeStyle,
          imagePath: 'assets/login/lifestyle@2x.png'),
      SwipItem(
          title: AppLocalizations.of(context)!.nameIt,
          imagePath: 'assets/login/nameit@2x.png'),
    ];
    final double screenHeight = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(
            top: activatedPage == 2 ? 0 : 80,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: screenHeight / 2.2,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 57, vertical: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage(swipItems[0].imagePath),
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            swipItems[0].title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 57,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(swipItems[1].imagePath),
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                            swipItems[1].title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),) ,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 96,
                          left: 57,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(swipItems[2].imagePath),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Text(
                          swipItems[2].title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    onPageChanged: (value) {
                      setState(() {
                        activatedPage = value;

                      });
                    },
                  ),
                ),
              ),
              if (activatedPage == 2)
                const SizedBox(
                  height: 80,
                ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: activatedPage == 0 ? 12 : 9,
                        height: activatedPage == 0 ? 12 : 9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                          color: activatedPage == 0 ? neonColor : blackColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                      ),
                      horizontalSpacingBoxSmall,
                      Container(
                        width: activatedPage == 1 ? 12 : 9,
                        height: activatedPage == 1 ? 12 : 9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                          color: activatedPage == 1 ? neonColor : blackColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                      ),
                      horizontalSpacingBoxSmall,
                      Container(
                        width: activatedPage == 2 ? 12 : 9,
                        height: activatedPage == 2 ? 12 : 9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                          color: activatedPage == 2 ? neonColor : blackColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeToChumsy,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(
                            //   vertical: screenHeight / 45,
                            // ),
                            minimumSize: Size(screenWidth, 51),
                            maximumSize: Size(screenWidth, 51),
                            backgroundColor: blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => const SignupScreen());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signUpText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(screenWidth, 51),
                            maximumSize: Size(screenWidth, 51),
                            // padding: EdgeInsets.symmetric(
                            //   vertical: screenHeight / 45,
                            // ),
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              color: blackColor,
                              width: 2,
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.loginText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextButton(
                        onPressed: () {
                          showChangeLanguageAction(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.changeLanguage,
                          style: const TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: blackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
