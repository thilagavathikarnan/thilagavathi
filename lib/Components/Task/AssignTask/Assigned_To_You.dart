import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';
import 'package:habittrackergad/Components/Task/Taskyearreport.dart';

import 'package:habittrackergad/Utils/Constants.dart';


class Morningtask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Weekdays;
  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;

  bool isselected = false;

  Morningtask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Morningtask> Morningtasklist = [
  Morningtask(
      Taskname: "Functionality",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
  Morningtask(
      Taskname: "Habit Tracker",
      Status: "To-do",
      Priority: "Medium",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "09:35.am   -",
      TimeScheduleTotime: "  10:55.am",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thesday"),
  Morningtask(
      Taskname: "Figma design",
      Status: "Resolved",
      Priority: "High",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "11:35.am   -",
      TimeScheduleTotime: "  11:40.am",
      AssignedTo: "Prasana",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Wednesday"),
  Morningtask(
      Taskname: "Gad Seo",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "10:35.am   -",
      TimeScheduleTotime: "  11:55.amm",
      AssignedTo: "Prabu",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thursday"),
];

class Afternoontask {
  final String Taskname;
  String Taskdescription;
  String Date;

  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;
  String Weekdays;

  bool isselected = false;

  Afternoontask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Afternoontask> Afternoontasklist = [
  Afternoontask(
      Taskname: "Api integration",
      Status: "Resolved",
      Priority: "Medium",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
  Afternoontask(
      Taskname: "Habit Tracker",
      Status: "To-do",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "09:35.am   -",
      TimeScheduleTotime: "  10:55.am",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thesday"),
  Afternoontask(
      Taskname: "Figma design",
      Status: "Resolved",
      Priority: "High",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "11:35.am   -",
      TimeScheduleTotime: "  11:40.am",
      AssignedTo: "Prasana",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Wednesday"),
  Afternoontask(
      Taskname: "Gad Seo",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "10:35.am   -",
      TimeScheduleTotime: "  11:55.amm",
      AssignedTo: "Prabu",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thursday"),
];

class Eveningtask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Weekdays;

  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;

  bool isselected = false;

  Eveningtask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Eveningtask> Eveningtasklist = [
  Eveningtask(
      Taskname: "Functionality",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
];

class Overduetask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Weekdays;

  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;

  bool isselected = false;

  Overduetask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Overduetask> Overduetasklist = [
  Overduetask(
      Taskname: "Habit tracker",
      Status: "To-do",
      Priority: "Medium",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
  Overduetask(
      Taskname: "Gad seo",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
];

class Assigned_to_you extends StatefulWidget {
  @override
  _Assigned_to_youState createState() => _Assigned_to_youState();
}

class _Assigned_to_youState extends State<Assigned_to_you>
    with TickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  bool checkBoxValue = false;

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

  Color chooseCardColor(String data) {
    switch (data) {
      case "Low":
        return const Color(0xff82AAE3);
      case 'Medium':
        return const Color(0xffFEF9A7);
      case 'High':
        return const Color(0xffFFA8A8);
      default:
        return const Color(0xffB3FFAE);
    }
  }

  double? height;
  double? width;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Taskyearreport()))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: width! - 40,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffe5d6f7),
                            Color(0xffd6c1f2),
                          ],
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Unlock the\npower of credit",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: BLACKCOLOR),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color(0xff5a00ca)),
                                      width: 120,
                                      height: 45,
                                      child: const Center(
                                        child: Text("Activate",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800,
                                                color: BUTTONTEXTCOLOR)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(UNLOCKCREDITICON)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Task Assigned to you',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    // InkWell(
                    //   onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Taskyearreport()),
                    //   ),
                    //   child: Image.asset(
                    //     BARCHARTICON,
                    //     width: 30,
                    //     height: 30,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                child: ColorfulTabBar(
                  indicatorHeight: 0,
                  unselectedHeight: 43,
                  verticalTabPadding: 3,
                  labelStyle: const TextStyle(fontSize: 16),
                  tabShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  selectedHeight: 50,
                  tabs: [
                    TabItem(
                        title: Row(children: const [
                          // Image(
                          //   image: AssetImage(MORNINGICON),
                          //   color: Colors.black,
                          //   width: 20,
                          //   height: 20,
                          //   // color: Colors.black,
                          // ),
                          // const SizedBox(width: 8),
                          Text(
                            'All task',
                            style: TextStyle(color: Color(0xff16a283)),
                          )
                        ]),
                        color: const Color(0xffd9eeea)),
                    TabItem(
                        title: Row(children: const [
                          // Image(
                          //   image: AssetImage(AFTERNOONICON),
                          //   color: Colors.black,
                          //   width: 20,
                          //   height: 20,
                          //   // color: Colors.black,
                          // ),
                          // const SizedBox(width: 8),
                          Text(
                            'Completed',
                            style: TextStyle(color: Color(0xffFFBF00)),
                          )
                        ]),
                        color: const Color(0xffFCF9BE)),
                    TabItem(
                        title: Row(children: const [
                          // Image(
                          //   image: AssetImage(EVENINGICON),
                          //   color: Colors.black,
                          //   width: 20,
                          //   height: 20,
                          //   // color: Colors.black,
                          // ),
                          // const SizedBox(width: 8),
                          Text(
                            'In progress',
                            style: TextStyle(color: Color(0xff4927c0)),
                          )
                        ]),
                        color: const Color(0xffe7e4f5)),
                    TabItem(
                        title: Row(children: const [
                          // Image(
                          //   image: AssetImage(AFTERNOONICON),
                          //   color: Colors.black,
                          //   width: 20,
                          //   height: 20,
                          //   // color: Colors.black,
                          // ),
                          // const SizedBox(width: 8),
                          Text(
                            'Overdue',
                            style: TextStyle(color: Color(0xffb82b3f)),
                          )
                        ]),
                        color: const Color(0xfff3e4e5)),
                  ],
                  controller: _tabController,
                ),
              ),
              // tab bar view here
              SizedBox(
                height: height = 330 * 4.2,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: Morningtasklist.length,
                                itemBuilder: ((context, index) {
                                  Color colorstatus;
                                  switch (Morningtasklist[index].Status) {
                                    case "In-progress":
                                      colorstatus = Colors.red;
                                      break;
                                    case "To-do":
                                      colorstatus = Colors.blue;
                                      break;
                                    case "Resolved":
                                      colorstatus = Colors.yellow;
                                      break;

                                    default:
                                      colorstatus = Colors.black;
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: ((context) =>
                                          //             Addtasknew(
                                          //               Taskname:
                                          //                   Morningtasklist[index]
                                          //                       .Taskname,
                                          //               Taskdescription:
                                          //                   Morningtasklist[index]
                                          //                       .Taskdescription,
                                          //               Date:
                                          //                   Morningtasklist[index]
                                          //                       .Date,
                                          //               Status:
                                          //                   Morningtasklist[index]
                                          //                       .Status,
                                          //               Priority:
                                          //                   Morningtasklist[index]
                                          //                       .Priority,
                                          //               Weekdays:
                                          //                   Morningtasklist[index]
                                          //                       .Weekdays,
                                          //             )))),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                ),
                                                color: Morningtasklist[index]
                                                        .isselected
                                                    ? const Color(0xFF68B984)
                                                    : chooseCardColor(
                                                        Morningtasklist[index]
                                                            .Priority)),
                                            width: width! - 30,
                                            height: 270,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        Morningtasklist[index]
                                                            .Taskname,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      InkWell(
                                                        // onTap: (() => Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: ((context) =>
                                                        //             Taskpageprogress())))),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Morningtasklist[
                                                                            index]
                                                                        .Status ==
                                                                    "In-progress"
                                                                ? Colors.blue
                                                                : Morningtasklist[index]
                                                                            .Status ==
                                                                        "To-do"
                                                                    ? Colors
                                                                        .amber
                                                                    : Morningtasklist[index]
                                                                                .Status ==
                                                                            "Resolved"
                                                                        ? Colors
                                                                            .pink
                                                                        : Colors
                                                                            .lime,
                                                          ),
                                                          width: 90,
                                                          height: 40,
                                                          child: Center(
                                                              child: Text(
                                                            Morningtasklist[
                                                                        index]
                                                                    .isselected
                                                                ? "Done"
                                                                : Morningtasklist[
                                                                        index]
                                                                    .Status,
                                                            style: const TextStyle(
                                                                color:
                                                                    BUTTONTEXTCOLOR),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    Morningtasklist[index]
                                                        .Taskdescription,
                                                    style: const TextStyle(
                                                        color: BLACKCOLOR,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Icon(
                                                  //       Icons.alarm,
                                                  //       color: BLACKCOLOR,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 10,
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleFromtime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleTotime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  // SizedBox(
                                                  //   height: 10,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                          ASSIGNTOYOU,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav Flutter",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bhive team",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .AssignedTo,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w400),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.notifications,
                                                          color: BLACKCOLOR),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bulut peker",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav royal",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .Notifiy,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w300),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today,
                                                          color: BLACKCOLOR),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        Morningtasklist[index]
                                                            .Date,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: const [
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Mon",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Wed",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Fri",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                bottomLeft:
                                                    Radius.circular(12.0)),
                                            color: Color.fromARGB(
                                                179, 208, 208, 208),
                                          ),
                                          width: width! - 30,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  Morningtasklist[index]
                                                          .isselected
                                                      ? 'Done'
                                                      : Morningtasklist[index]
                                                          .Priority,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Morningtasklist[index]
                                                          .isselected
                                                      ? const Icon(
                                                          Icons.check_box,
                                                          color: Colors.green,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.blue,
                                                        ),
                                                  onPressed: (() {
                                                    setState(() {
                                                      Morningtasklist[index]
                                                              .isselected =
                                                          !Morningtasklist[
                                                                  index]
                                                              .isselected;
                                                    });
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })))
                      ],
                    ),

                    // Completed

                    Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: Afternoontasklist.length,
                                itemBuilder: ((context, index) {
                                  Color colorstatus;
                                  switch (Afternoontasklist[index].Status) {
                                    case "In-progress":
                                      colorstatus = Colors.red;
                                      break;
                                    case "To-do":
                                      colorstatus = Colors.blue;
                                      break;
                                    case "Resolved":
                                      colorstatus = Colors.yellow;
                                      break;

                                    default:
                                      colorstatus = Colors.black;
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: ((context) =>
                                          //             Addtasknew(
                                          //               Taskname:
                                          //                   Afternoontasklist[
                                          //                           index]
                                          //                       .Taskname,
                                          //               Taskdescription:
                                          //                   Afternoontasklist[
                                          //                           index]
                                          //                       .Taskdescription,
                                          //               Date: Afternoontasklist[
                                          //                       index]
                                          //                   .Date,
                                          //               Status: Afternoontasklist[
                                          //                       index]
                                          //                   .Status,
                                          //               Priority:
                                          //                   Afternoontasklist[
                                          //                           index]
                                          //                       .Priority,
                                          //               Weekdays:
                                          //                   Afternoontasklist[
                                          //                           index]
                                          //                       .Weekdays,
                                          //             )))),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                ),
                                                color: Afternoontasklist[index]
                                                        .isselected
                                                    ? const Color(0xFF68B984)
                                                    : chooseCardColor(
                                                        Afternoontasklist[index]
                                                            .Priority)),
                                            width: width! - 30,
                                            height: 270,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        Afternoontasklist[index]
                                                            .Taskname,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      InkWell(
                                                        // onTap: (() => Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: ((context) =>
                                                        //             Taskpageprogress())))),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Afternoontasklist[
                                                                            index]
                                                                        .Status ==
                                                                    "In-progress"
                                                                ? Colors.blue
                                                                : Afternoontasklist[index]
                                                                            .Status ==
                                                                        "To-do"
                                                                    ? Colors
                                                                        .amber
                                                                    : Afternoontasklist[index]
                                                                                .Status ==
                                                                            "Resolved"
                                                                        ? Colors
                                                                            .pink
                                                                        : Colors
                                                                            .lime,
                                                          ),
                                                          width: 90,
                                                          height: 40,
                                                          child: Center(
                                                              child: Text(
                                                            Afternoontasklist[
                                                                    index]
                                                                .Status,
                                                            style: const TextStyle(
                                                                color:
                                                                    BUTTONTEXTCOLOR),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    Afternoontasklist[index]
                                                        .Taskdescription,
                                                    style: const TextStyle(
                                                        color: BLACKCOLOR,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Icon(
                                                  //       Icons.alarm,
                                                  //       color: BLACKCOLOR,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 10,
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleFromtime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleTotime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  // SizedBox(
                                                  //   height: 10,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                          ASSIGNTOYOU,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav Flutter",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bhive team",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .AssignedTo,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w400),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.notifications,
                                                          color: BLACKCOLOR),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bulut peker",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav royal",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .Notifiy,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w300),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today,
                                                          color: BLACKCOLOR),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        Afternoontasklist[index]
                                                            .Date,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: const [
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Mon",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Wed",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Fri",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                bottomLeft:
                                                    Radius.circular(12.0)),
                                            color: Color.fromARGB(
                                                179, 208, 208, 208),
                                          ),
                                          width: width! - 30,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  Afternoontasklist[index]
                                                          .isselected
                                                      ? 'Done'
                                                      : Afternoontasklist[index]
                                                          .Priority,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Afternoontasklist[index]
                                                          .isselected
                                                      ? const Icon(
                                                          Icons.check_box,
                                                          color: Colors.green,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.blue,
                                                        ),
                                                  onPressed: (() {
                                                    setState(() {
                                                      Afternoontasklist[index]
                                                              .isselected =
                                                          !Afternoontasklist[
                                                                  index]
                                                              .isselected;
                                                    });
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })))
                      ],
                    ),

                    //pending
                    Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: Eveningtasklist.length,
                                itemBuilder: ((context, index) {
                                  Color colorstatus;
                                  switch (Eveningtasklist[index].Status) {
                                    case "In-progress":
                                      colorstatus = Colors.red;
                                      break;
                                    case "To-do":
                                      colorstatus = Colors.blue;
                                      break;
                                    case "Resolved":
                                      colorstatus = Colors.yellow;
                                      break;

                                    default:
                                      colorstatus = Colors.black;
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: ((context) =>
                                          //             Addtasknew(
                                          //               Taskname:
                                          //                   Eveningtasklist[index]
                                          //                       .Taskname,
                                          //               Taskdescription:
                                          //                   Eveningtasklist[index]
                                          //                       .Taskdescription,
                                          //               Date:
                                          //                   Eveningtasklist[index]
                                          //                       .Date,
                                          //               Status:
                                          //                   Eveningtasklist[index]
                                          //                       .Status,
                                          //               Priority:
                                          //                   Eveningtasklist[index]
                                          //                       .Priority,
                                          //               Weekdays:
                                          //                   Eveningtasklist[index]
                                          //                       .Weekdays,
                                          //             )))),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                ),
                                                color: Eveningtasklist[index]
                                                        .isselected
                                                    ? const Color(0xFF68B984)
                                                    : chooseCardColor(
                                                        Eveningtasklist[index]
                                                            .Priority)),
                                            width: width! - 30,
                                            height: 270,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        Eveningtasklist[index]
                                                            .Taskname,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      InkWell(
                                                        // onTap: (() => Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder:
                                                        //             ((context) =>
                                                        //                 Taskpageprogress())))),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Eveningtasklist[
                                                                            index]
                                                                        .Status ==
                                                                    "In-progress"
                                                                ? Colors.blue
                                                                : Eveningtasklist[index]
                                                                            .Status ==
                                                                        "To-do"
                                                                    ? Colors
                                                                        .amber
                                                                    : Eveningtasklist[index]
                                                                                .Status ==
                                                                            "Resolved"
                                                                        ? Colors
                                                                            .pink
                                                                        : Colors
                                                                            .lime,
                                                          ),
                                                          width: 90,
                                                          height: 40,
                                                          child: Center(
                                                              child: Text(
                                                            Eveningtasklist[
                                                                    index]
                                                                .Status,
                                                            style: const TextStyle(
                                                                color:
                                                                    BUTTONTEXTCOLOR),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    Eveningtasklist[index]
                                                        .Taskdescription,
                                                    style: const TextStyle(
                                                        color: BLACKCOLOR,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Icon(
                                                  //       Icons.alarm,
                                                  //       color: BLACKCOLOR,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 10,
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleFromtime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleTotime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  // SizedBox(
                                                  //   height: 10,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                          ASSIGNTOYOU,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav Flutter",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bhive team",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .AssignedTo,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w400),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.notifications,
                                                          color: BLACKCOLOR),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bulut peker",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav royal",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .Notifiy,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w300),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today,
                                                          color: BLACKCOLOR),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        Eveningtasklist[index]
                                                            .Date,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: const [
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Mon",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Wed",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Fri",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                bottomLeft:
                                                    Radius.circular(12.0)),
                                            color: Color.fromARGB(
                                                179, 208, 208, 208),
                                          ),
                                          width: width! - 30,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  Eveningtasklist[index]
                                                          .isselected
                                                      ? 'Done'
                                                      : Eveningtasklist[index]
                                                          .Priority,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Eveningtasklist[index]
                                                          .isselected
                                                      ? const Icon(
                                                          Icons.check_box,
                                                          color: Colors.green,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.blue,
                                                        ),
                                                  onPressed: (() {
                                                    setState(() {
                                                      Eveningtasklist[index]
                                                              .isselected =
                                                          !Eveningtasklist[
                                                                  index]
                                                              .isselected;
                                                    });
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })))
                      ],
                    ),

                    Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: Overduetasklist.length,
                                itemBuilder: ((context, index) {
                                  Color colorstatus;
                                  switch (Overduetasklist[index].Status) {
                                    case "In-progress":
                                      colorstatus = Colors.red;
                                      break;
                                    case "To-do":
                                      colorstatus = Colors.blue;
                                      break;
                                    case "Resolved":
                                      colorstatus = Colors.yellow;
                                      break;

                                    default:
                                      colorstatus = Colors.black;
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: ((context) =>
                                          //             Addtasknew(
                                          //               Taskname:
                                          //                   Eveningtasklist[index]
                                          //                       .Taskname,
                                          //               Taskdescription:
                                          //                   Eveningtasklist[index]
                                          //                       .Taskdescription,
                                          //               Date:
                                          //                   Eveningtasklist[index]
                                          //                       .Date,
                                          //               Status:
                                          //                   Eveningtasklist[index]
                                          //                       .Status,
                                          //               Priority:
                                          //                   Eveningtasklist[index]
                                          //                       .Priority,
                                          //               Weekdays:
                                          //                   Eveningtasklist[index]
                                          //                       .Weekdays,
                                          //             )))),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                ),
                                                color: Overduetasklist[index]
                                                        .isselected
                                                    ? const Color(0xFF68B984)
                                                    : chooseCardColor(
                                                        Overduetasklist[index]
                                                            .Priority)),
                                            width: width! - 30,
                                            height: 270,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        Overduetasklist[index]
                                                            .Taskname,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      InkWell(
                                                        // onTap: (() => Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder:
                                                        //             ((context) =>
                                                        //                 Taskpageprogress())))),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Overduetasklist[
                                                                            index]
                                                                        .Status ==
                                                                    "In-progress"
                                                                ? Colors.blue
                                                                : Overduetasklist[index]
                                                                            .Status ==
                                                                        "To-do"
                                                                    ? Colors
                                                                        .amber
                                                                    : Overduetasklist[index]
                                                                                .Status ==
                                                                            "Resolved"
                                                                        ? Colors
                                                                            .pink
                                                                        : Colors
                                                                            .lime,
                                                          ),
                                                          width: 90,
                                                          height: 40,
                                                          child: Center(
                                                              child: Text(
                                                            Overduetasklist[
                                                                        index]
                                                                    .isselected
                                                                ? "Done"
                                                                : Overduetasklist[
                                                                        index]
                                                                    .Status,
                                                            style: const TextStyle(
                                                                color:
                                                                    BUTTONTEXTCOLOR),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    Overduetasklist[index]
                                                        .Taskdescription,
                                                    style: const TextStyle(
                                                        color: BLACKCOLOR,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Icon(
                                                  //       Icons.alarm,
                                                  //       color: BLACKCOLOR,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 10,
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleFromtime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //     Text(
                                                  //       Morningtasklist[index]
                                                  //           .TimeScheduleTotime,
                                                  //       style: TextStyle(
                                                  //           color: BLACKCOLOR,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight.w400),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  // SizedBox(
                                                  //   height: 10,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                          ASSIGNTOYOU,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav Flutter",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bhive team",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .AssignedTo,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w400),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.notifications,
                                                          color: BLACKCOLOR),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Bulut peker",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text:
                                                                    "Pranav royal",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape: Shape
                                                                    .Circular,
                                                                text: "Vicky b",
                                                                fontSize: 14,
                                                                numberLetters:
                                                                    2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Text(
                                                        //   Morningtasklist[index]
                                                        //       .Notifiy,
                                                        //   style: TextStyle(
                                                        //       color: BLACKCOLOR,
                                                        //       fontSize: 16,
                                                        //       fontWeight:
                                                        //           FontWeight.w300),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today,
                                                          color: BLACKCOLOR),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        Overduetasklist[index]
                                                            .Date,
                                                        style: const TextStyle(
                                                            color: BLACKCOLOR,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  // Row(
                                                  //   children: const [
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Mon",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Wed",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Thu",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 3,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 40,
                                                  //       height: 40,
                                                  //       child: CircleAvatar(
                                                  //         backgroundColor:
                                                  //             Colors.white,
                                                  //         child: Text(
                                                  //           "Fri",
                                                  //           style: TextStyle(
                                                  //               fontSize: 14,
                                                  //               color:
                                                  //                   BLACKCOLOR),
                                                  //         ),
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                bottomLeft:
                                                    Radius.circular(12.0)),
                                            color: Color.fromARGB(
                                                179, 208, 208, 208),
                                          ),
                                          width: width! - 30,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      Overduetasklist[index]
                                                              .isselected
                                                          ? 'Done'
                                                          : Overduetasklist[
                                                                  index]
                                                              .Priority,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 60),
                                                      child: index % 1 == 1
                                                          ? Container()
                                                          : Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  border: Border.all(
                                                                      color: const Color(
                                                                          0xffe94c89))),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(Overduetasklist[
                                                                            index]
                                                                        .isselected
                                                                    ? "Done"
                                                                    : "Overdue"),
                                                              ),
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  icon: Overduetasklist[index]
                                                          .isselected
                                                      ? const Icon(
                                                          Icons.check_box,
                                                          color: Colors.green,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.blue,
                                                        ),
                                                  onPressed: (() {
                                                    setState(() {
                                                      Overduetasklist[index]
                                                              .isselected =
                                                          !Overduetasklist[
                                                                  index]
                                                              .isselected;
                                                    });
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })))
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
