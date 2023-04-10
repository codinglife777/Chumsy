// import 'dart:io';

import 'dart:io';

import 'package:chumsy/ui/register/profile_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../common/common.dart';

class ProfilePhoto extends StatefulWidget {
  final DateTime birthDay;
  final int gender;

  const ProfilePhoto({Key? key, required this.birthDay, required this.gender})
      : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? profileFile;

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void nextStep() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProfileComplete(
                birthDay: widget.birthDay,
                gender: widget.gender,
                profilePath: profileFile!)));
  }

  void uplaodPhotoClick() {
    if (kDebugMode) {
      print(widget.birthDay);
    }

    _showSimpleDialog();
  }

  Future pickImage(int type) async {
    try {
      final image = await ImagePicker().pickImage(
          source: type == 1 ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => profileFile = imageTemp);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future<void> _showSimpleDialog() async {
    const List<String> strListType = ['Photo Library', 'Take a Photo'];

    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.6),
                  // onPressed: () {
                  //   Navigator.of(context).pop();
                  // },
                  width: 359,
                  height: 112,
                  child: Wrap(children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: strListType.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              strListType[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0A84FF),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: index == 0
                                    ? const Radius.circular(24)
                                    : const Radius.circular(0),
                                topRight: index == 0
                                    ? const Radius.circular(24)
                                    : const Radius.circular(0),
                                bottomLeft: index == 1
                                    ? const Radius.circular(24)
                                    : const Radius.circular(0),
                                bottomRight: index == 1
                                    ? const Radius.circular(24)
                                    : const Radius.circular(0),
                              ),
                            ),
                            tileColor: const Color(0xCCEDEDED),
                            onTap: () {
                              pickImage(index);
                              Navigator.pop(context);
                            });
                      },
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, top: 10, bottom: 0),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 359,
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: const Text(
                            "Cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF007AFF),
                                fontWeight: FontWeight.bold),
                          ))),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color(0xff282828),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                backButton(context, isWhite: true),
                Container(
                    width: MediaQuery.of(context).size.width * 0.7,
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
                      width: MediaQuery.of(context).size.width,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      )),
                ),
                SizedBox(
                    height: 4,
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFB5FBEB)),
                    )),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13),
                width: MediaQuery.of(context).size.width * 0.7,
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'Upload your',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    const Text(
                      'profile picture',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08),
                        child: SizedBox(
                          width: 182,
                          height: 182,
                          child: InkWell(
                            radius: 182,
                            // display a snackbar on tap
                            onTap: () {},
                            // implement the image with Ink.image
                            child: profileFile == null
                                ? Ink.image(
                                    fit: BoxFit.cover,
                                    image: const AssetImage(
                                        "assets/register/upload_photo.png"),
                                  )
                                : Ink.image(
                                    fit: BoxFit.cover,
                                    image: const AssetImage(
                                        "assets/register/avatar.png") /*FileImage(profileFile!)*/,
                                  ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            (profileFile != null
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 140, bottom: 0),
                    child: Center(
                      child: InkWell(
                          onTap: uplaodPhotoClick,
                          child: Container(
                              width: 276,
                              height: 51,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(24)),
                              child: const Text(
                                "CHANGE A PHOTO",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  )
                : SizedBox()),
            Padding(
              padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: profileFile == null ? 150 : 20,
                  bottom: 0),
              child: Center(
                child: InkWell(
                    onTap: profileFile == null ? uplaodPhotoClick : nextStep,
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
                        child: Text(
                          profileFile == null ? "CHOOSE A PHOTO" : "NEXT",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
          ],
        ));
  }
}
