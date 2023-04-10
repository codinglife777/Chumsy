import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/register/profile_age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:chumsy/ui/login/components/verification_input_code.dart';

import '../common/common.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  String _onCompleted = '';

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void resendVerificationCode() {}
  void confirm() {
    // Navigator.pushNamed(context, '/profile_age');
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const ProfileAge()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ProgressHUD(
    //     indicatorColor: AdaptiveTheme.of(context).theme.colorScheme.background,
    //     backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.onSurface,
    //     child: Builder(
    //         builder: (context) =>
    return Scaffold(
        body: Column(
      children: <Widget>[
        backButton(context),
        const Padding(
          // padding: EdgeInsets.all(40.0),
          padding: EdgeInsets.only(left: 94, top: 20, right: 94, bottom: 10),
          child: Center(
            child: Text(
              'Verification code',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff282828)),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 94, right: 94, top: 0, bottom: 20),
          child: Center(
            child: Text(
              'A verification code has been sent to your phone number.',
              style: TextStyle(fontSize: 16.0, color: Color(0xff282828)),
            ),
          ),
        ),
        VerificationCodeInput(
          keyboardType: TextInputType.number,
          length: 5,
          forceUpperCase: false,
          autofocus: false,
          onCompleted: (String value) {
            if (kDebugMode) {
              print(value);
            }
            setState(() {
              _onCompleted = value;
            });
          },
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 94, right: 5, top: 60, bottom: 10),
              child: Center(
                child: Text(
                  "Didn't receive a code?",
                  style: TextStyle(fontSize: 16.0, color: Color(0xff282828)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 0, right: 10, top: 60, bottom: 10),
              child: Center(
                child: InkWell(
                    onTap: resendVerificationCode,
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff282828),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 25),
          child: Center(
            child: InkWell(
                onTap: confirm,
                child: Container(
                    width: 276,
                    height: 57,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              _onCompleted == ""
                                  ? const Color(0xffEFEFEF)
                                  : const Color(0xFFD8FECB),
                              _onCompleted == ""
                                  ? const Color(0xffEFEFEF)
                                  : const Color(0xFFA5FAFA)
                            ]),
                        color: const Color(0xffEFEFEF),
                        borderRadius: BorderRadius.circular(24)),
                    child: const Text(
                      "CONFIRM",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff282828),
                          fontWeight: FontWeight.bold),
                    ))),
          ),
        ),
      ],
    ));
  }
}
