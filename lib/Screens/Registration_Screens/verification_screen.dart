import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/Complete_Profile_Screens/profile_screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/sizes.dart';
import '../../Widgets/Extra Widgets/custom_otp_input_field.dart';
import '../../Widgets/chumsyerrordialog.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool code = false;
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  @override
  void initState() {
    super.initState();
    _fieldOne.text = "0";
    _fieldTwo.text = "7";
    _fieldThree.text = "9";
    _fieldFour.text = "6";
    _fieldFive.text = "4";
    code = true;
  }

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
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 48, 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'Verification code',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Expanded(
                          flex: 0,
                          child: Text(
                            'A verification code has been sent to your phone number',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtpInput(_fieldOne, false),
                            horizontalSpacingBoxSmall,
                            OtpInput(_fieldTwo, false),
                            horizontalSpacingBoxSmall,
                            OtpInput(_fieldThree, false),
                            horizontalSpacingBoxSmall,
                            OtpInput(_fieldFour, false),
                            horizontalSpacingBoxSmall,
                            OtpInput(_fieldFive, false),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          flex: 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Didn\'t receive a code?'),
                                  TextButton(
                                    onPressed: () {
                                      _dialogBuilder(context,
                                          "A new verification code has been sent to your e-mail");
                                    },
                                    child: const Text(
                                      'Resend',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        color: blackColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              spacingBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: code == true
                                            ? const EdgeInsets.symmetric(
                                                vertical: 0)
                                            : const EdgeInsets.symmetric(
                                                vertical: 25.5,
                                              ),
                                        backgroundColor: textColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                      onPressed: () => Get.to(
                                        () => const CreateProfile(),
                                      ),
                                      child: code
                                          ? Ink(
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    neonColor,
                                                    blueColor,
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              child: Container(
                                                height: 50,
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'CONFIRM',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const Text(
                                              'CONFIRM',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: blackColor,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        CupertinoIcons.back,
                        color: blackColor,
                        size: 35,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
