import 'package:flutter/cupertino.dart';

import '../../../Constants/sizes.dart';
import '../../../Constants/spacing.dart';
import '../../../Widgets/Create_Event/app_bar.dart';

class PaymentProfileScreenCurrency extends StatefulWidget {
  const PaymentProfileScreenCurrency({
    super.key,
  });

  @override
  State<PaymentProfileScreenCurrency> createState() =>
      _PaymentProfileScreenCurrencyState();
}

class _PaymentProfileScreenCurrencyState
    extends State<PaymentProfileScreenCurrency> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.5,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.5,
                            ),
                            child: Text(
                              "PLN",
                              style: regularStyleBold.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.5,
                            ),
                            child: Text(
                              "USD",
                              style: regularStyleBold.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.5,
                            ),
                            child: Text(
                              "EUR",
                              style: regularStyleBold.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
            title: "Currency",
          ),
        ],
      ),
    );
  }
}
