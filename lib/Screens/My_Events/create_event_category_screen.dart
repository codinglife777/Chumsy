import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Styles/styles.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/scatteredgrid.dart';

// typedef FilterSetCallbak = Function(String key, Map<dynamic, dynamic> data);

class CreateEventCategory extends StatefulWidget {
  const CreateEventCategory({super.key});
  // final FilterSetCallbak setFilterData;
  // final Map<dynamic, dynamic>? filterData;
  @override
  State<CreateEventCategory> createState() => _CreateEventCategoryState();
}

class _CreateEventCategoryState extends State<CreateEventCategory> {
  String selected = "Sport";
  int dataCount = 0;

  final ValueNotifier<bool> _sport = ValueNotifier(true);
  final ValueNotifier<bool> _nameIt = ValueNotifier(false);
  final TextEditingController _search = TextEditingController();
  final ValueNotifier<List<Map<String, String>>> _selectedTopics =
      ValueNotifier([]);
  final ValueNotifier<bool> _keyboardVisible = ValueNotifier(false);
  final FocusNode _searchNode = FocusNode();
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
    {"topic": 'Board games'},
    {"topic": 'Calligraphy'},
    {"topic": 'Caravanning'},
    {"topic": "Card games"},
    {"topic": 'Ceramics and Pottery'},
    {"topic": 'Cooking'},
    {"topic": 'Crocheting'},
    {"topic": 'Drawing'},
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
            .where((element) =>
                element["topic"]!.toLowerCase().contains(searchString))
            .toList();
      } else {
        controlList = lifeStyleTopics
            .where((element) =>
                element["topic"]!.toLowerCase().contains(searchString))
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
          borderColor: const Color(0xff282828),
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
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topSpacingBox,
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacingBox,
                          Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            ),
                            padding: const EdgeInsets.all(
                              3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppLocalizations.of(context)!.sport,
                                AppLocalizations.of(context)!.lifeStyle,
                                AppLocalizations.of(context)!.nameIt
                              ]
                                  .map(
                                    (e) => Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          gradient: selected.contains(e)
                                              ? const LinearGradient(
                                                  colors: [
                                                    neonColor,
                                                    blueColor,
                                                  ],
                                                )
                                              : const LinearGradient(
                                                  colors: [
                                                    blackColor,
                                                    blackColor,
                                                  ],
                                                ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selected = e;
                                              if (e ==
                                                  AppLocalizations.of(context)!
                                                      .sport) {
                                                _sport.value = true;
                                              } else {
                                                _sport.value = false;
                                              }
                                              if (e ==
                                                  AppLocalizations.of(context)!
                                                      .nameIt) {
                                                _nameIt.value = true;
                                              } else {
                                                _nameIt.value = false;
                                                onSearch(_search.text);
                                              }
                                            });
                                          },
                                          child: Center(
                                            child: Text(
                                              e,
                                              style: subHeadingStyle.copyWith(
                                                color: selected.contains(e)
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          spacingBox,
                          spacingBox,
                          _nameIt.value
                              ? const SizedBox()
                              : ValueListenableBuilder(
                                  valueListenable: _selectedTopics,
                                  builder: (BuildContext context,
                                      List<Map<String, String>> value,
                                      Widget? child) {
                                    return Container(
                                      width: screenWidth,
                                      constraints:
                                          const BoxConstraints(maxHeight: 104),
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: _selectedTopics.value.isNotEmpty
                                              ? 21
                                              : 0),
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
                          _nameIt.value
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                    color: textColor.withOpacity(
                                      0.13,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      horizontalSpacingBox,
                                      const Expanded(
                                        flex: 0,
                                        child: Icon(
                                          CupertinoIcons.search,
                                          color: blackColor,
                                        ),
                                      ),
                                      horizontalSpacingBox,
                                      Expanded(
                                        flex: 1,
                                        child: CupertinoTextField(
                                          controller: _search,
                                          onChanged: (value) {
                                            onSearch(_search.text);
                                          },
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 5,
                                          ),
                                          placeholder: 'Search',
                                          placeholderStyle: const TextStyle(
                                              color: greyIconColor,
                                              fontSize: 16),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          spacingBox,
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: screenHeight / 1.6,
                            ),
                            child: selected.contains(
                                    AppLocalizations.of(context)!.nameIt)
                                ? Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .nameTheEvent,
                                            style: smallStyleBold,
                                          ),
                                          spacingBox,
                                          CupertinoTextField(
                                            onChanged: (value) {
                                              setState(() {
                                                dataCount = value.length;
                                              });
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            placeholder:
                                                AppLocalizations.of(context)!
                                                    .chooseTheName,
                                            placeholderStyle: smallStyle,
                                            maxLength: 24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: textColor.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                          ),
                                          spacingBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "$dataCount/ 24",
                                                style: smallStyle,
                                              ),
                                            ],
                                          ),
                                          spacingBox,
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(24)),
                                            child: Image.asset(
                                              "assets/extras/millo-lin-IbngTBpNuMA-unsplash.jpg",
                                              width: screenWidth / 1.5,
                                            ),
                                          ),
                                          spacingBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                CupertinoIcons.add_circled,
                                                color: blackColor,
                                                size: 36,
                                              ),
                                              horizontalSpacingBox,
                                              Text(
                                                "Change a picture",
                                                style:
                                                    regularStyleBold.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 500,
                                    width: screenWidth,
                                    child: CustomScrollView(
                                      slivers: [
                                        SliverToBoxAdapter(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ScatteredGrid(
                                                elementBackgroundColor:
                                                    Colors.white,
                                                elementTextColor:
                                                    const Color(0xff282828),
                                                elementBorderColor:
                                                    const Color(0xff282828),
                                                topicList: controlList,
                                                onSelect: onSelect,
                                              ),
                                              Container(
                                                height: 200,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          spacingBox,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30,
                    ),
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
                      onTapFunction: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          EventAppBar(
            title: AppLocalizations.of(context)!.category,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}
