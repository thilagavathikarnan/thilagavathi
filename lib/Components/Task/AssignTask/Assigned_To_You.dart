import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habittrackergad/Components/Accounts/Manual/Chart_Manual_account.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';
import 'package:habittrackergad/Components/Task/Taskyearreport.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/teamController.dart';

import '../../../model/task_model.dart';
import '../Taskdetails.dart';


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
  TeamController taskController = Get.put(TeamController());

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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ChartManualaccount(
                          account:false,
                          taskPage:"assigned_to_users"
                        )))),
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
                          padding: const EdgeInsets.all(8.0),
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
                    Obx(
                            () {
                          if(taskController.assignByTaskAll.isEmpty)
                          {
                            return Container(
                              height: 100,
                              child: Center(child: Text("Task is empty")),
                            );
                          }
                          else
                          {
                            return SizedBox(
                              // height: taskController.assignByTaskAll.length * 350,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: taskController.assignByTaskAll.length,
                                  itemBuilder: ((context, index) {


                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              TaskModel task = await TaskModel(
                                                id: taskController.assignByTaskAll[index].id,
                                                userId: taskController.assignByTaskAll[index].userId,
                                                taskName: taskController.assignByTaskAll[index].taskName,
                                                task_owner: taskController.assignByTaskAll[index].task_owner,
                                                description:taskController.assignByTaskAll[index].description,
                                                status:taskController.assignByTaskAll[index].status,
                                                subTask:taskController.assignByTaskAll[index].subTask,
                                                priority:taskController.assignByTaskAll[index].priority,
                                                startDate:taskController.assignByTaskAll[index].startDate,
                                                endDate:taskController.assignByTaskAll[index].endDate,
                                                assignId: taskController.assignByTaskAll[index].assignId,
                                                notifyId: taskController.assignByTaskAll[index].notifyId,
                                                createdAt:  taskController.assignByTaskAll[index].createdAt,
                                                updatedAt:  taskController.assignByTaskAll[index].updatedAt,
                                                userName: taskController.assignByTaskAll[index].userName,
                                                notify_names: taskController.assignByTaskAll[index].notify_names,
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
                                                  color: Color(0xFF68B984),
                                              ),
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
                                                            taskController.assignByTaskAll[index].taskName,
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
                                                              color: taskController.assignByTaskAll[index].status == "In-progress"
                                                                  ? Colors.blue
                                                                  : taskController.assignByTaskAll[index].status  == "To-do"
                                                                  ? Colors.amber
                                                                  : taskController.assignByTaskAll[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                            ),
                                                            width: 90,
                                                            height: 40,
                                                            child: Center(
                                                                child: Text(taskController.assignByTaskAll[index].status,
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
                                                      taskController.assignByTaskAll[index].description,
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
                                                              for(int i=0;i<taskController.assignByTaskAll[index].userName.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskAll[index].userName[i].firstName} ${taskController.assignByTaskAll[index].userName[i].lastName}",
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
                                                              for(int i=0;i<taskController.assignByTaskAll[index].notify_names.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskAll[index].notify_names[i].firstName} ${taskController.assignByTaskAll[index].notify_names[i].lastName}",
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
                                                          taskController.assignByTaskAll[index].startDate +"  -  "+taskController.assignByTaskAll[index].endDate,
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
                                                    taskController.assignByTaskAll[index].priority,
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
                                                            child: Text(
                                                                taskController.assignByTaskAll[index].status),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    // icon:  taskController.assignByTaskAll[index].status == "Completed"
                                                    //     ? const Icon(
                                                    //   Icons.check_box,
                                                    //   color: Colors.green,
                                                    // )
                                                    //     : const Icon(
                                                    //   Icons. check_box_outline_blank,
                                                    //   color: Colors.blue,
                                                    // ),
                                                    icon: taskController.assignByTaskAll[index].status == "completed" ?
                                                    Icon(
                                                      Icons.check_box,
                                                      color: Colors.green,
                                                    )
                                                        :  Icon(
                                                      Icons.check_box_outline_blank,
                                                      color: Colors.blue,
                                                    ),
                                                    onPressed: (() {
                                                      setState(() {
                                                        Morningtasklist[index]
                                                            .isselected =
                                                        !Morningtasklist[index]
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
                                  })),
                            );
                          }

                        }
                    ),

                    Obx(
                            () {
                          if(taskController.assignByTaskCompleted.isEmpty)
                          {
                            return Container(
                              height: 100,
                              child: Center(child: Text("Task is empty")),
                            );
                          }
                          else
                          {
                            return SizedBox(
                              // height: taskController.assignByTaskCompleted.length * 350,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: taskController.assignByTaskCompleted.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              TaskModel task = await TaskModel(
                                                id: taskController.assignByTaskCompleted[index].id,
                                                userId: taskController.assignByTaskCompleted[index].userId,
                                                taskName: taskController.assignByTaskCompleted[index].taskName,
                                                task_owner: taskController.assignByTaskCompleted[index].task_owner,
                                                description:taskController.assignByTaskCompleted[index].description,
                                                status:taskController.assignByTaskCompleted[index].status,
                                                subTask:taskController.assignByTaskCompleted[index].subTask,
                                                priority:taskController.assignByTaskCompleted[index].priority,
                                                startDate:taskController.assignByTaskCompleted[index].startDate,
                                                endDate:taskController.assignByTaskCompleted[index].endDate,
                                                assignId: taskController.assignByTaskCompleted[index].assignId,
                                                notifyId: taskController.assignByTaskCompleted[index].notifyId,
                                                createdAt:  taskController.assignByTaskCompleted[index].createdAt,
                                                updatedAt:  taskController.assignByTaskCompleted[index].updatedAt,
                                                userName: taskController.assignByTaskCompleted[index].userName,
                                                notify_names: taskController.assignByTaskCompleted[index].notify_names,
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
                                                  taskController.assignByTaskCompleted[index].status == "completed"
                                                  ?  Color(0xFF68B984)
                                                      : Colors.white),
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
                                                            taskController.assignByTaskCompleted[index].taskName,
                                                            maxLines: 1,
                                                            style: const TextStyle(
                                                                overflow: TextOverflow.ellipsis,

                                                                color: BLACKCOLOR,
                                                                fontSize: 24,
                                                                fontWeight:
                                                                FontWeight.w800),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(12),
                                                            color: taskController.assignByTaskCompleted[index].status == "In-progress"
                                                                ? Colors.blue
                                                                : taskController.assignByTaskCompleted[index].status  == "To-do"
                                                                ? Colors.amber
                                                                : taskController.assignByTaskCompleted[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                          ),
                                                          width: 90,
                                                          height: 40,
                                                          child: Center(
                                                              child: Text(taskController.assignByTaskCompleted[index].status,
                                                                style: const TextStyle(
                                                                    color:
                                                                    BUTTONTEXTCOLOR),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      taskController.assignByTaskCompleted[index].description,
                                                      style: const TextStyle(
                                                          color: BLACKCOLOR,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
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
                                                              for(int i=0;i<taskController.assignByTaskCompleted[index].userName.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskCompleted[index].userName[i].firstName} ${taskController.assignByTaskCompleted[index].userName[i].lastName}",
                                                                    fontSize: 14,
                                                                    numberLetters: 2,
                                                                  ),
                                                                ),
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
                                                              for(int i=0;i<taskController.assignByTaskCompleted[index].notify_names.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskCompleted[index].notify_names[i].firstName} ${taskController.assignByTaskCompleted[index].notify_names[i].lastName}",
                                                                    fontSize: 14,
                                                                    numberLetters: 2,
                                                                  ),
                                                                ),
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
                                                          taskController.assignByTaskCompleted[index].startDate +"  -  "+taskController.assignByTaskCompleted[index].endDate,
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
                                                      Text(taskController.assignByTaskCompleted[index].priority,
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
                                                            child: Text(taskController.assignByTaskCompleted[index].status),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    icon: taskController.assignByTaskCompleted[index].status == "completed" ?
                                                    Icon(
                                                      Icons.check_box,
                                                      color: Colors.green,
                                                    )
                                                        :  Icon(
                                                      Icons.check_box_outline_blank,
                                                      color: Colors.blue,
                                                    ),
                                                    onPressed: (() {
                                                      setState(() {
                                                        // Morningtasklist[index]
                                                        //     .isselected =
                                                        // !Morningtasklist[index]
                                                        //     .isselected;
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
                                  })),
                            );
                          }

                        }
                    ),

                    Obx(
                            () {
                          if(taskController.assignByTaskInprogress.isEmpty)
                          {
                            return Container(
                              height: 300,
                              child: Center(child: Text("Task is empty")),
                            );
                          }
                          else
                          {
                            return SizedBox(
                              height: taskController.assignByTaskInprogress.length * 350,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: taskController.assignByTaskInprogress.length,
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
                                                    onTap: () async {
                                                      TaskModel task = await TaskModel(
                                                        id: taskController.assignByTaskInprogress[index].id,
                                                        userId: taskController.assignByTaskInprogress[index].userId,
                                                        taskName: taskController.assignByTaskInprogress[index].taskName,
                                                        task_owner: taskController.assignByTaskInprogress[index].task_owner,
                                                        description:taskController.assignByTaskInprogress[index].description,
                                                        status:taskController.assignByTaskInprogress[index].status,
                                                        subTask:taskController.assignByTaskInprogress[index].subTask,
                                                        priority:taskController.assignByTaskInprogress[index].priority,
                                                        startDate:taskController.assignByTaskInprogress[index].startDate,
                                                        endDate:taskController.assignByTaskInprogress[index].endDate,
                                                        assignId: taskController.assignByTaskInprogress[index].assignId,
                                                        notifyId: taskController.assignByTaskInprogress[index].notifyId,
                                                        createdAt:  taskController.assignByTaskInprogress[index].createdAt,
                                                        updatedAt:  taskController.assignByTaskInprogress[index].updatedAt,
                                                        userName: taskController.assignByTaskInprogress[index].userName,
                                                        notify_names: taskController.assignByTaskInprogress[index].notify_names,
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
                                                                    taskController.assignByTaskInprogress[index].taskName,
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
                                                                      color: taskController.assignByTaskInprogress[index].status == "In-progress"
                                                                          ? Colors.blue
                                                                          : taskController.assignByTaskInprogress[index].status  == "To-do"
                                                                          ? Colors.amber
                                                                          : taskController.assignByTaskInprogress[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                                    ),
                                                                    width: 90,
                                                                    height: 40,
                                                                    child: Center(
                                                                        child: Text(
                                                                          taskController.assignByTaskInprogress[index].status,
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
                                                              taskController.assignByTaskInprogress[index].description,
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
                                                                      for(int i=0;i<taskController.assignByTaskInprogress[index].userName.length;i++)
                                                                        SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: TextAvatar(
                                                                            textColor:
                                                                            Colors.white,
                                                                            shape: Shape.Circular,
                                                                            text:
                                                                            "${taskController.assignByTaskInprogress[index].userName[i].firstName} ${taskController.assignByTaskInprogress[index].userName[i].lastName}",
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
                                                                      for(int i=0;i<taskController.assignByTaskInprogress[index].notify_names.length;i++)
                                                                        SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: TextAvatar(
                                                                            textColor:
                                                                            Colors.white,
                                                                            shape: Shape.Circular,
                                                                            text:
                                                                            "${taskController.assignByTaskInprogress[index].notify_names[i].firstName} ${taskController.assignByTaskInprogress[index].notify_names[i].lastName}",
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
                                                                  taskController.assignByTaskInprogress[index].startDate +"  -  "+taskController.assignByTaskInprogress[index].endDate,
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
                                                                    : taskController.assignByTaskInprogress[index].priority,
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
                                                                    child: Text(
                                                                        Morningtasklist[
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
                                                                !Morningtasklist[index]
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
                            );
                          }

                        }
                    ),

                    Obx(
                            () {
                          if(taskController.assignByTaskOverDue.isEmpty)
                          {
                            return Container(
                              height: 300,
                              child: Center(child: Text("Task is empty")),
                            );
                          }
                          else
                          {
                            return SizedBox(
                              // height: taskController.assignByTaskOverDue.length * 350,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: taskController.assignByTaskOverDue.length,
                                  itemBuilder: ((context, index) {


                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              TaskModel task = await TaskModel(
                                                id: taskController.assignByTaskOverDue[index].id,
                                                userId: taskController.assignByTaskOverDue[index].userId,
                                                taskName: taskController.assignByTaskOverDue[index].taskName,
                                                task_owner: taskController.assignByTaskOverDue[index].task_owner,
                                                description:taskController.assignByTaskOverDue[index].description,
                                                status:taskController.assignByTaskOverDue[index].status,
                                                subTask:taskController.assignByTaskOverDue[index].subTask,
                                                priority:taskController.assignByTaskOverDue[index].priority,
                                                startDate:taskController.assignByTaskOverDue[index].startDate,
                                                endDate:taskController.assignByTaskOverDue[index].endDate,
                                                assignId: taskController.assignByTaskOverDue[index].assignId,
                                                notifyId: taskController.assignByTaskOverDue[index].notifyId,
                                                createdAt:  taskController.assignByTaskOverDue[index].createdAt,
                                                updatedAt:  taskController.assignByTaskOverDue[index].updatedAt,
                                                userName: taskController.assignByTaskOverDue[index].userName,
                                                notify_names: taskController.assignByTaskOverDue[index].notify_names,
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
                                                  taskController.assignByTaskOverDue[index].status == "completed"?
                                                  Color(0xFF68B984)
                                                      :Colors.white
                                              ),
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
                                                            taskController.assignByTaskOverDue[index].taskName,
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
                                                              color: taskController.assignByTaskOverDue[index].status == "In-progress"
                                                                  ? Colors.blue
                                                                  : taskController.assignByTaskOverDue[index].status  == "To-do"
                                                                  ? Colors.amber
                                                                  : taskController.assignByTaskOverDue[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                            ),
                                                            width: 90,
                                                            height: 40,
                                                            child: Center(
                                                                child: Text(
                                                                  taskController.assignByTaskOverDue[index].status,
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
                                                      taskController.assignByTaskOverDue[index].description,
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
                                                              for(int i=0;i<taskController.assignByTaskOverDue[index].userName.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskOverDue[index].userName[i].firstName} ${taskController.assignByTaskOverDue[index].userName[i].lastName}",
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
                                                              for(int i=0;i<taskController.assignByTaskOverDue[index].notify_names.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.assignByTaskOverDue[index].notify_names[i].firstName} ${taskController.assignByTaskOverDue[index].notify_names[i].lastName}",
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
                                                          taskController.assignByTaskOverDue[index].startDate +"  -  "+taskController.assignByTaskOverDue[index].endDate,
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
                                                 taskController.assignByTaskOverDue[index].priority,
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
                                                            child: Text(
                                                              taskController.assignByTaskOverDue[index].status
                                                              ,),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    icon: taskController.assignByTaskOverDue[index].status == "completed"
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
                                                        !Morningtasklist[index]
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
                                  })),
                            );
                          }

                        }
                    )
                  ],
                ),
              ),
            ])));
  }
}
