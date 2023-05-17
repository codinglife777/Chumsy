import 'package:chumsy_app/Widgets/Extra%20Widgets/scrollpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateScrollPicker extends StatefulWidget {
  DateScrollPicker({
    Key? key,
    required this.initialDate,
    DateTime? maximumDate,
    DateTime? mininimumDate,
    required this.onDateChanged,
  })  : maxDate = maximumDate ??
            DateTime(DateTime.now().year - 16, DateTime.now().month,
                DateTime.now().day),
        minDate = mininimumDate ?? DateTime(DateTime.now().year - 100),
        super(key: key);
  final DateTime initialDate;
  final DateTime maxDate;
  final DateTime minDate;
  final onDateChanged;

  @override
  State<DateScrollPicker> createState() => _DateScrollPickerState();
}

class _DateScrollPickerState extends State<DateScrollPicker> {
  DateTime? selectedDate;

  List<String> _days = [];
  
  List<String> _years = [];
  final FixedExtentScrollController daysController =
      FixedExtentScrollController();
  final FixedExtentScrollController monthsController =
      FixedExtentScrollController();
  final FixedExtentScrollController yearController =
      FixedExtentScrollController();
  int _daysSelectedIndex = 0;
  int _monthSelectedIndex = 0;
  int _yearSelectedIndex = 0;
  final _listOfThirtyOne = [0, 2, 4, 6, 7, 9, 11];
  final _listOfThirty = [3, 5, 8, 10];

  void onDayChanged(dayIndex) {
    if (int.parse(_years[_yearSelectedIndex]) == widget.maxDate.year &&
        _monthSelectedIndex == widget.maxDate.month - 1) {
      if (dayIndex > widget.maxDate.day - 1) {
        daysController.jumpToItem(widget.maxDate.day - 1);
        return;
      }
    }
    setState(() {
      _daysSelectedIndex = dayIndex;
    });
    widget.onDateChanged(DateTime(int.parse(_years[_yearSelectedIndex]),
        _monthSelectedIndex + 1, _daysSelectedIndex + 1));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int startYear = widget.minDate.year;
    for (int yearCounter = 0;
        yearCounter < widget.maxDate.year - widget.minDate.year + 1;
        yearCounter++) {
      _years.add(startYear.toString());
      startYear++;
    }
    _daysSelectedIndex = widget.initialDate.day - 1;
    _monthSelectedIndex = widget.initialDate.month - 1;

    _yearSelectedIndex = (widget.initialDate.year - widget.minDate.year);
  }

  void onMonthChanged(monthIndex) {
    if (int.parse(_years[_yearSelectedIndex]) == widget.maxDate.year) {
      if (monthIndex > widget.maxDate.month - 1) {
        monthsController.jumpToItem(widget.maxDate.month - 1);
        return;
      }
    }
    setState(() {
      _monthSelectedIndex = monthIndex;
    });
    widget.onDateChanged(DateTime(int.parse(_years[_yearSelectedIndex]),
        _monthSelectedIndex + 1, _daysSelectedIndex + 1));
  }

  void onYearChange(yearIndex) {
    setState(() {
      _yearSelectedIndex = yearIndex;
    });
    widget.onDateChanged(DateTime(int.parse(_years[_yearSelectedIndex]),
        _monthSelectedIndex + 1, _daysSelectedIndex + 1));
  }

  bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  List<String> generateDays() {
    List<String> daysList = [];
    if (_listOfThirtyOne.contains(_monthSelectedIndex)) {
      daysList = List.generate(31, (index) => (index + 1).toString());
    } else if (_listOfThirty.contains(_monthSelectedIndex)) {
      daysList = List.generate(30, (index) => (index + 1).toString());
    } else if (isLeapYear(int.parse(_years[_yearSelectedIndex]))) {
      daysList = List.generate(29, (index) => (index + 1).toString());
    } else {
      daysList = List.generate(28, (index) => (index + 1).toString());
    }
    setState(() {
      _days = daysList;
    });
    return daysList;
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    final List<String> months = [
    l.january,
    l.february,
    l.march,
    l.april,
    l.may,
    l.june,
    l.july,
    l.august,
    l.september,
    l.october,
    l.novemeber,
    l.december
  ];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 276,
              height: 51,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffD7FDCB), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 275,
                width: 50,
                child: ScrollPicker(
                  list: generateDays(),
                  controller: daysController,
                  onChanged: onDayChanged,
                  selectedIndex: _daysSelectedIndex,
                ),
              ),
              SizedBox(
                width: 120,
                height: 275,
                child: ScrollPicker(
                  list: months,
                  controller: monthsController,
                  onChanged: onMonthChanged,
                  selectedIndex: _monthSelectedIndex,
                ),
              ),
              Container(
                height: 275,
                width: 75,
                child: ScrollPicker(
                  list: _years,
                  controller: yearController,
                  onChanged: onYearChange,
                  selectedIndex: _yearSelectedIndex,
                  align: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
