import 'package:chumsy/ui/register/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../common/common.dart';
import '../common/custom_switch.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int numberChumsys = 1;
  bool isAdvanced = false;
  bool needMaster = false;

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void createEvent() {}
  void nextStep() {
    //  Navigator.push(
    //     context,
    //     CupertinoPageRoute(
    //         builder: (context) => ProfilePhoto(
    //             birthDay: widget.birthDay, gender: _selectedIndex)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(context, isWhite: false),
                const Text(
                  'Create an event',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff282828),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 20),
                    child: const Text(
                      'Clear',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xff282828)),
                    )),
              ],
            ),
            Container(
              height: 1,
              color: const Color(0x33282828),
            ),
            buildRow("Category", "Choose", () {}),
            buildRow("Time", "Choose", () {}),
            buildRow("Location", "Choose", () {}),
            buildRow("Location", "Free", () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 35),
                  child: Text(
                    "Number of Chumsys",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff282828),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 35),
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (numberChumsys > 1) numberChumsys--;
                              });
                            },
                            color: const Color(0xffF2F2F2),
                            icon: const Text(
                              "-",
                              style: TextStyle(
                                  color: Color(0xff282828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            iconSize: 16,
                          ),
                          Text(
                            numberChumsys.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff282828)),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                numberChumsys++;
                              });
                            },
                            color: const Color(0xffB3FBED),
                            icon: const Text(
                              "+",
                              style: TextStyle(
                                  color: Color(0xff282828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            iconSize: 16,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            isAdvanced
                ? Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30, top: 30),
                          child: Text(
                            "Need a Master?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff282828),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, top: 35),
                          child: CustomSwitch(
                            value: needMaster,
                            isLight: true,
                            onChanged: (bool val) {
                              setState(() {
                                needMaster = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    buildRow("With whom?", "Choose", () {}),
                    buildRow("Level", "Choose", () {}),
                    buildRow("Type", "Choose", () {}),
                  ])
                : Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAdvanced = true;
                        });
                      },
                      child: const Text(
                        "Advanced",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff282828),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 64, right: 64),
              child: InkWell(
                  onTap: createEvent,
                  child: Container(
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
                        "CREATE AN EVENT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff282828),
                            fontWeight: FontWeight.bold),
                      ))),
            ),
          ],
        ));
  }

  Row buildRow(String leftText, String rightText, VoidCallback cb) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 30),
          child: Text(
            leftText,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xff282828),
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30, top: 30),
          child: InkWell(
              onTap: cb,
              child: Row(
                children: [
                  Text(
                    rightText,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xff282828)),
                  ),
                  const Icon(
                    // <-- Icon
                    Icons.arrow_right_outlined,
                    size: 32.0,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
