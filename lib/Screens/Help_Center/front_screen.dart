import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Screens/Help_Center/mng_bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Functions/terms.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class HelpCenterMain extends StatefulWidget {
  const HelpCenterMain({
    super.key,
  });

  @override
  State<HelpCenterMain> createState() => _HelpCenterMainState();
}

class _HelpCenterMainState extends State<HelpCenterMain> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      backgroundColor: whiteColor,
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
                    height: screenHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacingBox,
                          buildRow(
                            l.support,
                            "",
                            () {
                              Get.to(() => const MngSupportPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            l.reportAbug,
                            "",
                            () {
                              Get.to(() => const MngReportPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            l.faq,
                            "",
                            () {
                              Get.to(() => const MngFaqPage());
                            },
                          ),
                          spacingBox,
                          buildRow(
                            l.terms_Conditions,
                            "",
                            () async {
                              await termsAndConditions();
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
          EventAppBar2(
            title: l.helpCenter,
          ),
        ],
      ),
    );
  }
}
