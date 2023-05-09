import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import '../../../Functions/build_event_row.dart';
import '../../../Constants/sizes.dart';
import '../../../Constants/spacing.dart';
import '../../../Widgets/Create_Event/app_bar.dart';

class PaymentProfileScreenBank extends StatefulWidget {
  const PaymentProfileScreenBank({
    super.key,
  });

  @override
  State<PaymentProfileScreenBank> createState() =>
      _PaymentProfileScreenBankState();
}

class _PaymentProfileScreenBankState extends State<PaymentProfileScreenBank> {
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
                          const SizedBox(
                            height: 38,
                          ),
                          const CustomLine(
                            title: "Account holder",
                            data: "Emily Benneth",
                          ),
                          const SizedBox(
                            height: 41,
                          ),
                          const CustomLine(
                            title: "Account number",
                            data: "9373 0000 7575 5775",
                          ),
                          const SizedBox(
                            height: 41,
                          ),
                          const CustomLine(
                            title: "Bank name",
                            data: "Santander",
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          buildRow(
                            "Currency",
                            "PLN",
                            () {},
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          const CustomLine(
                            title: "SWAT / BIC",
                            data: "ABBYGB2LXXX",
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
            title: "Bank account number",
          ),
        ],
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
    required this.title,
    required this.data,
  });
  final String title, data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title,
          style: regularStyleBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          softWrap: true,
        ),
        AutoSizeText(
          data,
          style: regularStyle,
          maxLines: 1,
          softWrap: true,
        ),
      ],
    );
  }
}
