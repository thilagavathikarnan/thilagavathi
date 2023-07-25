import 'dart:math';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Components/Home/Homepage.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:simple_chips_input/simple_chips_input.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

import '../../controller/teamController.dart';
import 'AssignTask/Assigned_To_You.dart';
import 'AssignTask/Assigned_By_You.dart';

class Addtasknew extends StatefulWidget {
  @override
  State<Addtasknew> createState() => _AddtasknewState();
}

class _AddtasknewState extends State<Addtasknew> {
  //////////////////////contact
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  TeamController teamController = Get.put(TeamController());
  var selectTeams = [];
  var selectTeamsNotify = [];

  @override
  void initState() {
    super.initState();

    _fetchContacts();

    dateInput.text = "selct";

    _resetSelectedDate();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  //////////////////contact
  late DateTime _selectedDate;

  // datepickcalender

  TextEditingController dateInput = TextEditingController();
  TextEditingController Title = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController sub_taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var taskSatus;
  var taskPriority;

  DateTime? startDate;
  DateTime? endDate;

  var buttonText = 'Click Me!';

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  Future<void> getContactsList() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts();
      print('The List Of Contacts List $contacts');
    }
  }

  final random = Random();
  static List<Color> listColors = const [
    Color(0xffD8D9CF),
    Color(0xff27E1CE),
    Color(0xffFF98DA),
    Color(0xffFDFF8F),
    Color(0xffD8D9CF),
    Color(0xff8DED8E),
    Color(0xff0bebed),
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

  @override
  void dispose() {
    super.dispose();
  }

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  bool TaskisVisible = true;
  bool ChipisVisible = false;

  String _selectedstatus = 'In-progress';
  List<String> _itemsstatus = [
    'To-do',
    'Resolved',
  ];

  String _selectedpriority = 'Low';
  List<String> _itemspriority = [
    'Medium',
    'High',
  ];

  String output = '';
  String? deletedChip, deletedChipIndex;
  final keySimpleChipsInput = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final TextFormFieldStyle style = const TextFormFieldStyle(
    keyboardType: TextInputType.text,
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0.0),
      border: InputBorder.none,
    ),
  );

  String _selectedItemstatus = "In-progress";
  String _selectedItempriority = "Low";

  bool isselected = true;

  bool value3 = false;

  final List<String> Subtask = <String>[];

  TextEditingController SubtaskController1 = TextEditingController();

  void addItemToListSubtask() {
    setState(() {
      Subtask.insert(
        0,
        SubtaskController1.text,
      );

      SubtaskController1.clear();
      // msgCount.insert(0, 0);
    });
  }

  String _selected = '';
  List<String> _items = ['A', 'B', 'C', 'D'];
  int? ctxx;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                  )),

              const SizedBox(
                height: 30,
              ),
              const Text('Add task',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('Task name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),

                  // InkWell(
                  //     onTap: (() {
                  //       setState(() {
                  //         // TaskisVisible = !TaskisVisible;
                  //       });
                  //     }),
                  //     child: Icon(
                  //       Icons.edit,
                  //       size: 20,
                  //     ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: taskController,
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
                height: 30,
              ),
              const Text('Subtask',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: sub_taskController,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        addItemToListSubtask();
                      },
                      child: const Icon(Icons.send)),
                  labelText: "Add subtask",
                  filled: true,
                  fillColor: const Color(0xffeaf0f6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),

              SizedBox(
                height: 50,
                child: ListView.separated(
                    itemCount: Subtask.length,
                    controller: ScrollController(),
                    separatorBuilder: (_, __) => const SizedBox(height: 25),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${Subtask[index]}',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: TASKPAGEVIEWTEXTCOLOR),
                            ),
                            // Checkbox(
                            //   value: this.value3,
                            //   onChanged: (bool? value) {
                            //     setState(() {
                            //       this.value3 = value!;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      );
                    }),
              ),

              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text('Description',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Status',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: (() => _onButtonPressed()),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffeaf0f6)),
                        width: width! - 130,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                _selectedItemstatus,
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Priority',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: (() => _onButtonPressed2()),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffeaf0f6)),
                        width: width! - 130,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                _selectedItempriority,
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
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Projects',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
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
                                                          teamController.selectProject.value = teamController.projects[index].id;
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
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        SizedBox(
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      child: Image
                                                                          .asset(
                                                                        ASSIGNTOYOU,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  for (int i = 0; i < teamController.projects[index].teamList.length; i++)
                                                                    Padding(
                                                                      padding: EdgeInsets.all(4.0),
                                                                      child: SizedBox(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        child:
                                                                            TextAvatar(
                                                                          textColor:
                                                                              Colors.white,
                                                                          shape:
                                                                              Shape.Circular,
                                                                          text:
                                                                              "${teamController.projects[index].teamList[i].name}",
                                                                          fontSize:
                                                                              14,
                                                                          numberLetters:
                                                                              2,
                                                                        ),
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
                                color: BUTTONTEXTCOLOR,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Add',
                                    style: TextStyle(
                                        color: BUTTONTEXTCOLOR,
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
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('Assign',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    selectTeams.isNotEmpty
                        ? Text('( ${selectTeams.length} team selected )',
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
                                                      getColor().withOpacity(.4),
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
                                                                .teams[i].phone),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              MAIL_ICON,
                                                              height: 25,
                                                              width: 25,
                                                            ),
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
                                                      getColor().withOpacity(.4),
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
                                                                .teams[i].phone),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              MAIL_ICON,
                                                              height: 25,
                                                              width: 25,
                                                            ),
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
                        // Get.defaultDialog(
                        //
                        //     title:"Select Teams ( ${selectTeams.length} )",
                        //
                        //     content: Container(
                        //       height: 500,
                        //       child: ListView(
                        //         children: [
                        //           for(int i = 0;i <teamController.teams.length;i++)
                        //             InkWell(
                        //               onTap: ()
                        //               {
                        //                 setState(() {
                        //                   if (selectTeams.contains(teamController.teams[i].id)) {
                        //                     selectTeams.remove(teamController.teams[i].id);
                        //                   } else {
                        //                     selectTeams.add(teamController.teams[i].id);
                        //                   }
                        //                 });
                        //                 print("SELECTTEAM");
                        //                 print(selectTeams);
                        //               },
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Container(
                        //
                        //                   decoration: BoxDecoration(
                        //                     border: Border.all(
                        //                       color: selectTeams.contains(teamController.teams[i].id)?
                        //                           Colors.black.withOpacity(0.8):Colors.transparent
                        //                     ),
                        //                     color: getColor().withOpacity(.4),
                        //                     borderRadius: BorderRadius.circular(8),
                        //                   ),
                        //                   child: Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Row(
                        //                         children: [
                        //                           Padding(
                        //                             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //                             child: Text(
                        //                               teamController.teams[i].name,
                        //                               style: const TextStyle(
                        //                                 fontSize: 21,
                        //                                 fontWeight: FontWeight.w700,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Container(
                        //                             height: 20,
                        //                             width: 1,
                        //                             color: Colors.grey,
                        //                           ),
                        //                           const SizedBox(width: 10),
                        //                           Text(
                        //                             teamController.teams[i].designation,
                        //                             style: const TextStyle(
                        //                               fontSize: 14,
                        //                               fontWeight: FontWeight.w400,
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        //                         child: Row(
                        //                           children: [
                        //                             Icon(
                        //                               Icons.phone,
                        //                               size: 18,
                        //                             ),
                        //                             SizedBox(width: 10),
                        //                             Text(teamController.teams[i].phone),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        //                         child: Row(
                        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                           children: [
                        //                             Row(
                        //                               children: [
                        //                                 Padding(
                        //                                   padding: const EdgeInsets.only(left: 0.2),
                        //                                   child: Image.asset(
                        //                                     MAIL_ICON,
                        //                                     height: 25,
                        //                                     width: 25,
                        //                                   ),
                        //                                 ),
                        //                                 Padding(
                        //                                   padding: const EdgeInsets.only(right: 0),
                        //                                   child: Text(
                        //                                     teamController.teams[i].email,
                        //                                     style: const TextStyle(
                        //                                       fontSize: 16,
                        //                                       overflow: TextOverflow.ellipsis,
                        //                                       fontWeight: FontWeight.w400,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //         ],
                        //       ),
                        //     )
                        //
                        // );
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
                                color: BUTTONTEXTCOLOR,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Add',
                                    style: TextStyle(
                                        color: BUTTONTEXTCOLOR,
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
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notify',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    selectTeamsNotify.isNotEmpty
                        ? Text('( ${selectTeamsNotify.length} team selected )',
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
                                  Text(
                                      "Select Teams ( ${selectTeamsNotify.length} )"),
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
                                                      color:
                                                      getColor().withOpacity(.4),
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
                                                                .teams[i].phone),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              MAIL_ICON,
                                                              height: 25,
                                                              width: 25,
                                                            ),
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
                                                      color:
                                                      getColor().withOpacity(.4),
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
                                                                .teams[i].phone),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              MAIL_ICON,
                                                              height: 25,
                                                              width: 25,
                                                            ),
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
                            selectTeamsNotify;
                          });
                        });
                        // Get.defaultDialog(
                        //
                        //     title:"Select Teams ( ${selectTeamsNotify.length} )",
                        //
                        //     content: Container(
                        //       height: 500,
                        //       child: ListView(
                        //         children: [
                        //           for(int i = 0;i <teamController.teams.length;i++)
                        //             InkWell(
                        //               onTap: ()
                        //               {
                        //                 setState(() {
                        //                   if (selectTeamsNotify.contains(teamController.teams[i].id)) {
                        //                     selectTeamsNotify.remove(teamController.teams[i].id);
                        //                   } else {
                        //                     selectTeamsNotify.add(teamController.teams[i].id);
                        //                   }
                        //                 });
                        //                 print("SELECTTEAM");
                        //                 print(selectTeamsNotify);
                        //               },
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Container(
                        //
                        //                   decoration: BoxDecoration(
                        //                     border: Border.all(
                        //                         color: selectTeamsNotify.contains(teamController.teams[i].id)?
                        //                         Colors.black.withOpacity(0.8):Colors.transparent
                        //                     ),
                        //                     color: getColor().withOpacity(.4),
                        //                     borderRadius: BorderRadius.circular(8),
                        //                   ),
                        //                   child: Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Row(
                        //                         children: [
                        //                           Padding(
                        //                             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //                             child: Text(
                        //                               teamController.teams[i].name,
                        //                               style: const TextStyle(
                        //                                 fontSize: 21,
                        //                                 fontWeight: FontWeight.w700,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Container(
                        //                             height: 20,
                        //                             width: 1,
                        //                             color: Colors.grey,
                        //                           ),
                        //                           const SizedBox(width: 10),
                        //                           Text(
                        //                             teamController.teams[i].designation,
                        //                             style: const TextStyle(
                        //                               fontSize: 14,
                        //                               fontWeight: FontWeight.w400,
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        //                         child: Row(
                        //                           children: [
                        //                             Icon(
                        //                               Icons.phone,
                        //                               size: 18,
                        //                             ),
                        //                             SizedBox(width: 10),
                        //                             Text(teamController.teams[i].phone),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        //                         child: Row(
                        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                           children: [
                        //                             Row(
                        //                               children: [
                        //                                 Padding(
                        //                                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        //                                   child: Image.asset(
                        //                                     MAIL_ICON,
                        //                                     height: 25,
                        //                                     width: 25,
                        //                                   ),
                        //                                 ),
                        //                                 Padding(
                        //                                   padding: const EdgeInsets.only(right: 20),
                        //                                   child: Text(
                        //                                     teamController.teams[i].email,
                        //                                     style: const TextStyle(
                        //                                       fontSize: 16,
                        //                                       fontWeight: FontWeight.w400,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //         ],
                        //       ),
                        //     )
                        //
                        // );
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
                                color: BUTTONTEXTCOLOR,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Add',
                                    style: TextStyle(
                                        color: BUTTONTEXTCOLOR,
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
              ),

              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: ChipisVisible,
                child: SimpleChipsInput(
                  separatorCharacter: ",",
                  focusNode: focusNode,
                  validateInput: true,
                  // autoFocus: true,
                  formKey: keySimpleChipsInput,
                  textFormFieldStyle: style,

                  onSubmitted: (p0) {
                    setState(() {
                      output = p0;
                    });
                  },
                  onChipDeleted: (p0, p1) {
                    setState(() {
                      deletedChip = p0;
                      deletedChipIndex = p1.toString();
                    });
                  },
                  onSaved: ((p0) {
                    setState(() {
                      output = p0;
                    });
                  }),
                  chipTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  deleteIcon: const Icon(
                    Icons.delete,
                    size: 14.0,
                    color: Colors.black,
                  ),
                  widgetContainerDecoration: BoxDecoration(
                    color: const Color(0xffeaf0f6),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipContainerDecoration: BoxDecoration(
                    color: getColor(),
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  placeChipsSectionAbove: false,
                ),
              ),
              // MaterialButton(
              //   color: Colors.blue,
              //   onPressed: (() {
              //     keySimpleChipsInput.currentState!.save();
              //   }),
              //   child: const Text(
              //     'Submit',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               showCustomDateRangePicker(
              //                 context,
              //                 dismissible: true,
              //                 minimumDate: new DateTime.now()
              //                     .subtract(new Duration(days: 2000)),
              //                 maximumDate:
              //                     DateTime.now().add(const Duration(days: 0)),
              //                 endDate: endDate,
              //                 startDate: startDate,
              //                 onApplyClick: (start, end) {
              //                   setState(() {
              //                     buttonText =
              //                         '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : ''}';
              //                     endDate = end;
              //                     startDate = start;
              //                   });
              //                 },
              //                 onCancelClick: () {
              //                   setState(() {
              //                     endDate = null;
              //                     startDate = null;
              //                   });
              //                 },
              //               );
              //             },
              //             child: Row(
              //               children: [
              //                 const Text(
              //                   "Dec",
              //                   style: TextStyle(
              //                       fontSize: 16, fontWeight: FontWeight.w800),
              //                 ),
              //                 const Icon(Icons.arrow_drop_down_outlined)
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       Text(
              //         '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : ''} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : 'All transcation'}',
              //       )
              //     ],
              //   ),
              // ),

              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     color: const Color(0xffeaf0f6),
              //   ),
              //   width: width! - 20,
              //   height: 70,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             Text("Due date"),
              //             SizedBox(
              //               width: 180,
              //               child: TextField(
              //                 controller: dateInput,
              //                 //editing controller of this TextField
              //                 decoration: InputDecoration(
              //                   prefixIcon: const Icon(Icons.calendar_today),
              //                   filled: true,
              //                   fillColor:
              //                       const Color.fromARGB(255, 255, 255, 255),
              //                   border: OutlineInputBorder(
              //                       borderRadius: BorderRadius.circular(12),
              //                       borderSide: BorderSide.none),
              //                 ),
              //                 readOnly: true,

              //                 //set it true, so that user will not able to edit text
              //                 onTap: () {
              //                   showCustomDateRangePicker(
              //                     context,
              //                     dismissible: true,
              //                     minimumDate: new DateTime.now()
              //                         .subtract(new Duration(days: 2000)),
              //                     maximumDate: DateTime.now()
              //                         .add(const Duration(days: 0)),
              //                     endDate: endDate,
              //                     startDate: startDate,
              //                     onApplyClick: (start, end) {
              //                       setState(() {
              //                         buttonText =
              //                             '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : ''}';
              //                         endDate = end;
              //                         startDate = start;
              //                       });
              //                     },
              //                     onCancelClick: () {
              //                       setState(() {
              //                         endDate = null;
              //                         startDate = null;
              //                       });
              //                     },
              //                   );
              //                   Text(
              //                     '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : ''} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : 'All transcation'}',
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //         InkWell(
              //           onTap: (() {
              //             setState(() {
              //               dateInput.clear();
              //             });
              //           }),
              //           child: Container(
              //             decoration: BoxDecoration(
              //               gradient: const LinearGradient(
              //                 begin: Alignment.topRight,
              //                 end: Alignment.bottomLeft,
              //                 colors: [
              //                   Color(0xff59d6f9),
              //                   Color(0xff7f85f1),
              //                 ],
              //               ),
              //               borderRadius: BorderRadius.circular(12),
              //             ),
              //             width: 40,
              //             height: 40,
              //             child: const Center(
              //                 child: Icon(
              //               Icons.cancel,
              //               color: Colors.white,
              //             )),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                // width: width! - 30,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffeaf0f6),
                ),
                child: Row(
                  children: [
                    Text("Due date"),
                    Container(
                      // width: 210,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showCustomDateRangePicker(
                                  context,
                                  dismissible: true,
                                  minimumDate: new DateTime.now(),
                                  maximumDate: DateTime.now()
                                      .add(const Duration(days: 3000)),
                                  endDate: endDate,
                                  startDate: startDate,
                                  onApplyClick: (start, end) {
                                    setState(() {
                                      buttonText =
                                          '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : ''}';
                                      endDate = end;
                                      startDate = start;
                                    });
                                  },
                                  onCancelClick: () {
                                    setState(() {
                                      endDate = null;
                                      startDate = null;
                                    });
                                  },
                                );
                              },
                              icon: Icon(Icons.calendar_today)),
                          Text(
                            '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : ''} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : 'Select date'}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    String taskName = taskController.text.toString();
                    String subTaskName = sub_taskController.text.toString();
                    String description = descriptionController.text.toString();
                    print("ADD TASK");
                    print(taskController.text.toString());
                    print(sub_taskController.text.toString());
                    print(descriptionController.text.toString());
                    print(selectTeams);
                    print(selectTeamsNotify);
                    print(_selectedItemstatus);
                    print(_selectedItempriority);
                    print(_selectedDate);
                    if (_selectedDate != null &&
                        _selectedItemstatus.isNotEmpty &&
                        _selectedItempriority.isNotEmpty &&
                        taskController.text.isNotEmpty &&
                        sub_taskController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        selectTeams.isNotEmpty &&
                        selectTeamsNotify.isNotEmpty) {
                      teamController.taskAdd(
                          taskName,
                          description,
                          subTaskName,
                          selectTeams,
                          selectTeamsNotify,
                          startDate,
                          endDate,
                          _selectedItempriority,
                          _selectedItemstatus);
                    } else {
                      Get.snackbar("Alert", "Please enter all the fields",
                          backgroundColor: Colors.black.withOpacity(0.4),
                          colorText: Colors.white,
                          icon: Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffebd1ff),
                            Color(0xffa371f3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: width! - 100,
                      height: 50,
                      child: teamController.isTeamSaveLoaders.isTrue
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ))
                          : Center(
                              child: Text('Submit',
                                  style: TextStyle(
                                      color: Color(0xfffaf9fb), fontSize: 18)),
                            ),
                    );
                  }),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //
              // -------------
              // Example end
              //
            ],
          ),
        ),
      ),
    );
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
                  onTap: () => _selectItemstatus("In-progress"),
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

  void _selectItemstatus(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItemstatus = name;
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
            height: 260,
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
                  onTap: () => _selectItempriority("Low"),
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

  void _selectItempriority(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItempriority = name;
      });
    }
  }

  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:--";
    return "${time.hour}:${time.minute}";
  }

  ///////////////////////////////////////contact

  void showModal(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          if (_permissionDenied)
            return Center(child: Text('Permission denied'));
          if (_contacts == null)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: _contacts!.length,
              itemBuilder: (context, i) => ListTile(
                  title: Text(_contacts![i].displayName),
                  onTap: () async {
                    final fullContact =
                        await FlutterContacts.getContact(_contacts![i].id);
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ContactPage(fullContact!)));
                  }));
        });
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;

  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('First name: ${contact.name.first}'),
          Text('Last name: ${contact.name.last}'),
          Text(
              'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
          Text(
              'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
        ]),
      ));
}
