import 'dart:math';

import 'package:calendar_calendar/calendar_calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

import 'package:sliver_bar_chart/sliver_bar_chart.dart';

class Habitreport {
  String Habitreporttitle;
  String Habitreportcount;
  String Habitreportcompletiontitle;
  String Habitreportcompletionrate;

  Habitreport(
      {required this.Habitreporttitle,
      required this.Habitreportcount,
      required this.Habitreportcompletiontitle,
      required this.Habitreportcompletionrate});
}

List<Habitreport> Habitreportlist = [
  Habitreport(
    Habitreporttitle: "HABIT\nFINISHED",
    Habitreportcount: "5",
    Habitreportcompletiontitle: "HABIT\nCOMPLETION\nRATE",
    Habitreportcompletionrate: "50%",
  )
];

class Habit_report extends StatefulWidget {
  const Habit_report({super.key});

  @override
  State<Habit_report> createState() => _Habit_reportState();
}

class _Habit_reportState extends State<Habit_report> {
  final ScrollController _scrollController = ScrollController();
  late final List<BarChartData> _barValues;

  final double _minHeight = AppBar().preferredSize.height;
  final double _xAxisTextRotationAngle = 180.0;
  final int _yAxisIntervalCount = 8;
  double _maxHeight = 400.0;
  double _maxWidth = 10.0;

  final bool _restrain = true;
  final bool _fluctuating = false;
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();

    _setupBarChartValues();
    _resetSelectedDate();

    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset.roundToDouble() < 100.0) {
          _maxHeight = 400.0;
          _maxWidth = 10.0;
          _isScrolling = true;
        } else {
          if (_scrollController.offset.roundToDouble() >= 400.0) {
            _maxWidth = _scrollController.offset - 10;
          }
          _isScrolling = false;
        }
      });
    });
  }

  late DateTime _selectedDate;
  late TabController _tabController;

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  final random = Random();
  static List<Color> listColors = const [
    Color(0xffF473B9),
    Color(0xff5584AC),
    Color(0xffFFBC97),
    Color(0xffFF7777),
    Color(0xff9FE6A0),
    Color(0xffFFBD35),
    Color(0xffFF9F45),
    Color(0xffFF6363),
    Color(0xff94B3FD),
    Color(0xff96C7C1),
    Color(0xff42C2FF),
    Color(0xff676FA3),
    Color(0xffD8D9CF),
    Color(0xff27E1CE),
    Color(0xffFF98DA),
    Color(0xffFDFF8F),
    Color(0xffD8D9CF),
    Color(0xff8DED8E),
    Color(0xff00BEBED),
  ];

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  double? height;
  double? width;
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios_new_outlined)),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          AdvancedCalendar(
            controller: _calendarControllerToday,
            events: events,
            startWeekDay: 1,
            innerDot: false,
            weekLineHeight: 48.0,
          ),
          // CalendarTimeline(
          //   showYears: false,
          //   initialDate: _selectedDate,
          //   firstDate: DateTime.now(),
          //   lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          //   onDateSelected: (date) => setState(() => _selectedDate = date),
          //   leftMargin: 20,
          //   monthColor: Colors.black,
          //   dayColor: Color(0xFF704a9f),
          //   dayNameColor: Colors.white,
          //   activeDayColor: Colors.white,
          //   activeBackgroundDayColor: Color(0xFF704a9f),
          //   dotsColor: const Color(0xFF333A47),
          //   selectableDayPredicate: (date) => date.day != 23,
          //   locale: 'en',
          // ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              "Habit report",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Habitreportlist.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor()),
                                    width: width! / 2.3,
                                    height: 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          Habitreportlist[index]
                                              .Habitreporttitle,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          Habitreportlist[index]
                                              .Habitreportcount,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor()),
                                    width: width! / 2.3,
                                    height: 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Habitreportlist[index]
                                              .Habitreportcompletiontitle,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          Habitreportlist[index]
                                              .Habitreportcompletionrate,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        }))),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Statistic",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverBarChart(
                    restrain: _restrain,
                    fluctuating: _fluctuating,
                    minHeight: _minHeight,
                    maxHeight: _maxHeight,
                    maxWidth: _maxWidth,
                    barWidget: BarChartWidget(
                      maxHeight: _maxHeight,
                      minHeight: _minHeight,
                      barValues: _barValues,
                      isScrolling: _isScrolling,
                      yAxisIntervalCount: _yAxisIntervalCount,
                      xAxisTextRotationAngle: _xAxisTextRotationAngle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  void _setupBarChartValues() {
    _barValues = [
      BarChartData(
        x: 'Sun',
        y: 500.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Mon',
        y: 800.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Tue',
        y: 600.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Wed',
        y: 900.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Thu',
        y: 1000.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Fri',
        y: 700.0,
        barColor: getColor(),
      ),
      BarChartData(
        x: 'Sat',
        y: 600.0,
        barColor: getColor(),
      ),
    ];
  }
}
