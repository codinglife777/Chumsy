import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Functions/show_alert.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/spacing.dart';
import '../../Functions/show_tosts.dart';
import '../../Widgets/chumsyerrordialog.dart';
import 'mobile_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  Future<void> _dialogBuilder(BuildContext context, String errorMessage) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ChumsyErrorDialog(errorMessage: errorMessage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            spacingBoxExtended,
            Container(
              margin: const EdgeInsets.only(
                top: 18,
              ),
              height: screenHeight / 1.6,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/login/bg@2x.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, screenHeight / 6, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: screenWidth / 4,
                    child: Image.asset("assets/login/logo.png",),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: mainButtonSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CupertinoTextField(
                        controller: _emailCont,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                        placeholder: 'E-mail address',
                        placeholderStyle: const TextStyle(
                          fontSize: 13,
                          color: blackColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth / 50,
                          horizontal: screenWidth / 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  SizedBox(
                    height: mainButtonSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CupertinoTextField(
                        controller: _passwordCont,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                        obscureText: true,
                        placeholder: 'Password',
                        placeholderStyle: const TextStyle(
                          fontSize: 13,
                          color: blackColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth / 50,
                          horizontal: screenWidth / 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  SizedBox(
                    height: mainButtonSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          if (_emailCont.text != "" &&
                              _passwordCont.text != "") {
                            Get.off(
                              () => const MobileScreen(),
                            );
                          } else if (_emailCont.text == "") {
                            _dialogBuilder(
                                context, "Please enter an e-mail address");
                            //showErrorToast("Please fill e-mail", context);
                          } else if (_passwordCont.text == "") {
                            _dialogBuilder(context, "Password is required");
                            //showErrorToast("Please fill password", context);
                          }
                          //  else {
                          //   showErrorToast(
                          //       "Please fill e-mail and password", context);
                          // }
                        },
                        child: const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 87,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Sign in with:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: greyIconColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                            onPressed: () => openDialog(context, "Google.com"),
                            child: Image.asset(
                              "assets/login/google.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () =>
                                openDialog(context, "Facebook.com"),
                            child: Image.asset(
                              "assets/login/facebook.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () => openDialog(context, "Apple.com"),
                            child: Image.asset(
                              "assets/login/apple_black@2x.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              child: CupertinoButton(
                onPressed: () => Get.back(),
                child: const Icon(
                  CupertinoIcons.back,
                  size: 35,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
