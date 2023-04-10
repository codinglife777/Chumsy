// import 'dart:io';

import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/home/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';

class TextSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TextSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _TextSwitchState createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              if (_animationController!.isCompleted) {
                _animationController!.reverse();
              } else {
                _animationController!.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Stack(
              children: [
                widget.value == false
                    ? Container(
                        width: 262.0,
                        height: 51.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                          child: Container(
                            alignment: widget.value
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 129.0,
                              height: 47.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFD8FECB),
                                        Color(0xFFA5FAFA)
                                      ])),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 262.0,
                        height: 51.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                          child: Container(
                            alignment: widget.value
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 129.0,
                              height: 47.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFD8FECB),
                                        Color(0xFFA5FAFA)
                                      ])),
                            ),
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 131,
                        height: 51,
                        child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Sport",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff282828),
                                  fontWeight: FontWeight.bold),
                            ))),
                    SizedBox(
                        width: 131,
                        height: 51,
                        child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Lifestyle",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff282828),
                                  fontWeight: FontWeight.bold),
                            ))),
                  ],
                )
              ],
            ));
      },
    );
  }
}

class ProfileQualification extends StatefulWidget {
  final DateTime birthDay;
  final int gender;
  final File profilePath;

  const ProfileQualification(
      {Key? key,
      required this.birthDay,
      required this.gender,
      required this.profilePath})
      : super(key: key);

  @override
  State<ProfileQualification> createState() => _ProfileQualificationState();
}

class _ProfileQualificationState extends State<ProfileQualification> {
  File? profileFile;
  bool isLifestyle = false;
  final TextEditingController txtSearchController = TextEditingController();
  List<String> sportList = [
    'Box',
    'Football',
    'Frisbee',
    'Badminton',
    'Bike',
    'Runinng',
    'Tennis',
    'Nordic Walking',
    'Yoga',
    'Pilates',
    'Nordic Waliking',
    'Box',
    'Football',
    'Frisbee',
    'Badminton',
    'Bike',
    'Runinng',
    'Tennis',
    'Nordic Walking',
    'Yoga',
    'Pilates',
    'Nordic Waliking'
  ];
  List<String> lifeStyleList = [
    'Football',
    'Frisbee',
    'Badminton',
    'Bike',
    'Runinng',
    'Tennis',
    'Nordic Walking',
    'Yoga',
    'Pilates',
    'Nordic Waliking',
    'Box',
    'Football',
    'Frisbee',
    'Badminton',
    'Bike',
    'Runinng',
    'Tennis',
    'Nordic Walking',
    'Yoga',
    'Pilates',
    'Nordic Waliking'
  ];

  List<String> selectedSportList = [];
  List<String> selectedLifestyleList = [];

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void nextStep() {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const NavigationMenu()));
  }

  void sportClicked(int idx) {
    // if (kDebugMode) {
    //   print(idx);
    //   setState(() {
    //     selectedSportList.add(sportList[idx]);
    //     sportList.removeAt(idx);
    //   });
    // }
  }

  void lifeStyleClicked(idx) {
    if (kDebugMode) {
      print(idx);
      setState(() {
        selectedLifestyleList.add(lifeStyleList[idx]);
        lifeStyleList.removeAt(idx);
      });
    }
  }

  void selectedSportClicked(int idx) {
    if (kDebugMode) {
      print(idx);
      setState(() {
        sportList.add(selectedSportList[idx]);
        selectedSportList.removeAt(idx);
      });
    }
  }

  void selectedLifestyleClicked(int idx) {
    if (kDebugMode) {
      print(idx);
      setState(() {
        lifeStyleList.add(selectedLifestyleList[idx]);
        selectedLifestyleList.removeAt(idx);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    int sportIdx = 0;
    int lifeStyleIdx = 0;
    int selectedSportIdx = 0;
    int selectedLifestyleIdx = 0;

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
                      'Quailifications',
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
            // Center(
            // child:
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.7,
              // alignment: Alignment.center,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Because you are a Master please let us know',
                    style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'in what categories you specialise',
                    style: TextStyle(fontSize: 16.0, color: Color(0xffffffff)),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 262,
                    child: TextSwitch(
                      value: isLifestyle,
                      onChanged: (bool val) {
                        setState(() {
                          isLifestyle = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  selectedSportList.isNotEmpty
                      ? Flexible(
                          child: SingleChildScrollView(
                              child: Wrap(
                          spacing: 13,
                          runSpacing: 13,
                          children: selectedSportList
                              .map((e) => generateSelectedSportButton(
                                  e, selectedSportIdx++))
                              .toList(),
                        )))
                      : const SizedBox(),
                  selectedSportList.isNotEmpty
                      ? const SizedBox(height: 20)
                      : const SizedBox(),
                  SizedBox(
                      width: 330,
                      height: 35,
                      child: TextField(
                        textAlign: TextAlign.left,
                        controller: txtSearchController,
                        cursorColor:
                            AdaptiveTheme.of(context).theme.colorScheme.primary,
                        style: TextStyle(
                            fontSize: 16,
                            color: AdaptiveTheme.of(context)
                                .theme
                                .colorScheme
                                .onBackground),
                        decoration: InputDecoration(
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            hintStyle: AdaptiveTheme.of(context)
                                .theme
                                .inputDecorationTheme
                                .hintStyle,
                            enabledBorder: AdaptiveTheme.of(context)
                                .theme
                                .inputDecorationTheme
                                .border,
                            border: AdaptiveTheme.of(context)
                                .theme
                                .inputDecorationTheme
                                .border,
                            focusedBorder: AdaptiveTheme.of(context)
                                .theme
                                .inputDecorationTheme
                                .focusedBorder),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Wrap(
                    spacing: 13,
                    runSpacing: 13,
                    children: isLifestyle
                        ? lifeStyleList
                            .map(
                                (e) => generateButton(e, lifeStyleIdx++, false))
                            .toList()
                        : sportList
                            .map((e) => generateButton(e, sportIdx++, true))
                            .toList(),
                  )))
                ],
              ),
            ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
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
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            )
          ],
        ));
  }

  Widget generateButton(String strName, int index, bool isSport) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xff282828),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white, width: 2)),
      child: OutlinedButton(
          onPressed: () {
            isSport ? sportClicked(index) : lifeStyleClicked(index);
          },
          child: Text(
            strName,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }

  Widget generateSelectedSportButton(String strName, int index) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            strName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xff282828),
                fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () {
              selectedSportClicked(index);
            },
            padding: const EdgeInsets.only(top: 5),
            icon: const Icon(Icons.close),
            iconSize: 18,
          )
        ],
      ),
    );
  }
}
