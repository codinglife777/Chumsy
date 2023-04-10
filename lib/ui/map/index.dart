// import 'dart:io';

import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/home/index.dart';
import 'package:chumsy/ui/map/create_event.dart';
import 'package:chumsy/ui/map/filter_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  File? profileFile;
  bool isLifestyle = false;
  final TextEditingController txtSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void nextStep() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const CreateEvent()));
  }

  void search() {}

  void filterOption() {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const FilterOption()));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 44,
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: txtSearchController,
                              cursorColor: AdaptiveTheme.of(context)
                                  .theme
                                  .colorScheme
                                  .primary,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .colorScheme
                                      .onBackground),
                              decoration: InputDecoration(
                                  hintText: 'Search event',
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: IconButton(
                                      color: const Color(0xff282828),
                                      onPressed: search,
                                      icon: const Icon(Icons.search)),
                                  suffixIcon: IconButton(
                                    color: const Color(0xff282828),
                                    onPressed: filterOption,
                                    icon: const Icon(Icons.tune),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(24, 0, 0, 24),
                                  hintStyle: AdaptiveTheme.of(context)
                                      .theme
                                      .inputDecorationTheme
                                      .hintStyle,
                                  // enabledBorder: AdaptiveTheme.of(context)
                                  //     .theme
                                  //     .inputDecorationTheme
                                  //     .border,
                                  border: AdaptiveTheme.of(context)
                                      .theme
                                      .inputDecorationTheme
                                      .border,
                                  focusedBorder: AdaptiveTheme.of(context)
                                      .theme
                                      .inputDecorationTheme
                                      .focusedBorder),
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 44,
                      height: 44,
                      child: FloatingActionButton(
                        heroTag: "1",
                        onPressed: () => print('button pressed'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: const Color(0xff282828),
                        child: const Icon(Icons.question_mark, size: 22.0),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                  ]),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: screenSize.height * 0.6),
              child: Column(children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: FloatingActionButton(
                        heroTag: "2",
                        onPressed: () => print('button pressed'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: const Color(0xff282828),
                        child: const Icon(Icons.send, size: 22.0),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: FloatingActionButton(
                        heroTag: "3",
                        onPressed: () => print('button pressed'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: const Color(0xff282828),
                        child: const Icon(Icons.menu, size: 22.0),
                      ),
                    )),
              ]),
            ),
            // ),
            Container(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
              margin: EdgeInsets.only(top: screenSize.height * 0.63 + 80),
              child: Center(
                child: InkWell(
                    onTap: nextStep,
                    child: Container(
                        width: screenSize.width * 0.85,
                        height: 51,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
            ),
          ],
        ));
  }
}
