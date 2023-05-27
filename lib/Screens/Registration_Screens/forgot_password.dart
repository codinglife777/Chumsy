import 'package:chumsy_app/Functions/show_alert.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Constants/spacing.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widgets/chumsyerrordialog.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailCont = TextEditingController();

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
              padding: EdgeInsets.fromLTRB(48, screenHeight / 5.5, 48, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 151,
                    child: SvgPicture.asset("assets/logo/logo.svg"),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      AppLocalizations.of(context)!.resetPassword,
                      style: regularStyle.copyWith(
                          color: blackColor, fontWeight: FontWeight.w500),
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
                          vertical: screenWidth / 50,
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          if (_emailCont.text != "") {
                            _dialogBuilder(
                                context,
                                AppLocalizations.of(context)!
                                    .resetPasswordLinkSent);
                            // Get.off(
                            //   () => const LandingPage(),
                            // );
                          } else if (_emailCont.text == "") {
                            // showErrorToast("Please fill e-mail", context);
                            _dialogBuilder(context,
                                AppLocalizations.of(context)!.emailRequired);
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.submit,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ),
                    ),
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
