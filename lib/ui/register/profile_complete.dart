// import 'dart:io';

import 'dart:io';

import 'package:chumsy/ui/common/custom_switch.dart';
import 'package:chumsy/ui/register/profile_quailifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../common/common.dart';

class ProfileComplete extends StatefulWidget {
  final DateTime birthDay;
  final int gender;
  final File profilePath;

  const ProfileComplete(
      {Key? key,
      required this.birthDay,
      required this.gender,
      required this.profilePath})
      : super(key: key);

  @override
  State<ProfileComplete> createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> {
  bool masterState = false;

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void nextStep() {}

  void qualification() {
    if (kDebugMode) {
      print(widget.birthDay);
    }

    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProfileQualification(
                birthDay: widget.birthDay,
                gender: widget.gender,
                profilePath: widget.profilePath)));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xff282828),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                backButton(context, isWhite: true),
                Container(
                    width: screenSize.width * 0.7,
                    alignment: Alignment.center,
                    child: const Text(
                      'Complete your profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    )),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: SizedBox(
                      height: 2,
                      width: screenSize.width,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      )),
                ),
                SizedBox(
                    height: 4,
                    width: screenSize.width,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFB5FBEB)),
                    )),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.15),
                width: screenSize.width * 0.7,
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                // top: screenSize.height * 0.08,
                                bottom: 20),
                            child: SizedBox(
                              width: 182,
                              height: 182,
                              child: InkWell(
                                radius: 182,
                                // display a snackbar on tap
                                onTap: () {},
                                // implement the image with Ink.image
                                child: widget.profilePath == null
                                    ? Ink.image(
                                        fit: BoxFit.cover,
                                        image: const AssetImage(
                                            "assets/register/upload_photo.png"),
                                      )
                                    : Ink.image(
                                        fit: BoxFit.cover,
                                        image: const AssetImage(
                                            "assets/register/avatar.png") /*FileImage(widget.profilePath)*/,
                                      ),
                              ),
                            )),
                        (masterState
                            ? Container(
                                width: 117,
                                height: 31,
                                margin: const EdgeInsets.only(
                                    top: 155, left: (182 - 117) / 2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFD8FECB),
                                          Color(0xFFA5FAFA)
                                        ]),
                                    color: const Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Text(
                                  "Master",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff282828),
                                      fontWeight: FontWeight.bold),
                                ))
                            : const SizedBox())
                      ],
                    ),
                    const Text(
                      'Emily Benneth, 26',
                      style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Poland, Warsaw',
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xffffffff)),
                    ),
                    SizedBox(height: screenSize.height * 0.2),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomSwitch(
                        value: masterState,
                        isLight: false,
                        onChanged: (bool val) {
                          setState(() {
                            masterState = val;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Are you a Master?*',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
              child: Center(
                child: InkWell(
                    onTap: masterState ? qualification : nextStep,
                    child: Container(
                        width: 276,
                        height: 51,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFD8FECB), Color(0xFFA5FAFA)]),
                            color: const Color(0xffEFEFEF),
                            borderRadius: BorderRadius.circular(24)),
                        child: const Text(
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
            const Text(
              "*Would you like to be able to host events as a",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            const Text(
              "trainer / lecture?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
