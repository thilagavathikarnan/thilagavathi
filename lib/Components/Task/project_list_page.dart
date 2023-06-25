import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/Packs/Material.dart';
import 'package:habittrackergad/Components/Task/Add_projects.dart';
import 'package:habittrackergad/Components/Task/Addtask.dart';
import 'package:habittrackergad/Components/Task/Taskpage.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
      projectname: "Hive crm",
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
      projectname: "Offer super star",
      Projecktaskcount: "15 Tasks",
      Projecticon: Icons.star,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "Admin"),
  projectteam(
      projectname: "Gad",
      Projecktaskcount: "7 Tasks",
      Projecticon: Icons.airplay,
      projectteamemailid: "Shripranav29@gmail.com",
      projectteampersonwork: "junior"),
];

class project_list_page extends StatefulWidget {
  const project_list_page({super.key});

  @override
  State<project_list_page> createState() => _project_list_pageState();
}

class _project_list_pageState extends State<project_list_page> {
  final random = Random();
  static List<Color> listColors = const [
    Color(0xff472183),
    Color(0xffCB1C8D),
    Color(0xff181D31),
    Color(0xff10A19D),
    Color(0xff0014FF),
    Color(0xff00BEBED),
    Color(0xffE97777),
    Color(0xff372948),
    Color(0xff84DFFF),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SizedBox(
          height: 40,
          width: 120,
          child: FloatingActionButton(
            child: const Text("Add projects"), //child widget inside this button
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addprojects()),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, bottom: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Assigned to you",
                  style: TextStyle(
                      color: BLACKCOLOR,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 500,
                child: GridView.count(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  children: List.generate(projectteamlist.length, (index) {
                    return SizedBox(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Taskpage()),
                          ),
                        ),
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
                                          child: Icon(
                                            Icons.edit,
                                            color: BUTTONTEXTCOLOR,
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
                                          color: BUTTONTEXTCOLOR,
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
                                      style: const TextStyle(
                                          color: BUTTONTEXTCOLOR),
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
                    );
                  }),
                ),
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
