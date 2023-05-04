import 'package:chumsy_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      insetPadding: const EdgeInsets.only(left: 20, right: 20),
      backgroundColor: Colors.transparent,
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
                    Radius.circular(18),
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
                        style: Styles.regularText(),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth - 18 * 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      decoration: Styles.gredientButtonContainer(),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "OK",
                          style: Styles.greyButtonText(),
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
