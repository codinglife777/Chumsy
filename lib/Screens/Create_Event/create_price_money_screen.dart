import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventPriceMoney extends StatefulWidget {
  const CreateEventPriceMoney({super.key});

  @override
  State<CreateEventPriceMoney> createState() => _CreateEventPriceMoneyState();
}

final TextEditingController _ammountController = TextEditingController();

class _CreateEventPriceMoneyState extends State<CreateEventPriceMoney> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _ammountController.text = "0,00";
    });
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
                    height: screenHeight / 1.6,
                    width: 200,
                    child: Center(
                      child: CupertinoTextField(
                        controller: _ammountController,
                        keyboardType: TextInputType.number,
                        style: headingStyle24,
                        textAlign: TextAlign.right,
                        decoration: const BoxDecoration(
                          color: whiteColor,
                        ),
                        suffix: const Text(
                          "zł",
                          style: headingStyle24,
                        ),
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
            title: "Price",
          ),
        ],
      ),
    );
  }
}
