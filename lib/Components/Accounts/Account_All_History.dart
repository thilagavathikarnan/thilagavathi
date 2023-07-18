import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Task/AssignTask/Assigned_To_You.dart';
import 'package:habittrackergad/Components/Task/AssignTask/Assigned_By_You.dart';
import 'package:habittrackergad/Components/Task/AssignTask/Notify.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/accountController.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class Account_All_History extends StatefulWidget {
  const Account_All_History({super.key});

  @override
  State<Account_All_History> createState() => _Account_All_HistoryState();
}

class _Account_All_HistoryState extends State<Account_All_History> {
  late DateTime _selectedDate = DateTime.now();
  // datepickcalender
  TextEditingController dateInput = TextEditingController();
  AccountController accountController = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
    dateInput.text = ""; //datepic calender
    // _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
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

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  final List AccountHolderImages = [
    "assets/images/personimage1.webp",
    "assets/images/personimage2.jpeg",
    "assets/images/personimage3.jpeg",
    "assets/images/personimage4.jpeg",
  ];
  final List AccountHolderName = [
    "Salary",
    "Medical",
    "Office rent",
    "Factory"
  ];
  final List AccountTransationAmount = [
    "₹1,00,000",
    "₹300",
    "₹4000",
    "₹2400",
  ];

  final List AccountPaymentName = [
    "Credit",
    "Upi funds transfer",
    "Atm",
    "Net banking"
  ];
  final List AccountTransationMonth = [
    "February ",
    "April",
    "August",
    "November"
  ];
  final List AccountTransationDate = [
    " 28,2022",
    " 13,2022",
    " 01,2022",
    " 22,2022"
  ];
  final List AccountTransationTime = [
    "at 10:36 AM",
    "at 12:27 PM",
    "at 6:29 PM",
    "at 5:51 AM"
  ];

  double? height;
  double? width;
  // datepick calender......

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                ),
                child: InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios_new_outlined)),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          // AdvancedCalendar(
          //   controller: _calendarControllerToday,
          //   events: events,
          //   startWeekDay: 1,
          //   innerDot: false,
          //   weekLineHeight: 48.0,
          // ),
          // CalendarTimeline(
          //   showYears: false,
          //   initialDate: _selectedDate,
          //   firstDate: DateTime.now(),
          //   lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          //   onDateSelected: (date) => setState(() => _selectedDate = date),
          //   leftMargin: 20,
          //   monthColor: Colors.black,
          //   dayColor: Color(0xFF704a9f),
          //   dayNameColor: Colors.white,
          //   activeDayColor: Colors.white,
          //   activeBackgroundDayColor: Color(0xFF704a9f),
          //   dotsColor: const Color(0xFF333A47),
          //   selectableDayPredicate: (date) => date.day != 23,
          //   locale: 'en',
          // ),
          CalendarTimeline(

            showYears: false,
            initialDate: _selectedDate,
             firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date)
            async {
              setState(()
              {
                _selectedDate = date;
              });
              print("Select Date");
              print(_selectedDate);
              var accountController;
              accountController.incomeExpenseDate.value = await _selectedDate;
              accountController.getIncomeAndExpenses();
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Color(0xFF704a9f),
            dayNameColor: Colors.white,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Color(0xFF704a9f),
            dotsColor: const Color(0xFF333A47),
            // selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',

          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Account History",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            height: 400,
            child: Center(child: Text("List is empty")),
          )
          // Expanded(
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: AccountHolderName.length,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemBuilder: ((context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //                 padding: EdgeInsets.all(8),
          //                 width: width!,
          //                 // height: 80,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(12),
          //                     border: Border.all(color: getColor()),
          //                     color: BUTTONTEXTCOLOR),
          //                 child: Row(
          //                   mainAxisAlignment:
          //                   MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         // SizedBox(
          //                         //   width: 50,
          //                         //   height: 50,
          //                         //   child: CircleAvatar(
          //                         //     radius: 48, // Image radius
          //                         //     backgroundImage: AssetImage(
          //                         //         AccountHolderImages[
          //                         //         index]),
          //                         //   ),
          //                         // ),
          //                         // SizedBox(width: 5,),
          //                         Column(
          //                           crossAxisAlignment:
          //                           CrossAxisAlignment.start,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.center,
          //                           children: [
          //                             Padding(
          //                               padding:
          //                               const EdgeInsets.only(
          //                                   bottom: 5),
          //                               child: Text(
          //                                 AccountHolderName[
          //                                 index],
          //                                 style: const TextStyle(
          //                                     fontSize: 18,
          //                                     fontWeight:
          //                                     FontWeight
          //                                         .w700),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               const EdgeInsets.only(
          //                                   bottom: 5),
          //                               child: Text(
          //                                 AccountPaymentName[
          //                                 index],
          //                                 style: const TextStyle(
          //                                     fontWeight:
          //                                     FontWeight
          //                                         .w600),
          //                               ),
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Text(
          //                                   AccountTransationMonth[
          //                                   index],
          //                                 ),
          //                                 Padding(
          //                                   padding:
          //                                   const EdgeInsets
          //                                       .only(
          //                                       left: 5,
          //                                       right: 5),
          //                                   child: Text(
          //                                       AccountTransationDate[
          //                                       index]),
          //                                 ),
          //                                 Text(
          //                                     AccountTransationTime[
          //                                     index]),
          //                               ],
          //                             ),
          //                           ],
          //                         )
          //                       ],
          //                     ),
          //                     Text(AccountTransationAmount[index],
          //                         style: const TextStyle(
          //                             fontSize: 18,
          //                             fontWeight: FontWeight.w500))
          //                   ],
          //                 )),
          //           );
          //         }))),
          // SizedBox(
          //   height: height = 80 * 6,
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: ListView.builder(
          //               itemCount: AccountHolderName.length,
          //               physics: NeverScrollableScrollPhysics(),
          //               itemBuilder: ((context, index) {
          //                 return Padding(
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 10, horizontal: 20),
          //                   child: Container(
          //                       width: width! - 10,
          //                       height: 80,
          //                       decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(12),
          //                           border: Border.all(color: Colors.grey),
          //                           color: BUTTONTEXTCOLOR),
          //                       child: Padding(
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 10),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Row(
          //                               children: [
          //                                 SizedBox(
          //                                   width: 50,
          //                                   height: 50,
          //                                   child: CircleAvatar(
          //                                     radius: 48, // Image radius
          //                                     backgroundImage: AssetImage(
          //                                         AccountHolderImages[index]),
          //                                   ),
          //                                 ),
          //                                 Padding(
          //                                   padding:
          //                                       const EdgeInsets.only(left: 10),
          //                                   child: Column(
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.center,
          //                                     children: [
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 bottom: 5),
          //                                         child: Text(
          //                                           AccountHolderName[index],
          //                                           style: TextStyle(
          //                                               fontSize: 18,
          //                                               fontWeight:
          //                                                   FontWeight.w700),
          //                                         ),
          //                                       ),
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 bottom: 5),
          //                                         child: Text(
          //                                           AccountPaymentName[index],
          //                                           style: TextStyle(
          //                                               fontWeight:
          //                                                   FontWeight.w600),
          //                                         ),
          //                                       ),
          //                                       Row(
          //                                         children: [
          //                                           Text(
          //                                             AccountTransationMonth[
          //                                                 index],
          //                                           ),
          //                                           Padding(
          //                                             padding:
          //                                                 const EdgeInsets.only(
          //                                                     left: 5,
          //                                                     right: 5),
          //                                             child: Text(
          //                                                 AccountTransationDate[
          //                                                     index]),
          //                                           ),
          //                                           Text(AccountTransationTime[
          //                                               index]),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                             Text(AccountTransationAmount[index],
          //                                 style: TextStyle(
          //                                     fontSize: 18,
          //                                     fontWeight: FontWeight.w500))
          //                           ],
          //                         ),
          //                       )),
          //                 );
          //               }))),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
