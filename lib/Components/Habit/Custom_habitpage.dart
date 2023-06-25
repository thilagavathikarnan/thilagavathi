import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

import '../../Api_providers/api_provider.dart';
import '../../controller/habit_controller.dart';
import '../Task/AssignTask/Assigned_To_You.dart';
import '../Task/AssignTask/Assigned_By_You.dart';
import '../Task/AssignTask/Notify.dart';

class Customhabit extends StatefulWidget {
  @override
  _CustomhabitState createState() => _CustomhabitState();
}

class _CustomhabitState extends State<Customhabit>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  HabitController habitController = Get.put(HabitController());

  late DateTime _selectedDate;
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

  // datepickcalender
  TextEditingController habit_name_controller = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    habitController.getHabit();
    dateInput.text = ""; //datepic calender
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
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
    print("PICKICON");

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
                    top: 20,
                  ),
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
            Text('Custom habits',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Habit Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: habit_name_controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 20,
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
                suffixIcon: Icon(Icons.calendar_today),
                filled: true,
                fillColor: Color(0xffeaf0f6),
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
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
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
                unSelectedDayTextColor: Color(0xff181D31),
                selectedDayTextColor: Color(0xffF7F7F7),
                daysBorderColor: Color.fromARGB(207, 254, 253, 253),
                daysFillColor: Color(0xff2196F3),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                days: _days,
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffbebaec),
                      Color(0xffa9cfe6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xffeaf0f6),
                  ),
                ),
                onSelect: (values) {
                  setState(() {
                    selectDays =values;
                  });
                  print(selectDays);
                  print(values);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text("Goal duration"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Color(0xffedf2e2),
                    onPrimary: Color(0xff6a98e6),
                    onSurface: Color(0xff6a98e6),
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
                        print(_startTime.hour);
                        print(_startTime.minute);
                        print(_startTime.hourOfPeriod);
                        print(_startTime.period.name.toUpperCase());
                        print(_startTime.periodOffset);
                        print(_endTime);
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
                          gradient: LinearGradient(
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
                              style: TextStyle(
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
                        gradient: LinearGradient(
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
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Repeat this habit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),

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
            ),            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
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

            SizedBox(
              height: 40,
            ),
            Obx(()
                {
                  if(habitController.isLoaders.isTrue)
                    {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: APPBACKGROUNDCOLOR),
                          width: width! - 100,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            )
                          ),
                        ),
                      );
                    }
                  else
                    {
                      return Center(
                        child: InkWell(
                          onTap: ()
                          {
                            String shift = morningSelect == true ? "Morning":afternoonSelect == true? "Afternoon":eveningSelect == true ? "Evening" :"Night" ;

                            String habitName = habit_name_controller.text.toString();
                            String duration_start = "${_startTime.hour}:${_startTime.minute}${_startTime.period.name}";
                            String duration_to = "${_endTime.hour}:${_endTime.minute}${_endTime.period.name}";
                            if(habit_name_controller.text.isNotEmpty && duration_start !=null && duration_start !=null && selectDays !=null &&slots != null &&
                                slotType != null &&
                                dateInput.text.isNotEmpty )
                            {
                              habitController.habitUserSave(
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

                            // Navigator.pop(context);

                          },
                          child:
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: APPBACKGROUNDCOLOR),
                            width: width! - 100,
                            height: 50,
                            child: Center(
                              child: Text('Submit',
                                  style: TextStyle(color: BUTTONTEXTCOLOR, fontSize: 18)),
                            ),
                          ),
                        ),
                      );
                    }


                }

            ),

            SizedBox(
              height: 40,
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
