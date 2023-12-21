import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ht_re/service/common_var.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:ht_re/view/task/project_add.dart';
import 'package:ht_re/view/task/team_add.dart';
import 'package:get/get.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({Key? key}) : super(key: key);

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  @override
  TeamController teamController = Get.put(TeamController());
  TextEditingController taskNameController = TextEditingController();
  TextEditingController sub_taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var selectTeams = [];
  var selectTeamsNotify = [];
  String _selectedstatus = 'In-progress';
  List<String> _itemsstatus = [
    'To-do',
    'Resolved',
  ];

  String _selectedItemstatus = "In-progress";
  String _selectedItempriority = "Low";
  String _selectedpriority = 'Low';
  List<String> _itemspriority = [
    'Medium',
    'High',
  ];
  final random = Random();

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
  int? ctxx;
  // TeamController teamController = Get.put(TeamController());

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.pink,
        title: Text("Add Task",style: TextStyle(fontSize: 16,color:Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text('Task name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                label: Text("Enter task name"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Subtask',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: sub_taskController,
              decoration: InputDecoration(
                // suffixIcon: InkWell(
                //     onTap: () {
                //       // addItemToListSubtask();
                //     },
                //     child: const Icon(Icons.send)
                // ),
                labelText: "Add subtask",
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Description',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                // label: Text("Enter description"),
                hintText: "Enter the description",

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
                const Text('Status',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                InkWell(
                  onTap: (){
                    _onButtonPressed();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffeaf0f6)),
                    width: MediaQuery.of(context).size.width! - 130,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(_selectedItemstatus,
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
              ],
            ),
             SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Priority',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                InkWell(
                  onTap:(){
                    _onButtonPressed2();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffeaf0f6)),
                    width: MediaQuery.of(context)!.size.width - 130,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(_selectedItempriority,
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('Projects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) =>
                          StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  teamController.selectProject.isNotEmpty
                                      ?
                                  InkWell(
                                    onTap: ()
                                    {
                                      setState(()
                                      {
                                        teamController.selectProject.value ='';
                                        teamController.selectProjectName.value = "";
                                        selectTeams.clear();
                                        selectTeamsNotify.clear();

                                      });


                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                              "Remove Project"),
                                          SizedBox(width: 4,),
                                          Icon(Icons.remove)
                                        ],
                                      ),
                                    ),
                                  ):
                                  Text(
                                      "Select Project"),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              content: Container(
                                height: 500,
                                child: ListView(
                                  children: [
                                    Obx(() {
                                      if (teamController.isLoaderProjectGet.isTrue) {
                                        return Container(
                                          height: 300,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      } else {
                                        if (teamController.projects.isNotEmpty) {
                                          return Container(
                                            // padding: EdgeInsets.all(10),
                                            // height: 110 * teamController.teams.length.toDouble(),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                const NeverScrollableScrollPhysics(),
                                                itemCount: teamController.projects.length,
                                                itemBuilder: ((context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(()
                                                        {
                                                          ctxx = index;
                                                          teamController.selectProject.value = teamController.projects[index].id.toString();
                                                          teamController.selectProjectName.value = teamController.projects[index].projectName;
                                                          teamController.selectTeamList.clear();
                                                          for(int i = 0; i<teamController.projects[index].teamList.length;i++)
                                                          {
                                                            teamController.selectTeamList.add(teamController.projects[index].teamList[i].id);

                                                          }


                                                        });
                                                      },
                                                      child: Container(
                                                          padding:
                                                          EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: getColor().withOpacity(.4),
                                                              borderRadius: BorderRadius.circular(8),
                                                              border: Border.all(
                                                                  color:ctxx == index && teamController.selectProject.isNotEmpty? Colors.grey:Colors.transparent
                                                              )

                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "Project",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                      padding:
                                                                      EdgeInsets.all(
                                                                          8),
                                                                      child:
                                                                      Icon(
                                                                        Icons
                                                                            .work,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800,
                                                                      )),
                                                                  // Container(
                                                                  //   height: 20,
                                                                  //   width: 1,
                                                                  //   color: Colors.grey,
                                                                  // ),
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child: Text(
                                                                      teamController
                                                                          .projects[
                                                                      index]
                                                                          .projectName,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                          16,
                                                                          fontWeight:
                                                                          FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  for (int i = 0; i < teamController.projects[index].teamList.length; i++)
                                                                    Padding(
                                                                      padding: EdgeInsets.all(4.0),
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(Icons.groups),
                                                                          Text(
                                                                              "${teamController.projects[index].teamList[i].name}"
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  );
                                                })),
                                          );
                                        } else {
                                          return Container(
                                            height: 300,
                                            child: Center(
                                                child: Text("No projects")),
                                          );
                                        }
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ).then((value) {
                      setState(() {
                        selectTeams;
                      });
                    });
                    },
                  // onTap: () => showModal(context),
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
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                              Icons.add,
                              color: Colors.white
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notify', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                selectTeamsNotify.isNotEmpty?
                Text('( ${selectTeamsNotify.length} team selected )',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4))):Container(),
                teamController.selectProjectName.isNotEmpty
                    ? Text('( ${teamController.selectProjectName}  selected )',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4)))
                    : Container(),

                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) =>
                          StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Select Teams ( ${selectTeamsNotify.length} )"),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              content: Obx(() {
                                if(teamController.selectProject.isEmpty)
                                {
                                  return Container(
                                    height: 500,
                                    child: ListView(
                                      children: [
                                        for (int i = 0;
                                        i < teamController.teams.length;
                                        i++)
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectTeamsNotify.contains(teamController.teams[i].user))
                                                  {
                                                    selectTeamsNotify.remove(
                                                        teamController
                                                            .teams[i].user);
                                                  }
                                                  else
                                                  {
                                                    selectTeamsNotify.add(teamController.teams[i].user);
                                                  }
                                                });
                                                print("SELECTTEAM");
                                                print(selectTeamsNotify);
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(top: 8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: selectTeamsNotify
                                                            .contains(
                                                            teamController
                                                                .teams[i]
                                                                .user)
                                                            ? Colors.black
                                                            .withOpacity(0.8)
                                                            : Colors.transparent),
                                                    color:Colors.green.withOpacity(.4),
                                                    borderRadius:
                                                    BorderRadius.circular(8),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            teamController
                                                                .teams[i].name,
                                                            style: const TextStyle(
                                                              fontSize: 21,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Container(
                                                            height: 20,
                                                            width: 1,
                                                            color: Colors.grey,
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Text(
                                                            teamController.teams[i]
                                                                .designation,
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.phone,
                                                            size: 18,
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(teamController
                                                              .teams[i].phone.toString()),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.mail),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              teamController
                                                                  .teams[i].email,
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                          )
                                      ],
                                    ),
                                  );
                                }
                                else
                                {
                                  return Container(
                                    height: 500,
                                    child: ListView(
                                      children: [
                                        for (int i = 0; i < teamController.teams.length; i++)
                                          for (int j = 0; j < teamController.selectTeamList.length; j++)
                                            if(teamController.selectTeamList[j].toString() == teamController.teams[i].id.toString())
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectTeamsNotify.contains(
                                                          teamController
                                                              .teams[i].user)) {
                                                        selectTeamsNotify.remove(
                                                            teamController
                                                                .teams[i].user);
                                                      } else {
                                                        selectTeamsNotify.add(
                                                            teamController
                                                                .teams[i].user);
                                                      }
                                                    });
                                                    print("SELECTTEAM");
                                                    print(selectTeamsNotify);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(top: 8.0),
                                                    child: Container(
                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: selectTeamsNotify
                                                                .contains(
                                                                teamController
                                                                    .teams[i]
                                                                    .user)
                                                                ? Colors.black
                                                                .withOpacity(0.8)
                                                                : Colors.transparent),
                                                        color:Colors.green.withOpacity(.4),
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                teamController
                                                                    .teams[i].name,
                                                                style: const TextStyle(
                                                                  fontSize: 21,
                                                                  fontWeight:
                                                                  FontWeight.w700,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Container(
                                                                height: 20,
                                                                width: 1,
                                                                color: Colors.grey,
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Text(
                                                                teamController.teams[i]
                                                                    .designation,
                                                                style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.phone,
                                                                size: 18,
                                                              ),
                                                              SizedBox(width: 10),
                                                              Text(teamController
                                                                  .teams[i].phone.toString()),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                           Icon(Icons.mail),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  teamController
                                                                      .teams[i].email,
                                                                  style: const TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                            else
                                              Container()
                                      ],
                                    ),
                                  );

                                }

                              }
                              ),
                            );
                          }),
                    ).then((value) {
                      setState(() {
                        // selectTeamsNotify;
                      });
                    });
                  },
                  // onTap: () => showModal(context),
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
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assign', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
    selectTeams.isNotEmpty?Text('( ${selectTeams.length} team selected )',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4))):Container(),

                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) =>
                          StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Select Teams ( ${selectTeams.length} )"),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              content: Obx(() {
                                if(teamController.selectProject.isEmpty)
                                {
                                  return Container(
                                    height: 500,
                                    child: ListView(
                                      children: [
                                        for (int i = 0; i < teamController.teams.length; i++)
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectTeams.contains(
                                                      teamController
                                                          .teams[i].user)) {
                                                    selectTeams.remove(
                                                        teamController
                                                            .teams[i].user);
                                                  } else {
                                                    selectTeams.add(teamController
                                                        .teams[i].user);
                                                  }
                                                });
                                                print("SELECTTEAM");
                                                print(selectTeams);
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(top: 8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: selectTeams.contains(
                                                            teamController
                                                                .teams[i].user)
                                                            ? Colors.black
                                                            .withOpacity(0.8)
                                                            : Colors.transparent),
                                                    color:
                                                   Colors.green.withOpacity(.4),
                                                    borderRadius:
                                                    BorderRadius.circular(8),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            teamController
                                                                .teams[i].name,
                                                            style: const TextStyle(
                                                              fontSize: 21,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 1,
                                                            color: Colors.grey,
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Text(
                                                            teamController.teams[i]
                                                                .designation,
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.phone,
                                                            size: 18,
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(teamController
                                                              .teams[i].phone.toString()),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.mail),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              teamController
                                                                  .teams[i].email,
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                      ],
                                    ),
                                  );
                                }
                                else
                                {

                                  return Container(
                                    height: 500,
                                    child: ListView(
                                      children: [
                                        for (int i = 0; i < teamController.teams.length; i++)
                                          for (int j = 0; j < teamController.selectTeamList.length; j++)
                                            if(teamController.selectTeamList[j] == teamController.teams[i].id)
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectTeams.contains(
                                                          teamController
                                                              .teams[i].user)) {
                                                        selectTeams.remove(
                                                            teamController
                                                                .teams[i].user);
                                                      } else {
                                                        selectTeams.add(teamController
                                                            .teams[i].user);
                                                      }
                                                    });
                                                    print("SELECTTEAM");
                                                    print(selectTeams);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(top: 8.0),
                                                    child: Container(
                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: selectTeams.contains(
                                                                teamController
                                                                    .teams[i].user)
                                                                ? Colors.black
                                                                .withOpacity(0.8)
                                                                : Colors.transparent),
                                                        color:
                                                        Colors.green.withOpacity(.4),
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                teamController
                                                                    .teams[i].name,
                                                                style: const TextStyle(
                                                                  fontSize: 21,
                                                                  fontWeight:
                                                                  FontWeight.w700,
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 20,
                                                                width: 1,
                                                                color: Colors.grey,
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Text(
                                                                teamController.teams[i]
                                                                    .designation,
                                                                style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.phone,
                                                                size: 18,
                                                              ),
                                                              SizedBox(width: 10),
                                                              Text(teamController.teams[i].phone.toString()),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons.mail),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  teamController
                                                                      .teams[i].email,
                                                                  style: const TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                            else
                                              Container()
                                      ],
                                    ),
                                  );
                                }

                              }
                              ),
                            );
                          }),
                    ).then((value) {
                      setState(() {
                        selectTeams;
                      });
                    });
                  },
                  // onTap: () => showModal(context),
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
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
  void _selectItemstatus(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItemstatus = name;
      });
    }
  }
  void _selectItempriority(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItempriority = name;
      });
    }
  }
  void _onButtonPressed() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 260,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 60),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.black,
                      //     ),
                      //     width: 200,
                      //     height: 10,
                      //   ),
                      // ),
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
                  onTap: () => _selectItemstatus("In-progress"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffBFEAF5),
                    ),
                    width: MediaQuery.of(context).size.width! - 10,
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
                            "In-progress",
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
                  onTap: () => _selectItemstatus("To-do"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFE5F1),
                    ),
                    width: MediaQuery.of(context).size.width! - 10,
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
                            "To-do",
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
                  onTap: () => _selectItemstatus("Resolved"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDEF5E5),
                    ),
                    width: MediaQuery.of(context).size.width! - 10,
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
                            "Resolved",
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
              ],
            ),
          );
        });
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
            height: 260,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 60),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.black,
                      //     ),
                      //     width: 200,
                      //     height: 10,
                      //   ),
                      // ),
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
                  onTap: () => _selectItempriority("Low"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffBFEAF5),
                    ),
                    width: MediaQuery.of(context)!.size.width - 10,
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
                            "Low",
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
                  onTap: () => _selectItempriority("Medium"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFE5F1),
                    ),
                    width: MediaQuery.of(context)!.size.width - 10,
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
                            "Medium",
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
                  onTap: () => _selectItempriority("High"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDEF5E5),
                    ),
                    width: MediaQuery.of(context)!.size.width - 10,
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
                            "High",
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
              ],
            ),
          );
        });
  }

}
