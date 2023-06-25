import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:habittrackergad/Components/Habit/Habitpage.dart';
import 'package:habittrackergad/model/habits_model.dart';

import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';
import '../../../controller/habit_controller.dart';

class Habitintrend {
  String title;
  String Subtitle;
  bool isselected = false;

  Habitintrend(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Habitintrend> Habitintrendlist = [
  Habitintrend(
      title: "Block screen time",
      Subtitle: "Lock screen and glue attention",
      isselected: false),
  Habitintrend(
      title: "Limit caffeine intake",
      Subtitle: "Replace with other healthy",
      isselected: false),
  Habitintrend(
      title: "Intermittent fasting",
      Subtitle: "Your stomach needs a little rest",
      isselected: false),
  Habitintrend(
      title: "Practice meditation",
      Subtitle: "Connect with your inner peace",
      isselected: false),
  Habitintrend(
      title: "Laugh more",
      Subtitle: "Find a moment that can make you",
      isselected: false),
  Habitintrend(
      title: "You're the best",
      Subtitle: "say it to yourself when waking up",
      isselected: false),
  Habitintrend(
      title: "Practice a hobby",
      Subtitle: "Fill your time, life won't pass you by",
      isselected: false),
  Habitintrend(
      title: "Fast clean-up",
      Subtitle: "Tidy your space in just minutes",
      isselected: false),
  Habitintrend(
      title: "Achieve your ideal weight",
      Subtitle: "You look different today",
      isselected: false),
  Habitintrend(
      title: "Give a hug",
      Subtitle: "Little distance brings us closer",
      isselected: false),
  Habitintrend(
      title: "Pets together",
      Subtitle: "Bring your pet to a fur party",
      isselected: false),
  Habitintrend(
      title: "Video call",
      Subtitle: "Face-to-face regardless of distance",
      isselected: false),
];

class Habit_in_trend extends StatefulWidget {
  @override
  final List<Habits> habit_value;
  final String title;
  final String subtitle;
  const Habit_in_trend({required this.habit_value, required this.title, required this.subtitle,});

  State<Habit_in_trend> createState() => _Habit_in_trendState();
}

class _Habit_in_trendState extends State<Habit_in_trend> {
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

  double? height;
  double? width;
  bool click = true;
  HabitController habitController = Get.put(HabitController());

  late DateTime _selectedDate;
  var selectDays;
  var slotType;
  var slots;
  bool morningSelect = false;
  bool afternoonSelect = false;
  bool eveningSelect = false;
  bool nightSelect = false;
  bool monthlySelect = false;
  bool weeklySelect = false;
  bool yearlySelect = false;

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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
             widget.title,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: BLACKCOLOR),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widget.habit_value.isEmpty?
              Container(height: 140,
              child: Center(child: Text("No habits")),):
          SizedBox(
            height: height = 100 * 13,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.habit_value.length,
                  itemBuilder: (context, index) {
                    var habitintrend = widget.habit_value[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              habitintrend.id.toString(),
                              habitintrend.name,
                              habitintrend.description,
                            ),
                          ),
                        ),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  habitintrend.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle: Text(habitintrend.description),
                              // leading: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: InkWell(
                              //       onTap: () {
                              //         setState(() {
                              //           click = !click;
                              //         });
                              //       },
                              //       child: Icon((click == false)
                              //           ? Icons.check
                              //           : Icons.check_box_outline_blank)),
                              // ),
                              // leading: IconButton(
                              //   icon: Habitintrendlist[index].isselected
                              //       ? Icon(Icons.check)
                              //       : Icon(Icons.check_box_outline_blank),
                              //   onPressed: (() {
                              //     setState(() {
                              //       if (Habitintrendlist[index].isselected) {
                              //         Habitintrendlist[index].isselected =
                              //             false;
                              //       } else {
                              //         Habitintrendlist[index].isselected = true;
                              //       }
                              //     });
                              //   }),
                              // ),
                              trailing: const Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
