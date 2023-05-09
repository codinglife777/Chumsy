import 'package:chumsy_app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLight;
  final bool isDarkBtn;
  final bool changeColor;
  final Color color2;

  const CustomSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.isLight,
      required this.isDarkBtn,
      required this.changeColor,
      required this.color2})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: widget.value == false
              ? Container(
                  width: 55.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                        color: widget.isLight
                            ? const Color(0xff282828)
                            : Colors.white,
                        width: 2),
                    color: widget.isLight
                        ? const Color(0xfff2f2f2)
                        : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                    child: Container(
                      alignment: widget.value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: widget.isLight
                                    ? const Color(0xff282828)
                                    : Colors.white,
                                width: 2),
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 55.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      // color: widget.changeColor ? widget.color2 : Colors.white,
                      border: Border.all(
                          color: widget.isLight
                              ? const Color(0xff282828)
                              : Colors.transparent,
                          width: 2),
                      borderRadius: BorderRadius.circular(24.0),
                      gradient: widget.changeColor
                          ? Styles.primaryGradient()
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white])),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                    child: Container(
                      alignment: widget.value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.isLight
                                ? widget.isDarkBtn
                                    ? const Color(0xff282828)
                                    : Colors.white
                                : const Color(0xff282828),
                            border: Border.all(
                                color: widget.isLight
                                    ? const Color(0xff282828)
                                    : Colors.transparent,
                                width: 2)),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
