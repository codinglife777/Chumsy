import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:slidable_button/slidable_button.dart';

import 'package:get/get.dart';

import '../../Widgets/Extra Widgets/google_map.dart';
import '../../Widgets/Extra Widgets/gradient_widget.dart';
import '../../Widgets/Extra Widgets/scatteredgrid.dart';
import '../../styles/styles.dart';

class CreateProfileQualification extends StatefulWidget {
  const CreateProfileQualification({super.key});

  @override
  State<CreateProfileQualification> createState() =>
      _CreateProfileQualificationState();
}

class _CreateProfileQualificationState
    extends State<CreateProfileQualification> {
  String selected = "Sports";
  final TextEditingController searchCont = TextEditingController();

  final ValueNotifier<bool> _sport = ValueNotifier(true);
  final TextEditingController _search = TextEditingController();
  final ValueNotifier<List<Map<String, String>>> _selectedTopics =
      ValueNotifier([]);
  final ValueNotifier<bool> _keyboardVisible = ValueNotifier(false);
  final FocusNode _searchNode = FocusNode();

  late AppLocalizations l;

  List<Map<String, String>> topicList = [
    {"topic": "Acrobatics"},
    {"topic": "Aerobics"},
    {"topic": "Aqua Aerobics"},
    {"topic": "Archery"},
    {"topic": "Athletics"},
    {"topic": "Badminton"},
    {"topic": "Baseball"},
    {"topic": "Basketball"},
    {"topic": "Biathlon"},
    {"topic": "Bowling"},
    {"topic": "Boxing"},
    {"topic": "Canoening"},
    {"topic": "Chess"},
    {"topic": "Climbing"},
    {"topic": "Combat sports (other)"},
    {"topic": "Cricket"},
    {"topic": "CrossFit"},
    {"topic": "Crossminton"},
    {"topic": "Cycling"},
    {"topic": "Dance"},
    {"topic": "eSport"},
    {"topic": "Fencing"},
    {"topic": "Fitness"},
    {"topic": "Floorball"},
    {"topic": "Football"},
    {"topic": "Frisbee"},
    {"topic": "Golf"},
    {"topic": "Gym"},
    {"topic": "Gymnastics"},
    {"topic": "Handball"},
    {"topic": "Hockey"},
    {"topic": "Horse riding"},
    {"topic": "Ice-skating"},
    {"topic": "Judo"},
    {"topic": "Karate"},
    {"topic": "Karting"},
    {"topic": "Kick-boxing"},
    {"topic": "Kitesurfing"},
    {"topic": "MMA"},
    {"topic": "Motorbike riding"},
    {"topic": "Nordic walking"},
    {"topic": "Padel"},
    {"topic": "Pedalo"},
    {"topic": "Physiotherapy (exercise)"},
    {"topic": "Pilates"},
    {"topic": "Pool"},
    {"topic": "Roller blading"},
    {"topic": "Roller skates"},
    {"topic": "Rowing"},
    {"topic": "Rugby"},
    {"topic": "Running"},
    {"topic": "Sailing"},
    {"topic": "Shooting"},
    {"topic": "Skateboard"},
    {"topic": "Ski jumping"},
    {"topic": "Skiing"},
    {"topic": "Snowboard"},
    {"topic": "Squash"},
    {"topic": "SUP"},
    {"topic": "Surfing"},
    {"topic": "Swimming"},
    {"topic": "Tennis"},
    {"topic": "Taekwondo"},
    {"topic": "Tennis"},
    {"topic": "Trekking"},
    {"topic": "Triathlon"},
    {"topic": "Volleyball"},
    {"topic": "Weightlifting"},
    {"topic": "Windsurfing"},
    {"topic": "Wrestling"},
    {"topic": "Yoga"},
  ];

  List<Map<String, String>> lifeStyleTopics = [
    {"topic": "Board games"},
    {"topic": "Calligraphy"},
    {"topic": "Caravanning"},
    {"topic": "Card games"},
    {"topic": "Ceramics and Pottery"},
    {"topic": "Cooking"},
    {"topic": "Crocheting"},
    {"topic": "Drawing"},
    {"topic": 'Embroidering'},
    {"topic": 'Fashion'},
    {"topic": 'Fishing'},
    {"topic": 'Floristics'},
    {"topic": 'Handicraft'},
    {"topic": 'Macrame'},
    {"topic": 'Make-up and Beauty care'},
    {"topic": 'Mindfulness'},
    {"topic": 'Music and Singing'},
    {"topic": 'Paintball'},
    {"topic": 'Painting'},
    {"topic": 'Photography'},
    {"topic": 'Picnic'},
    {"topic": 'Pole dance'},
    {"topic": 'Rope course'},
    {"topic": 'Sauna'},
    {"topic": 'Sled'},
    {"topic": 'Trampolines'},
    {"topic": 'Walk'},
    {"topic": 'Walk with a dog'},
    {"topic": 'Walk with children'},
    {"topic": 'Zumba'},
  ];

  List<Map<String, String>> controlList = [];
  @override
  void initState() {
    super.initState();
    controlList = topicList;
    _searchNode.addListener(() {
      if (kDebugMode) {
        print(MediaQuery.of(context).viewInsets.bottom);
      }
    });
  }

  void onSearch(String searchString) {
    setState(() {
      if (_sport.value) {
        controlList = topicList
            .where((element) => element["topic"]!
                .toLowerCase()
                .contains(searchString.toLowerCase()))
            .toList();
      } else {
        controlList = lifeStyleTopics
            .where((element) => element["topic"]!
                .toLowerCase()
                .contains(searchString.toLowerCase()))
            .toList();
      }
    });
  }

  void onSelect(String selectedText) {
    _selectedTopics.value = List.from(_selectedTopics.value)
      ..insert(0, {
        "type": _sport.value ? "Sport" : "Lifestyle",
        "topic": selectedText
      });
    if (_sport.value) {
      topicList = List.from(topicList)
        ..removeWhere(
          (element) => element['topic'] == selectedText,
        );
    } else {
      lifeStyleTopics = List.from(lifeStyleTopics)
        ..removeWhere(
          (element) => element['topic'] == selectedText,
        );
    }

    onSearch(_search.text);
  }

  void clear() {
    for (int i = _selectedTopics.value.length - 1; i > -1; i--) {
      onRemove(_selectedTopics.value[i]);
    }
  }

  List<Widget> generateSelected() {
    List<Widget> tempWidgets = [];

    for (int i = 0; i < _selectedTopics.value.length; i++) {
      tempWidgets.add(Container(
        height: 40,
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: Styles.greyButton(
          backgroundColor: Colors.white,
          borderColor: Colors.transparent,
        ),
        child: TextButton(
          onPressed: () {
            onRemove(_selectedTopics.value[i]);
          },
          child: Text(
            "${_selectedTopics.value[i]['topic']}  X",
            style: Styles.greyButtonText(fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }
    return tempWidgets;
  }

  void onRemove(Map<String, String> item) {
    _selectedTopics.value = List.from(_selectedTopics.value)
      ..removeWhere((element) => element == item);
    if (item['type'] == 'Sport') {
      topicList = List.from(topicList)..add({"topic": item["topic"]!});
    } else {
      lifeStyleTopics = List.from(lifeStyleTopics)
        ..add({"topic": item['topic']!});
    }

    onSearch(_search.text);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // data: const CupertinoThemeData(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: blackColor,
      //   barBackgroundColor: blackColor,
      // ),
      data: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: blackColor,
      ),
      child: Scaffold(
        // navigationBar: CupertinoNavigationBar(
        //   leading: CupertinoButton(
        //     padding: EdgeInsets.zero,
        //     child: const Icon(
        //       CupertinoIcons.back,
        //       color: whiteColor,
        //       size: 30,
        //     ),
        //     onPressed: () => Get.back(),
        //   ),
        //   middle: const Text(
        //     "Qualifications",
        //     style: TextStyle(
        //       color: whiteColor,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 18,
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: blackColor,
          toolbarHeight: 64.5,
          centerTitle: true,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.back,
              color: whiteColor,
              size: 30,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            AppLocalizations.of(context)!.qualifications,
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            InkWell(
              onTap: clear,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  AppLocalizations.of(context)!.clear,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  width: screenWidth,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: neonColor2,
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 47, right: 47, bottom: 27, top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.becauseYouAreAMaster,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      HorizontalSlidableButton(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 51,
                        buttonWidth: MediaQuery.of(context).size.width / 2.6,
                        color: Colors.white,
                        // buttonColor: Theme.of(context).primaryColor,
                        dismissible: false,
                        label: Container(
                          constraints: const BoxConstraints.expand(),
                          decoration: Styles.gredientButtonContainer(
                              borderColor: Colors.transparent),
                        ),
                        onChanged: (position) {
                          setState(() {
                            if (position == SlidableButtonPosition.end) {
                              _sport.value = false;
                              onSearch(_search.text);
                            } else {
                              _sport.value = true;
                              onSearch(_search.text);
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        // padding: const EdgeInsets.all(8.0),
                        child: IgnorePointer(
                            child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Text(
                                  AppLocalizations.of(context)!.sport,
                                  style: Styles.greyButtonText(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Text(
                                  AppLocalizations.of(context)!.lifeStyle,
                                  style: Styles.greyButtonText(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        )),
                      )
                    ],
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   margin: EdgeInsets.only(
                  //     left: screenWidth < 390 ? 57 : 64,
                  //     right: screenWidth < 390 ? 57 : 64,
                  //   ),
                  //   height: 51,
                  //   width: screenWidth - (screenWidth < 390 ? 57 * 2 : 64 * 2),
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.all(Radius.circular(100)),
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       ValueListenableBuilder(
                  //         valueListenable: _sport,
                  //         builder: (BuildContext context, bool value,
                  //             Widget? child) {
                  //           return AnimatedContainer(
                  //             duration: const Duration(milliseconds: 300),
                  //             height: 47,
                  //             width: 129,
                  //             margin: EdgeInsets.only(
                  //                 left: value
                  //                     ? 2
                  //                     : (screenWidth < 390 ? 57 * 2 : 64 * 2) +
                  //                         4),
                  //             decoration: Styles.gredientButtonContainer(
                  //                 borderColor: Colors.transparent),
                  //           );
                  //         },
                  //       ),
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () {
                  //               _sport.value = true;
                  //               onSearch(_search.text);
                  //             },
                  //             child: Container(
                  //               color: Colors.transparent,
                  //               alignment: Alignment.center,
                  //               width: (screenWidth < 390 ? 57 * 2 : 64 * 2),
                  //               height: 45,
                  //               child: Text(
                  //                 AppLocalizations.of(context)!.sport,
                  //                 style: Styles.greyButtonText(
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           ),
                  //           GestureDetector(
                  //             onTap: () {
                  //               _sport.value = false;
                  //               onSearch(_search.text);
                  //             },
                  //             child: Container(
                  //               color: Colors.transparent,
                  //               alignment: Alignment.center,
                  //               width: (screenWidth < 390 ? 57 * 2 : 64 * 2),
                  //               height: 45,
                  //               child: Text(
                  //                   AppLocalizations.of(context)!.lifeStyle,
                  //                   style: Styles.greyButtonText(
                  //                       fontWeight: FontWeight.bold)),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ValueListenableBuilder(
                    valueListenable: _selectedTopics,
                    builder: (BuildContext context,
                        List<Map<String, String>> value, Widget? child) {
                      return Container(
                        width: screenWidth,
                        constraints: const BoxConstraints(maxHeight: 104),
                        margin: EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: _selectedTopics.value.isNotEmpty ? 21 : 0),
                        child: SingleChildScrollView(
                          child: Wrap(
                            runAlignment: WrapAlignment.start,
                            spacing: 13,
                            runSpacing: 13,
                            children: generateSelected(),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 20,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x00000000), Color(0xff282828)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 22),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    height: 35,
                    width: screenWidth - 22 * 2,
                    decoration: Styles.textFieldContainer(),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/register/searchicon.png',
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: TextFormField(
                            focusNode: _searchNode,
                            controller: _search,
                            onChanged: (value) {
                              onSearch(_search.text);
                            },
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.search,
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.all(10),
                                border: InputBorder.none),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ScatteredGrid(
                                    topicList: controlList,
                                    onSelect: onSelect,
                                  ),
                                  Container(
                                    height: 200,
                                    color: Color(0xff282828),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            // SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 50,
            //     ),
            //     child: Column(
            //       children: [
            //         spacingBoxExtended,
            //         const Center(
            //           child: Text(
            //             "Because you are a Master please let us know in what categories you specialise",
            //             style: TextStyle(
            //               color: textColor,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 27,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 10,
            //           ),
            //           child: Container(
            //             height: 51,
            //             decoration: BoxDecoration(
            //               color: whiteColor,
            //               borderRadius: BorderRadius.circular(
            //                 100,
            //               ),
            //             ),
            //             padding: const EdgeInsets.all(
            //               2,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               mainAxisSize: MainAxisSize.min,
            //               children: ["Sports", "Lifestyle"]
            //                   .map(
            //                     (e) => Expanded(
            //                       flex: 1,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                             100,
            //                           ),
            //                           gradient: selected.contains(e)
            //                               ? const LinearGradient(
            //                                   colors: [
            //                                     neonColor,
            //                                     blueColor,
            //                                   ],
            //                                 )
            //                               : const LinearGradient(
            //                                   colors: [
            //                                     whiteColor,
            //                                     whiteColor,
            //                                   ],
            //                                 ),
            //                         ),
            //                         padding: const EdgeInsets.symmetric(
            //                           vertical: 10,
            //                         ),
            //                         child: GestureDetector(
            //                           onTap: () {
            //                             setState(() {
            //                               selected = e;
            //                             });
            //                           },
            //                           child: Center(
            //                             child: Text(
            //                               e,
            //                               style: regularStyleBold.copyWith(
            //                                 fontWeight: FontWeight.bold,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   )
            //                   .toList(),
            //             ),
            //           ),
            //         ),
            //         spacingBox,
            //         spacingBox,
            //         Container(
            //           height: 35,
            //           decoration: BoxDecoration(
            //             color: whiteColor,
            //             borderRadius: BorderRadius.circular(
            //               100,
            //             ),
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               const SizedBox(
            //                 width: 20.12,
            //               ),
            //               Expanded(
            //                 flex: 0,
            //                 child: Icon(
            //                   CupertinoIcons.search,
            //                   color: blackColor.withOpacity(0.8),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 width: 13,
            //               ),
            //               Expanded(
            //                 flex: 1,
            //                 child: CupertinoTextField(
            //                   controller: searchCont,
            //                   padding: EdgeInsets.zero,
            //                   placeholder: 'Search',
            //                   placeholderStyle: const TextStyle(
            //                     color: greyIconColor,
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                   decoration: const BoxDecoration(
            //                     borderRadius: BorderRadius.all(
            //                       Radius.circular(
            //                         100,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 24,
            //         ),
            //         Stack(
            //           children: [
            //             Container(
            //               constraints: BoxConstraints(
            //                 maxHeight: screenHeight / 2.5,
            //               ),
            //               child: ListView(
            //                 shrinkWrap: true,
            //                 addRepaintBoundaries: false,
            //                 children: [
            //                   ChipSets2(
            //                     listOfChips: items1,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items2,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items3,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items4,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items5,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items6,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items3,
            //                   ),
            //                   ChipSets2(
            //                     listOfChips: items4,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             IgnorePointer(
            //               ignoring: true,
            //               child: Container(
            //                 constraints: BoxConstraints(
            //                   maxHeight: screenHeight / 2.5,
            //                   minWidth: screenWidth,
            //                 ),
            //                 height: screenHeight / 2.5,
            //                 width: screenWidth,
            //                 decoration: BoxDecoration(
            //                   boxShadow: [
            //                     BoxShadow(
            //                       blurRadius: 15,
            //                       spreadRadius: 8,
            //                       offset: const Offset(
            //                         -6,
            //                         -20,
            //                       ),
            //                       inset: true,
            //                       color: blackColor.withOpacity(0.8),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(
            //           height: 13,
            //         ),
            Padding(
              padding: const EdgeInsets.only(left: 47, right: 47, top: 10),
              child: CustomGradientButtonWidget(
                buttonWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.save,
                      style: regularStyleBold,
                    ),
                  ],
                ),
                onTapFunction: () {
                  Get.to(() => const LandingPage());
                },
              ),
            ),
            const SizedBox(height: 50)
          ],
          // ),
          //   ),
          // ),
          //   Positioned(
          //     bottom: MediaQuery.of(context).viewInsets.bottom > 0
          //         ? -MediaQuery.of(context).viewInsets.bottom
          //         : 0,
          //     child: SizedBox(
          //       height: 152 + 33,
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 33,
          //             width: screenWidth * 0.8,
          //             decoration: const BoxDecoration(
          //               gradient: LinearGradient(
          //                 colors: [Color(0x00282828), Color(0xff282828)],
          //                 begin: Alignment.topCenter,
          //                 end: Alignment.bottomCenter,
          //               ),
          //             ),
          //           ),
          //           SignupBottomSheet(
          //             onPressed: () {
          //               UserModel qualifications = UserModel()
          //                 ..user = _selectedTopics.value;
          //               messageStreamController.add({
          //                 "for": "LoadingScreen",
          //                 "message": "SignupComplete"
          //               });
          //             },
          //             buttonText: AppLocalizations.of(context)!.save,
          //           ),
          //         ],
          //       ),
          //     ),
          //   )
          // ],
        ),
      ),
    );
  }
}
