import 'package:chumsy_app/Screens/Help_Center/mng_bottom_nav.dart';
import 'package:chumsy_app/Screens/Help_Center/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import 'faq.dart';
import 'report.dart';

class HelpCenterMain extends StatefulWidget {
  const HelpCenterMain({
    super.key,
  });

  @override
  State<HelpCenterMain> createState() => _HelpCenterMainState();
}

class _HelpCenterMainState extends State<HelpCenterMain> {
  Future<void> termsAndConditions(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacingBox,
                          buildRow(
                            "Support",
                            "",
                            () {
                              Get.to(() => const MngSupportPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            "Report a bug",
                            "",
                            () {
                              Get.to(() => const MngReportPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            "FAQ",
                            "",
                            () {
                              Get.to(() => const MngFaqPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            "Terms & Conditions",
                            "",
                            () async {
                              final Uri url = Uri.parse('https://chumsy.com');
                              await termsAndConditions(url);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const EventAppBar2(
            title: "Help Center",
          ),
        ],
      ),
    );
  }
}
