import 'dart:math';
import 'dart:ui';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Components/Task/Add_projects.dart';
import 'package:habittrackergad/Components/Task/Addtask.dart';
import 'package:habittrackergad/Components/Task/Allteam.dart';
import 'package:habittrackergad/Components/Task/Project_list_page.dart';

import 'package:habittrackergad/Components/Task/Taskdetails.dart';
import 'package:habittrackergad/Components/Task/projecttask/projectassignedbyyou.dart';
import 'package:habittrackergad/Components/Task/projecttask/projectassignedtoyou.dart';
import 'package:habittrackergad/Components/Task/projecttask/projectnotify.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/teamController.dart';
import 'package:habittrackergad/model/task_model.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

import 'AssignTask/Assigned_To_You.dart';
import 'AssignTask/Assigned_By_You.dart';
import 'AssignTask/Notify.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';

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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
];

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> with TickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate;
  // datepickcalender
  TextEditingController dateInput = TextEditingController();
  TeamController taskController = Get.put(TeamController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabControllernew = TabController(length: 3, vsync: this);

    dateInput.text = ""; //datepic calender
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

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

  final List AssignedToYou = ["Assigned to you"];
  final List AssignedToYouAssigned = ["Assigned"];
  final List AssignedToYouAssignedCount = ["13"];
  final List AssignedToYouCompleted = ["Completed"];
  final List AssignedToYouCompletedCount = ["8"];
  final List AssignedToYouPending = ["Pending"];
  final List AssignedToYouPendingCount = ["5"];

  final List AssignedByYou = ["Assigned by you"];
  final List AssignedByYouAssigned = ["Assigned"];
  final List AssignedByYouAssignedCount = ["6"];
  final List AssignedByYouCompleted = ["Completed"];
  final List AssignedByYouCompletedCount = ["4"];
  final List AssignedByYouPending = ["Pending"];
  final List AssignedByYouPendingCount = ["2"];

  final List Notify = ["Notify"];
  final List NotifyAssigned = ["Assigned"];
  final List NotifyAssignedCount = ["6"];
  final List NotifyCompleted = ["Completed"];
  final List NotifyCompletedCount = ["4"];
  final List NotifyPending = ["Pending"];
  final List NotifyPendingCount = ["2"];

  double? height;
  double? width;
  // datepick calender......
  List<DayInWeek> _days = [
    DayInWeek(
      "Monday",
    ),
    DayInWeek(
      "Tuesday",
    ),
    DayInWeek(
      "Wednesday",
    ),
    DayInWeek(
      "Thursday",
    ),
    DayInWeek(
      "Friday",
    ),
    DayInWeek("Saturday", isSelected: true),
    DayInWeek("Sunday", isSelected: true),
  ];

  // time to and end......
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  late TabController _tabController;
  late TabController _tabControllernew;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _tabControllernew.dispose();
  }

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff3b4682),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Addtasknew()),
        ),
        label: const Text('Add task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => Allteam()))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: getColor(),
                  ),
                  width: width! - 40,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          TEAMICON,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "All teams",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 20,
            ),
            Obx(() {
                return Container(
                  height: 300,
                  child:  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Assigned_to_you()),
                        ),
                        child: Container(
                          width: width! - 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                ASSIGNTOYOU,
                                              ),
                                            )),
                                      ),
                                    ),
                                    const Text(
                                      "Assigned to you",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Assigned",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatus.value.assigned.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatus.value.completed.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "In progress",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatus.value.inProgress.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Overdue",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatus.value.overDue.toString())),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Assigned_by_you()),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const projectassignedbyyou()),
                          // );
                        },
                        child: Container(
                          width: width! - 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                              ASSIGNTOME,
                                            ),
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    "Assigned by you",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Assigned",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusByU.value.assigned.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusByU.value.completed.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "In progress",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusByU.value.inProgress.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Overdue",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusByU.value.overDue.toString())),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const projectnotify()),
                        // ),
                        onTap:()=>Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notifypage()),
                        ),
                        child: Container(
                          width: width! - 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                NOTIFY,
                                              ),
                                            )),
                                      ),
                                    ),
                                    const Text(
                                      "Notify",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Assigned",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusNotify.value.assigned.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusNotify.value.completed.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "In progress",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusNotify.value.inProgress.toString())),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Overdue",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: getColor(),
                                      ),
                                      child:  Center(child: Text(taskController.taskStatusNotify.value.overDue.toString())),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                );
              }
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 15,
              ),
              child: Text("Today task",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            ),
            Obx(
                    () {
                      if(taskController.myTaskList.isEmpty)
                        {
                          return Container(
                            height: 300,
                            child: Center(child: Text("Task is empty")),
                          );
                        }
                      else
                        {
                          return SizedBox(
                            height: taskController.myTaskList.length * 350,
                            child: Column(
                              children: [
                                Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: taskController.myTaskList.length,
                                        itemBuilder: ((context, index) {

                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    TaskModel task = await TaskModel(
                                                      id: taskController.myTaskList[index].id,
                                                      userId: taskController.myTaskList[index].userId,
                                                      taskName: taskController.myTaskList[index].taskName,
                                                      task_owner: taskController.myTaskList[index].task_owner,
                                                      description:taskController.myTaskList[index].description,
                                                      status:taskController.myTaskList[index].status,
                                                      subTask:taskController.myTaskList[index].subTask,
                                                      priority:taskController.myTaskList[index].priority,
                                                      startDate:taskController.myTaskList[index].startDate,
                                                      endDate:taskController.myTaskList[index].endDate,
                                                      assignId: taskController.myTaskList[index].assignId,
                                                      notifyId: taskController.myTaskList[index].notifyId,
                                                      createdAt:  taskController.myTaskList[index].createdAt,
                                                      updatedAt:  taskController.myTaskList[index].updatedAt,
                                                      userName: taskController.myTaskList[index].userName,
                                                      notify_names: taskController.myTaskList[index].notify_names,
                                                    );
                                                    taskController.fetchComments(task.id);


                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                Taskpageprogress(
                                                                    task:task
                                                                ))));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.only(
                                                          topRight: Radius.circular(12.0),
                                                          topLeft: Radius.circular(12.0),
                                                        ),
                                                        color:
                                                        Morningtasklist[index].isselected
                                                            ? const Color(0xFF68B984)
                                                            : chooseCardColor(
                                                            Morningtasklist[index]
                                                                .Priority)),
                                                    width: width! - 30,
                                                    height: 260,
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
                                                              Flexible(
                                                                child: Text(
                                                                  taskController.myTaskList[index].taskName,
                                                                  maxLines: 1,
                                                                  style: const TextStyle(
                                                                    overflow: TextOverflow.ellipsis,

                                                                      color: BLACKCOLOR,
                                                                      fontSize: 24,
                                                                      fontWeight:
                                                                      FontWeight.w800),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                // onTap: (() => Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: ((context) =>
                                                                //             Taskpageprogress())
                                                                //             )
                                                                //             )
                                                                //             ),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(12),
                                                                    color: taskController.myTaskList[index].status == "In-progress"
                                                                        ? Colors.blue
                                                                        : taskController.myTaskList[index].status  == "To-do"
                                                                        ? Colors.amber
                                                                        : taskController.myTaskList[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                                  ),
                                                                  width: 90,
                                                                  height: 40,
                                                                  child: Center(
                                                                      child: Text(
                                                                        taskController.myTaskList[index].status,
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
                                                            taskController.myTaskList[index].description,
                                                            style: const TextStyle(
                                                                color: BLACKCOLOR,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w400),
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
                                                                const EdgeInsets.only(
                                                                    left: 10),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    for(int i=0;i<taskController.myTaskList[index].userName.length;i++)
                                                                    SizedBox(
                                                                      height: 35,
                                                                      width: 35,
                                                                      child: TextAvatar(
                                                                        textColor:
                                                                        Colors.white,
                                                                        shape: Shape.Circular,
                                                                        text:
                                                                        "${taskController.myTaskList[index].userName[i].firstName} ${taskController.myTaskList[index].userName[i].lastName}",
                                                                        fontSize: 14,
                                                                        numberLetters: 2,
                                                                      ),
                                                                    ),
                                                                    // const SizedBox(
                                                                    //   width: 1,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   height: 35,
                                                                    //   width: 35,
                                                                    //   child: TextAvatar(
                                                                    //     textColor:
                                                                    //     Colors.white,
                                                                    //     shape: Shape.Circular,
                                                                    //     text: "Bhive team",
                                                                    //     fontSize: 14,
                                                                    //     numberLetters: 2,
                                                                    //   ),
                                                                    // ),
                                                                    // const SizedBox(
                                                                    //   width: 1,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   height: 35,
                                                                    //   width: 35,
                                                                    //   child: TextAvatar(
                                                                    //     textColor:
                                                                    //     Colors.white,
                                                                    //     shape: Shape.Circular,
                                                                    //     text: "Vicky b",
                                                                    //     fontSize: 14,
                                                                    //     numberLetters: 2,
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(Icons.notifications,
                                                                  color: BLACKCOLOR),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.only(
                                                                    left: 10),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    for(int i=0;i<taskController.myTaskList[index].notify_names.length;i++)
                                                                      SizedBox(
                                                                        height: 35,
                                                                        width: 35,
                                                                        child: TextAvatar(
                                                                          textColor:
                                                                          Colors.white,
                                                                          shape: Shape.Circular,
                                                                          text:
                                                                          "${taskController.myTaskList[index].notify_names[i].firstName} ${taskController.myTaskList[index].notify_names[i].lastName}",
                                                                          fontSize: 14,
                                                                          numberLetters: 2,
                                                                        ),
                                                                      ),
                                                                    // const SizedBox(
                                                                    //   width: 1,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   height: 35,
                                                                    //   width: 35,
                                                                    //   child: TextAvatar(
                                                                    //     textColor:
                                                                    //     Colors.white,
                                                                    //     shape: Shape.Circular,
                                                                    //     text: "Bhive team",
                                                                    //     fontSize: 14,
                                                                    //     numberLetters: 2,
                                                                    //   ),
                                                                    // ),
                                                                    // const SizedBox(
                                                                    //   width: 1,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   height: 35,
                                                                    //   width: 35,
                                                                    //   child: TextAvatar(
                                                                    //     textColor:
                                                                    //     Colors.white,
                                                                    //     shape: Shape.Circular,
                                                                    //     text: "Vicky b",
                                                                    //     fontSize: 14,
                                                                    //     numberLetters: 2,
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(Icons.calendar_today,
                                                                  color: BLACKCOLOR),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                taskController.myTaskList[index].startDate +"  -  "+taskController.myTaskList[index].endDate,
                                                                style: const TextStyle(
                                                                    color: BLACKCOLOR,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(12.0),
                                                        bottomLeft: Radius.circular(12.0)),
                                                    color: Color.fromARGB(179, 208, 208, 208),
                                                  ),
                                                  width: width! - 30,
                                                  height: 50,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              Morningtasklist[index]
                                                                  .isselected
                                                                  ? 'Done'
                                                                  : taskController.myTaskList[index].priority,
                                                              style: const TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(
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
                                                                  EdgeInsets.all(
                                                                      8.0),
                                                                  child: Text(taskController.myTaskList[index].status == "completed"||
                                                                      Morningtasklist[index].isselected
                                                                          ? "Done"
                                                                          : "${taskController.myTaskList[index].status}"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        IconButton(
                                                          icon: Morningtasklist[index]
                                                              .isselected || taskController.myTaskList[index].status == "completed"
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
                                                              Morningtasklist[index].isselected = !Morningtasklist[index].isselected;
                                                              taskController.fetchTasks();
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
                          );
                        }

                }
            ),
            // SizedBox(
            //   height: 320 * 4.3,
            //   child: Column(
            //     children: [
            //       Expanded(
            //           child: ListView.builder(
            //               physics: const NeverScrollableScrollPhysics(),
            //               itemCount: Morningtasklist.length,
            //               itemBuilder: ((context, index) {
            //                 Color colorstatus;
            //                 switch (Morningtasklist[index].Status) {
            //                   case "In-progress":
            //                     colorstatus = Colors.red;
            //                     break;
            //                   case "To-do":
            //                     colorstatus = Colors.blue;
            //                     break;
            //                   case "Resolved":
            //                     colorstatus = Colors.yellow;
            //                     break;
            //
            //                   default:
            //                     colorstatus = Colors.black;
            //                 }
            //
            //                 return Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 10, horizontal: 20),
            //                   child: Column(
            //                     children: [
            //                       InkWell(
            //                         onTap: () => Navigator.push(
            //                             context,
            //                             MaterialPageRoute(
            //                                 builder: ((context) =>
            //                                     Taskpageprogress(
            //                                       Taskname:
            //                                           Morningtasklist[index]
            //                                               .Taskname,
            //                                       Taskdescription:
            //                                           Morningtasklist[index]
            //                                               .Taskdescription,
            //                                       Date: Morningtasklist[index]
            //                                           .Date,
            //                                       Status: Morningtasklist[index]
            //                                           .Status,
            //                                       Priority:
            //                                           Morningtasklist[index]
            //                                               .Priority,
            //                                       Weekdays:
            //                                           Morningtasklist[index]
            //                                               .Weekdays,
            //                                     )))),
            //                         child: Container(
            //                           decoration: BoxDecoration(
            //                               borderRadius: const BorderRadius.only(
            //                                 topRight: Radius.circular(12.0),
            //                                 topLeft: Radius.circular(12.0),
            //                               ),
            //                               color:
            //                                   Morningtasklist[index].isselected
            //                                       ? const Color(0xFF68B984)
            //                                       : chooseCardColor(
            //                                           Morningtasklist[index]
            //                                               .Priority)),
            //                           width: width! - 30,
            //                           height: 260,
            //                           child: Column(
            //                             crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                             children: [
            //                               Row(
            //                                 mainAxisAlignment:
            //                                 MainAxisAlignment
            //                                     .spaceBetween,
            //                                 children: [
            //                                   Text(
            //                                     Morningtasklist[index]
            //                                         .Taskname,
            //                                     style: const TextStyle(
            //                                         color: BLACKCOLOR,
            //                                         fontSize: 24,
            //                                         fontWeight:
            //                                         FontWeight.w800),
            //                                   ),
            //                                   InkWell(
            //                                     // onTap: (() => Navigator.push(
            //                                     //     context,
            //                                     //     MaterialPageRoute(
            //                                     //         builder: ((context) =>
            //                                     //             Taskpageprogress())
            //                                     //             )
            //                                     //             )
            //                                     //             ),
            //                                     child: Container(
            //                                       decoration: BoxDecoration(
            //                                         borderRadius:
            //                                         BorderRadius.circular(
            //                                             12),
            //                                         color: Morningtasklist[
            //                                         index]
            //                                             .Status ==
            //                                             "In-progress"
            //                                             ? Colors.blue
            //                                             : Morningtasklist[
            //                                         index]
            //                                             .Status ==
            //                                             "To-do"
            //                                             ? Colors.amber
            //                                             : Morningtasklist[
            //                                         index]
            //                                             .Status ==
            //                                             "Resolved"
            //                                             ? Colors.pink
            //                                             : Colors.lime,
            //                                       ),
            //                                       width: 90,
            //                                       height: 40,
            //                                       child: Center(
            //                                           child: Text(
            //                                             Morningtasklist[index]
            //                                                 .isselected
            //                                                 ? "Done"
            //                                                 : Morningtasklist[
            //                                             index]
            //                                                 .Status,
            //                                             style: const TextStyle(
            //                                                 color:
            //                                                 BUTTONTEXTCOLOR),
            //                                           )),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                               const SizedBox(
            //                                 height: 10,
            //                               ),
            //                               Text(
            //                                 Morningtasklist[index]
            //                                     .Taskdescription,
            //                                 style: const TextStyle(
            //                                     color: BLACKCOLOR,
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.w400),
            //                               ),
            //                               const SizedBox(
            //                                 height: 15,
            //                               ),
            //                               // Row(
            //                               //   children: [
            //                               //     Icon(
            //                               //       Icons.alarm,
            //                               //       color: BLACKCOLOR,
            //                               //     ),
            //                               //     SizedBox(
            //                               //       width: 10,
            //                               //     ),
            //                               //     Text(
            //                               //       Morningtasklist[index]
            //                               //           .TimeScheduleFromtime,
            //                               //       style: TextStyle(
            //                               //           color: BLACKCOLOR,
            //                               //           fontSize: 16,
            //                               //           fontWeight:
            //                               //               FontWeight.w400),
            //                               //     ),
            //                               //     Text(
            //                               //       Morningtasklist[index]
            //                               //           .TimeScheduleTotime,
            //                               //       style: TextStyle(
            //                               //           color: BLACKCOLOR,
            //                               //           fontSize: 16,
            //                               //           fontWeight:
            //                               //               FontWeight.w400),
            //                               //     ),
            //                               //   ],
            //                               // ),
            //
            //                               // SizedBox(
            //                               //   height: 10,
            //                               // ),
            //                               Row(
            //                                 children: [
            //                                   SizedBox(
            //                                     width: 25,
            //                                     height: 25,
            //                                     child: Image.asset(
            //                                       ASSIGNTOYOU,
            //                                     ),
            //                                   ),
            //                                   Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 10),
            //                                     child: Row(
            //                                       crossAxisAlignment:
            //                                       CrossAxisAlignment
            //                                           .center,
            //                                       mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .center,
            //                                       children: [
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text:
            //                                             "Pranav Flutter",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                         const SizedBox(
            //                                           width: 1,
            //                                         ),
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text: "Bhive team",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                         const SizedBox(
            //                                           width: 1,
            //                                         ),
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text: "Vicky b",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                     // Text(
            //                                     //   Morningtasklist[index]
            //                                     //       .AssignedTo,
            //                                     //   style: TextStyle(
            //                                     //       color: BLACKCOLOR,
            //                                     //       fontSize: 16,
            //                                     //       fontWeight:
            //                                     //           FontWeight.w400),
            //                                     // ),
            //                                   ),
            //                                 ],
            //                               ),
            //
            //                               const SizedBox(
            //                                 height: 15,
            //                               ),
            //                               Row(
            //                                 children: [
            //                                   const Icon(Icons.notifications,
            //                                       color: BLACKCOLOR),
            //                                   Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 10),
            //                                     child: Row(
            //                                       crossAxisAlignment:
            //                                       CrossAxisAlignment
            //                                           .center,
            //                                       mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .center,
            //                                       children: [
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text: "Bulut peker",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                         const SizedBox(
            //                                           width: 1,
            //                                         ),
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text: "Pranav royal",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                         const SizedBox(
            //                                           width: 1,
            //                                         ),
            //                                         SizedBox(
            //                                           height: 35,
            //                                           width: 35,
            //                                           child: TextAvatar(
            //                                             textColor:
            //                                             Colors.white,
            //                                             shape: Shape.Circular,
            //                                             text: "Vicky b",
            //                                             fontSize: 14,
            //                                             numberLetters: 2,
            //                                           ),
            //                                         ),
            //                                       ],
            //                                     ),
            //
            //                                     // Text(
            //                                     //   Morningtasklist[index]
            //                                     //       .Notifiy,
            //                                     //   style: TextStyle(
            //                                     //       color: BLACKCOLOR,
            //                                     //       fontSize: 16,
            //                                     //       fontWeight:
            //                                     //           FontWeight.w300),
            //                                     // ),
            //                                   ),
            //                                 ],
            //                               ),
            //                               const SizedBox(
            //                                 height: 15,
            //                               ),
            //                               Row(
            //                                 children: [
            //                                   const Icon(Icons.calendar_today,
            //                                       color: BLACKCOLOR),
            //                                   const SizedBox(
            //                                     width: 10,
            //                                   ),
            //                                   Text(
            //                                     Morningtasklist[index].Date,
            //                                     style: const TextStyle(
            //                                         color: BLACKCOLOR,
            //                                         fontSize: 16,
            //                                         fontWeight:
            //                                         FontWeight.w400),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ],
            //                           )
            //                         ),
            //                       ),
            //                       Container(
            //                         decoration: const BoxDecoration(
            //                           borderRadius: BorderRadius.only(
            //                               bottomRight: Radius.circular(12.0),
            //                               bottomLeft: Radius.circular(12.0)),
            //                           color: Color.fromARGB(179, 208, 208, 208),
            //                         ),
            //                         width: width! - 30,
            //                         height: 50,
            //                         child: Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 10, right: 10),
            //                           child: Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               Row(
            //                                 children: [
            //                                   Text(
            //                                     Morningtasklist[index]
            //                                             .isselected
            //                                         ? 'Done'
            //                                         : Morningtasklist[index]
            //                                             .Priority,
            //                                     style: const TextStyle(
            //                                       fontSize: 18,
            //                                     ),
            //                                   ),
            //                                   Padding(
            //                                     padding: const EdgeInsets.only(
            //                                         left: 60),
            //                                     child: index % 2 == 1
            //                                         ? Container()
            //                                         : Container(
            //                                             decoration: BoxDecoration(
            //                                                 borderRadius:
            //                                                     BorderRadius
            //                                                         .circular(
            //                                                             30),
            //                                                 border: Border.all(
            //                                                     color: const Color(
            //                                                         0xffe94c89))),
            //                                             child: Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                       .all(8.0),
            //                                               child: Text(
            //                                                   Morningtasklist[
            //                                                               index]
            //                                                           .isselected
            //                                                       ? "Done"
            //                                                       : "Overdue"),
            //                                             ),
            //                                           ),
            //                                   ),
            //                                 ],
            //                               ),
            //                               IconButton(
            //                                 icon: Morningtasklist[index]
            //                                         .isselected
            //                                     ? const Icon(
            //                                         Icons.check_box,
            //                                         color: Colors.green,
            //                                       )
            //                                     : const Icon(
            //                                         Icons
            //                                             .check_box_outline_blank,
            //                                         color: Colors.blue,
            //                                       ),
            //                                 onPressed: (() {
            //                                   setState(() {
            //                                     Morningtasklist[index]
            //                                             .isselected =
            //                                         !Morningtasklist[index]
            //                                             .isselected;
            //                                   });
            //                                 }),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               })))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:--";
    return "${time.hour}:${time.minute}";
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('GAD')),
          content: Container(
            height: 150,
            width: width,
            child: Column(
              children: const [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    child: Icon(Icons.check),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('You finish this task already Completed'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
