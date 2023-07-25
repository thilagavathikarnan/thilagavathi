import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habittrackergad/Components/Task/Addtask.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/teamController.dart';

class Morningtask {
  String Taskname;
  String Taskdescription;

  Morningtask({
    required this.Taskname,
    required this.Taskdescription,
  });
}

List<Morningtask> Morningtasklist = [
  Morningtask(
    Taskname: "Functionality",
    Taskdescription: "In-progress",
  ),
];

class Addprojects extends StatefulWidget {
  String? projectname;
  String? Projecktaskcount;
  String? Projecticon;
  String? projectteamemailid;
  String? projectteampersonwork;
  bool isselected;

  Addprojects(
      {this.projectname,
      this.Projecktaskcount,
      this.Projecticon,
      this.projectteamemailid,
      this.projectteampersonwork,
      this.isselected = false});

  @override
  State<Addprojects> createState() => _AddprojectsState();
}

String _selectedItempriority1 = "Naveenraj@gmail.com";
String _selectedItempriority2 = "Administrator";

double? height;
double? width;
Icon? _icon;
bool istwoselected = false;

class _AddprojectsState extends State<Addprojects> {

  TeamController projectController =   Get.put(TeamController());

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    _icon = Icon(icon);
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
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
            const Text(
              "Project Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: projectController.projectName,
              decoration: InputDecoration(
                hintText: "Project name",
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: _pickIcon,
                      child: const Text(
                        'Icon picker',
                        style: TextStyle(color: BLACKCOLOR),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffeaf0f6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffeaf0f6)),
                        width: 40,
                        height: 40,
                        child: _icon ?? Container()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Invite People Assign team to this project",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() => _onButtonPressed1()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffeaf0f6)),
                width: width! / 2.4,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Select team",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // InkWell(
            //   onTap: (() => _onButtonPressed2()),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: const Color(0xffeaf0f6)),
            //     width: width! / 2.4,
            //     height: 60,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 15),
            //           child: Text(
            //             _selectedItempriority2,
            //             style: const TextStyle(fontSize: 16),
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.only(right: 10),
            //           child: Icon(
            //             Icons.arrow_drop_down_outlined,
            //             size: 35,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Obx(() {
                return Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    for(int i = 0; i<projectController.teams.length; i++)
                      for(int j = 0; j<projectController.selectTeamForProject.length; j++)
                        if(projectController.selectTeamForProject[j] == projectController.teams[i].user)
                          ListTile(
                            title: Text("${projectController.teams[i].email}"),
                            trailing: Text("${projectController.teams[i].designation}"),
                          ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              }
            ),

            // const ListTile(
            //   title: Text("Pranav@gmail.com"),
            //   trailing: Text("Lead"),
            // ),
            // const Divider(
            //   color: Colors.grey,
            // ),
            // const ListTile(
            //   title: Text("Rajesh@gmail.com"),
            //   trailing: Text("Task"),
            // ),
            // const Divider(
            //   color: Colors.grey,
            // ),
             SizedBox(
              height: 40,
            ),
            Obx(()
            {
              if(projectController.isProjectSaveLoaders.isTrue)
                {
                  return InkWell(
                    onTap: ()
                    {

                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width! - 100,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0XFFffbf96),
                              Color(0XFFfe7096),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );

                }
              else
                {
                  return InkWell(
                    onTap: ()
                    {
                      projectController.selectTeamForWholeProject.clear();
                      for(int i = 0; i<projectController.teams.length;i++)
                      {
                        for(int j = 0; j<projectController.selectTeamForProject.length;j++)
                        {
                          if(projectController.teams[i].user == projectController.selectTeamForProject[j])
                          {
                            setState(() {
                              var body =
                              {
                                "id": projectController.teams[i].id,
                                "user_id": "${projectController.teams[i].userId}",
                                "user": "${projectController.teams[i].user}",
                                "name": "${projectController.teams[i].name}",
                                "designation": "${projectController.teams[i].designation}",
                                "email": "${projectController.teams[i].email}",
                                "phone": "${projectController.teams[i].phone}",
                                "created_at": "${projectController.teams[i].createdAt}",
                                "updated_at": "${projectController.teams[i].updatedAt}"
                              };
                              projectController.selectTeamForWholeProject.add(body);
                            });
                          }
                          else
                          {
                            continue;
                          }
                        }

                      }

                      if(projectController.projectName.text.isNotEmpty && projectController.selectTeamForWholeProject.isNotEmpty)
                      {
                        projectController.addProject(projectController.projectName.text);



                      }
                      else
                      {
                        Get.snackbar("Alert", "Please fill all fields",
                            backgroundColor: Colors.black.withOpacity(0.4),
                            colorText: Colors.white,
                            icon: Icon(
                              Icons.warning,
                              color: Colors.white,
                            ),
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width! - 100,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0XFFffbf96),
                              Color(0XFFfe7096),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('Add Project',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: BUTTONTEXTCOLOR)),
                        ),
                      ),
                    ),
                  );
                }
            })

            // InkWell(
            //   onTap: () => Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => Addtasknew())),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //       width: width! - 100,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         gradient: const LinearGradient(
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //           colors: [
            //             Color(0XFFffbf96),
            //             Color(0XFFfe7096),
            //           ],
            //         ),
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: const Center(
            //         child: Text('Add task',
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w800,
            //                 color: BUTTONTEXTCOLOR)),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed1() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          return Obx(() {
              return Container(
                height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 20,left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(width: 3,),
                          Text("Select Team",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff624F82),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 70,
                              height: 35,
                              child: const Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    for(int i = 0; i< projectController.teams.length;i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        // onTap: () => _selectItempriority1("Naveenraj@gmail.com"),
                        onTap: ()
                        {
                          if(projectController.selectTeamForProject.contains(projectController.teams[i].user))
                            {
                              projectController.selectTeamForProject.remove(projectController.teams[i].user);

                            }
                          else
                            {

                              projectController.selectTeamForProject.add(projectController.teams[i].user);

                            }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff624F82),
                          ),
                          width: width! - 10,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "${projectController.teams[i].email}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "${projectController.teams[i].designation}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if(projectController.selectTeamForProject.contains(projectController.teams[i].user))
                                        {
                                          projectController.selectTeamForProject.remove(projectController.teams[i].user);

                                        }
                                        else
                                        {
                                          // setState(() {
                                          //   projectController.selectTeamForWholeProject.add(projectController.teams[i]);
                                          // });
                                          projectController.selectTeamForProject.add(projectController.teams[i].user);

                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        width: 30,
                                        height: 30,
                                        child:  projectController.selectTeamForProject.contains(projectController.teams[i].user)
                                        ?Center(
                                            child: Icon(
                                          Icons.check,
                                          color: Colors.black,
                                          size: 20,
                                        )):Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // InkWell(
                    //   onTap: () => _selectItempriority1("Pranav@gmail.com"),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: const Color(0xff624F82),
                    //     ),
                    //     width: width! - 10,
                    //     height: 50,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10, right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Text(
                    //             "Pranav@gmail.com",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 16),
                    //           ),
                    //           Row(
                    //             children: [
                    //               const Padding(
                    //                 padding: EdgeInsets.only(right: 15),
                    //                 child: Text(
                    //                   "Lead",
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontSize: 16),
                    //                 ),
                    //               ),
                    //               InkWell(
                    //                 onTap: () => Navigator.pop(context),
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(12),
                    //                   ),
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: const Center(
                    //                       child: Icon(
                    //                     Icons.add,
                    //                     color: Colors.black,
                    //                     size: 20,
                    //                   )),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // InkWell(
                    //   onTap: () => _selectItempriority1("Rajesh@gmail.com"),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: const Color(0xff624F82),
                    //     ),
                    //     width: width! - 10,
                    //     height: 50,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10, right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Text(
                    //             "Rajesh@gmail.com",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 16),
                    //           ),
                    //           Row(
                    //             children: [
                    //               const Padding(
                    //                 padding: EdgeInsets.only(right: 10),
                    //                 child: Text(
                    //                   "Administrator",
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontSize: 16),
                    //                 ),
                    //               ),
                    //               InkWell(
                    //                 onTap: () => Navigator.pop(context),
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(12),
                    //                   ),
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: const Center(
                    //                       child: Icon(
                    //                     Icons.add,
                    //                     color: Colors.black,
                    //                     size: 20,
                    //                   )),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // InkWell(
                    //   onTap: () => _selectItempriority1("Prasana@gmail.com"),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: const Color(0xff624F82),
                    //     ),
                    //     width: width! - 10,
                    //     height: 50,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10, right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Text(
                    //             "Prasana@gmail.com",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 16),
                    //           ),
                    //           Row(
                    //             children: [
                    //               const Padding(
                    //                 padding: EdgeInsets.only(right: 10),
                    //                 child: Text(
                    //                   "Associate",
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontSize: 16),
                    //                 ),
                    //               ),
                    //               InkWell(
                    //                 onTap: () => Navigator.pop(context),
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(12),
                    //                   ),
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: const Center(
                    //                       child: Icon(
                    //                     Icons.add,
                    //                     color: Colors.black,
                    //                     size: 20,
                    //                   )),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // InkWell(
                    //   onTap: () => _selectItempriority1("Vignesh@gmail.com"),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: const Color(0xff624F82),
                    //     ),
                    //     width: width! - 10,
                    //     height: 50,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10, right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Text(
                    //             "Vignesh@gmail.com",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 16),
                    //           ),
                    //           Row(
                    //             children: [
                    //               const Padding(
                    //                 padding: EdgeInsets.only(right: 15),
                    //                 child: Text(
                    //                   "Juinor",
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontSize: 16),
                    //                 ),
                    //               ),
                    //               InkWell(
                    //                 onTap: () => Navigator.pop(context),
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(12),
                    //                   ),
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: const Center(
                    //                       child: Icon(
                    //                     Icons.add,
                    //                     color: Colors.black,
                    //                     size: 20,
                    //                   )),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }
          );
        });
  }

  void _selectItempriority1(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItempriority1 = name;
      });
    }
  }

  void _onButtonPressed2() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                          ),
                          width: 200,
                          height: 10,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff59d6f9),
                                Color(0xff7f85f1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 30,
                          height: 30,
                          child: const Center(
                              child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => _selectItempriority2("Administrator"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffBFEAF5),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff5CB8E4),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Adminisrstator",
                            style: TextStyle(
                                color: Color(0xff5CB8E4),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItempriority2("Manager"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFE5F1),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE98EAD),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Manager",
                            style: TextStyle(
                                color: Color(0xffE98EAD),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItempriority2("Lead"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDEF5E5),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff4FA095),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Lead",
                            style: TextStyle(
                                color: Color(0xff4FA095),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItempriority2("Associate"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff1ecfb),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff7e5fbe),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Associate",
                            style: TextStyle(
                                color: Color(0xff7e5fbe),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItempriority2("Junior"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfffbf0ed),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffe2825d),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Junior",
                            style: TextStyle(
                                color: Color(0xffe2825d),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _selectItempriority2(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItempriority2 = name;
      });
    }
  }
}
