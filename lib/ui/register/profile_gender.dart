import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/register/profile_photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../common/common.dart';

class ProfileGender extends StatefulWidget {
  final DateTime birthDay;

  const ProfileGender({Key? key, required this.birthDay}) : super(key: key);

  @override
  State<ProfileGender> createState() => _ProfileGenderState();
}

class _ProfileGenderState extends State<ProfileGender> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void resendProfileGender() {}
  void nextStep() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ProfilePhoto(
    //             birthDay: widget.birthDay, gender: _selectedIndex)));
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProfilePhoto(
                birthDay: widget.birthDay, gender: _selectedIndex)));
  }

  @override
  Widget build(BuildContext context) {
    const List<String> strListGender = ['Male', 'Female', 'Non-binary'];

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
                  padding: EdgeInsets.only(top: 1),
                  child: SizedBox(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      )),
                ),
                SizedBox(
                    height: 4,
                    width: MediaQuery.of(context).size.width * 0.34,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFB5FBEB)),
                    )),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                width: MediaQuery.of(context).size.width * 0.7,
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'What is your sex?',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.13),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: strListGender.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                  strListGender[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: _selectedIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: _selectedIndex == index
                                          ? const Color(0xffD7FDCB)
                                          : Colors.transparent,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                textColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                });
                          },
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 100, bottom: 0),
              child: Center(
                child: InkWell(
                    onTap: nextStep,
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
                          "NEXT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
