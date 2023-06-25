import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

import '../../controller/habit_controller.dart';
import '../Task/AssignTask/Assigned_To_You.dart';
import '../Task/AssignTask/Assigned_By_You.dart';
import '../Task/AssignTask/Notify.dart';

class Alltask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Dayschedule;
  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;

  Alltask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.Dayschedule,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy});
}

List<Alltask> Alltasklist = [
  Alltask(
      Taskname: "Hand writting",
      Taskdescription: "Meditation,yoga",
      Date: "26/06/2022",
      Dayschedule: "Morning",
      TimeScheduleFromtime: "09-35.am   -",
      TimeScheduleTotime: "  1-55.pm",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav"),
  Alltask(
      Taskname: "Hand writting",
      Taskdescription: "Meditation,yoga",
      Date: "26/06/2022",
      Dayschedule: "Morning",
      TimeScheduleFromtime: "09-35.am   -",
      TimeScheduleTotime: "  1-55.pm",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav"),
  Alltask(
      Taskname: "Hand writting",
      Taskdescription: "Meditation,yoga",
      Date: "26/06/2022",
      Dayschedule: "Morning",
      TimeScheduleFromtime: "09-35.am   -",
      TimeScheduleTotime: "  1-55.pm",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav"),
  Alltask(
      Taskname: "Hand writting",
      Taskdescription: "Meditation,yoga",
      Date: "26/06/2022",
      Dayschedule: "Morning",
      TimeScheduleFromtime: "09-35.am   -",
      TimeScheduleTotime: "  1-55.pm",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav"),
];

class Morning {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;
  String Habitaddschedule;

  Morning({
    this.HabitImage = "",
    required this.HabitName,
    required this.Habitadddate,
    required this.Habitaddtime,
    required this.Habitaddschedule,
  });
}

List<Morning> MorningList = [
  Morning(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Morning(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Morning(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Morning(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
];

class Afternoon {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;
  String Habitaddschedule;

  Afternoon({
    this.HabitImage = "",
    required this.HabitName,
    required this.Habitadddate,
    required this.Habitaddtime,
    required this.Habitaddschedule,
  });
}

List<Afternoon> AfternoonList = [
  Afternoon(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Afternoon(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Afternoon(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Afternoon(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
];

class Evening {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;
  String Habitaddschedule;

  Evening({
    this.HabitImage = "",
    required this.HabitName,
    required this.Habitadddate,
    required this.Habitaddtime,
    required this.Habitaddschedule,
  });
}

List<Evening> EveningList = [
  Evening(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Evening(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Evening(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
  Evening(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      Habitaddschedule: "morning"),
];

class Addhabitsintrent extends StatefulWidget {
  String id;
  String title;
  String Subtitle;
  //  String Habitintrendtitle;
  // String HabitintrendSubtitle;

  Addhabitsintrent(
    this.id,
    this.title,
    this.Subtitle,
  );
  // Addhabitsfirst(String HabitintrendSubtitle,String Habitintrendtitle );

  @override
  _AddhabitsintrentState createState() => _AddhabitsintrentState();
}

class _AddhabitsintrentState extends State<Addhabitsintrent>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate;
  String? shiftSelect;
  // datepickcalender
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
  HabitController habitController = Get.put(HabitController());

  // late DateTime _selectedDate;
  var selectDays;
  var slotType;
  var slots;
  bool morningSelect = false;
  bool afternoonSelect = false;
  bool eveningSelect = false;
  bool nightSelect = false;
  bool monthlySelect = false;
  bool weeklySelect = false;
  bool yearlySelect = false;

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
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

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Icon? _icon;

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
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            Text(widget.Subtitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            // Text('Custom habits',
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Text('Habit Name',
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: const BorderSide(
            //             color: Color.fromARGB(255, 255, 255, 255))),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                    onPressed: _pickIcon,
                    child: const Text('IconPicker'),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Card(
                    elevation: 2,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white60,
                        ),
                        width: 40,
                        height: 40,
                        child: _icon ?? Container()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(

                // height: MediaQuery.of(context).size.width / 4,
                child: Center(
                    child: TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text = formattedDate; //set output date to TextField value.
                  });
                } else {}

              },
            ))),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: SelectWeekDays(
                unSelectedDayTextColor: const Color(0xff181D31),
                selectedDayTextColor: const Color(0xffF7F7F7),
                daysBorderColor: const Color.fromARGB(207, 254, 253, 253),
                daysFillColor: const Color(0xff2196F3),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                days: _days,
                boxDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffbebaec),
                      Color(0xffa9cfe6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: const Color(0xffeaf0f6),
                  ),
                ),
                onSelect: (values) {
                  selectDays =values;
                  print(values);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text("Goal duration"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: const Color(0xffedf2e2),
                    onPrimary: const Color(0xff6a98e6),
                    onSurface: const Color(0xff6a98e6),
                  ),
                  onPressed: () => TimeRangePicker.show(
                    context: context,
                    unSelectedEmpty: true,
                    startTime: TimeOfDay(
                        hour: _startTime.hour, minute: _startTime.minute),
                    endTime:
                        TimeOfDay(hour: _endTime.hour, minute: _endTime.minute),
                    onSubmitted: (TimeRangeValue value) {
                      setState(() {
                        _startTime = value.startTime!;
                        _endTime = value.endTime!;
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffdce1ed),
                              Color(0xffdfe2ef),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text("From : ${_timeFormated(_startTime)}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffdce1ed),
                            Color(0xffdfe2ef),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("To : ${_timeFormated(_endTime)}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Repeat this habit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width / 4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: const Color(0xfffee0e2),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Weekly",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width / 4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: const Color(0xffffe5bf),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Monthly",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width / 4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: const Color(0xffcbebe4),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Yearly",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slotType = "Weekly";
                      weeklySelect = true;
                      monthlySelect = false;
                      yearlySelect = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: weeklySelect == true? Colors.black:Colors.transparent
                      ),
                    ),

                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xfffee0e2),
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Weekly",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slotType = "Monthly";
                      monthlySelect = true;
                      yearlySelect = false;
                      weeklySelect = false;

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: monthlySelect == true? Colors.black:Colors.transparent
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffffe5bf),
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Monthly",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slotType = "Yearly";
                      yearlySelect = true;
                      monthlySelect = false;
                      weeklySelect = false;

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: yearlySelect == true? Colors.black:Colors.transparent
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffcbebe4),
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Yearly",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Do it at',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slots = "Morning";
                      morningSelect = true;
                      eveningSelect = false;
                      afternoonSelect = false;
                      nightSelect =false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: morningSelect == true? Colors.black:Colors.transparent
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2.4,

                      decoration: BoxDecoration(
                        color: Color(0xffb28bc7),

                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Morning",
                            style: TextStyle(
                              color: BUTTONTEXTCOLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slots = "Afternoon";
                      morningSelect = false;
                      eveningSelect = false;
                      afternoonSelect = true;
                      nightSelect =false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: afternoonSelect == true? Colors.black:Colors.transparent
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2.4,

                      decoration: BoxDecoration(
                        color: Color(0xff59e6ee),

                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Afternoon",
                            style: TextStyle(
                              color: BUTTONTEXTCOLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
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
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slots = "Evening";
                      morningSelect = false;
                      eveningSelect = true;
                      afternoonSelect = false;
                      nightSelect =false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: eveningSelect == true? Colors.black:Colors.transparent
                      ),
                    ),

                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      // height: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffdce1ed),
                            Color(0xffdfe2ef),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Evening",
                            style: TextStyle(
                              color: BUTTONTEXTCOLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      slots = "Night";
                      morningSelect = false;
                      eveningSelect = false;
                      afternoonSelect = false;
                      nightSelect =true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                          color: nightSelect == true? Colors.black:Colors.transparent
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2.4,

                      decoration: BoxDecoration(
                          color: Color(0xffb28bc7),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Text("Night",
                            style: TextStyle(
                              color: BUTTONTEXTCOLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2.4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: const Color(0xffb28bc7),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Morning",
            //             style: TextStyle(
            //               color: BUTTONTEXTCOLOR,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2.4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: const Color(0xff59e6ee),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Afternoon",
            //             style: TextStyle(
            //               color: BUTTONTEXTCOLOR,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2.4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         gradient: const LinearGradient(
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //           colors: [
            //             Color(0xffdce1ed),
            //             Color(0xffdfe2ef),
            //           ],
            //         ),
            //         borderRadius: BorderRadius.circular(8),
            //         // border: Border.all(color: Colors.grey)
            //       ),
            //       child: const Center(
            //         child: Text("Evening",
            //             style: TextStyle(
            //               color: BUTTONTEXTCOLOR,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2.4,
            //       height: 50,
            //       decoration: BoxDecoration(
            //           color: const Color(0xffb28bc7),
            //           borderRadius: BorderRadius.circular(8),
            //           border: Border.all(color: Colors.grey)),
            //       child: const Center(
            //         child: Text("Night",
            //             style: TextStyle(
            //               color: BUTTONTEXTCOLOR,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //             )),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 50,
            ),
            Obx(()
            {
              if(habitController.isHabitLoaders.value == true)
                {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: APPBACKGROUNDCOLOR),
                    width: width! - 100,
                    height: 50,
                    child: const Center(
                        child:CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        )
                    ),
                  );
                }
              else
                {
                  return InkWell(
                    onTap: ()
                    {
                      print("object Gets");
                      print(dateInput.text);
                      String shift = morningSelect == true ? "Morning":afternoonSelect == true? "Afternoon":eveningSelect == true ? "Evening" :"Night" ;
                      String habitName = widget.title.toString();
                      String duration_start = "${_startTime.hour}:${_startTime.minute}${_startTime.period.name}";
                      String duration_to = "${_endTime.hour}:${_endTime.minute}${_endTime.period.name}";
                      print(duration_start);
                      print(slots);
                      print(selectDays);
                      print(dateInput.text.toString());
                      print(slotType);


                      if( shift.isNotEmpty && duration_start !=null && duration_start !=null && selectDays !=null &&slots != null &&
                          slotType != null &&
                          dateInput.text.isNotEmpty )
                      {
                        habitController.habitRequest(
                            habitName,
                            duration_start,
                            duration_to,
                            selectDays,
                            slots,
                            slotType,
                            dateInput.text.toString(),
                            shift

                        );
                      }
                      else
                      {
                        Get.snackbar("Alert", "Pleae enter all the fields",
                            backgroundColor: Colors.black.withOpacity(0.8),
                            colorText: Colors.white,
                            icon: Icon(Icons.warning,color: Colors.white,),
                            snackPosition: SnackPosition.BOTTOM
                        );
                      }
                    },
                    child:
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: APPBACKGROUNDCOLOR),
                      width: width! - 100,
                      height: 50,
                      child: const Center(
                        child: Text('Submit',
                            style: TextStyle(color: BUTTONTEXTCOLOR, fontSize: 18)),
                      ),
                    ),
                  );
                }
            }),


            const SizedBox(
              height: 50,
            ),
            //
            // -------------
            // Example end
            //
          ],
        ),
      ),
    );
  }

  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:--";
    return "${time.hour}:${time.minute}";
  }
}
