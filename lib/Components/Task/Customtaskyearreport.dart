import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:range_calendar/range_calendar.dart';

class CustomTaskyearreport extends StatefulWidget {
  CustomTaskyearreport({Key? key}) : super(key: key);

  @override
  _CustomTaskyearreportState createState() => _CustomTaskyearreportState();
}

class _CustomTaskyearreportState extends State<CustomTaskyearreport> {
  final random = Random();
  static List<Color> listColors = const [
    // Color(0xffF473B9),
    // Color(0xff5584AC),
    // Color(0xffFFBC97),
    // Color(0xffFF7777),
    // Color(0xff9FE6A0),
    // Color(0xffFFBD35),
    // Color(0xffFF9F45),
    // Color(0xffFF6363),
    // Color(0xff94B3FD),
    // Color(0xff96C7C1),
    // Color(0xff42C2FF),
    // Color(0xff676FA3),
    Color(0xffD8D9CF),
    Color(0xff27E1CE),
    Color(0xffFF98DA),
    Color(0xffFDFF8F),
    Color(0xffD8D9CF),
    Color(0xff8DED8E),
    Color(0xff00BEBED),
    Color(0xffFCD2C2),
    Color(0xffC7F5FE),
    Color(0xff84DFFF),
    Color(0xffFFFCDC),
    Color(0xffA3F7BF),

    Color(0xff58DADA),
    Color(0xffC7F0DB),
    Color(0xffE8A0BF),
    Color(0xffB9BBDF),
    Color(0xffF1FEA4),
  ];

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  Map<DateTime, List<Widget>> events = {};

  List<String> listOfMonthsOfTheYear = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> listLabelWeekday = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  @override
  void initState() {
    setState(() {
      events[DateTime(2022, 9, 1)] = [
        generateWidget("Runing"),
        generateWidget("Video call"),
        generateWidget("Take greens & fruits"),
      ];
      events[DateTime(2022, 8, 2)] = [
        generateWidget("Drink 8 cupps of water"),
        generateWidget("Walking"),
        generateWidget("Workout"),
      ];
      events[DateTime(2022, 10, 2)] = [
        generateWidget("Limit caffeine intake"),
        generateWidget("Quit smoking"),
      ];
      events[DateTime(2022, 10, 5)] = [
        generateWidget("No fried food"),
      ];
      events[DateTime(2022, 11, 22)] = [
        generateWidget("Dress up"),
        generateWidget("Id Card"),
      ];
      events[DateTime(2022, 11, 5)] = [
        generateWidget("School"),
        generateWidget("Warm up"),
      ];
      events[DateTime(2022, 11, 5)] = [
        generateWidget("Gad meeting"),
      ];

      events[DateTime(2022, 12, 12)] = [
        generateWidget("Speech"),
        generateWidget("Reading"),
      ];
      events[DateTime(2022, 12, 5)] = [
        generateWidget("Design"),
        generateWidget("Habit tracker"),
        generateWidget("Api integration"),
      ];
      events[DateTime(2022, 12, 20)] = [generateWidget("Yoga")];
      events[DateTime(2022, 12, 17)] = [
        generateWidget("Figma design"),
        generateWidget("work"),
      ];
    });
    super.initState();
  }

  Widget generateWidget(String title) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventView(titleEvent: title),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: getColor()),
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(width: 25),
              CircleAvatar(
                child: Text(
                  "${title.substring(0, 1)}".toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.grey.shade200,
              ),
              SizedBox(width: 25),
              Text("$title"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Custom task report",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RangeCalendar(
              onDateSelected: (DateTime date) => null,
              onTapRange: (CalendarRangeSelected range) => null,
              events: events,
              titleListEvents: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Events report",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              colorTextSelected: Colors.blue,
              backgroundColorPointerEvent: Colors.red,
              listLabelWeekday: listLabelWeekday,
              viewYerOnMonthName: true,
              listOfMonthsOfTheYear: listOfMonthsOfTheYear,
            ),
          ],
        ),
      ),
    );
  }
}

class EventView extends StatelessWidget {
  const EventView({Key? key, required this.titleEvent}) : super(key: key);
  final String titleEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: Center(
        child: Text(
          "$titleEvent",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
