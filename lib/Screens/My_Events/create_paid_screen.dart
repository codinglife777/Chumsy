import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Functions/build_event_row.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import 'create_paymet_options_screen.dart';
import 'create_price_money_screen.dart';

class CreateEventPaidOptions extends StatefulWidget {
  const CreateEventPaidOptions({super.key});

  @override
  State<CreateEventPaidOptions> createState() => _CreateEventPaidOptionsState();
}

class _CreateEventPaidOptionsState extends State<CreateEventPaidOptions> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
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
                  spacingBox,
                  spacingBox,
                  SizedBox(
                    height: screenHeight / 1.6,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(l.price, "", () {
                            Get.to(() => const CreateEventPriceMoney());
                          }),
                          spacingBox,
                          buildRow(l.paymentMethod, "", () {
                            Get.to(() => const CreateEventPaymentOptions());
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 40,
                    ),
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
            ),
          ),
          EventAppBar2(
            title: l.paid,
          ),
        ],
      ),
    );
  }
}
