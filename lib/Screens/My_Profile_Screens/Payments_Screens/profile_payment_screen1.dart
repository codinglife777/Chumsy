import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Functions/build_event_row.dart';
import '../../../Constants/sizes.dart';
import '../../../Constants/spacing.dart';
import '../../../Widgets/Create_Event/app_bar.dart';
import 'profile_payment_screen_bank.dart';
import 'profile_payment_screen_currency.dart';
import 'profile_payment_screen_invoice.dart';

class PaymentProfileScreen extends StatefulWidget {
  const PaymentProfileScreen({
    super.key,
  });

  @override
  State<PaymentProfileScreen> createState() => _PaymentProfileScreenState();
}

class _PaymentProfileScreenState extends State<PaymentProfileScreen> {
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
                          buildRow("Currency", "USD", () {
                            Get.to(() => const PaymentProfileScreenCurrency());
                          }),
                          buildRow("Invoice", "", () {
                            Get.to(() => const PaymentProfileScreenInvoice());
                          }),
                          buildRow("Bank Account Number", "", () {
                            Get.to(() => const PaymentProfileScreenBank());
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const EventAppBar2(
            title: "Payments",
          ),
        ],
      ),
    );
  }
}
