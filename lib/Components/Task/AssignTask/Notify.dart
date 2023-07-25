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
import 'package:habittrackergad/Components/Task/Taskdetails.dart';
import 'package:habittrackergad/Components/Task/Taskyearreport.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/teamController.dart';

import '../../../model/task_model.dart';

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

class Notifypage extends StatefulWidget {
  @override
  _NotifypageState createState() => _NotifypageState();
}

class _NotifypageState extends State<Notifypage> with TickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate;
  late TabController _tabController;
  TeamController taskController = Get.put(TeamController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);

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
                        builder: ((context) => ChartManualaccount(
                            account:false,
                            taskPage:"assigned_notify_users"
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
                  children: const [
                    Text(
                      'Notify',
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
                    // TabItem(
                    //     title: Row(children: const [
                    //       // Image(
                    //       //   image: AssetImage(AFTERNOONICON),
                    //       //   color: Colors.black,
                    //       //   width: 20,
                    //       //   height: 20,
                    //       //   // color: Colors.black,
                    //       // ),
                    //       // const SizedBox(width: 8),
                    //       Text(
                    //         'Completed',
                    //         style: TextStyle(color: Color(0xffFFBF00)),
                    //       )
                    //     ]),
                    //     color: const Color(0xffFCF9BE)),
                    // TabItem(
                    //     title: Row(children: const [
                    //       // Image(
                    //       //   image: AssetImage(EVENINGICON),
                    //       //   color: Colors.black,
                    //       //   width: 20,
                    //       //   height: 20,
                    //       //   // color: Colors.black,
                    //       // ),
                    //       // const SizedBox(width: 8),
                    //       Text(
                    //         'In progress',
                    //         style: TextStyle(color: Color(0xff4927c0)),
                    //       )
                    //     ]),
                    //     color: const Color(0xffe7e4f5)),
                    // TabItem(
                    //     title: Row(children: const [
                    //       // Image(
                    //       //   image: AssetImage(AFTERNOONICON),
                    //       //   color: Colors.black,
                    //       //   width: 20,
                    //       //   height: 20,
                    //       //   // color: Colors.black,
                    //       // ),
                    //       // const SizedBox(width: 8),
                    //       Text(
                    //         'Overdue',
                    //         style: TextStyle(color: Color(0xffb82b3f)),
                    //       )
                    //     ]),
                    //     color: const Color(0xfff3e4e5)),
                  ],
                  controller: _tabController,
                ),
              ),
              // tab bar view here
              SizedBox(
                height: taskController.myNotifyTaskList.length ==0? 400: taskController.myNotifyTaskList.length * 350,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Obx(() {
                          if(taskController.myNotifyTaskList.isEmpty)
                          {
                            return Container(
                              height: 350,
                              child: Center(child: Text("Task is empty")),
                            );
                          }
                          else
                          {
                            return SizedBox(
                              height: taskController.myNotifyTaskList.length * 350,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:  taskController.myNotifyTaskList.length,
                                  itemBuilder: ((context, index) {


                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              TaskModel task = await TaskModel(
                                                id: taskController.myNotifyTaskList[index].id,
                                                userId: taskController.myNotifyTaskList[index].userId,
                                                taskName: taskController.myNotifyTaskList[index].taskName,
                                                task_owner: taskController.myNotifyTaskList[index].task_owner,
                                                description:taskController.myNotifyTaskList[index].description,
                                                status:taskController.myNotifyTaskList[index].status,
                                                subTask:taskController.myNotifyTaskList[index].subTask,
                                                projectId:taskController.myNotifyTaskList[index].projectId,
                                                projectName:taskController.myNotifyTaskList[index].projectName,
                                                priority:taskController.myNotifyTaskList[index].priority,
                                                startDate:taskController.myNotifyTaskList[index].startDate,
                                                endDate:taskController.myNotifyTaskList[index].endDate,
                                                assignId: taskController.myNotifyTaskList[index].assignId,
                                                notifyId: taskController.myNotifyTaskList[index].notifyId,
                                                createdAt:  taskController.myNotifyTaskList[index].createdAt,
                                                updatedAt:  taskController.myNotifyTaskList[index].updatedAt,
                                                userName: taskController.myNotifyTaskList[index].userName,
                                                notify_names: taskController.myNotifyTaskList[index].notify_names,
                                              );
                                              taskController.fetchComments(task.id);


                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          Taskpageprogress(
                                                              task:task,
                                                              taskPage: "Notify_by_you",
                                                          ))));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(12.0),
                                                    topLeft: Radius.circular(12.0),
                                                  ),
                                                  color:
                                                  taskController.myNotifyTaskList[index].status == "completed"
                                                      ? const Color(0xFF68B984)
                                                      : chooseCardColor(
                                                      taskController.myNotifyTaskList[index].priority)),
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
                                                            taskController.myNotifyTaskList[index].taskName,
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
                                                              color: taskController.myNotifyTaskList[index].status == "In-progress"
                                                                  ? Colors.blue
                                                                  : taskController.myNotifyTaskList[index].status  == "To-do"
                                                                  ? Colors.amber
                                                                  : taskController.myNotifyTaskList[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                            ),
                                                            width: 90,
                                                            height: 40,
                                                            child: Center(
                                                                child: Text(
                                                                  taskController.myNotifyTaskList[index].status,
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
                                                      taskController.myNotifyTaskList[index].description,
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
                                                              for(int i=0;i<taskController.myNotifyTaskList[index].userName.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.myNotifyTaskList[index].userName[i].firstName} ${taskController.myNotifyTaskList[index].userName[i].lastName}",
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
                                                              for(int i=0;i<taskController.myNotifyTaskList[index].notify_names.length;i++)
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 35,
                                                                  child: TextAvatar(
                                                                    textColor:
                                                                    Colors.white,
                                                                    shape: Shape.Circular,
                                                                    text:
                                                                    "${taskController.myNotifyTaskList[index].notify_names[i].firstName} ${taskController.myNotifyTaskList[index].notify_names[i].lastName}",
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
                                                          taskController.myNotifyTaskList[index].startDate +"  -  "+taskController.myNotifyTaskList[index].endDate,
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
                                                     taskController.myNotifyTaskList[index].priority,
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
                                                                taskController.myNotifyTaskList[index].status),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // IconButton(
                                                  //   icon: Morningtasklist[index]
                                                  //       .isselected
                                                  //       ? const Icon(
                                                  //     Icons.check_box,
                                                  //     color: Colors.green,
                                                  //   )
                                                  //       : const Icon(
                                                  //     Icons
                                                  //         .check_box_outline_blank,
                                                  //     color: Colors.blue,
                                                  //   ),
                                                  //   onPressed: (() {
                                                  //     setState(() {
                                                  //       Morningtasklist[index]
                                                  //           .isselected =
                                                  //       !Morningtasklist[index]
                                                  //           .isselected;
                                                  //     });
                                                  //   }),
                                                  // ),
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
                    // Column(
                    //   children: [
                    //     Obx(() {
                    //       if(taskController.notifyCompleted.isEmpty)
                    //       {
                    //         return Container(
                    //           height: 350,
                    //           child: Center(child: Text("Task is empty")),
                    //         );
                    //       }
                    //       else
                    //       {
                    //         return SizedBox(
                    //           height: taskController.notifyCompleted.length * 350,
                    //           child: Column(
                    //             children: [
                    //               Expanded(
                    //                   child: ListView.builder(
                    //                       shrinkWrap: true,
                    //                       physics: const NeverScrollableScrollPhysics(),
                    //                       itemCount:  taskController.notifyCompleted.length,
                    //                       itemBuilder: ((context, index) {
                    //
                    //
                    //                         return Padding(
                    //                           padding: const EdgeInsets.symmetric(
                    //                               vertical: 10, horizontal: 20),
                    //                           child: Column(
                    //                             children: [
                    //                               InkWell(
                    //                                 onTap: () async {
                    //                                   TaskModel task = await TaskModel(
                    //                                     id: taskController.notifyCompleted[index].id,
                    //                                     userId: taskController.notifyCompleted[index].userId,
                    //                                     taskName: taskController.notifyCompleted[index].taskName,
                    //                                     task_owner: taskController.notifyCompleted[index].task_owner,
                    //                                     description:taskController.notifyCompleted[index].description,
                    //                                     status:taskController.notifyCompleted[index].status,
                    //                                     subTask:taskController.notifyCompleted[index].subTask,
                    //                                     priority:taskController.notifyCompleted[index].priority,
                    //                                     startDate:taskController.notifyCompleted[index].startDate,
                    //                                     endDate:taskController.notifyCompleted[index].endDate,
                    //                                     assignId: taskController.notifyCompleted[index].assignId,
                    //                                     notifyId: taskController.notifyCompleted[index].notifyId,
                    //                                     createdAt:  taskController.notifyCompleted[index].createdAt,
                    //                                     updatedAt:  taskController.notifyCompleted[index].updatedAt,
                    //                                     userName: taskController.notifyCompleted[index].userName,
                    //                                     notify_names: taskController.notifyCompleted[index].notify_names,
                    //                                   );
                    //                                   taskController.fetchComments(task.id);
                    //
                    //
                    //                                   Navigator.push(
                    //                                       context,
                    //                                       MaterialPageRoute(
                    //                                           builder: ((context) =>
                    //                                               Taskpageprogress(
                    //                                                   task:task
                    //                                               ))));
                    //                                 },
                    //                                 child: Container(
                    //                                   decoration: BoxDecoration(
                    //                                       borderRadius: const BorderRadius.only(
                    //                                         topRight: Radius.circular(12.0),
                    //                                         topLeft: Radius.circular(12.0),
                    //                                       ),
                    //                                       color:
                    //                                       Morningtasklist[index].isselected
                    //                                           ? const Color(0xFF68B984)
                    //                                           : chooseCardColor(
                    //                                           Morningtasklist[index]
                    //                                               .Priority)),
                    //                                   width: width! - 30,
                    //                                   height: 260,
                    //                                   child: Padding(
                    //                                     padding: const EdgeInsets.only(
                    //                                         left: 20, top: 10, right: 20),
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                       CrossAxisAlignment.start,
                    //                                       children: [
                    //                                         Row(
                    //                                           mainAxisAlignment:
                    //                                           MainAxisAlignment
                    //                                               .spaceBetween,
                    //                                           children: [
                    //                                             Flexible(
                    //                                               child: Text(
                    //                                                 taskController.notifyCompleted[index].taskName,
                    //                                                 maxLines: 1,
                    //                                                 style: const TextStyle(
                    //                                                     overflow: TextOverflow.ellipsis,
                    //
                    //                                                     color: BLACKCOLOR,
                    //                                                     fontSize: 24,
                    //                                                     fontWeight:
                    //                                                     FontWeight.w800),
                    //                                               ),
                    //                                             ),
                    //                                             InkWell(
                    //                                               // onTap: (() => Navigator.push(
                    //                                               //     context,
                    //                                               //     MaterialPageRoute(
                    //                                               //         builder: ((context) =>
                    //                                               //             Taskpageprogress())
                    //                                               //             )
                    //                                               //             )
                    //                                               //             ),
                    //                                               child: Container(
                    //                                                 decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius.circular(12),
                    //                                                   color: taskController.notifyCompleted[index].status == "In-progress"
                    //                                                       ? Colors.blue
                    //                                                       : taskController.notifyCompleted[index].status  == "To-do"
                    //                                                       ? Colors.amber
                    //                                                       : taskController.notifyCompleted[index].status == "Resolved" ? Colors.pink : Colors.lime,
                    //                                                 ),
                    //                                                 width: 90,
                    //                                                 height: 40,
                    //                                                 child: Center(
                    //                                                     child: Text(
                    //                                                       taskController.notifyCompleted[index].status,
                    //                                                       style: const TextStyle(
                    //                                                           color:
                    //                                                           BUTTONTEXTCOLOR),
                    //                                                     )),
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 10,
                    //                                         ),
                    //                                         Text(
                    //                                           taskController.notifyCompleted[index].description,
                    //                                           style: const TextStyle(
                    //                                               color: BLACKCOLOR,
                    //                                               fontSize: 18,
                    //                                               fontWeight: FontWeight.w400),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         // Row(
                    //                                         //   children: [
                    //                                         //     Icon(
                    //                                         //       Icons.alarm,
                    //                                         //       color: BLACKCOLOR,
                    //                                         //     ),
                    //                                         //     SizedBox(
                    //                                         //       width: 10,
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleFromtime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleTotime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //   ],
                    //                                         // ),
                    //
                    //                                         // SizedBox(
                    //                                         //   height: 10,
                    //                                         // ),
                    //                                         Row(
                    //                                           children: [
                    //                                             SizedBox(
                    //                                               width: 25,
                    //                                               height: 25,
                    //                                               child: Image.asset(
                    //                                                 ASSIGNTOYOU,
                    //                                               ),
                    //                                             ),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyCompleted[index].userName.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyCompleted[index].userName[i].firstName} ${taskController.myNotifyTaskList[index].userName[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.notifications,
                    //                                                 color: BLACKCOLOR),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyCompleted[index].notify_names.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyCompleted[index].notify_names[i].firstName} ${taskController.notifyCompleted[index].notify_names[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.calendar_today,
                    //                                                 color: BLACKCOLOR),
                    //                                             const SizedBox(
                    //                                               width: 10,
                    //                                             ),
                    //                                             Text(
                    //                                               taskController.notifyCompleted[index].startDate +"  -  "+taskController.notifyCompleted[index].endDate,
                    //                                               style: const TextStyle(
                    //                                                   color: BLACKCOLOR,
                    //                                                   fontSize: 16,
                    //                                                   fontWeight:
                    //                                                   FontWeight.w400),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 decoration: const BoxDecoration(
                    //                                   borderRadius: BorderRadius.only(
                    //                                       bottomRight: Radius.circular(12.0),
                    //                                       bottomLeft: Radius.circular(12.0)),
                    //                                   color: Color.fromARGB(179, 208, 208, 208),
                    //                                 ),
                    //                                 width: width! - 30,
                    //                                 height: 50,
                    //                                 child: Padding(
                    //                                   padding: const EdgeInsets.only(
                    //                                       left: 10, right: 10),
                    //                                   child: Row(
                    //                                     mainAxisAlignment:
                    //                                     MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Row(
                    //                                         children: [
                    //                                           Text(
                    //                                             Morningtasklist[index]
                    //                                                 .isselected
                    //                                                 ? 'Done'
                    //                                                 : taskController.notifyCompleted[index].priority,
                    //                                             style: const TextStyle(
                    //                                               fontSize: 18,
                    //                                             ),
                    //                                           ),
                    //                                           Padding(
                    //                                             padding: const EdgeInsets.only(
                    //                                                 left: 60),
                    //                                             child: index % 1 == 1
                    //                                                 ? Container()
                    //                                                 : Container(
                    //                                               decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(
                    //                                                       30),
                    //                                                   border: Border.all(
                    //                                                       color: const Color(
                    //                                                           0xffe94c89))),
                    //                                               child: Padding(
                    //                                                 padding:
                    //                                                 EdgeInsets.all(
                    //                                                     8.0),
                    //                                                 child: Text(
                    //                                                     Morningtasklist[
                    //                                                     index]
                    //                                                         .isselected
                    //                                                         ? "Done"
                    //                                                         : "Overdue"),
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                       IconButton(
                    //                                         icon: Morningtasklist[index]
                    //                                             .isselected
                    //                                             ? const Icon(
                    //                                           Icons.check_box,
                    //                                           color: Colors.green,
                    //                                         )
                    //                                             : const Icon(
                    //                                           Icons
                    //                                               .check_box_outline_blank,
                    //                                           color: Colors.blue,
                    //                                         ),
                    //                                         onPressed: (() {
                    //                                           setState(() {
                    //                                             Morningtasklist[index]
                    //                                                 .isselected =
                    //                                             !Morningtasklist[index]
                    //                                                 .isselected;
                    //                                           });
                    //                                         }),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       })))
                    //             ],
                    //           ),
                    //         );
                    //       }
                    //
                    //     }
                    //     ),
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Obx(() {
                    //       if(taskController.notifyInprogress.isEmpty)
                    //       {
                    //         return Container(
                    //           height: 350,
                    //           child: Center(child: Text("Task is empty")),
                    //         );
                    //       }
                    //       else
                    //       {
                    //         return SizedBox(
                    //           height: taskController.notifyInprogress.length * 350,
                    //           child: Column(
                    //             children: [
                    //               Expanded(
                    //                   child: ListView.builder(
                    //                       shrinkWrap: true,
                    //                       physics: const NeverScrollableScrollPhysics(),
                    //                       itemCount:  taskController.notifyInprogress.length,
                    //                       itemBuilder: ((context, index) {
                    //
                    //
                    //                         return Padding(
                    //                           padding: const EdgeInsets.symmetric(
                    //                               vertical: 10, horizontal: 20),
                    //                           child: Column(
                    //                             children: [
                    //                               InkWell(
                    //                                 onTap: () async {
                    //                                   TaskModel task = await TaskModel(
                    //                                     id: taskController.notifyInprogress[index].id,
                    //                                     userId: taskController.notifyInprogress[index].userId,
                    //                                     taskName: taskController.notifyInprogress[index].taskName,
                    //                                     task_owner: taskController.notifyInprogress[index].task_owner,
                    //                                     description:taskController.notifyInprogress[index].description,
                    //                                     status:taskController.notifyInprogress[index].status,
                    //                                     subTask:taskController.notifyInprogress[index].subTask,
                    //                                     priority:taskController.notifyInprogress[index].priority,
                    //                                     startDate:taskController.notifyInprogress[index].startDate,
                    //                                     endDate:taskController.notifyInprogress[index].endDate,
                    //                                     assignId: taskController.notifyInprogress[index].assignId,
                    //                                     notifyId: taskController.notifyInprogress[index].notifyId,
                    //                                     createdAt:  taskController.notifyInprogress[index].createdAt,
                    //                                     updatedAt:  taskController.notifyInprogress[index].updatedAt,
                    //                                     userName: taskController.notifyInprogress[index].userName,
                    //                                     notify_names: taskController.notifyInprogress[index].notify_names,
                    //                                   );
                    //                                   taskController.fetchComments(task.id);
                    //
                    //
                    //                                   Navigator.push(
                    //                                       context,
                    //                                       MaterialPageRoute(
                    //                                           builder: ((context) =>
                    //                                               Taskpageprogress(
                    //                                                   task:task
                    //                                               ))));
                    //                                 },
                    //                                 child: Container(
                    //                                   decoration: BoxDecoration(
                    //                                       borderRadius: const BorderRadius.only(
                    //                                         topRight: Radius.circular(12.0),
                    //                                         topLeft: Radius.circular(12.0),
                    //                                       ),
                    //                                       color:
                    //                                       Morningtasklist[index].isselected
                    //                                           ? const Color(0xFF68B984)
                    //                                           : chooseCardColor(
                    //                                           Morningtasklist[index]
                    //                                               .Priority)),
                    //                                   width: width! - 30,
                    //                                   height: 260,
                    //                                   child: Padding(
                    //                                     padding: const EdgeInsets.only(
                    //                                         left: 20, top: 10, right: 20),
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                       CrossAxisAlignment.start,
                    //                                       children: [
                    //                                         Row(
                    //                                           mainAxisAlignment:
                    //                                           MainAxisAlignment
                    //                                               .spaceBetween,
                    //                                           children: [
                    //                                             Flexible(
                    //                                               child: Text(
                    //                                                 taskController.notifyInprogress[index].taskName,
                    //                                                 maxLines: 1,
                    //                                                 style: const TextStyle(
                    //                                                     overflow: TextOverflow.ellipsis,
                    //
                    //                                                     color: BLACKCOLOR,
                    //                                                     fontSize: 24,
                    //                                                     fontWeight:
                    //                                                     FontWeight.w800),
                    //                                               ),
                    //                                             ),
                    //                                             InkWell(
                    //                                               // onTap: (() => Navigator.push(
                    //                                               //     context,
                    //                                               //     MaterialPageRoute(
                    //                                               //         builder: ((context) =>
                    //                                               //             Taskpageprogress())
                    //                                               //             )
                    //                                               //             )
                    //                                               //             ),
                    //                                               child: Container(
                    //                                                 decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius.circular(12),
                    //                                                   color: taskController.notifyInprogress[index].status == "In-progress"
                    //                                                       ? Colors.blue
                    //                                                       : taskController.notifyInprogress[index].status  == "To-do"
                    //                                                       ? Colors.amber
                    //                                                       : taskController.notifyInprogress[index].status == "Resolved" ? Colors.pink : Colors.lime,
                    //                                                 ),
                    //                                                 width: 90,
                    //                                                 height: 40,
                    //                                                 child: Center(
                    //                                                     child: Text(
                    //                                                       taskController.notifyInprogress[index].status,
                    //                                                       style: const TextStyle(
                    //                                                           color:
                    //                                                           BUTTONTEXTCOLOR),
                    //                                                     )),
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 10,
                    //                                         ),
                    //                                         Text(
                    //                                           taskController.notifyInprogress[index].description,
                    //                                           style: const TextStyle(
                    //                                               color: BLACKCOLOR,
                    //                                               fontSize: 18,
                    //                                               fontWeight: FontWeight.w400),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         // Row(
                    //                                         //   children: [
                    //                                         //     Icon(
                    //                                         //       Icons.alarm,
                    //                                         //       color: BLACKCOLOR,
                    //                                         //     ),
                    //                                         //     SizedBox(
                    //                                         //       width: 10,
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleFromtime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleTotime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //   ],
                    //                                         // ),
                    //
                    //                                         // SizedBox(
                    //                                         //   height: 10,
                    //                                         // ),
                    //                                         Row(
                    //                                           children: [
                    //                                             SizedBox(
                    //                                               width: 25,
                    //                                               height: 25,
                    //                                               child: Image.asset(
                    //                                                 ASSIGNTOYOU,
                    //                                               ),
                    //                                             ),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyInprogress[index].userName.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyInprogress[index].userName[i].firstName} ${taskController.myNotifyTaskList[index].userName[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.notifications,
                    //                                                 color: BLACKCOLOR),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyInprogress[index].notify_names.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyInprogress[index].notify_names[i].firstName} ${taskController.notifyInprogress[index].notify_names[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.calendar_today,
                    //                                                 color: BLACKCOLOR),
                    //                                             const SizedBox(
                    //                                               width: 10,
                    //                                             ),
                    //                                             Text(
                    //                                               taskController.notifyInprogress[index].startDate +"  -  "+taskController.notifyInprogress[index].endDate,
                    //                                               style: const TextStyle(
                    //                                                   color: BLACKCOLOR,
                    //                                                   fontSize: 16,
                    //                                                   fontWeight:
                    //                                                   FontWeight.w400),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 decoration: const BoxDecoration(
                    //                                   borderRadius: BorderRadius.only(
                    //                                       bottomRight: Radius.circular(12.0),
                    //                                       bottomLeft: Radius.circular(12.0)),
                    //                                   color: Color.fromARGB(179, 208, 208, 208),
                    //                                 ),
                    //                                 width: width! - 30,
                    //                                 height: 50,
                    //                                 child: Padding(
                    //                                   padding: const EdgeInsets.only(
                    //                                       left: 10, right: 10),
                    //                                   child: Row(
                    //                                     mainAxisAlignment:
                    //                                     MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Row(
                    //                                         children: [
                    //                                           Text(
                    //                                             Morningtasklist[index]
                    //                                                 .isselected
                    //                                                 ? 'Done'
                    //                                                 : taskController.notifyInprogress[index].priority,
                    //                                             style: const TextStyle(
                    //                                               fontSize: 18,
                    //                                             ),
                    //                                           ),
                    //                                           Padding(
                    //                                             padding: const EdgeInsets.only(
                    //                                                 left: 60),
                    //                                             child: index % 1 == 1
                    //                                                 ? Container()
                    //                                                 : Container(
                    //                                               decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(
                    //                                                       30),
                    //                                                   border: Border.all(
                    //                                                       color: const Color(
                    //                                                           0xffe94c89))),
                    //                                               child: Padding(
                    //                                                 padding:
                    //                                                 EdgeInsets.all(
                    //                                                     8.0),
                    //                                                 child: Text(
                    //                                                     Morningtasklist[
                    //                                                     index]
                    //                                                         .isselected
                    //                                                         ? "Done"
                    //                                                         : "Overdue"),
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                       IconButton(
                    //                                         icon: Morningtasklist[index]
                    //                                             .isselected
                    //                                             ? const Icon(
                    //                                           Icons.check_box,
                    //                                           color: Colors.green,
                    //                                         )
                    //                                             : const Icon(
                    //                                           Icons
                    //                                               .check_box_outline_blank,
                    //                                           color: Colors.blue,
                    //                                         ),
                    //                                         onPressed: (() {
                    //                                           setState(() {
                    //                                             Morningtasklist[index]
                    //                                                 .isselected =
                    //                                             !Morningtasklist[index]
                    //                                                 .isselected;
                    //                                           });
                    //                                         }),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       })))
                    //             ],
                    //           ),
                    //         );
                    //       }
                    //
                    //     }
                    //     ),
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Obx(() {
                    //       if(taskController.notifyOverdue.isEmpty)
                    //       {
                    //         return Container(
                    //           height: 350,
                    //           child: Center(child: Text("Task is empty")),
                    //         );
                    //       }
                    //       else
                    //       {
                    //         return SizedBox(
                    //           height: taskController.notifyOverdue.length * 350,
                    //           child: Column(
                    //             children: [
                    //               Expanded(
                    //                   child: ListView.builder(
                    //                       shrinkWrap: true,
                    //                       physics: const NeverScrollableScrollPhysics(),
                    //                       itemCount:  taskController.notifyOverdue.length,
                    //                       itemBuilder: ((context, index) {
                    //
                    //
                    //                         return Padding(
                    //                           padding: const EdgeInsets.symmetric(
                    //                               vertical: 10, horizontal: 20),
                    //                           child: Column(
                    //                             children: [
                    //                               InkWell(
                    //                                 onTap: () async {
                    //                                   TaskModel task = await TaskModel(
                    //                                     id: taskController.notifyOverdue[index].id,
                    //                                     userId: taskController.notifyOverdue[index].userId,
                    //                                     taskName: taskController.notifyOverdue[index].taskName,
                    //                                     task_owner: taskController.notifyOverdue[index].task_owner,
                    //                                     description:taskController.notifyOverdue[index].description,
                    //                                     status:taskController.notifyOverdue[index].status,
                    //                                     subTask:taskController.notifyOverdue[index].subTask,
                    //                                     priority:taskController.notifyOverdue[index].priority,
                    //                                     startDate:taskController.notifyOverdue[index].startDate,
                    //                                     endDate:taskController.notifyOverdue[index].endDate,
                    //                                     assignId: taskController.notifyOverdue[index].assignId,
                    //                                     notifyId: taskController.notifyOverdue[index].notifyId,
                    //                                     createdAt:  taskController.notifyOverdue[index].createdAt,
                    //                                     updatedAt:  taskController.notifyOverdue[index].updatedAt,
                    //                                     userName: taskController.notifyOverdue[index].userName,
                    //                                     notify_names: taskController.notifyOverdue[index].notify_names,
                    //                                   );
                    //                                   taskController.fetchComments(task.id);
                    //
                    //
                    //                                   Navigator.push(
                    //                                       context,
                    //                                       MaterialPageRoute(
                    //                                           builder: ((context) =>
                    //                                               Taskpageprogress(
                    //                                                   task:task
                    //                                               ))));
                    //                                 },
                    //                                 child: Container(
                    //                                   decoration: BoxDecoration(
                    //                                       borderRadius: const BorderRadius.only(
                    //                                         topRight: Radius.circular(12.0),
                    //                                         topLeft: Radius.circular(12.0),
                    //                                       ),
                    //                                       color:
                    //                                       Morningtasklist[index].isselected
                    //                                           ? const Color(0xFF68B984)
                    //                                           : chooseCardColor(
                    //                                           Morningtasklist[index]
                    //                                               .Priority)),
                    //                                   width: width! - 30,
                    //                                   height: 260,
                    //                                   child: Padding(
                    //                                     padding: const EdgeInsets.only(
                    //                                         left: 20, top: 10, right: 20),
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                       CrossAxisAlignment.start,
                    //                                       children: [
                    //                                         Row(
                    //                                           mainAxisAlignment:
                    //                                           MainAxisAlignment
                    //                                               .spaceBetween,
                    //                                           children: [
                    //                                             Flexible(
                    //                                               child: Text(
                    //                                                 taskController.notifyOverdue[index].taskName,
                    //                                                 maxLines: 1,
                    //                                                 style: const TextStyle(
                    //                                                     overflow: TextOverflow.ellipsis,
                    //
                    //                                                     color: BLACKCOLOR,
                    //                                                     fontSize: 24,
                    //                                                     fontWeight:
                    //                                                     FontWeight.w800),
                    //                                               ),
                    //                                             ),
                    //                                             InkWell(
                    //                                               // onTap: (() => Navigator.push(
                    //                                               //     context,
                    //                                               //     MaterialPageRoute(
                    //                                               //         builder: ((context) =>
                    //                                               //             Taskpageprogress())
                    //                                               //             )
                    //                                               //             )
                    //                                               //             ),
                    //                                               child: Container(
                    //                                                 decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius.circular(12),
                    //                                                   color: taskController.notifyOverdue[index].status == "In-progress"
                    //                                                       ? Colors.blue
                    //                                                       : taskController.notifyOverdue[index].status  == "To-do"
                    //                                                       ? Colors.amber
                    //                                                       : taskController.notifyOverdue[index].status == "Resolved" ? Colors.pink : Colors.lime,
                    //                                                 ),
                    //                                                 width: 90,
                    //                                                 height: 40,
                    //                                                 child: Center(
                    //                                                     child: Text(
                    //                                                       taskController.notifyOverdue[index].status,
                    //                                                       style: const TextStyle(
                    //                                                           color:
                    //                                                           BUTTONTEXTCOLOR),
                    //                                                     )),
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 10,
                    //                                         ),
                    //                                         Text(
                    //                                           taskController.notifyOverdue[index].description,
                    //                                           style: const TextStyle(
                    //                                               color: BLACKCOLOR,
                    //                                               fontSize: 18,
                    //                                               fontWeight: FontWeight.w400),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         // Row(
                    //                                         //   children: [
                    //                                         //     Icon(
                    //                                         //       Icons.alarm,
                    //                                         //       color: BLACKCOLOR,
                    //                                         //     ),
                    //                                         //     SizedBox(
                    //                                         //       width: 10,
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleFromtime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //     Text(
                    //                                         //       Morningtasklist[index]
                    //                                         //           .TimeScheduleTotime,
                    //                                         //       style: TextStyle(
                    //                                         //           color: BLACKCOLOR,
                    //                                         //           fontSize: 16,
                    //                                         //           fontWeight:
                    //                                         //               FontWeight.w400),
                    //                                         //     ),
                    //                                         //   ],
                    //                                         // ),
                    //
                    //                                         // SizedBox(
                    //                                         //   height: 10,
                    //                                         // ),
                    //                                         Row(
                    //                                           children: [
                    //                                             SizedBox(
                    //                                               width: 25,
                    //                                               height: 25,
                    //                                               child: Image.asset(
                    //                                                 ASSIGNTOYOU,
                    //                                               ),
                    //                                             ),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyOverdue[index].userName.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyOverdue[index].userName[i].firstName} ${taskController.notifyOverdue[index].userName[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.notifications,
                    //                                                 color: BLACKCOLOR),
                    //                                             Padding(
                    //                                               padding:
                    //                                               const EdgeInsets.only(
                    //                                                   left: 10),
                    //                                               child: Row(
                    //                                                 crossAxisAlignment:
                    //                                                 CrossAxisAlignment
                    //                                                     .center,
                    //                                                 mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .center,
                    //                                                 children: [
                    //                                                   for(int i=0;i<taskController.notifyOverdue[index].notify_names.length;i++)
                    //                                                     SizedBox(
                    //                                                       height: 35,
                    //                                                       width: 35,
                    //                                                       child: TextAvatar(
                    //                                                         textColor:
                    //                                                         Colors.white,
                    //                                                         shape: Shape.Circular,
                    //                                                         text:
                    //                                                         "${taskController.notifyOverdue[index].notify_names[i].firstName} ${taskController.notifyOverdue[index].notify_names[i].lastName}",
                    //                                                         fontSize: 14,
                    //                                                         numberLetters: 2,
                    //                                                       ),
                    //                                                     ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Bhive team",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                   // const SizedBox(
                    //                                                   //   width: 1,
                    //                                                   // ),
                    //                                                   // SizedBox(
                    //                                                   //   height: 35,
                    //                                                   //   width: 35,
                    //                                                   //   child: TextAvatar(
                    //                                                   //     textColor:
                    //                                                   //     Colors.white,
                    //                                                   //     shape: Shape.Circular,
                    //                                                   //     text: "Vicky b",
                    //                                                   //     fontSize: 14,
                    //                                                   //     numberLetters: 2,
                    //                                                   //   ),
                    //                                                   // ),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Row(
                    //                                           children: [
                    //                                             const Icon(Icons.calendar_today,
                    //                                                 color: BLACKCOLOR),
                    //                                             const SizedBox(
                    //                                               width: 10,
                    //                                             ),
                    //                                             Text(
                    //                                               taskController.notifyOverdue[index].startDate +"  -  "+taskController.notifyOverdue[index].endDate,
                    //                                               style: const TextStyle(
                    //                                                   color: BLACKCOLOR,
                    //                                                   fontSize: 16,
                    //                                                   fontWeight:
                    //                                                   FontWeight.w400),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 decoration: const BoxDecoration(
                    //                                   borderRadius: BorderRadius.only(
                    //                                       bottomRight: Radius.circular(12.0),
                    //                                       bottomLeft: Radius.circular(12.0)),
                    //                                   color: Color.fromARGB(179, 208, 208, 208),
                    //                                 ),
                    //                                 width: width! - 30,
                    //                                 height: 50,
                    //                                 child: Padding(
                    //                                   padding: const EdgeInsets.only(
                    //                                       left: 10, right: 10),
                    //                                   child: Row(
                    //                                     mainAxisAlignment:
                    //                                     MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Row(
                    //                                         children: [
                    //                                           Text(
                    //                                             Morningtasklist[index]
                    //                                                 .isselected
                    //                                                 ? 'Done'
                    //                                                 : taskController.notifyOverdue[index].priority,
                    //                                             style: const TextStyle(
                    //                                               fontSize: 18,
                    //                                             ),
                    //                                           ),
                    //                                           Padding(
                    //                                             padding: const EdgeInsets.only(
                    //                                                 left: 60),
                    //                                             child: index % 1 == 1
                    //                                                 ? Container()
                    //                                                 : Container(
                    //                                               decoration: BoxDecoration(
                    //                                                   borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(
                    //                                                       30),
                    //                                                   border: Border.all(
                    //                                                       color: const Color(
                    //                                                           0xffe94c89))),
                    //                                               child: Padding(
                    //                                                 padding:
                    //                                                 EdgeInsets.all(
                    //                                                     8.0),
                    //                                                 child: Text(
                    //                                                     Morningtasklist[
                    //                                                     index]
                    //                                                         .isselected
                    //                                                         ? "Done"
                    //                                                         : "Overdue"),
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                       IconButton(
                    //                                         icon: Morningtasklist[index]
                    //                                             .isselected
                    //                                             ? const Icon(
                    //                                           Icons.check_box,
                    //                                           color: Colors.green,
                    //                                         )
                    //                                             : const Icon(
                    //                                           Icons
                    //                                               .check_box_outline_blank,
                    //                                           color: Colors.blue,
                    //                                         ),
                    //                                         onPressed: (() {
                    //                                           setState(() {
                    //                                             Morningtasklist[index]
                    //                                                 .isselected =
                    //                                             !Morningtasklist[index]
                    //                                                 .isselected;
                    //                                           });
                    //                                         }),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       })))
                    //             ],
                    //           ),
                    //         );
                    //       }
                    //
                    //     }
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ])));
  }
}
