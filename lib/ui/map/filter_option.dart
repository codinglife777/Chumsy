// import 'dart:io';

import 'dart:io';

import 'package:chumsy/ui/common/custom_switch.dart';
import 'package:chumsy/ui/register/profile_quailifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../common/common.dart';

class FilterOption extends StatefulWidget {
  const FilterOption({Key? key}) : super(key: key);

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  bool masterState = false;
  double sliderVal = 0;

  @override
  void initState() {
    super.initState();
  }

  //To-do
  void nextStep() {}

  void applyFilters() {}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context, isWhite: false),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Filters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff282828),
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                        color: Color.fromARGB(255, 5, 4, 4), fontSize: 16),
                  ),
                ),
              )
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 35),
                child: Text(
                  "Category",
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
                      children: const [
                        Text(
                          "Choose",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff282828)),
                        ),
                        Icon(
                          // <-- Icon
                          Icons.arrow_right_outlined,
                          size: 32.0,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 35),
                child: Text(
                  "Time",
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
                      children: const [
                        Text(
                          "Choose",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff282828)),
                        ),
                        Icon(
                          // <-- Icon
                          Icons.arrow_right_outlined,
                          size: 32.0,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 35),
                child: Text(
                  "Location",
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
                      children: const [
                        Text(
                          "Warsaw",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff282828)),
                        ),
                        Icon(
                          // <-- Icon
                          Icons.arrow_right_outlined,
                          size: 32.0,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  "Distance(km)",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff282828),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.5, top: 60, right: 30.5, bottom: 65),
            child: SfSlider(
              min: 0.0,
              max: 100.0,
              value: sliderVal.round(),
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              activeColor: const Color(0xFFB5FBEB),
              inactiveColor: const Color(0xFF282828),
              minorTicksPerInterval: 1,
              tooltipShape: const SfPaddleTooltipShape(),
              onChanged: (dynamic value) {
                setState(() {
                  sliderVal = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 35),
                child: Text(
                  "Price",
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
                      children: const [
                        Text(
                          "Choose",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff282828)),
                        ),
                        Icon(
                          // <-- Icon
                          Icons.arrow_right_outlined,
                          size: 32.0,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Advanced",
              style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: Color(0xFF282828)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 64, right: 64),
            child: InkWell(
                onTap: applyFilters,
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
                    "APPLY FILTERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff282828),
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
