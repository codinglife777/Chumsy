import 'package:flutter/cupertino.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

class ChipSets extends StatefulWidget {
  const ChipSets(
      {super.key,
      required this.listOfChips,
      required this.islarge,
      this.readonly});
  final List<String> listOfChips;
  final bool islarge;
  final bool? readonly;

  @override
  State<ChipSets> createState() => _ChipSetsState();
}

List<String> selected = [];

class _ChipSetsState extends State<ChipSets> {
  @override
  Widget build(BuildContext context) {
    bool readonly = widget.readonly ?? false;
    return SizedBox(
      height: 50,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: widget.listOfChips
            .map(
              (e) => CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  margin: EdgeInsets.only(
                    right: screenWidth / 100,
                  ),
                  height: 31,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    border: Border.all(
                      color: blackColor,
                    ),
                    color: !readonly && selected.contains(e)
                        ? blackColor
                        : whiteColor,
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: regularStyleBold.copyWith(
                        fontSize: widget.islarge ? 16 : 10,
                        color: !readonly && selected.contains(e)
                            ? whiteColor
                            : blackColor,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (!readonly) {
                    setState(() {
                      if (selected.contains(e)) {
                        selected.remove(e);
                      } else {
                        selected.add(e);
                      }
                    });
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class ChipSets2 extends StatefulWidget {
  const ChipSets2({
    super.key,
    required this.listOfChips,
  });
  final List<String> listOfChips;

  @override
  State<ChipSets2> createState() => _ChipSets2State();
}

List<String> selectedChips = [];

class _ChipSets2State extends State<ChipSets2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: widget.listOfChips
            .map(
              (e) => CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    right: screenWidth / 100,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    border: Border.all(
                      color: whiteColor,
                      width: 2,
                    ),
                    color: selected.contains(e) ? whiteColor : blackColor,
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: regularStyleBold.copyWith(
                        color: selected.contains(e) ? blackColor : whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (selected.contains(e)) {
                      selected.remove(e);
                    } else {
                      selected.add(e);
                    }
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
