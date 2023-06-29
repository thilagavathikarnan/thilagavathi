import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/Packs/Material.dart';
import 'package:habittrackergad/Components/Task/Add_projects.dart';
import 'package:habittrackergad/Components/Task/Addtask.dart';
import 'package:habittrackergad/Components/Task/Taskpage.dart';
import 'package:habittrackergad/Components/Task/Taskdetails.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../AssignTask/Assigned_By_You.dart';
import '../Addteam.dart';

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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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
      Date: "26/06/2022",
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

class projectteam {
  String? projectname;
  String? Projecktaskcount;
  IconData? Projecticon;
  String? projectteamemailid;
  String? projectteampersonwork;
  bool isselected = false;

  projectteam({
    this.projectname,
    this.Projecktaskcount,
    this.Projecticon,
    this.projectteamemailid,
    this.projectteampersonwork,
  });
}

List<projectteam> projectteamlist = [
  projectteam(
      projectname: "Functionality",
      Projecktaskcount: "5 Tasks",
      Projecticon: Icons.task,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "Lead"),
  projectteam(
      projectname: "Habit tracker",
      Projecktaskcount: "10 Tasks",
      Projecticon: Icons.list,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "Manager"),
  projectteam(
      projectname: "Figma design",
      Projecktaskcount: "15 Tasks",
      Projecticon: Icons.star,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "Admin"),
  projectteam(
      projectname: "Gad seo",
      Projecktaskcount: "7 Tasks",
      Projecticon: Icons.airplay,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "junior"),
];

class projectassignedbyyou extends StatefulWidget {
  const projectassignedbyyou({super.key});

  @override
  State<projectassignedbyyou> createState() => _projectassignedbyyouState();
}

class _projectassignedbyyouState extends State<projectassignedbyyou> {
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

  @override
  double? height;
  double? width;
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: Wrap(
          //will break to another line on overflow
          direction: Axis.horizontal, //use vertical to show  on vertical axis
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                      height: 45,
                      width: 120,
                      margin: const EdgeInsets.all(10),
                      child: FloatingActionButton(
                        heroTag: "google",
                        backgroundColor: const Color(0xff3b4682),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Addteam()),
                        ),
                        child: const Text("Add team"),
                      )),
                ),
                Container(
                    height: 45,
                    width: 120,
                    margin: const EdgeInsets.all(10),
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xff3b4682),
                      heroTag: "gad",
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addprojects()),
                      ),
                      child: const Text("Add projects"),
                    )), // button second
              ],
            ), //button first

            // button third

            // Add more buttons here
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, bottom: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Assigned by you",
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontSize: 22,
                          fontWeight: FontWeight.w800)),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Assigned_by_you()),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("View all",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 0.9,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                children: List.generate(projectteamlist.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: InkWell(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: ((context) => Taskpageprogress(
                        //           Taskname: Morningtasklist[index].Taskname,
                        //           Taskdescription:
                        //               Morningtasklist[index].Taskdescription,
                        //           Date: Morningtasklist[index].Date,
                        //           Status: Morningtasklist[index].Status,
                        //           Priority: Morningtasklist[index].Priority,
                        //           Weekdays: Morningtasklist[index].Weekdays,
                        //         )),
                        //   ),
                        // ),
                        onTap: () {},

                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.white,
                                          ),
                                          child: Icon(projectteamlist[index]
                                              .Projecticon),
                                          width: 50,
                                          height: 50,
                                        ),
                                        InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Addprojects(
                                                      projectname:
                                                          projectteamlist[index]
                                                              .projectname
                                                              .toString(),
                                                      projectteamemailid:
                                                          projectteamlist[index]
                                                              .projectteamemailid
                                                              .toString(),
                                                      projectteampersonwork:
                                                          projectteamlist[index]
                                                              .projectteampersonwork
                                                              .toString(),
                                                      isselected:
                                                          projectteamlist[index]
                                                                  .isselected =
                                                              false))),
                                          child: const Icon(
                                            Icons.edit,
                                            color: BLACKCOLOR,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      projectteamlist[index].projectname!,
                                      style: const TextStyle(
                                          color: BLACKCOLOR,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      projectteamlist[index].Projecktaskcount!,
                                      style: const TextStyle(color: BLACKCOLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Container(
                                width: width!,
                                height: 80,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey, //New
                                      blurRadius: 1.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff624F82),
                                                  child: Text(
                                                    "Sr",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: BUTTONTEXTCOLOR),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff624F82),
                                                  child: Text(
                                                    "Pr",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: BUTTONTEXTCOLOR),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff624F82),
                                                  child: Text(
                                                    "Sp",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: BUTTONTEXTCOLOR),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff624F82),
                                                  child: Text(
                                                    "Mg",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: BUTTONTEXTCOLOR),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text("30%",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: BLACKCOLOR,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    LinearPercentIndicator(
                                      animation: true,
                                      lineHeight: 8.0,
                                      animationDuration: 2000,
                                      percent: 0.3,
                                      // center: Text("69.0%"),
                                      barRadius: const Radius.circular(8),
                                      progressColor: const Color(0xff6366ee),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        )

        // body: Padding(
        //   padding: const EdgeInsets.only(left: 20, right: 20),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(
        //         height: 40,
        //       ),
        //       const Text(
        //         "My projects",
        //         style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        //       ),
        //       Expanded(
        //           child: ListView.builder(
        //               itemCount: projectteamlist.length,
        //               itemBuilder: ((context, index) {
        //                 return InkWell(
        //                   onTap: () => Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: ((context) => Taskpage()),
        //                     ),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 10),
        //                     child: Container(
        //                         decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(12),
        //                             border: Border.all(color: Colors.black)
        //                             // gradient: const LinearGradient(
        //                             //   begin: Alignment.topRight,
        //                             //   end: Alignment.bottomLeft,
        //                             //   colors: [
        //                             //     Color(0xffbec7e1),
        //                             //     Color(0xffebdddb),
        //                             //   ],
        //                             // )
        //                             ),
        //                         width: width! / 2.4,
        //                         height: 120,
        //                         child: Padding(
        //                           padding: const EdgeInsets.only(
        //                               left: 20, right: 20, top: 15),
        //                           child: Column(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Text(
        //                                       projectteamlist[index].projectname!,
        //                                       style: const TextStyle(
        //                                           fontSize: 18,
        //                                           fontWeight: FontWeight.w500)),
        //                                   Container(
        //                                     decoration: BoxDecoration(
        //                                       borderRadius:
        //                                           BorderRadius.circular(12),
        //                                       color: Color(0xff863A6F),
        //                                     ),
        //                                     child: Padding(
        //                                       padding: const EdgeInsets.all(8.0),
        //                                       child: Text(
        //                                           projectteamlist[index]
        //                                               .projectteampersonwork!,
        //                                           style: const TextStyle(
        //                                               fontSize: 16,
        //                                               fontWeight: FontWeight.w500,
        //                                               color: BUTTONTEXTCOLOR)),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                               const SizedBox(
        //                                 height: 10,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Row(
        //                                     children: const [
        //                                       SizedBox(
        //                                         width: 40,
        //                                         height: 40,
        //                                         child: CircleAvatar(
        //                                           backgroundColor:
        //                                               Color(0xff624F82),
        //                                           child: Text(
        //                                             "Sr",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 color: BUTTONTEXTCOLOR),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         width: 10,
        //                                       ),
        //                                       SizedBox(
        //                                         width: 40,
        //                                         height: 40,
        //                                         child: CircleAvatar(
        //                                           backgroundColor:
        //                                               Color(0xff624F82),
        //                                           child: Text(
        //                                             "Pr",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 color: BUTTONTEXTCOLOR),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         width: 10,
        //                                       ),
        //                                       SizedBox(
        //                                         width: 40,
        //                                         height: 40,
        //                                         child: CircleAvatar(
        //                                           backgroundColor:
        //                                               Color(0xff624F82),
        //                                           child: Text(
        //                                             "Sp",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 color: BUTTONTEXTCOLOR),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         width: 10,
        //                                       ),
        //                                       SizedBox(
        //                                         width: 40,
        //                                         height: 40,
        //                                         child: CircleAvatar(
        //                                           backgroundColor:
        //                                               Color(0xff624F82),
        //                                           child: Text(
        //                                             "Mg",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 color: BUTTONTEXTCOLOR),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                   InkWell(
        //                                       onTap: () => Navigator.push(
        //                                           context,
        //                                           MaterialPageRoute(
        //                                               builder: (context) => Addprojects(
        //                                                   projectname:
        //                                                       projectteamlist[
        //                                                               index]
        //                                                           .projectname
        //                                                           .toString(),
        //                                                   projectteamemailid:
        //                                                       projectteamlist[
        //                                                               index]
        //                                                           .projectteamemailid
        //                                                           .toString(),
        //                                                   projectteampersonwork:
        //                                                       projectteamlist[
        //                                                               index]
        //                                                           .projectteampersonwork
        //                                                           .toString(),
        //                                                   isselected:
        //                                                       projectteamlist[
        //                                                                   index]
        //                                                               .isselected =
        //                                                           false))),
        //                                       child: Icon(Icons.edit))
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                         )),
        //                   ),
        //                 );
        //               })))
        //     ],
        //   ),
        // ),
        );
  }
}
