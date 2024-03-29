import 'package:chumsy_app/Screens/Registration_Screens/verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Functions/terms.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _sNameCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _phoneCode = TextEditingController();
  bool agree = false;

  @override
  void initState() {
    super.initState();
    _phoneCode.text = "+48";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 60,
                    ),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 1.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login/bg@2x.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 100, 48, 100),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 100),
                          width: 151,
                          child: SvgPicture.asset("assets/logo/logo.svg"),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 51,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            child: CupertinoTextField(
                              controller: _nameCont,
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
                              placeholder: AppLocalizations.of(context)!.name,
                              placeholderStyle: const TextStyle(
                                fontSize: 13,
                                color: blackColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 18,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                            ),
                            child: CupertinoTextField(
                              controller: _sNameCont,
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
                              placeholder:
                                  AppLocalizations.of(context)!.surname,
                              placeholderStyle: const TextStyle(
                                fontSize: 13,
                                color: blackColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 18,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth / 50,
                              ),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoTextField(
                                      controller: _phoneCode,
                                      keyboardType: TextInputType.phone,
                                      placeholder: '+48',
                                      placeholderStyle: const TextStyle(
                                        fontSize: 13,
                                        color: blackColor,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: whiteColor,
                                        border: Border(
                                          right: BorderSide(
                                            color: blackColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                        right: 0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: CupertinoTextField(
                                      controller: _phoneCont,
                                      keyboardType: TextInputType.phone,
                                      placeholder: AppLocalizations.of(context)!
                                          .phoneNumber,
                                      placeholderStyle: const TextStyle(
                                        fontSize: 13,
                                        color: blackColor,
                                      ),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      padding: EdgeInsets.only(
                                        left: screenWidth / 90,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
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
                                          text: AppLocalizations.of(context)!
                                              .agreeTo,
                                          children: [
                                            TextSpan(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .termsAndConditions,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  await termsAndConditions();
                                                },
                                            ),
                                            TextSpan(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .and),
                                            TextSpan(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .privacyPolicy,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  await privacy();
                                                },
                                            )
                                          ],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                height: 51,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    right: 0,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blackColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                    ),
                                    onPressed: () => Get.to(
                                        () => const VerificationScreen()),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .createAccount,
                                      style: TextStyle(
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
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: CupertinoButton(
                      onPressed: () => Get.back(),
                      child: const Icon(
                        CupertinoIcons.back,
                        color: blackColor,
                        size: 35,
                      ),
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
