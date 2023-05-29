import 'package:chumsy_app/Constants/sizes.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Controllers/image_controller.dart';
import '../../Functions/cupertino_action_sheet.dart';
import '../../Styles/styles.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import '../../Widgets/Extra Widgets/scatteredgrid.dart';
import '../../Widgets/Extra Widgets/three_state_switch.dart';

// typedef FilterSetCallbak = Function(String key, Map<dynamic, dynamic> data);

class CreateEventCategory extends StatefulWidget {
  const CreateEventCategory({super.key});
  // final FilterSetCallbak setFilterData;
  // final Map<dynamic, dynamic>? filterData;
  @override
  State<CreateEventCategory> createState() => _CreateEventCategoryState();
}

class _CreateEventCategoryState extends State<CreateEventCategory>
    with WidgetsBindingObserver {
  String selected = "Sport";
  int dataCount = 0;

  final ValueNotifier<bool> _sport = ValueNotifier(true);
  final ValueNotifier<bool> _nameIt = ValueNotifier(false);
  final TextEditingController _search = TextEditingController();
  final ValueNotifier<List<Map<String, String>>> _selectedTopics =
      ValueNotifier([]);
  final ValueNotifier<bool> _keyboardVisible = ValueNotifier(false);
  final FocusNode _searchNode = FocusNode();
  List<Map<String, String>> topicList = [];

  List<Map<String, String>> lifeStyleTopics = [];

  List<Map<String, String>> controlList = [];

  @override
  didChangeDependencies() {
    WidgetsBinding.instance.addObserver(this);
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
      setState(() {
        topicList = sports;
        lifeStyleTopics = lifeStyles;
        controlList = _sport.value ? topicList : lifeStyleTopics;
      });
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
      tempWidgets.add(GestureDetector(
        onTap: () {
          onRemove(_selectedTopics.value[i]);
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: Styles.greyButton(
            backgroundColor: const Color(0xff282828),
            borderColor: Colors.white,
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "${_selectedTopics.value[i]['topic']}  X",
              style: Styles.greyButtonText(
                  fontSize: 15, fontWeight: FontWeight.w600, color: whiteColor),
            ),
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

  void cbState(SwitchState state) {
    setState(() {
      if (state == SwitchState.state1) {
        _sport.value = true;
      } else {
        _sport.value = false;
      }

      if (state == SwitchState.state3) {
        _nameIt.value = true;
      } else {
        _nameIt.value = false;
        onSearch(_search.text);
      }
    });
  }

  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;

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
                          ThreeStateSwitch(cbState: cbState),
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
                                      margin: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 0,
                                          bottom: 10),
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
                                    // color: textColor.withOpacity(
                                    //   0.13,
                                    // ),
                                    color: const Color(0xffeeeef0),
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
                                            horizontal: 5,
                                            vertical: 7,
                                          ),
                                          placeholder:
                                              AppLocalizations.of(context)!
                                                  .search,
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
                            child: _nameIt.value
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
                                          GestureDetector(
                                            onTap: () {
                                              showActionSheet(
                                                  context,
                                                  imageController,
                                                  AppLocalizations.of(context)!
                                                      .photoLibrary,
                                                  AppLocalizations.of(context)!
                                                      .takeAPhoto,
                                                  false,
                                                  false);
                                            },
                                            child: Row(
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
                                                  l.changeAPicture,
                                                  style:
                                                      regularStyleBold.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          )
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
