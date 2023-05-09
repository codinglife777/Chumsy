import 'package:chumsy_app/Functions/show_alert.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Functions/show_tosts.dart';
import '../../Widgets/chumsyerrordialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                top: 30,
              ),
              height: screenHeight / 1.7,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/login/bg@2x.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(48, screenHeight / 6, 48, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 147,
                    child: Image.asset(
                      "assets/login/logo.png",
                    ),
                  ),
                  SizedBox(
                    height: 51,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                    height: 51,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                    height: 51,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          if (_emailCont.text != "" &&
                              _passwordCont.text != "") {
                            Get.off(
                              () => const LandingPage(),
                            );
                          } else if (_emailCont.text == "") {
                            // showErrorToast("Please fill e-mail", context);
                            _dialogBuilder(
                                context, "Please enter an e-mail address");
                          } else if (_passwordCont.text == "") {
                            _dialogBuilder(context, "Password is required");
                            // showErrorToast("Please fill password", context);
                          } else {
                            showErrorToast(
                                "Please fill e-mail and password", context);
                          }
                        },
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Log in with:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: greyIconColor,
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
                            child: Image.asset("assets/login/google.png",
                                width: 40, fit: BoxFit.contain),
                          ),
                          CupertinoButton(
                            onPressed: () =>
                                openDialog(context, "Facebook.com"),
                            child: Image.asset("assets/login/facebook.png",
                                width: 40, fit: BoxFit.contain),
                          ),
                          CupertinoButton(
                            onPressed: () => openDialog(context, "Apple.com"),
                            child: Image.asset(
                                "assets/login/apple_black@2x.png",
                                width: 40,
                                fit: BoxFit.contain),
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
                  size: 30,
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
