import 'package:chumsy_app/styles/styles.dart';
import 'package:flutter/material.dart';

class ScrollPicker extends StatefulWidget {
  const ScrollPicker(
      {Key? key,
      this.initialValue = "",
      required this.list,
      this.padding = 10,
      this.itemExtent = 41,
      required this.controller,
      required this.onChanged,
      required this.selectedIndex,
      this.align = TextAlign.center})
      : super(key: key);
  final String initialValue;
  final List<String> list;
  final double itemExtent;
  final double padding;
  final FixedExtentScrollController controller;
  final onChanged;
  final int selectedIndex;
  final TextAlign align;

  @override
  State<ScrollPicker> createState() => _ScrollPickerState();
}

class _ScrollPickerState extends State<ScrollPicker> {
  final FixedExtentScrollPhysics scrollPhysics =
      const FixedExtentScrollPhysics();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(initListData);
  }

  initListData(_) async {
    widget.controller.jumpToItem(widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: widget.padding,
          bottom: widget.padding,
        ),
        child: ListWheelScrollView.useDelegate(
          itemExtent: widget.itemExtent,
          diameterRatio: 1,
          controller: widget.controller,
          physics: const FixedExtentScrollPhysics(),
          perspective: 0.00001,
          onSelectedItemChanged: widget.onChanged,
          childDelegate: ListWheelChildListDelegate(
              children: List<Widget>.generate(widget.list.length, (index) {
            return _buildListView(index: index);
          })),
        ));
  }

  Widget _buildListView({required int index}) {
    return Container(
      height: 31 / 2,
      alignment: Alignment.center,
      child: Text(
        "${widget.list[index]}",
        style: widget.selectedIndex == index
            ? Styles.headingStyleDark()
            : TextStyle(fontSize: 22, color: Colors.white),
        textAlign: widget.align,
      ),
    );
  }
}
