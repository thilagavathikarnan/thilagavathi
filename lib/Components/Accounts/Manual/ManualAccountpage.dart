import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Accounts/Automatic/AutomaticAccountspage.dart';
import 'package:habittrackergad/Components/Accounts/Cash/Cashin.dart';
import 'package:habittrackergad/Components/Accounts/Cash/Cashout.dart';
import 'package:habittrackergad/Components/Accounts/Manual/Chart_Manual_account.dart';
import 'package:habittrackergad/Components/Accounts/Manual/ManualAccountyearreport.dart';
import 'package:habittrackergad/Components/Accounts/Manual/Manual_cashbook_report.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/accountController.dart';
import 'package:intl/intl.dart';

// class Cashin {
//   String name = "";
//   String date;
//   String time;
//   String cashin;
//   String cashinadd;
//   String cashoutadd;
//   String Paymenttype;
//
//   Cashin({
//     this.name = "",
//     required this.date,
//     required this.time,
//     required this.cashin,
//     required this.cashinadd,
//     required this.cashoutadd,
//     required this.Paymenttype,
//   });
// }
//
// List<Cashin> CashinList = [
//   Cashin(
//       name: 'salary',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashin: '+ 50,000',
//       cashinadd: "Cash in",
//       cashoutadd: "Cash out",
//       Paymenttype: "Credit"),
//   Cashin(
//       name: 'mill',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashin: '+ 20000',
//       cashinadd: "Cash in",
//       cashoutadd: "Cash out",
//       Paymenttype: "Upi funds transaction"),
//   Cashin(
//       name: 'Car factory',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashin: '+ 1,00,000',
//       cashinadd: "Cash in",
//       cashoutadd: "Cash out",
//       Paymenttype: "Atm"),
//   Cashin(
//       name: 'Bike showroom',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashin: '+ 25,000',
//       cashinadd: "Cash in",
//       cashoutadd: "Cash out",
//       Paymenttype: "Net banking"),
// ];
//
// class Cashout {
//   String name = "";
//   String date;
//   String time;
//   String cashout;
//   String paymenttype;
//
//   Cashout(
//       {this.name = "",
//       required this.date,
//       required this.time,
//       required this.cashout,
//       required this.paymenttype});
// }
//
// List<Cashout> CashoutList = [
//   Cashout(
//       name: 'Emi',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashout: '- 1500',
//       paymenttype: "Credit"),
//   Cashout(
//       name: 'Bike petrol',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashout: '- 2000',
//       paymenttype: "Upi funds transaction"),
//   Cashout(
//       name: 'College fee',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashout: '-2,00,000',
//       paymenttype: "Atm"),
//   Cashout(
//       name: 'Book',
//       date: "27-08-2022",
//       time: "01:50 pm",
//       cashout: '- 500',
//       paymenttype: "Net banking"),
// ];


class ManualAccountpage extends StatefulWidget {
  @override
  _ManualAccountpageState createState() => _ManualAccountpageState();
}

class _ManualAccountpageState extends State<ManualAccountpage>
    with SingleTickerProviderStateMixin {

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate = DateTime.now();
  late TabController _tabController;

  @override
  void initState()
  {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }
  AccountController accountController = Get.put(AccountController());

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

  double? height;
  double? width;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  // final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom = AdvancedCalendarController.custom(DateTime(2022, 10, 23));
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
                  top: 10,
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Manual_cashbook_report()),
                          ),
                          child: Row(
                            children: [
                              // InkWell(
                              //   onTap: () => Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ChartManualaccount()),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(right: 0),
                              //     child: Image.asset(
                              //       "assets/icons/pie-chart.png",
                              //       width: 35,
                              //       height: 35,
                              //     ),
                              //   ),
                              // ),
                              // Image.asset(
                              //   "assets/icons/cashbookreport.logo.png",
                              //   width: 40,
                              //   height: 40,
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ChartManualaccount()))),
            child:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(12),
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
                    Row(
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
                                    borderRadius: BorderRadius.circular(12),
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: AdvancedCalendar(
          //     controller: accountController.calendarControllerToday,
          //     events: events,
          //     startWeekDay: 1,
          //     innerDot: false,
          //     weekLineHeight: 48.0,
          //
          //   ),
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
          // const SizedBox(
          //   height: 20,
          // ),

          // give the tab bar a height [can change hheight to preferred height]

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       width: MediaQuery.of(context).size.width / 2.4,
          //       height: 100,
          //       decoration: const BoxDecoration(
          //         // image: DecorationImage(
          //         //   image: AssetImage("images/"),
          //         //   fit: BoxFit.fitWidth,
          //         //   alignment: Alignment.topCenter,
          //         // ),
          //         color: INCOMECARDCOLOR,
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(12.0),
          //         ),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               Text(
          //                 'Income ',
          //                 style: TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w400,
          //                     color: INCOMEEXPENSESCARDTEXTCOLOR),
          //               ),
          //               SizedBox(
          //                 width: 5,
          //               ),
          //               SizedBox(
          //                 height: 15,
          //                 width: 15,
          //                 child: Image(
          //                   image: AssetImage(
          //                     "assets/icons/Incomearrow.icon.png",
          //                   ),
          //                   color: Colors.white,
          //                 ),
          //               )
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           const Text(
          //             '₹ 1,95,000',
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w900,
          //                 color: INCOMECARDTEXTCOLOR),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: MediaQuery.of(context).size.width / 2.4,
          //       height: 100,
          //       decoration: const BoxDecoration(
          //         color: EXPENSESCARDCOLOR,
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(12.0),
          //         ),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               Text(
          //                 'Expenses ',
          //                 style: TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w400,
          //                     color: INCOMEEXPENSESCARDTEXTCOLOR),
          //               ),
          //               SizedBox(
          //                 width: 5,
          //               ),
          //               SizedBox(
          //                 height: 15,
          //                 width: 15,
          //                 child: Image(
          //                   image: AssetImage(
          //                     "assets/icons/Expansesarrow.logo.png",
          //                   ),
          //                   color: Colors.white,
          //                 ),
          //               )
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           const Text(
          //             '₹ 2,04000',
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w900,
          //                 color: EXPENSECARDTEXTCOLOR),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 10,
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
              accountController.incomeExpenseDate.value = await _selectedDate;
              accountController.getIncomeAndExpenses();
              accountController.getCashOut();
              accountController.getCashIn();

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


          // AdvancedCalendar(
          //   controller: _calendarControllerToday,
          //   events: events,
          //   startWeekDay: 1,
          //   innerDot: false,
          //   weekLineHeight: 48.0,
          //
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text(
              'Today Accounts',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: BLACKCOLOR),
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AutomaticAccountpage()),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 100,
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage("images/"),
                      //   fit: BoxFit.fitWidth,
                      //   alignment: Alignment.topCenter,
                      // ),
                      color: INCOMECARDCOLOR,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Income ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: INCOMEEXPENSESCARDTEXTCOLOR),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
                              child: Image(
                                image: AssetImage(
                                  "assets/icons/Incomearrow.icon.png",
                                ),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '₹ ${accountController.incomeValue}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: INCOMECARDTEXTCOLOR),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AutomaticAccountpage()),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: EXPENSESCARDCOLOR,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Expenses ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: INCOMEEXPENSESCARDTEXTCOLOR),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
                              child: Image(
                                image: AssetImage(
                                  "assets/icons/Expansesarrow.logo.png",
                                ),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '₹ ${accountController.expensesValue}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: EXPENSECARDTEXTCOLOR),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text(
              'Manual cashin & cash out',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w900, color: BLACKCOLOR),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  child: TabBar(
                    controller: _tabController,

                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.green,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Cashin',
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Cashout',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // tab bar view here
          SizedBox(
            height: height = 95 * 4.8,
            child: TabBarView(
              controller: _tabController,
              children: [
                Obx(() {
                  if(accountController.cashInList.isEmpty)
                    {
                      return Container(
                        child: Center(child: Text("No List")),
                      );

                    }
                  else
                    {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                physics:  NeverScrollableScrollPhysics(),
                                itemCount: accountController.cashInList.length,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 25),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border:
                                                  Border.all(color: Colors.grey)),
                                              width: width! - 30,
                                              height: 95,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          accountController.cashInList[index].category_name.toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                        Text("+ "+double.parse(accountController.cashInList[index].amount).toStringAsFixed(2),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: Colors.green)),
                                                      ],
                                                    ),
                                                  ),
                                                  accountController.cashInList[index].paymentMode.toString() == "1"?
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10, bottom: 10),
                                                    child: Text("Online"),
                                                  ):
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10, bottom: 10),
                                                    child: Text("Offline"),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(DateFormat.yMMMEd().format(DateTime.parse(accountController.cashInList[index].date))),
                                                      // Text(accountController.cashInList[index].date),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      // Text(DateFormat.j().format(DateTime.parse(accountController.cashInList[index].date))),
                                                    ],
                                                  )
                                                  // Text(numberList[index].cashType == "cash in" ?Text("cash in ",style: TextStyle(color: numberList[0].cashType =="cash type"? Colors.green:Colors.red),))
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                })),
                          ),
                        ],
                      );
                    }

                  }
                ),
                Obx(() {
                  if(accountController.cashOutList.isEmpty)
                  {
                    return Container(
                      child: Center(child: Text("No List")),
                    );

                  }
                  else
                  {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              physics:  NeverScrollableScrollPhysics(),
                              itemCount: accountController.cashOutList.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.white,
                                                border:
                                                Border.all(color: Colors.grey)),
                                            width: width! - 30,
                                            height: 95,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        accountController.cashOutList[index].category_name.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      Text("- "+double.parse(accountController.cashOutList[index].amount).toStringAsFixed(2),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: Colors.green)),
                                                    ],
                                                  ),
                                                ),
                                                accountController.cashOutList[index].paymentMode.toString() == "1"?
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10, bottom: 10),
                                                  child: Text("Online"),
                                                ):
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10, bottom: 10),
                                                  child: Text("Offline"),
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(DateFormat.yMMMEd().format(DateTime.parse(accountController.cashOutList[index].date))),

                                                    // Text(accountController.cashOutList[index].date),
                                                    // const SizedBox(
                                                    //   width: 10,
                                                    // ),
                                                    // Text(DateFormat.j().format(DateTime.parse(accountController.cashOutList[index].date))),
                                                  ],
                                                )
                                                // Text(numberList[index].cashType == "cash in" ?Text("cash in ",style: TextStyle(color: numberList[0].cashType =="cash type"? Colors.green:Colors.red),))
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                );
                              })),
                        ),
                      ],
                    );
                  }

                }
                ),
                // second tab bar view widget
                // Column(
                //   children: [
                //     Expanded(
                //       child: ListView.builder(
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemCount: CashoutList.length,
                //           itemBuilder: ((context, index) {
                //             return Column(
                //               children: [
                //                 Center(
                //                   child: Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         vertical: 10, horizontal: 25),
                //                     child: Container(
                //                         decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             color: Colors.white,
                //                             border:
                //                                 Border.all(color: Colors.grey)),
                //                         width: width! - 30,
                //                         height: 95,
                //                         child: Column(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Padding(
                //                               padding: const EdgeInsets.all(10),
                //                               child: Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment
                //                                         .spaceBetween,
                //                                 children: [
                //                                   Text(
                //                                     CashoutList[index].name,
                //                                     style: const TextStyle(
                //                                         fontSize: 18,
                //                                         fontWeight:
                //                                             FontWeight.w600),
                //                                   ),
                //                                   Text(
                //                                       CashoutList[index]
                //                                           .cashout,
                //                                       style: const TextStyle(
                //                                           fontSize: 18,
                //                                           fontWeight:
                //                                               FontWeight.w600,
                //                                           color: Colors.red)),
                //                                 ],
                //                               ),
                //                             ),
                //                             Padding(
                //                               padding: const EdgeInsets.only(
                //                                   left: 10, bottom: 10),
                //                               child: Text(CashinList[index]
                //                                   .Paymenttype),
                //                             ),
                //                             Row(
                //                               children: [
                //                                 const SizedBox(
                //                                   width: 10,
                //                                 ),
                //                                 Text(CashoutList[index].date),
                //                                 const SizedBox(
                //                                   width: 10,
                //                                 ),
                //                                 Text(CashoutList[index].time),
                //                               ],
                //                             )
                //                             // Text(numberList[index].cashType == "cash in" ?Text("cash in ",style: TextStyle(color: numberList[0].cashType =="cash type"? Colors.green:Colors.red),))
                //                           ],
                //                         )),
                //                   ),
                //                 ),
                //               ],
                //             );
                //           })),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()
                   async{
                     setState(() {
                       accountController.selectContactName.clear();
                     });

                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Cashinadd(type:"Cash in")),
    );
               },
            child: Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: 60,
            decoration: BoxDecoration(
            gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
            Color(0XFFd0a1d2),
            Color(0XFF3b4682),
            ],
            ),
            borderRadius: BorderRadius.circular(12),
            ),
            child:
             Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Cash in',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: BUTTONTEXTCOLOR)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  async{
                    print("ADVNASDAD");
                    setState(() {
                      accountController.selectContactName.clear();
                    });

                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) => CashoutAdd()),
                      MaterialPageRoute(builder: (context) => Cashinadd(type:"Cash out")),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0XFFd0a1d2),
                          Color(0XFF3b4682),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Cash out',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: BUTTONTEXTCOLOR)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 40,
          ),
          // SizedBox(
          //   height: 300,
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: ListView.builder(
          //               itemCount: Cashbuttonlist.length,
          //               itemBuilder: ((context, index) {
          //                 Cashbutton cashbutton = Cashbuttonlist[index];
          //                 return Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: InkWell(
          //                     onTap: () => Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                         builder: (context) => Cashin_Cashout_Add(
          //                           Cashbuttonlist[index].title,
          //                         ),
          //                       ),
          //                     ),
          //                     child: Container(
          //                       width: 150,
          //                       height: 50,
          //                       color: Colors.amber,
          //                       child: Text(Cashbuttonlist[index].title),
          //                     ),
          //                   ),
          //                 );
          //               }))),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
