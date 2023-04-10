import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/common/common.dart';
import 'package:flutter/foundation.dart';
//import 'package:dispatch/services/worker_service.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:chumsy/utils/show_toast.dart';
//import 'package:dispatch/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                            key: const ValueKey('Log In button'),
                            onTap: () {
                              if (_txtPassword.text.isEmpty ||
                                  _txtUserName.text.isEmpty) {
                                showErrorToast(
                                    "Please fill username and password");
                              } else {
                                final progress = ProgressHUD.of(context);
                                progress?.show();
                                // AuthService.login(
                                //         username:
                                //             _txtUserName.text.trim(),
                                //         password:
                                //             _txtPassword.text.trim())
                                //     .then((response) async {
                                //   if (response != null) {
                                //     firebaseSetup();
                                //     WorkerService.getDetail()
                                //         .then((value) async {
                                //       progress?.dismiss();
                                //       Navigator.pushNamed(
                                //           context, 'home');
                                //     });
                                //   } else {
                                //     progress?.dismiss();
                                //     showErrorToast(
                                //         "Please fill correct username and password");
                                //   }
                                // }).catchError((err) {
                                //   progress?.dismiss();
                                //   showErrorToast(err.toString());
                                // });
                              }
                            },
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
                                    'LOG IN',
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
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.68),
                          alignment: Alignment.center,
                          child: InkWell(
                            key: const ValueKey('Forgot password'),
                            onTap: () {
                              if (kDebugMode) {
                                print("Forgot password clicked");
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Text(
                                'Forgot your password',
                                style: TextStyle(
                                    color: Color(0xff282828),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.77),
                          child: const Text(
                            'Log in with:',
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
                                      onTap: () {
                                        if (kDebugMode) {
                                          print("Google login clicked!");
                                        }
                                      },
                                      child: Image.asset(
                                          "assets/login/google.png",
                                          width: 40,
                                          height: 40)),
                                ),
                                const SizedBox(width: 43),
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                      onTap: () {
                                        if (kDebugMode) {
                                          print("Facebook login clicked!");
                                        }
                                      },
                                      child: Image.asset(
                                          "assets/login/facebook.png",
                                          width: 40,
                                          height: 40)),
                                ),
                                const SizedBox(width: 43),
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                      onTap: () {
                                        if (kDebugMode) {
                                          print("Apple login clicked!");
                                        }
                                      },
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
