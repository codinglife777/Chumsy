import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class ScatteredGrid extends StatefulWidget {
  const ScatteredGrid({
    Key? key,
    required this.topicList,
    required this.onSelect,
    this.elementBackgroundColor,
    this.elementBorderColor,
    this.elementTextColor,
  }) : super(key: key);
  final List<Map<String, String>> topicList;
  final onSelect;
  final Color? elementBackgroundColor;
  final Color? elementBorderColor;
  final Color? elementTextColor;

  @override
  State<ScatteredGrid> createState() => _ScatteredGridState();
}

class _ScatteredGridState extends State<ScatteredGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> calculateWidgets() {
    List<Widget> tempState = [];
    for (int i = 0; i < widget.topicList.length; i++) {
      tempState.add(GestureDetector(
        onTap: () {
          widget.onSelect(widget.topicList[i]["topic"]);
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.only(left: 9, right: 9, top: 6),
          decoration: Styles.greyButton(
              borderColor: widget.elementBorderColor ?? Colors.white,
              backgroundColor:
                  widget.elementBackgroundColor ?? const Color(0xff282828)),
          // child: TextButton(
          //   onPressed: () {
          //     widget.onSelect(widget.topicList[i]["topic"]);
          //   },
          child: Text(
            widget.topicList[i]["topic"]!,
            style: Styles.greyButtonText(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: widget.elementTextColor ?? Colors.white),
          ),
        ),
        // ),
      ));
    }
    return tempState;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Wrap(
        spacing: 13,
        runSpacing: 12,
        children: calculateWidgets(),
      ),
    );
  }
}
