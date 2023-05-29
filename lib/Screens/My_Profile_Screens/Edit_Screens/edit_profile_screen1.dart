import 'package:chumsy_app/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:slidable_button/slidable_button.dart';

import '../../../Functions/build_event_row.dart';
import '../../../Constants/sizes.dart';
import '../../../Styles/styles.dart';
import '../../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../../Widgets/Extra Widgets/custom_switch.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool needMaster = true;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          Container(
            color: whiteColor,
            width: screenWidth / 2,
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.back,
                    color: blackColor,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  l.editProfile,
                  style: headingStyle20,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text(""),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              // height: screenHeight,
              color: whiteColor,
              constraints: BoxConstraints(
                  minWidth: widget.constraints.maxWidth,
                  minHeight: widget.constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: transparentColor,
                          radius: 55,
                          child: Stack(
                            children: const [
                              CircleAvatar(
                                foregroundImage:
                                    AssetImage("assets/register/avatar@2x.png"),
                                radius: 55,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 16.5,
                                  child: CircleAvatar(
                                    radius: 15.5,
                                    backgroundColor: blackColor,
                                    child: Icon(
                                      CupertinoIcons.pencil,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildRow(l.name, "Emily", () {}),
                              buildRow(l.surname, "Benneth", () {}),
                              buildRow(
                                  l.email, "Alexpawluczuk@gmail.com", () {}),
                              buildRow(l.phoneNumber, "+48501666030", () {}),
                              buildRow(l.dateOfBirth, "21 June 1991", () {}),
                              buildRow(l.gender, "Female", () {}),
                              buildRow(l.location, "Poland, Warsaw", () {}),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    l.areYouAMaster,
                                    style: regularStyleBold.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  HorizontalSlidableButton(
                                    width: 60,
                                    height: 32,
                                    buttonWidth: 34,
                                    color: Colors.white,
                                    initialPosition: needMaster
                                        ? SlidableButtonPosition.end
                                        : SlidableButtonPosition.start,
                                    // buttonColor: Theme.of(context).primaryColor,
                                    dismissible: false,
                                    label: Container(
                                      margin: const EdgeInsets.all(4),
                                      constraints:
                                          const BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          gradient: needMaster
                                              ? Styles.primaryGradient()
                                              : const LinearGradient(colors: [
                                                  Colors.white,
                                                  Colors.white
                                                ])),
                                    ),
                                    onChanged: (position) {
                                      setState(() {
                                        if (position ==
                                            SlidableButtonPosition.end) {
                                          setState(() => needMaster = true);
                                        } else {
                                          setState(() => needMaster = false);
                                        }
                                      });
                                    },
                                  )
                                  // CustomSwitch(
                                  //   value: needMaster,
                                  //   isDarkBtn: false,
                                  //   changeColor: true,
                                  //   color2: neonColor,
                                  //   isLight: true,
                                  //   onChanged: (bool val) {
                                  //     setState(() {
                                  //       needMaster = val;
                                  //     });
                                  //   },
                                  // ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 30,
                              // ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: Colors.white,
            child: CustomGradientButtonWidget(
              buttonWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l.save,
                    style: regularStyleBold,
                  ),
                ],
              ),
              onTapFunction: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
