import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Widgets/custom_appbar.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({
    super.key,
  });

  @override
  State<MyPosts> createState() => _MyPostsState();
}

// to check ehich screen is activated
int active = 0;

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: whiteColor,
      child: Column(
        children: [
          Column(
            children: [
              CustomAppBar(
                title: 'Post',
                isBack: true,
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: CupertinoButton(
                    child: const SizedBox(
                      height: 22,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center, 
                height: screenHeight - 200,
                child: Text('No feeds', style: regularStyle,),
                )
             
            ],
          )
        ],
      ),
    );
  }

}
