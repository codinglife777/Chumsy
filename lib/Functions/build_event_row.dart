import 'package:flutter/cupertino.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

GestureDetector buildRow(String leftText, String rightText, VoidCallback cb,
    [String? secondaryText]) {
  secondaryText ??= "";
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: cb,
    child: Container(
      width: screenWidth,
       child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftText,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              secondaryText.isEmpty
                  ? const SizedBox()
                  : Text(
                      secondaryText,
                      style: smallStyle,
                    ),
            ],
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: cb,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                rightText != ""
                    ? SizedBox(
                        // width: 185,
                        child: Text(
                          rightText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: blackColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )
                    : const SizedBox(),
                const Icon(
                  CupertinoIcons.right_chevron,
                ),
              ],
            ),
          ),
        ],
      ),
    )),
  );
}

  class BuildEditRow extends StatefulWidget {
    final String title;
    final String defaultValue;
    final ValueChanged<String> onChanged;

    const BuildEditRow(
        {Key? key,
        required this.title,
        required this.defaultValue,
        required this.onChanged})
        : super(key: key);

    @override
    // ignore: library_private_types_in_public_api
    _BuildEditRowState createState() => _BuildEditRowState();
  }

  class _BuildEditRowState extends State<BuildEditRow>
      with SingleTickerProviderStateMixin {

    final TextEditingController txtCtrl = TextEditingController();

    @override
    void initState() {
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      txtCtrl.text = widget.defaultValue;
      return Container(
      width: screenWidth,
       child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: regularStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.6, 
                child: CupertinoTextField(
                controller: txtCtrl,
                textAlign: TextAlign.end,
                style: const TextStyle(
                            fontSize: 16,
                            color: blackColor,
                          ),
                onChanged: (value) {
                  widget.onChanged(value);
                },
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 5,
                //   vertical: 7,
                // ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      100,
                    ),
                  ),
                ),
              ),),
                const Icon(
                  CupertinoIcons.right_chevron,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
    }
  }
