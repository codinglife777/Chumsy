import 'package:flutter/material.dart';

Widget backButton(BuildContext context, {bool? isWhite}) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: SizedBox(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              color: isWhite != null && isWhite
                  ? const Color(0xffffffff)
                  : const Color(0xff282828),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              //   ),
            ),
          ],
        ),
      ),
    ),
  );
}
