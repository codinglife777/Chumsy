import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/show_alert.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Functions/show_tosts.dart';
import '../../Functions/terms.dart';
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
  bool agree = false;
  bool _obscureText = true;

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
              height: screenHeight / 1.7,
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
              padding: EdgeInsets.fromLTRB(40, screenHeight / 5.2, 40, 0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 151,
                    child: Image.asset(
                      "assets/logo/chumsy_logo@1x.png",
                    ),
                  ),
                  const SizedBox(height: 45),
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
                        placeholder: AppLocalizations.of(context)!.emailAddress,
                        placeholderStyle: const TextStyle(
                          fontSize: 13,
                          color: blackColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          // vertical: screenWidth / 50,
                          horizontal: screenWidth / 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            )),
                        obscureText: _obscureText,
                        placeholder: AppLocalizations.of(context)!.password,
                        placeholderStyle: const TextStyle(
                          fontSize: 13,
                          color: blackColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          // vertical: screenWidth / 50,
                          horizontal: screenWidth / 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            agree = !agree;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              agree
                                  ? CupertinoIcons.checkmark_square_fill
                                  : CupertinoIcons.square,
                            ),
                            horizontalSpacingBox,
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)!.agreeTo,
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .termsAndConditions,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          await termsAndConditions();
                                        },
                                    ),
                                    TextSpan(
                                        text:
                                            AppLocalizations.of(context)!.and),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .privacyPolicy,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          await privacy();
                                        },
                                    )
                                  ],
                                  style: const TextStyle(
                                    color: blackColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 51,
                    width: screenWidth * 0.8,
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
                              () => const MobileScreen(),
                            );
                          } else if (_emailCont.text == "") {
                            _dialogBuilder(context,
                                AppLocalizations.of(context)!.emailRequired);
                            //showErrorToast("Please fill e-mail", context);
                          } else if (_passwordCont.text == "") {
                            _dialogBuilder(context,
                                AppLocalizations.of(context)!.passwordRequired);
                            //showErrorToast("Please fill password", context);
                          }
                          //  else {
                          //   showErrorToast(
                          //       "Please fill e-mail and password", context);
                          // }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.signUpWith,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
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
                            child: Image.asset("assets/login/google@2x.png",
                                width: 40, fit: BoxFit.contain),
                          ),
                          CupertinoButton(
                            onPressed: () =>
                                openDialog(context, "Facebook.com"),
                            child: Image.asset("assets/login/facebook@2x.png",
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
