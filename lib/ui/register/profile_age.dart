import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/register/profile_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../common/common.dart';

class ProfileAge extends StatefulWidget {
  const ProfileAge({Key? key}) : super(key: key);

  @override
  State<ProfileAge> createState() => _ProfileAgeState();
}

class _ProfileAgeState extends State<ProfileAge> {
  DateTime _birthDay = DateTime(2000, 1, 1);

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void resendProfileAge() {}
  void nextStep() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProfileGender(birthDay: _birthDay)));
  } //

  @override
  Widget build(BuildContext context) {
    // ignore: todo
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
                    top: MediaQuery.of(context).size.height * 0.13),
                width: MediaQuery.of(context).size.width * 0.7,
                // height: MediaQuery.of(context).size.height * 0.6,
                // color: Colors.red,
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'What is your age?',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    // SizedBox(
                    //   height: 350,
                    //   child: CupertinoTheme(
                    //       data: const CupertinoThemeData(
                    //         brightness: Brightness.light,
                    //         textTheme: CupertinoTextThemeData(
                    //           dateTimePickerTextStyle: TextStyle(
                    //               fontSize: 18,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       child: CupertinoDatePicker(
                    //         initialDateTime: _birthDay,
                    //         mode: CupertinoDatePickerMode.date,
                    //         use24hFormat: true,
                    //         // This is called when the user changes the date.
                    //         onDateTimeChanged: (DateTime newDate) {
                    //           setState(() => _birthDay = newDate);
                    //         },
                    //       )),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 80),
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
