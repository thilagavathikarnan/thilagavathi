import 'dart:math';

import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Task/Add_projects.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/controller/teamController.dart';
import 'package:habittrackergad/model/user_model.dart';
import 'package:pie_chart/pie_chart.dart';
class AllProject extends StatefulWidget {
  const AllProject({super.key});

  @override
  State<AllProject> createState() => _AllProjectState();
}

class _AllProjectState extends State<AllProject> {
  final random = Random();
  TeamController teamController = Get.put(TeamController());

  static List<Color> listColors = const [

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
  void initState()
  {
    super.initState();
    // teamController.getTeamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
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
                  onPressed: ()
                  {
                    teamController.selectTeamForProject.clear();
                    teamController.selectTeamForWholeProject.clear();
                    teamController.projectName.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Addprojects()),
                    );
                  },
                  child: const Text("Add projects"),
                )),
          ),

          // button third

          // Add more buttons here
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 0, bottom: 10),
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
            //  Text(
            //   Get.find<UserController>().userModel!.name,
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            // ),
            const SizedBox(
              height: 10,
            ),


            Obx(
                    () {
                  if(teamController.isLoaderProjectGet.isTrue)
                  {
                    return Container(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      ),
                    );

                  }
                  else
                  {
                    if(teamController.projects.isNotEmpty)
                    {
                      return Container(
                        // padding: EdgeInsets.all(10),
                        // height: 110 * teamController.teams.length.toDouble(),
                        child: ListView.builder(
                            shrinkWrap: true,

                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: teamController.projects.length,
                            itemBuilder: ((context, index) {

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: getColor().withOpacity(.4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Project",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.all(8),
                                              child: Icon(Icons.work,color: Colors.grey.shade800,)
                                            ),
                                            // Container(
                                            //   height: 20,
                                            //   width: 1,
                                            //   color: Colors.grey,
                                            // ),
                                            Padding(
                                              padding:  EdgeInsets.all(10),

                                              child: Text(
                                                teamController.projects[index].projectName,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),

                                          ],
                                        ),
                                          Row(
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: Image.asset(
                                                    ASSIGNTOYOU,
                                                  ),
                                                ),
                                              ),
                                              for(int i=0;i<teamController.projects[index].teamList.length;i++)

                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: TextAvatar(
                                                    textColor:
                                                    Colors.white,
                                                    shape: Shape.Circular,
                                                    text:
                                                    "${teamController.projects[index].teamList[i].name}",
                                                    fontSize: 14,
                                                    numberLetters: 2,
                                                  ),
                                              ),
                                                ),
                                            ],
                                          ),


                                      ],
                                    )),
                              );
                            })),
                      );
                    }
                    else
                    {
                      return Container(
                        height: 300,
                        child: Center(child: Text("No projects")),
                      );
                    }

                  }

                }
            ),
          ],
        ),
      ),
    );
  }
}
