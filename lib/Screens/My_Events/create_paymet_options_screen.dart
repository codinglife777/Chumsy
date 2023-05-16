import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventPaymentOptions extends StatefulWidget {
  const CreateEventPaymentOptions({super.key});

  @override
  State<CreateEventPaymentOptions> createState() =>
      _CreateEventPaymentOptionsState();
}

class _CreateEventPaymentOptionsState extends State<CreateEventPaymentOptions> {
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
                  spacingBox,
                  spacingBox,
                  SizedBox(
                    height: screenHeight / 1.6,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PaymentTypes(
                            payType: "Cash",
                          ),
                          spacingBox,
                          PaymentTypes(
                            payType: "Online via application",
                          ),
                          // spacingBox,
                          // PaymentTypes(
                          //   payType: "Chumsy Coins",
                          // ),
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
                        children: const [
                          Text(
                            "SAVE",
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
          const EventAppBar2(
            title: "Payment Method",
          ),
        ],
      ),
    );
  }
}

class PaymentTypes extends StatelessWidget {
  const PaymentTypes({
    super.key,
    required this.payType,
  });
  final String payType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          Text(
            payType,
            style: regularStyleBold.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
