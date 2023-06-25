import 'dart:math' as math;
import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class ChartAutomaticaccount extends StatefulWidget {
  const ChartAutomaticaccount({Key? key}) : super(key: key);

  @override
  ChartAutomaticaccountState createState() => ChartAutomaticaccountState();
}

class ChartAutomaticaccountState extends State<ChartAutomaticaccount> {
  final dataMap = <String, double>{
    "Credit": 20,
    "Upi funds transfer": 10,
    "Atm": 40,
    "Net banking": 30,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

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

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  double? height;
  double? width;
  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  DateTime? startDate;
  DateTime? endDate;

  var buttonText = 'Click Me!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_back_ios_new_outlined)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCustomDateRangePicker(
                                          context,
                                          dismissible: true,
                                          minimumDate: new DateTime.now()
                                              .subtract(
                                                  new Duration(days: 2000)),
                                          maximumDate: DateTime.now()
                                              .add(const Duration(days: 0)),
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
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Dec",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const Icon(
                                              Icons.arrow_drop_down_outlined)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : ''} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : 'All transcation'}',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff223faf)),
                            width: 40,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/download.icon.png",
                                  width: 25,
                                  height: 25,
                                  color: BUTTONTEXTCOLOR,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 10,
          ),

          AdvancedCalendar(
            controller: _calendarControllerToday,
            events: events,
            startWeekDay: 1,
            innerDot: false,
            weekLineHeight: 48.0,
          ),
          // CalendarTimeline(
          //   showYears: false,
          //   initialDate: _selectedDate,
          //   firstDate: DateTime.now(),
          //   lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          //   onDateSelected: (date) => setState(() => _selectedDate = date),
          //   leftMargin: 20,
          //   monthColor: Colors.black,
          //   dayColor: Color(0xffA3DA8D),
          //   dayNameColor: Colors.white,
          //   activeDayColor: Colors.white,
          //   activeBackgroundDayColor: Color(0xFF704a9f),
          //   dotsColor: const Color(0xFF333A47),
          //   selectableDayPredicate: (date) => date.day != 23,
          //   locale: 'en',
          // ),
          const SizedBox(
            height: 20,
          ),

          // give the tab bar a height [can change hheight to preferred height]
          // Padding(
          //   padding: const EdgeInsets.only(left: 20),
          //   child: Text(
          //     " Automatic Account Transactions",
          //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 90,
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
                    const Text(
                      '₹ 2,50,000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: INCOMECARDTEXTCOLOR),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 90,
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
                    const Text(
                      '₹ 6,700',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: EXPENSECARDTEXTCOLOR),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor:
                  Color.fromARGB(255, 235, 143, 143)!.withOpacity(0.15),
              colorList: colorList,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              totalValue: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Non-budgeted categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/Creditlogo.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Credit"),
                        )
                      ],
                    ),
                    Text("₹2,50,000",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/Creditlogo.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Debit"),
                        )
                      ],
                    ),
                    Text("₹6,700",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/upi.logo.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Upi funds transfer"),
                        )
                      ],
                    ),
                    Text("₹300", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/Atm.logo.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Atm"),
                        )
                      ],
                    ),
                    Text("₹4000", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                "assets/icons/Netbanking.logo.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Net banking",
                          ),
                        )
                      ],
                    ),
                    Text("₹2400", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
