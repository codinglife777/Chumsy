import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/decimal_text_input_formatter.dart';

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
      // _ammountController.text = "0,00";
    });
  }

  @override
Widget build(BuildContext context) {
  AppLocalizations l = AppLocalizations.of(context)!;
  return CupertinoPageScaffold(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                topSpacingBox,
                const SizedBox(height: 30),
                Container(
                  height: screenHeight / 2.3,
                  padding: const EdgeInsets.only(top: 160, left: 80, right: 80),
                  alignment: Alignment.center,
                  // width: 160,
                  // child: Center(
                    child: CupertinoTextField(
                      controller: _ammountController,
                      keyboardType: TextInputType.number,
                      placeholder: '0,00',
                      placeholderStyle: const TextStyle(color: Colors.black),
                      style: headingStyle24,
                      textAlign: TextAlign.center,
                      inputFormatters: [DecimalTextInputFormatter()],
                      decoration: const BoxDecoration(
                        color: whiteColor,
                      ),
                      // suffix: const Text(
                      //   "zł",
                      //   style: headingStyle24,
                      // ),
                    ),
                  // ),
                ),
              ],
            ),
          ),
        ),
        EventAppBar2(
          title: l.price,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(40),
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
        ),
      ],
    ),
  );
}

}
