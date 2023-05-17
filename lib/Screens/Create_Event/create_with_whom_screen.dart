import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';

class CreateEventWIthWhom extends StatefulWidget {
  const CreateEventWIthWhom({super.key, required this.btnText});
  final String btnText;

  @override
  State<CreateEventWIthWhom> createState() => _CreateEventWIthWhomState();
}

class _CreateEventWIthWhomState extends State<CreateEventWIthWhom> {
  void clear() {}

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
                          WithWhomTypes(
                            payType: l.friends,
                          ),
                          spacingBox,
                          WithWhomTypes(
                            payType: l.public,
                          ),
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
                            widget.btnText,
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
          EventAppBar(
            title: l.withWhom,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}

class WithWhomTypes extends StatelessWidget {
  const WithWhomTypes({
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
