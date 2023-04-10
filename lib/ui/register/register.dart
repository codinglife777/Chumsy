import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/common/common.dart';
import 'package:chumsy/ui/login/verification_code.dart';
import 'package:chumsy/ui/register/profile_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
//import 'package:dispatch/services/worker_service.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:chumsy/utils/show_toast.dart';
//import 'package:dispatch/services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _txtUserName = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void firebaseSetup() {
    // FirebaseMessaging.instance.getToken().then((fcmToken) {
    //   if (fcmToken != null) {
    //     WorkerService.updateDeviceToken(fcmToken);
    //   }
    // });
  }

  void createAccount() {
    //Navigator.pushNamed(context, '/verification_code');
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const ProfileName()));
    // if (_txtPassword.text.isEmpty || _txtUserName.text.isEmpty) {
    //   showErrorToast("Please fill username and password");
    // } else {
    //   final progress = ProgressHUD.of(context);
    //   progress?.show();
    //   // AuthService.login(
    //   //         username:
    //   //             _txtUserName.text.trim(),
    //   //         password:
    //   //             _txtPassword.text.trim())
    //   //     .then((response) async {
    //   //   if (response != null) {
    //   //     firebaseSetup();
    //   //     WorkerService.getDetail()
    //   //         .then((value) async {
    //   //       progress?.dismiss();
    //   //       Navigator.pushNamed(
    //   //           context, 'home');
    //   //     });
    //   //   } else {
    //   //     progress?.dismiss();
    //   //     showErrorToast(
    //   //         "Please fill correct username and password");
    //   //   }
    //   // }).catchError((err) {
    //   //   progress?.dismiss();
    //   //   showErrorToast(err.toString());
    //   // });
    // }
  }

  void loginWithGoogle() {
    if (kDebugMode) {
      print("Allowd to login with google");
    }
  }

  void loginWithFacebook() {
    if (kDebugMode) {
      print("Allowd to login with facebook");
    }
  }

  void loginWithApple() {
    if (kDebugMode) {
      print("Allowd to login with apple");
    }
  }

  void googleRegister() {
    showAlertDialog(
        context,
        'Chumsy wants to use "Google.com to log in"',
        'Do you allow to use your information for log in purpose?',
        'Allow',
        'Cancel',
        loginWithGoogle,
        () {});
  }

  void facebookRegister() {
    showAlertDialog(
        context,
        'Chumsy wants to use "Facebook.com to log in"',
        'Do you allow to use your information for log in purpose?',
        'Allow',
        'Cancel',
        loginWithFacebook,
        () {});
  }

  void appleRegister() {
    showAlertDialog(
        context,
        'Chumsy wants to use "Apple.com to log in"',
        'Do you allow to use your information for log in purpose?',
        'Allow',
        'Cancel',
        loginWithApple,
        () {});
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode =
        AdaptiveTheme.of(context).brightness == Brightness.light;
    return ProgressHUD(
        indicatorColor: AdaptiveTheme.of(context).theme.colorScheme.background,
        backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.onSurface,
        child: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Stack(
                      // alignment: Alignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 1.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/login/bg@2x.png"),
                                  fit: BoxFit.cover)),
                          padding: const EdgeInsets.only(
                              right: 0, top: 0, bottom: 130),
                          // alignment: Alignment.center,
                          child: SizedBox(
                              height: 120,
                              child: Image.asset("assets/login/logo.png")),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.35,
                          ),
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Stack(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: const EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      width: 276,
                                      height: 51,
                                      child: TextField(
                                        controller: _txtUserName,
                                        cursorColor: AdaptiveTheme.of(context)
                                            .theme
                                            .colorScheme
                                            .primary,
                                        style: TextStyle(
                                            color: AdaptiveTheme.of(context)
                                                .theme
                                                .colorScheme
                                                .onBackground),
                                        decoration: InputDecoration(
                                            hintText: 'E-mail address',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: AdaptiveTheme.of(context)
                                                .theme
                                                .inputDecorationTheme
                                                .hintStyle,
                                            enabledBorder:
                                                AdaptiveTheme.of(context)
                                                    .theme
                                                    .inputDecorationTheme
                                                    .border,
                                            border: AdaptiveTheme.of(context)
                                                .theme
                                                .inputDecorationTheme
                                                .border,
                                            focusedBorder:
                                                AdaptiveTheme.of(context)
                                                    .theme
                                                    .inputDecorationTheme
                                                    .focusedBorder),
                                      )),
                                ),
                                // ignore: prefer_const_constructors

                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      width: 276,
                                      height: 51,
                                      child: TextField(
                                        controller: _txtPassword,
                                        cursorColor: AdaptiveTheme.of(context)
                                            .theme
                                            .colorScheme
                                            .primary,
                                        style: TextStyle(
                                            color: AdaptiveTheme.of(context)
                                                .theme
                                                .colorScheme
                                                .onBackground),
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: AdaptiveTheme.of(context)
                                                .theme
                                                .inputDecorationTheme
                                                .hintStyle,
                                            enabledBorder:
                                                AdaptiveTheme.of(context)
                                                    .theme
                                                    .inputDecorationTheme
                                                    .border,
                                            border: AdaptiveTheme.of(context)
                                                .theme
                                                .inputDecorationTheme
                                                .border,
                                            focusedBorder:
                                                AdaptiveTheme.of(context)
                                                    .theme
                                                    .inputDecorationTheme
                                                    .focusedBorder),
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ]),
                        ),
                        backButton(context),
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.6,
                            bottom: 100,
                          ),
                          alignment: Alignment.center,
                          child: InkWell(
                            key: const ValueKey('Create account button'),
                            onTap: createAccount,
                            child: Container(
                              width: 276,
                              height: 51,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: const Color(0xff282828),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'CREATE ACCOUNT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                  // ,
                                  // Icon(Icons.arrow_forward_rounded,
                                  //     color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.77),
                          child: const Text(
                            'Sign in with:',
                            style: TextStyle(
                              color: Color(0xff282828),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.83),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                      onTap: googleRegister,
                                      child: Image.asset(
                                          "assets/login/google.png",
                                          width: 40,
                                          height: 40)),
                                ),
                                const SizedBox(width: 43),
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                      onTap: facebookRegister,
                                      child: Image.asset(
                                          "assets/login/facebook.png",
                                          width: 40,
                                          height: 40)),
                                ),
                                const SizedBox(width: 43),
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                      onTap: appleRegister,
                                      child: Image.asset(
                                          "assets/login/apple_black@2x.png",
                                          width: 40,
                                          height: 40)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                )));
  }
}
