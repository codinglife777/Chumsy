import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({
    super.key,
  });

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          topSpacingBox,
                          Image.asset(
                            "assets/extras/Group 7515@3x.png",
                            width: screenWidth / 1.2,
                          ),
                          const SizedBox(
                            height: 72.4,
                          ),
                          Text(
                            "Invite your friends to enjoy Chumsy app together!",
                            style: headingStyle24.copyWith(
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      color: transparentColor,
                      onPressed: () => Get.back(),
                      child: Container(
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                          color: blackColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SHARE THE LINK",
                              style: smallStyleBold.copyWith(
                                color: whiteColor,
                              ),
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
          const EventAppBar2(
            title: "Support",
          ),
        ],
      ),
    );
  }
}
