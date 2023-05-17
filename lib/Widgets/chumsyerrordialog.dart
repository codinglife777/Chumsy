import 'package:chumsy_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChumsyErrorDialog extends StatefulWidget {
  const ChumsyErrorDialog({Key? key, required this.errorMessage})
      : super(key: key);
  final String errorMessage;

  @override
  State<ChumsyErrorDialog> createState() => _ChumsyErrorDialogState();
}

class _ChumsyErrorDialogState extends State<ChumsyErrorDialog> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      insetPadding: const EdgeInsets.only(left: 1, right: 1),
      backgroundColor: Colors.black38,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(300),
                        topRight: Radius.circular(300))),
              ),
              Container(
                width: screenWidth - 18 * 2,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(42),
                  ),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 72,
                  ),
                  Container(
                    color: Colors.white,
                    width: screenWidth - 18 * 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.errorMessage,
                        textAlign: TextAlign.center,
                        style: Styles.regularText().copyWith(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth - 18 * 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: Styles.gredientButtonContainer(),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.ok_c,
                          style: Styles.greyButtonText()
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/logoblack.svg',
                    width: 75,
                    height: 75,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
