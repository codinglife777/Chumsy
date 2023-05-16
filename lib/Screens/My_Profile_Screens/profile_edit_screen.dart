import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Screens/My_Profile_Screens/Payments_Screens/profile_payment_screen1.dart';
import 'package:chumsy_app/Screens/Registration_Screens/login_screen.dart';
import 'package:chumsy_app/Screens/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../Help_Center/front_screen.dart';
import 'Edit_Screens/inside_edit_home_page.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: whiteColor,
        constraints: BoxConstraints(
            minWidth: widget.constraints.maxWidth,
            minHeight: widget.constraints.maxHeight),
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  spacingBox,
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                    ),
                    child: SizedBox(
                      height: screenHeight / 1.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                buildRow(
                                  "Edit Profile",
                                  "",
                                  () {
                                    Get.to(() => const InsideEditHomePage());
                                  },
                                ),
                                buildRow(
                                  "Change Password",
                                  "",
                                  () {
                                    // Get.to(() => const InsidePaymentHomePage());
                                  },
                                ),
                                buildRow(
                                  "Change Language",
                                  "",
                                  () {
                                    // Get.to(() => const InsidePaymentHomePage());
                                  },
                                ),
                                buildRow(
                                  "Invite Chumsys",
                                  "",
                                  () {
                                    Get.to(() => const ShareScreen());
                                  },
                                ),
                                // buildRow(
                                //   "Payments",
                                //   "",
                                //   () {
                                //     Get.to(() => const PaymentProfileScreen());
                                //   },
                                // ),
                                buildRow(
                                  "Help Center",
                                  "",
                                  () {
                                    Get.to(() => const HelpCenterMain());
                                  },
                                ),
                                buildRow(
                                  "Delete Account",
                                  "",
                                  () {
                                    // Get.to(() => const InsidePaymentHomePage());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 40,
                              ),
                              child: CustomGradientButtonWidget(
                                buttonWidget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "LOG OUT",
                                      style: regularStyleBold,
                                    ),
                                  ],
                                ),
                                onTapFunction: () =>
                                    Get.to(() => const LoginScreen()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 50,
                child: SimpleShadow(
                  offset: const Offset(0, 2),
                  opacity: 0.1,
                  child: Container(
                    color: whiteColor,
                    width: screenWidth / 2,
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
                        const Text(
                          "Profile",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
