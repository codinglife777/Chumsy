import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SwitchState { state1, state2, state3 }

typedef ThreeStateCallback = Function(SwitchState state);

class ThreeStateSwitch extends StatefulWidget {
  const ThreeStateSwitch({super.key, required this.cbState});

  final ThreeStateCallback cbState;
  @override
  State<ThreeStateSwitch> createState() => _ThreeStateSwitchState();
}

class _ThreeStateSwitchState extends State<ThreeStateSwitch> {
  double _containerPosition = 0.0;
  SwitchState _currentSwitchState = SwitchState.state1;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    double indicatorWidth = (MediaQuery.of(context).size.width - 40) / 3 - 4;
    double containerWidth = MediaQuery.of(context).size.width - 40 - 4;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _containerPosition += details.delta.dx;
          if (_containerPosition < 0.0) {
            _containerPosition = 0.0;
          } else if (_containerPosition > containerWidth / 3 * 2) {
            _containerPosition = containerWidth / 3 * 2;
          }
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          if (_containerPosition < indicatorWidth / 3 * 2) {
            _containerPosition = 0.0;
            _currentSwitchState = SwitchState.state1;
          } else if (_containerPosition <
              indicatorWidth + indicatorWidth / 3 * 2) {
            _containerPosition = containerWidth / 3;
            _currentSwitchState = SwitchState.state2;
          } else {
            _containerPosition = containerWidth / 3 * 2;
            _currentSwitchState = SwitchState.state3;
          }
        });

        widget.cbState(_currentSwitchState);
      },
      child: Container(
        height: 51.0,
        // width: screenWidth / 2,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xff282828),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: _containerPosition,
              child: Container(
                width: (MediaQuery.of(context).size!.width - 40) / 3,
                height: 47,
                decoration: BoxDecoration(
                  gradient: Styles.primaryGradient(),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(l.sport,
                        style: subHeadingStyle.copyWith(
                          color: _currentSwitchState == SwitchState.state1
                              ? blackColor
                              : whiteColor,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(l.lifeStyle,
                        style: subHeadingStyle.copyWith(
                          color: _currentSwitchState == SwitchState.state2
                              ? blackColor
                              : whiteColor,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(l.nameIt,
                        style: subHeadingStyle.copyWith(
                          color: _currentSwitchState == SwitchState.state3
                              ? blackColor
                              : whiteColor,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
