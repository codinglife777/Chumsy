import 'package:flutter/cupertino.dart';

import '../../../Constants/sizes.dart';
import '../../../Constants/spacing.dart';
import '../../../Widgets/Create_Event/app_bar.dart';

class PaymentProfileScreenInvoice extends StatefulWidget {
  const PaymentProfileScreenInvoice({
    super.key,
  });

  @override
  State<PaymentProfileScreenInvoice> createState() =>
      _PaymentProfileScreenInvoiceState();
}

class _PaymentProfileScreenInvoiceState
    extends State<PaymentProfileScreenInvoice> {
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
                        children: const [
                          SizedBox(
                            height: 38,
                          ),
                          CustomLine(
                            title: "Full Legal Name",
                            data: "Emily Benneth",
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          CustomLine(
                            title: "Address",
                            data: "Something Street 48",
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          CustomLine(
                            title: "Post Code",
                            data: "05-600",
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          CustomLine(
                            title: "City",
                            data: "Warsaw",
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          CustomLine(
                            title: "Country",
                            data: "Poland",
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          CustomLine(
                            title: "NIP/ VAT",
                            data: "PL2838247478",
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
            title: "Invoice Details",
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
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: regularStyleBold.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data,
            style: regularStyle,
          ),
        ],
      ),
    );
  }
}
