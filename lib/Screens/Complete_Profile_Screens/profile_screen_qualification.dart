import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Screens/landing_page.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:slidable_button/slidable_button.dart';
import 'dart:convert';

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

class _CreateProfileQualificationState extends State<CreateProfileQualification>
    with WidgetsBindingObserver {
  String selected = "Sports";
  final TextEditingController searchCont = TextEditingController();

  final ValueNotifier<bool> _sport = ValueNotifier(true);
  final TextEditingController _search = TextEditingController();
  final ValueNotifier<List<Map<String, String>>> _selectedTopics =
      ValueNotifier([]);
  final ValueNotifier<bool> _keyboardVisible = ValueNotifier(false);
  final FocusNode _searchNode = FocusNode();

  late AppLocalizations l = AppLocalizations.of(context)!;

  List<Map<String, String>> topicList = [];

  List<Map<String, String>> lifeStyleTopics = [];

  List<Map<String, String>> controlList = [];

  @override
  didChangeDependencies() {
    WidgetsBinding.instance.addObserver(this);
    l = AppLocalizations.of(context)!;
    try {
      List<dynamic> dataSports =
          jsonDecode(AppLocalizations.of(context)!.sports);
      List<dynamic> dataLifeStyles =
          jsonDecode(AppLocalizations.of(context)!.lifeStyles);
      List<Map<String, String>> sports = dataSports.map((e) {
        return {"topic": e as String};
      }).toList();
      List<Map<String, String>> lifeStyles = dataLifeStyles.map((e) {
        return {"topic": e as String};
      }).toList();
      // setState(() {
      topicList = sports;
      lifeStyleTopics = lifeStyles;
      controlList = _sport.value ? topicList : lifeStyleTopics;
      // });
      onSearch(_search.text);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    super.didChangeDependencies();
  }

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
      tempWidgets.add(GestureDetector(
        onTap: () {
          onRemove(_selectedTopics.value[i]);
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.only(left: 9, right: 9, top: 5),
          decoration: Styles.greyButton(
            backgroundColor: Colors.white,
            borderColor: Colors.transparent,
          ),
          // child: TextButton(
          //   onPressed: () {
          //     onRemove(_selectedTopics.value[i]);
          //   },
          child: Text(
            "${_selectedTopics.value[i]['topic']}  X",
            style: Styles.greyButtonText(fontWeight: FontWeight.bold),
          ),
          // ),
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
    print(_search.text);
    print(controlList);
    return Theme(
      data: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: blackColor,
      ),
      child: Scaffold(
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
                            spacing: 10,
                            runSpacing: 8,
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
                              onSearch(value);
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
        ),
      ),
    );
  }
}
