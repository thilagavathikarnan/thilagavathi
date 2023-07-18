import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:habittrackergad/Components/Habit/Custom_habitpage.dart';
import 'package:habittrackergad/Components/Habit/Customhabityearreport.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Beaninterestingperson.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Beforesleeproutine.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Budgetmoney.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Ease_stress.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Eat&drinkhealthily.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Essential_habits.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Exploreyournewself.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Gainself_discipline.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Getthrouughquarantine.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Goodmorning.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Habit_in_trend.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Keepactive&getfit.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Leisuremoments.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Masterproductivity.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Stayconnected.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Strongermind.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Tidylife.dart';
import 'package:habittrackergad/Components/Habit/Habit_collection/Treasurepettime.dart';
import 'package:habittrackergad/Components/Habit/Habit_report.dart';

import 'package:habittrackergad/Utils/Constants.dart';

import '../../controller/habit_controller.dart';
import '../../model/habits_model.dart';
import '../Accounts/Manual/ManualAccountyearreport.dart';

class Habitname {
  String title;
  String Subtitle;

  Habitname({required this.title, required this.Subtitle});
}

List<Habitname> habitnamelist = [
  Habitname(
      title: "Habits in trend", Subtitle: "Keep up the pace with the world"),
  Habitname(
      title: "Essential habits",
      Subtitle: "Refresh your life with simple acts"),
  Habitname(
      title: "Eat & drink healthily",
      Subtitle: "Stay healthy with daily intakes"),
  Habitname(title: "Keep active & get fit", Subtitle: "Sweet never lies"),
  Habitname(title: "Ease stress", Subtitle: "Your efforts deserve a break"),
  Habitname(
      title: "Gainself_discipline", Subtitle: "Let yourself manage yourself"),
  Habitname(
      title: "Good morning", Subtitle: "In the morning light,do what's right"),
  Habitname(
      title: "Before sleep routine",
      Subtitle: "May your dream be sweet tonight"),
  Habitname(
      title: "Master productivity",
      Subtitle: "Be strategic with your efforts and time"),
  Habitname(title: "Tidy life", Subtitle: "Everything has its own place"),
  Habitname(title: "Leisure moments", Subtitle: "Live your life to the max"),
  Habitname(title: "Stay connected", Subtitle: "Caring and sharing"),
  Habitname(
      title: "Explore your new self", Subtitle: "Discover your inner peace"),
  Habitname(
      title: "Stronger mind",
      Subtitle: "What doesn't kill you makes you stronger"),
  Habitname(
      title: "Be an interesting person",
      Subtitle: "End boring and start charming"),
  Habitname(title: "Budget money", Subtitle: "Give every dollar a job"),
  Habitname(title: "Treasure pet time", Subtitle: "Love to be needed"),
  Habitname(
      title: "Get through quarantine",
      Subtitle: "Be alone without being lonely"),
];

class Morning {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  Morning(
      {this.HabitImage = "",
      required this.HabitName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<Morning> MorningList = [
  Morning(
      HabitName: 'Walking',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  Morning(
      HabitName: 'Exercise',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  Morning(
      HabitName: 'Yoga',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  Morning(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
];

class Afternoon {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  Afternoon(
      {this.HabitImage = "",
      required this.HabitName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<Afternoon> AfternoonList = [
  Afternoon(
      HabitName: 'Food',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '12-15 pm 12:50 pm',
      isselected: false),
  Afternoon(
      HabitName: 'Rest',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-10 pm 01:20 pm',
      isselected: false),
  Afternoon(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-30 pm 01:40 pm',
      isselected: false),
  Afternoon(
      HabitName: 'Work start',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-30 pm 02:40 pm',
      isselected: false),
];

class Evening {
  String HabitImage = "";
  String HabitName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  Evening(
      {this.HabitImage = "",
      required this.HabitName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<Evening> EveningList = [
  Evening(
      HabitName: 'Games',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '04-15 pm 04:50 pm',
      isselected: false),
  Evening(
      HabitName: 'Drink 8 cup of water',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 pm 06:20 pm',
      isselected: false),
  Evening(
      HabitName: 'Fressup',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-25 pm 06:50 pm',
      isselected: false),
  Evening(
      HabitName: 'Study',
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-55 pm 07:20 pm',
      isselected: false),
];

class DefaultMorninghabit {
  String HabitImage = "";

  String HabitName;
  String HabitSubName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  DefaultMorninghabit(
      {this.HabitImage = "",
      required this.HabitName,
      required this.HabitSubName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<DefaultMorninghabit> DefaultMorninghabitList = [
  DefaultMorninghabit(
      HabitName: 'Practice meditation',
      HabitSubName: "Connect with your inner peace",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  DefaultMorninghabit(
      HabitName: 'Limit caffeine intake',
      HabitSubName: "Replace with other healthy",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  DefaultMorninghabit(
      HabitName: 'No alcohol',
      HabitSubName: "Life is way better without alcohol",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
  DefaultMorninghabit(
      HabitName: 'Share moments',
      HabitSubName: "Happiness is only real when shared",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 am 01:50 pm',
      isselected: false),
];

class DefaultAfternoonhabit {
  String HabitImage = "";
  String HabitName;
  String HabitSubName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  DefaultAfternoonhabit(
      {this.HabitImage = "",
      required this.HabitName,
      required this.HabitSubName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<DefaultAfternoonhabit> DefaultAfternoonhabitList = [
  DefaultAfternoonhabit(
      HabitName: 'Reading',
      HabitSubName: "Never enough books",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '12-15 pm 12:50 pm',
      isselected: false),
  DefaultAfternoonhabit(
      HabitName: 'Sleep over 8h',
      HabitSubName: "Enough time for sweet dreams",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-10 pm 01:20 pm',
      isselected: false),
  DefaultAfternoonhabit(
      HabitName: 'Set small goals',
      HabitSubName: "Make goals more specific",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-30 pm 01:40 pm',
      isselected: false),
  DefaultAfternoonhabit(
      HabitName: 'Work start',
      HabitSubName: "",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '01-30 pm 02:40 pm',
      isselected: false),
];

class DefaultEveninghabit {
  String HabitImage = "";
  String HabitName;
  String HabitSubName;
  String Habitadddate;
  String Habitaddtime;

  bool isselected = false;

  DefaultEveninghabit(
      {this.HabitImage = "",
      required this.HabitName,
      required this.HabitSubName,
      required this.Habitadddate,
      required this.Habitaddtime,
      required this.isselected});
}

List<DefaultEveninghabit> DefaultEveninghabitList = [
  DefaultEveninghabit(
      HabitName: 'Games',
      HabitSubName: "",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '04-15 pm 04:50 pm',
      isselected: false),
  DefaultEveninghabit(
      HabitName: 'Drink 8 cup of water',
      HabitSubName: "",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-15 pm 06:20 pm',
      isselected: false),
  DefaultEveninghabit(
      HabitName: 'Fressup',
      HabitSubName: "",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-25 pm 06:50 pm',
      isselected: false),
  DefaultEveninghabit(
      HabitName: 'Study',
      HabitSubName: "",
      HabitImage: "assets/images/personimage1.webp",
      Habitadddate: "25-08-22",
      Habitaddtime: '06-55 pm 07:20 pm',
      isselected: false),
];

class Habitpage extends StatefulWidget {
  @override
  _HabitpageState createState() => _HabitpageState();
}

class _HabitpageState extends State<Habitpage> with TickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  late TabController _tabControllernew;
  final HabitController habitController = Get.put(HabitController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabControllernew = TabController(length: 3, vsync: this);
    // habitController.getHabit();
    // habitController.getUserHabitList();
    // _resetSelectedDate();
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

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  // Color _colorContainer = Colors.blue;

  String selected = "first";
  bool click = true;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  // right: 20,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     right: 20,
                  //   ),
                  //   child: InkWell(
                  //     onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const Habit_report()),
                  //     ),
                  //     child: Image.asset(
                  //       "assets/icons/pie-chart.png",
                  //       width: 35,
                  //       height: 35,
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Habitsyearreport()),
                  //   ),
                  //   child: Image.asset(
                  //     BARCHARTICON,
                  //     width: 35,
                  //     height: 35,
                  //   ),
                  // ),
                ],
              ),
            ),
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
            // AdvancedCalendar(
            //   controller: _calendarControllerToday,
            //   events: events,
            //   startWeekDay: 1,
            //   innerDot: false,
            //   weekLineHeight: 48.0,
            // ),

            const SizedBox(
              height: 10,
            ),

            // SizedBox(
            //   height: 100,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 15, right: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selected = 'first';
            //             });
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(12),
            //                 color: selected == 'first'
            //                     ? Color(0xffBA94D1)
            //                     : Color(0xffEEEEEE),
            //                 boxShadow: selected == "first"
            //                     ? [
            //                         BoxShadow(
            //                           color: Colors.yellow,
            //                           offset: const Offset(
            //                             5.0,
            //                             5.0,
            //                           ),
            //                           blurRadius: 10.0,
            //                           spreadRadius: 2.0,
            //                         ),
            //                       ]
            //                     : []),
            //             height: 100,
            //             width: 100,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Image.asset(
            //                   "assets/icons/regularicon.png",
            //                   width: 30,
            //                   height: 30,
            //                 ),
            //                 Text("Regular")
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selected = 'second';
            //             });
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(12),
            //                 color: selected == 'second'
            //                     ? Color(0xffBA94D1)
            //                     : Color(0xffEEEEEE),
            //                 boxShadow: selected == "second"
            //                     ? [
            //                         BoxShadow(
            //                           color: Colors.yellow,
            //                           offset: const Offset(
            //                             5.0,
            //                             5.0,
            //                           ),
            //                           blurRadius: 10.0,
            //                           spreadRadius: 2.0,
            //                         ),
            //                       ]
            //                     : []),
            //             height: 100,
            //             width: 100,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Image.asset(
            //                   "assets/icons/Nagativeicon.png",
            //                   width: 30,
            //                   height: 30,
            //                 ),
            //                 Text("Negative")
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selected = 'third';
            //             });
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(12),
            //                 color: selected == 'third'
            //                     ? Color(0xffBA94D1)
            //                     : Color(0xffEEEEEE),
            //                 boxShadow: selected == "third"
            //                     ? [
            //                         BoxShadow(
            //                           color: Colors.yellow,
            //                           offset: const Offset(
            //                             5.0,
            //                             5.0,
            //                           ),
            //                           blurRadius: 10.0,
            //                           spreadRadius: 2.0,
            //                         ),
            //                       ]
            //                     : []),
            //             height: 100,
            //             width: 100,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Image.asset(
            //                   "assets/icons/onetimetodoicon.png",
            //                   width: 30,
            //                   height: 30,
            //                 ),
            //                 Center(child: Text("One-Time\nTODo"))
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => CustomHabitsyearreport()),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10, right: 10),
            //     child: Container(
            //       width: width! - 40,
            //       height: 180,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           gradient: const LinearGradient(
            //             begin: Alignment.topRight,
            //             end: Alignment.bottomLeft,
            //             colors: [
            //               Color(0xffe5d6f7),
            //               Color(0xffd6c1f2),
            //             ],
            //           )),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 15, right: 15),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const Text(
            //                       "Unlock the\npower of credit",
            //                       style: TextStyle(
            //                           fontSize: 22,
            //                           fontWeight: FontWeight.w800,
            //                           color: BLACKCOLOR),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(top: 10),
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(12),
            //                             color: const Color(0xff5a00ca)),
            //                         width: 120,
            //                         height: 45,
            //                         child: const Center(
            //                           child: Text("Activate",
            //                               style: TextStyle(
            //                                   fontSize: 22,
            //                                   fontWeight: FontWeight.w800,
            //                                   color: BUTTONTEXTCOLOR)),
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 SizedBox(
            //                     width: 150,
            //                     height: 150,
            //                     child: Image.asset(UNLOCKCREDITICON)),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, bottom: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Custom Habits',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: BLACKCOLOR),
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CustomHabitsyearreport()),
                  //   ),
                  //   child: Image.asset(
                  //     BARCHARTICON,
                  //     width: 30,
                  //     height: 30,
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              child: ColorfulTabBar(
                indicatorHeight: 0,
                unselectedHeight: 43,
                verticalTabPadding: 4,
                labelStyle: const TextStyle(fontSize: 16),
                tabShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                selectedHeight: 50,
                tabs: [
                  TabItem(
                      title: Row(children: [
                        Image(
                          image: AssetImage(MORNINGICON),
                          color: Colors.black,
                          width: 20,
                          height: 20,
                          // color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Morning',
                          style: TextStyle(color: Color(0xff16a283)),
                        )
                      ]),
                      color: const Color(0xffd9eeea)),
                  TabItem(
                      title: Row(children: [
                        Image(
                          image: AssetImage(AFTERNOONICON),
                          color: Colors.black,
                          width: 20,
                          height: 20,
                          // color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Afternoon',
                          style: TextStyle(color: Color(0xffb82b3f)),
                        )
                      ]),
                      color: const Color(0xfff3e4e5)),
                  TabItem(
                      title: Row(children: [
                        Image(
                          image: AssetImage(EVENINGICON),
                          color: Colors.black,
                          width: 20,
                          height: 20,
                          // color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Evening',
                          style: TextStyle(color: Color(0xff4927c0)),
                        )
                      ]),
                      color: const Color(0xffe7e4f5)),
                ],
                controller: _tabController,
              ),
            ),
            // tab bar view here
            SizedBox(
              height: 140 * habitController.morningHabitSlot.length.toDouble(),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Obx(() {
                    if(habitController.isHabituserList.isTrue)
                    {
                      return Container(
                        height: 200,
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
                      if (habitController.morningHabitSlot.isNotEmpty)
                      {
                        return Container(
                            height: 140 * habitController.morningHabitSlot.length.toDouble(),                      child: ListView.builder(
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: habitController.morningHabitSlot.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                    child: Center(
                                      child: Container(
                                        width: width! - 20,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: getColor().withOpacity(.4)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        height: 80,
                                                        child: CircleAvatar(
                                                          radius:
                                                          48, // Image radius
                                                          backgroundImage:
                                                          AssetImage(
                                                              EveningList[0]
                                                                  .HabitImage),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              habitController.morningHabitSlot[index].name,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        10),
                                                                    child: Icon(
                                                                      Icons.alarm,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                      habitController.morningHabitSlot[index].durationFrom+" - "+habitController.morningHabitSlot[index].durationTo,
                                                                      style:
                                                                      const TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                                habitController.morningHabitSlot[index].date,
                                                                style:
                                                                const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // IconButton(
                                                //   icon: EveningList[index]
                                                //           .isselected
                                                //       ? const Icon(Icons.check)
                                                //       : const Icon(Icons
                                                //           .check_box_outline_blank),
                                                //   onPressed: (() {
                                                //     setState(() {
                                                //       if (EveningList[index]
                                                //           .isselected) {
                                                //         EveningList[index]
                                                //             .isselected = false;
                                                //       } else {
                                                //         EveningList[index]
                                                //             .isselected = true;
                                                //       }
                                                //     });
                                                //   }),
                                                // ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                      }
                      else
                      {
                        return Container(
                          height: 200,
                          child: Center(child: Text("No habits")),
                        );
                      }
                    }


                  }
                  ),
                  Obx(() {
                    if (habitController.afterNoonHabitSlot.isNotEmpty)
                    {
                      return Container(
                          height: 140 * habitController.afterNoonHabitSlot.length.toDouble(),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: habitController.afterNoonHabitSlot.length,
                              itemBuilder: (context, index) {

                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                  child: Center(
                                    child: Container(
                                      width: width! - 20,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: getColor().withOpacity(.4)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        height: 80,
                                                        child: CircleAvatar(
                                                          radius:
                                                          48, // Image radius
                                                          backgroundImage:
                                                          AssetImage(
                                                              EveningList[0]
                                                                  .HabitImage),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              habitController.afterNoonHabitSlot[index].name,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom:
                                                                  5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                        10),
                                                                    child: Icon(
                                                                      Icons
                                                                          .alarm,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                      habitController.afterNoonHabitSlot[index].durationFrom+" - "+habitController.afterNoonHabitSlot[index].durationTo,
                                                                      style:
                                                                      const TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        fontWeight:
                                                                        FontWeight.w600,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                                habitController.afterNoonHabitSlot[index].date.toString(),
                                                                style:
                                                                const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // IconButton(
                                                //   icon: EveningList[index]
                                                //       .isselected
                                                //       ? const Icon(Icons.check)
                                                //       : const Icon(Icons
                                                //       .check_box_outline_blank),
                                                //   onPressed: (() {
                                                //     setState(() {
                                                //       if (EveningList[index]
                                                //           .isselected) {
                                                //         EveningList[index]
                                                //             .isselected = false;
                                                //       } else {
                                                //         EveningList[index]
                                                //             .isselected = true;
                                                //       }
                                                //     });
                                                //   }),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                              }));
                    }
                    else
                    {
                      return Container(
                        height: 150,child: Center(child: Text("No habits")),
                      );
                    }


                  }),

                  Obx(() {
                    if(habitController.eveningNoonHabitSlot.value.isNotEmpty)
                    {
                      return Container(
                        height: 140 * habitController.eveningNoonHabitSlot.length.toDouble(),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: habitController.eveningNoonHabitSlot.value.length,
                              itemBuilder: (context, index) {

                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),

                                  child: Center(
                                    child: Container(
                                      width: width! - 20,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: getColor().withOpacity(.4)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 80,
                                                      height: 80,
                                                      child: CircleAvatar(
                                                        radius:
                                                        48, // Image radius
                                                        backgroundImage:
                                                        AssetImage(
                                                            EveningList[0].HabitImage),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            habitController.eveningNoonHabitSlot[index].name,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom:
                                                                5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                const Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right:
                                                                      10),
                                                                  child: Icon(
                                                                    Icons
                                                                        .alarm,
                                                                    size: 16,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    habitController.eveningNoonHabitSlot[index].durationFrom+" - "+habitController.eveningNoonHabitSlot[index].durationTo,

                                                                    style:
                                                                    const TextStyle(
                                                                      fontSize:
                                                                      16,
                                                                      fontWeight:
                                                                      FontWeight.w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                              habitController.eveningNoonHabitSlot[index].date,

                                                              style:
                                                              const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // IconButton(
                                              //   icon: EveningList[index]
                                              //       .isselected
                                              //       ? const Icon(Icons.check)
                                              //       : const Icon(Icons
                                              //       .check_box_outline_blank),
                                              //   onPressed: (() {
                                              //     setState(() {
                                              //       if (EveningList[index]
                                              //           .isselected) {
                                              //         EveningList[index]
                                              //             .isselected = false;
                                              //       } else {
                                              //         EveningList[index]
                                              //             .isselected = true;
                                              //       }
                                              //     });
                                              //   }),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                              }));
                    }
                    else
                    {
                      return Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Text("No habits")),
                        ),
                      );
                    }

                  }),
                  // Container(
                  //     // height: 800,
                  //     child: ListView.builder(
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: MorningList.length,
                  //         itemBuilder: (context, index) {
                  //           return Padding(
                  //             padding:
                  //                 const EdgeInsets.only(left: 20, right: 20,top: 12),
                  //             child: Center(
                  //               child: Container(
                  //                 width: width!,
                  //                 height: 120,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color: getColor().withOpacity(.4)),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Row(
                  //                       // mainAxisAlignment:
                  //                       //     MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             SizedBox(
                  //                               width: 80,
                  //                               height: 80,
                  //                               child: CircleAvatar(
                  //                                 radius: 48, // Image radius
                  //                                 backgroundImage: AssetImage(
                  //                                     MorningList[index]
                  //                                         .HabitImage),
                  //                               ),
                  //                             ),
                  //                             Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment
                  //                                   .start,
                  //                               children: [
                  //                                 Row(
                  //                                   children: [
                  //                                     Padding(
                  //                                       padding:
                  //                                       const EdgeInsets
                  //                                           .only(
                  //                                           bottom: 5),
                  //                                       child: Text(
                  //                                         MorningList[index]
                  //                                             .HabitName,
                  //                                         style: const TextStyle(
                  //                                             fontSize: 18,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Padding(
                  //                                   padding:
                  //                                   const EdgeInsets
                  //                                       .only(
                  //                                       bottom: 5),
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                     MainAxisAlignment
                  //                                         .spaceAround,
                  //                                     children: [
                  //                                       const Padding(
                  //                                         padding: EdgeInsets
                  //                                             .only(
                  //                                             right:
                  //                                             10),
                  //                                         child: Icon(
                  //                                           Icons.alarm,
                  //                                           size: 16,
                  //                                         ),
                  //                                       ),
                  //                                       Text(
                  //                                           MorningList[
                  //                                           index]
                  //                                               .Habitaddtime,
                  //                                           style:
                  //                                           const TextStyle(
                  //                                             fontSize: 16,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600,
                  //                                           )),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Row(
                  //                                   children: [
                  //                                     const Padding(
                  //                                       padding:
                  //                                       EdgeInsets.only(
                  //                                           right: 10),
                  //                                       child: Icon(
                  //                                         Icons
                  //                                             .calendar_month_rounded,
                  //                                         size: 15,
                  //                                       ),
                  //                                     ),
                  //                                     Text(
                  //                                         MorningList[index]
                  //                                             .Habitadddate,
                  //                                         style:
                  //                                         const TextStyle(
                  //                                           fontSize: 16,
                  //                                           fontWeight:
                  //                                           FontWeight
                  //                                               .w600,
                  //                                         )),
                  //                                   ],
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         IconButton(
                  //                           icon: MorningList[index].isselected
                  //                               ? const Icon(Icons.check)
                  //                               : const Icon(Icons
                  //                                   .check_box_outline_blank),
                  //                           onPressed: (() {
                  //                             setState(() {
                  //                               if (MorningList[index]
                  //                                   .isselected) {
                  //                                 MorningList[index]
                  //                                     .isselected = false;
                  //                               } else {
                  //                                 MorningList[index]
                  //                                     .isselected = true;
                  //                               }
                  //                             });
                  //                           }),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         })),
                  // Container(
                  //     height: 800,
                  //  
                  //     child: ListView.builder(
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: AfternoonList.length,
                  //         itemBuilder: (context, index) {
                  //           return Padding(
                  //             padding:
                  //             const EdgeInsets.only(left: 20, right: 20,top: 12),
                  //             child: Center(
                  //               child: Container(
                  //                 width: width!,
                  //                 height: 120,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color: getColor().withOpacity(.4)),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Row(
                  //                       // mainAxisAlignment:
                  //                       //     MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             SizedBox(
                  //                               width: 80,
                  //                               height: 80,
                  //                               child: CircleAvatar(
                  //                                 radius: 48, // Image radius
                  //                                 backgroundImage: AssetImage(
                  //                                     MorningList[index]
                  //                                         .HabitImage),
                  //                               ),
                  //                             ),
                  //                             Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment
                  //                                   .start,
                  //                               children: [
                  //                                 Row(
                  //                                   children: [
                  //                                     Padding(
                  //                                       padding:
                  //                                       const EdgeInsets
                  //                                           .only(
                  //                                           bottom: 5),
                  //                                       child: Text(
                  //                                         MorningList[index]
                  //                                             .HabitName,
                  //                                         style: const TextStyle(
                  //                                             fontSize: 18,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Padding(
                  //                                   padding:
                  //                                   const EdgeInsets
                  //                                       .only(
                  //                                       bottom: 5),
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                     MainAxisAlignment
                  //                                         .spaceAround,
                  //                                     children: [
                  //                                       const Padding(
                  //                                         padding: EdgeInsets
                  //                                             .only(
                  //                                             right:
                  //                                             10),
                  //                                         child: Icon(
                  //                                           Icons.alarm,
                  //                                           size: 16,
                  //                                         ),
                  //                                       ),
                  //                                       Text(
                  //                                           MorningList[
                  //                                           index]
                  //                                               .Habitaddtime,
                  //                                           style:
                  //                                           const TextStyle(
                  //                                             fontSize: 16,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600,
                  //                                           )),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Row(
                  //                                   children: [
                  //                                     const Padding(
                  //                                       padding:
                  //                                       EdgeInsets.only(
                  //                                           right: 10),
                  //                                       child: Icon(
                  //                                         Icons
                  //                                             .calendar_month_rounded,
                  //                                         size: 15,
                  //                                       ),
                  //                                     ),
                  //                                     Text(
                  //                                         MorningList[index]
                  //                                             .Habitadddate,
                  //                                         style:
                  //                                         const TextStyle(
                  //                                           fontSize: 16,
                  //                                           fontWeight:
                  //                                           FontWeight
                  //                                               .w600,
                  //                                         )),
                  //                                   ],
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         IconButton(
                  //                           icon: MorningList[index].isselected
                  //                               ? const Icon(Icons.check)
                  //                               : const Icon(Icons
                  //                               .check_box_outline_blank),
                  //                           onPressed: (() {
                  //                             setState(() {
                  //                               if (MorningList[index]
                  //                                   .isselected) {
                  //                                 MorningList[index]
                  //                                     .isselected = false;
                  //                               } else {
                  //                                 MorningList[index]
                  //                                     .isselected = true;
                  //                               }
                  //                             });
                  //                           }),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         })),
                  // Container(
                  //     height: 800,
                  //     child: ListView.builder(
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: EveningList.length,
                  //         itemBuilder: (context, index) {
                  //           return Padding(
                  //             padding:
                  //             const EdgeInsets.only(left: 20, right: 20,top: 12),
                  //             child: Center(
                  //               child: Container(
                  //                 width: width!,
                  //                 height: 120,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color: getColor().withOpacity(.4)),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Row(
                  //                       // mainAxisAlignment:
                  //                       //     MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             SizedBox(
                  //                               width: 80,
                  //                               height: 80,
                  //                               child: CircleAvatar(
                  //                                 radius: 48, // Image radius
                  //                                 backgroundImage: AssetImage(
                  //                                     MorningList[index]
                  //                                         .HabitImage),
                  //                               ),
                  //                             ),
                  //                             Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment
                  //                                   .start,
                  //                               children: [
                  //                                 Row(
                  //                                   children: [
                  //                                     Padding(
                  //                                       padding:
                  //                                       const EdgeInsets
                  //                                           .only(
                  //                                           bottom: 5),
                  //                                       child: Text(
                  //                                         MorningList[index]
                  //                                             .HabitName,
                  //                                         style: const TextStyle(
                  //                                             fontSize: 18,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Padding(
                  //                                   padding:
                  //                                   const EdgeInsets
                  //                                       .only(
                  //                                       bottom: 5),
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                     MainAxisAlignment
                  //                                         .spaceAround,
                  //                                     children: [
                  //                                       const Padding(
                  //                                         padding: EdgeInsets
                  //                                             .only(
                  //                                             right:
                  //                                             10),
                  //                                         child: Icon(
                  //                                           Icons.alarm,
                  //                                           size: 16,
                  //                                         ),
                  //                                       ),
                  //                                       Text(
                  //                                           MorningList[
                  //                                           index]
                  //                                               .Habitaddtime,
                  //                                           style:
                  //                                           const TextStyle(
                  //                                             fontSize: 16,
                  //                                             fontWeight:
                  //                                             FontWeight
                  //                                                 .w600,
                  //                                           )),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 3,
                  //                                 ),
                  //                                 Row(
                  //                                   children: [
                  //                                     const Padding(
                  //                                       padding:
                  //                                       EdgeInsets.only(
                  //                                           right: 10),
                  //                                       child: Icon(
                  //                                         Icons
                  //                                             .calendar_month_rounded,
                  //                                         size: 15,
                  //                                       ),
                  //                                     ),
                  //                                     Text(
                  //                                         MorningList[index]
                  //                                             .Habitadddate,
                  //                                         style:
                  //                                         const TextStyle(
                  //                                           fontSize: 16,
                  //                                           fontWeight:
                  //                                           FontWeight
                  //                                               .w600,
                  //                                         )),
                  //                                   ],
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         IconButton(
                  //                           icon: MorningList[index].isselected
                  //                               ? const Icon(Icons.check)
                  //                               : const Icon(Icons
                  //                               .check_box_outline_blank),
                  //                           onPressed: (() {
                  //                             setState(() {
                  //                               if (MorningList[index]
                  //                                   .isselected) {
                  //                                 MorningList[index]
                  //                                     .isselected = false;
                  //                               } else {
                  //                                 MorningList[index]
                  //                                     .isselected = true;
                  //                               }
                  //                             });
                  //                           }),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         })),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Container(
            //   child: ColorfulTabBar(
            //     indicatorHeight: 0,
            //     unselectedHeight: 43,
            //     verticalTabPadding: 4,
            //     labelStyle: const TextStyle(fontSize: 16),
            //     tabShape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15)),
            //     selectedHeight: 45,
            //     tabs: [
            //       TabItem(
            //           title: Row(children: [
            //             Image(
            //               image: AssetImage(MORNINGICON),
            //               color: Colors.black,
            //               width: 20,
            //               height: 20,
            //               // color: Colors.black,
            //             ),
            //             const SizedBox(width: 8),
            //             const Text(
            //               'Morning',
            //               style: TextStyle(color: Color(0xff16a283)),
            //             )
            //           ]),
            //           color: const Color(0xffd9eeea)),
            //       TabItem(
            //           title: Row(children: [
            //             Image(
            //               image: AssetImage(AFTERNOONICON),
            //               color: Colors.black,
            //               width: 20,
            //               height: 20,
            //               // color: Colors.black,
            //             ),
            //             const SizedBox(width: 8),
            //             const Text(
            //               'Afternoon',
            //               style: TextStyle(color: Color(0xffb82b3f)),
            //             )
            //           ]),
            //           color: const Color(0xfff3e4e5)),
            //       TabItem(
            //           title: Row(children: [
            //             Image(
            //               image: AssetImage(EVENINGICON),
            //               color: Colors.black,
            //               width: 20,
            //               height: 20,
            //               // color: Colors.black,
            //             ),
            //             const SizedBox(width: 8),
            //             const Text(
            //               'Evening',
            //               style: TextStyle(color: Color(0xff4927c0)),
            //             )
            //           ]),
            //           color: const Color(0xffe7e4f5)),
            //     ],
            //     controller: _tabControllernew,
            //   ),
            // ),
            // // tab bar view here
            // SizedBox(
            //   height: 140 * MorningList.length.toDouble(),
            //   child: TabBarView(
            //     controller: _tabControllernew,
            //     children: [
            //       Container(
            //           height: 800,
            //           child: ListView.builder(
            //               physics: const NeverScrollableScrollPhysics(),
            //               shrinkWrap: true,
            //               itemCount: MorningList.length,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 10, horizontal: 20),
            //                   child: Center(
            //                     child: Container(
            //                       width: width! - 20,
            //                       height: 120,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(10),
            //                           color: getColor().withOpacity(.4)),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Padding(
            //                             padding:
            //                                 const EdgeInsets.only(right: 10),
            //                             child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 10),
            //                                   child: Row(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 80,
            //                                         height: 80,
            //                                         child: CircleAvatar(
            //                                           radius:
            //                                               48, // Image radius
            //                                           backgroundImage:
            //                                               AssetImage(
            //                                                   MorningList[index]
            //                                                       .HabitImage),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:
            //                                             const EdgeInsets.only(
            //                                                 left: 10),
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           children: [
            //                                             Row(
            //                                               children: [
            //                                                 Padding(
            //                                                   padding:
            //                                                       const EdgeInsets
            //                                                               .only(
            //                                                           bottom:
            //                                                               5),
            //                                                   child: Text(
            //                                                     MorningList[
            //                                                             index]
            //                                                         .HabitName,
            //                                                     style: const TextStyle(
            //                                                         fontSize:
            //                                                             18,
            //                                                         fontWeight:
            //                                                             FontWeight
            //                                                                 .w600),
            //                                                   ),
            //                                                 ),
            //                                               ],
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                           .only(
            //                                                       bottom: 5),
            //                                               child: Row(
            //                                                 mainAxisAlignment:
            //                                                     MainAxisAlignment
            //                                                         .spaceAround,
            //                                                 children: [
            //                                                   const Padding(
            //                                                     padding: EdgeInsets
            //                                                         .only(
            //                                                             right:
            //                                                                 10),
            //                                                     child: Icon(
            //                                                       Icons.alarm,
            //                                                       size: 16,
            //                                                     ),
            //                                                   ),
            //                                                   Text(
            //                                                       MorningList[
            //                                                               index]
            //                                                           .Habitaddtime,
            //                                                       style:
            //                                                           const TextStyle(
            //                                                         fontSize:
            //                                                             16,
            //                                                         fontWeight:
            //                                                             FontWeight
            //                                                                 .w600,
            //                                                       )),
            //                                                 ],
            //                                               ),
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Row(
            //                                               children: [
            //                                                 const Padding(
            //                                                   padding: EdgeInsets
            //                                                       .only(
            //                                                           right:
            //                                                               10),
            //                                                   child: Icon(
            //                                                     Icons
            //                                                         .calendar_month_rounded,
            //                                                     size: 15,
            //                                                   ),
            //                                                 ),
            //                                                 Text(
            //                                                     MorningList[
            //                                                             index]
            //                                                         .Habitadddate,
            //                                                     style:
            //                                                         const TextStyle(
            //                                                       fontSize: 16,
            //                                                       fontWeight:
            //                                                           FontWeight
            //                                                               .w600,
            //                                                     )),
            //                                               ],
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 IconButton(
            //                                   icon: MorningList[index]
            //                                           .isselected
            //                                       ? const Icon(Icons.check)
            //                                       : const Icon(Icons
            //                                           .check_box_outline_blank),
            //                                   onPressed: (() {
            //                                     setState(() {
            //                                       if (MorningList[index]
            //                                           .isselected) {
            //                                         MorningList[index]
            //                                             .isselected = false;
            //                                       } else {
            //                                         MorningList[index]
            //                                             .isselected = true;
            //                                       }
            //                                     });
            //                                   }),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               })),
            //
            //       // second tab bar view widget
            //       Container(
            //           height: 800,
            //           child: ListView.builder(
            //               physics: const NeverScrollableScrollPhysics(),
            //               shrinkWrap: true,
            //               itemCount: AfternoonList.length,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 10, horizontal: 20),
            //                   child: Center(
            //                     child: Container(
            //                       width: width! - 20,
            //                       height: 120,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(10),
            //                           color: getColor().withOpacity(.4)),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Padding(
            //                             padding:
            //                                 const EdgeInsets.only(right: 10),
            //                             child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 10),
            //                                   child: Row(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 80,
            //                                         height: 80,
            //                                         child: CircleAvatar(
            //                                           radius:
            //                                               48, // Image radius
            //                                           backgroundImage:
            //                                               AssetImage(
            //                                                   AfternoonList[
            //                                                           index]
            //                                                       .HabitImage),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:
            //                                             const EdgeInsets.only(
            //                                                 left: 10),
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           children: [
            //                                             Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                           .only(
            //                                                       bottom: 5),
            //                                               child: Text(
            //                                                 AfternoonList[index]
            //                                                     .HabitName,
            //                                                 style: const TextStyle(
            //                                                     fontSize: 18,
            //                                                     fontWeight:
            //                                                         FontWeight
            //                                                             .w600),
            //                                               ),
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                           .only(
            //                                                       bottom: 5),
            //                                               child: Row(
            //                                                 mainAxisAlignment:
            //                                                     MainAxisAlignment
            //                                                         .spaceAround,
            //                                                 children: [
            //                                                   const Padding(
            //                                                     padding: EdgeInsets
            //                                                         .only(
            //                                                             right:
            //                                                                 10),
            //                                                     child: Icon(
            //                                                       Icons.alarm,
            //                                                       size: 16,
            //                                                     ),
            //                                                   ),
            //                                                   Text(
            //                                                       AfternoonList[
            //                                                               index]
            //                                                           .Habitaddtime,
            //                                                       style:
            //                                                           const TextStyle(
            //                                                         fontSize:
            //                                                             16,
            //                                                         fontWeight:
            //                                                             FontWeight
            //                                                                 .w600,
            //                                                       )),
            //                                                 ],
            //                                               ),
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Text(
            //                                                 AfternoonList[index]
            //                                                     .Habitadddate,
            //                                                 style:
            //                                                     const TextStyle(
            //                                                   fontSize: 16,
            //                                                   fontWeight:
            //                                                       FontWeight
            //                                                           .w600,
            //                                                 )),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 IconButton(
            //                                   icon: AfternoonList[index]
            //                                           .isselected
            //                                       ? const Icon(Icons.check)
            //                                       : const Icon(Icons
            //                                           .check_box_outline_blank),
            //                                   onPressed: (() {
            //                                     setState(() {
            //                                       if (AfternoonList[index]
            //                                           .isselected) {
            //                                         AfternoonList[index]
            //                                             .isselected = false;
            //                                       } else {
            //                                         AfternoonList[index]
            //                                             .isselected = true;
            //                                       }
            //                                     });
            //                                   }),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               })),
            //       Container(
            //           height: 800,
            //           child: ListView.builder(
            //               physics: const NeverScrollableScrollPhysics(),
            //               shrinkWrap: true,
            //               itemCount: EveningList.length,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 10, horizontal: 20),
            //                   child: Center(
            //                     child: Container(
            //                       width: width! - 20,
            //                       height: 120,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(10),
            //                           color: getColor().withOpacity(.4)),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Padding(
            //                             padding: const EdgeInsets.only(
            //                               right: 10,
            //                             ),
            //                             child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                     left: 10,
            //                                   ),
            //                                   child: Row(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 80,
            //                                         height: 80,
            //                                         child: CircleAvatar(
            //                                           radius:
            //                                               48, // Image radius
            //                                           backgroundImage:
            //                                               AssetImage(
            //                                                   EveningList[index]
            //                                                       .HabitImage),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:
            //                                             const EdgeInsets.only(
            //                                                 left: 10),
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           children: [
            //                                             Text(
            //                                               EveningList[index]
            //                                                   .HabitName,
            //                                               style: const TextStyle(
            //                                                   fontSize: 18,
            //                                                   fontWeight:
            //                                                       FontWeight
            //                                                           .w600),
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                           .only(
            //                                                       bottom: 5),
            //                                               child: Row(
            //                                                 mainAxisAlignment:
            //                                                     MainAxisAlignment
            //                                                         .spaceAround,
            //                                                 children: [
            //                                                   const Padding(
            //                                                     padding: EdgeInsets
            //                                                         .only(
            //                                                             right:
            //                                                                 10),
            //                                                     child: Icon(
            //                                                       Icons.alarm,
            //                                                       size: 16,
            //                                                     ),
            //                                                   ),
            //                                                   Text(
            //                                                       EveningList[
            //                                                               index]
            //                                                           .Habitaddtime,
            //                                                       style:
            //                                                           const TextStyle(
            //                                                         fontSize:
            //                                                             16,
            //                                                         fontWeight:
            //                                                             FontWeight
            //                                                                 .w600,
            //                                                       )),
            //                                                 ],
            //                                               ),
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 3,
            //                                             ),
            //                                             Text(
            //                                                 EveningList[index]
            //                                                     .Habitadddate,
            //                                                 style:
            //                                                     const TextStyle(
            //                                                   fontSize: 16,
            //                                                   fontWeight:
            //                                                       FontWeight
            //                                                           .w600,
            //                                                 )),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 IconButton(
            //                                   icon: EveningList[index]
            //                                           .isselected
            //                                       ? const Icon(Icons.check)
            //                                       : const Icon(Icons
            //                                           .check_box_outline_blank),
            //                                   onPressed: (() {
            //                                     setState(() {
            //                                       if (EveningList[index]
            //                                           .isselected) {
            //                                         EveningList[index]
            //                                             .isselected = false;
            //                                       } else {
            //                                         EveningList[index]
            //                                             .isselected = true;
            //                                       }
            //                                     });
            //                                   }),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               })),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Customhabit())),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: width!,
                  height: 60,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Add Custom habit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BUTTONTEXTCOLOR)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 10, bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Habits',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: BLACKCOLOR),
                      ),
                      // InkWell(
                      //   onTap: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Habitsyearreport()),
                      //   ),
                      //   child: Image.asset(
                      //     BARCHARTICON,
                      //     width: 30,
                      //     height: 30,
                      //   ),
                      // ),
                    ],
                  ),
                )),

            // SizedBox(
            //   height: height = 80 * 22.5,
            //   child: Column(
            //     children: [
            //       Expanded(
            //           child: ListView.builder(
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: habitnamelist.length,
            //         itemBuilder: (context, index) {
            //           Habitname habitname = habitnamelist[index];
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 10, horizontal: 15),
            //             child: InkWell(
            //               onTap: (){
            //                 // Navigator.push(
            //                 //   context,
            //                 //   MaterialPageRoute(
            //                 //     builder: (context) => Habit_in_trend(
            //                 //       habitnamelist[index].title,
            //                 //       habitnamelist[index].Subtitle,
            //                 //     ),
            //                 //   ),
            //                 // );
            //               },
            //               child: Container(
            //                 height: 80,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(12),
            //                   color: getColor(),
            //                 ),
            //                 child: Center(
            //                   child: ListTile(
            //                     title: Padding(
            //                       padding: const EdgeInsets.only(bottom: 10),
            //                       child: Text(
            //                         habitnamelist[index].title,
            //                         style: TextStyle(
            //                             fontSize: 20,
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                     ),
            //                     subtitle: Text(habitnamelist[index].Subtitle),
            //                     leading: Icon(Icons.task_rounded),
            //                     trailing: Icon(
            //                       Icons.arrow_circle_right_outlined,
            //                       size: 35,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       )),
            //     ],
            //   ),
            // ),
            Obx(() {
              if(habitController.isHabitcat.isTrue)
                {
                  return Container(
                    height: 200,
                    child: Center(child: CircularProgressIndicator(strokeWidth: 2,color: Colors.black,)),
                  );

                }
              else
                {
                  if(habitController.habits.isNotEmpty)
                    {
                      return Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: habitController.habits.length,
                          itemBuilder: (habitControllercontext, index) {
                            final habit = habitController.habits[index];
                            return InkWell(
                              onTap: () async {
                                print("jkjckjdchj");
                                //
                                await habitController.getHabitByCat(habit.id);
                                //
                                //  print(habitController.habit[1].name);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Habit_in_trend(
                                        habit_value: habitController.habit.value,
                                        title: habit.name,
                                        subtitle: habit.description
                                      // habitnamelist[index].title,
                                      // habitnamelist[index].Subtitle,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Container(
                                  // height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: getColor(),
                                  ),
                                  // child: Container(height: 50,color: Colors.green,),
                                  child: Center(
                                    child: ListTile(
                                      // onTap: ()async{
                                      //   print("jkjckjdchj");
                                      //   print(habit.id);
                                      //
                                      //   await  habitController.getHabitByCat(habit.id);
                                      //
                                      //   print(habitController.habit[1].name);
                                      //
                                      //   Navigator.push(
                                      //      context,
                                      //      MaterialPageRoute(
                                      //        builder: (context) => Habit_in_trend(
                                      //            habit_value:habitController.habit.value
                                      //        ),
                                      //      ),
                                      //    );
                                      // },
                                        title: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            habit.name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        subtitle: Text(habit.description),
                                        leading: Image.network(habit.fullImage),
                                        // leading: const Icon(Icons.task_rounded),
                                        trailing: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white),
                                            child: const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 15,
                                              color: Colors.black,
                                            ))),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  else
                    {
                      return Container(
                        height: 200,
                        child: Center(child: Text("No habit category")),
                      );
                    }

                }

            })

            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Essentialhabitspage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Essentil habits",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle:
            //                 const Text("Refresh your life with simple acts"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Eatdrinkhealthilypage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Eat & drink healthily",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Stay healthy with daily intakes"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Keepactivegetfitpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Keep active & get fit",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Sweet never lies"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Easestresspage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Ease stress",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Your efforts deserve a break"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Gainselfdisciplinepage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Gain self-discipline",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Let yourself manage yourself"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Goodmorningpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Good morning",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle:
            //                 const Text("In the morning light,do what's right"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Beforesleeproutinepage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Before sleep routine",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("May your dream be sweet tonight"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Masterproductivitypage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Master productivity",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text(
            //                 "Be strategic with your efforts and time"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Tidylifepage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Tidy life",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Everything has its own place"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => LeisureMomentspage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Leisure moments",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Live your life to the max"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Stayconnectedpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Stay connected",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Caring and sharing"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Exploreyournewselfpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Explore your new self'",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Discover your inner peace"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Strongermindpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Stronger mind",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text(
            //                 "What doesn't kill you makes you stronger"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Beaninterestingpersonpage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Be an interesting person",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("End boring and start charming"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Budgetmoneypage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Budget money",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Give every dollar a job"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Treasurepettimepage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Treasure pet time",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Love to be needed"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Getthroughquarantinepage(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: getColor(),
            //       ),
            //       child: Center(
            //         child: ListTile(
            //             title: const Padding(
            //               padding: EdgeInsets.only(bottom: 10),
            //               child: Text(
            //                 "Get through quarantine",
            //                 style: TextStyle(
            //                     fontSize: 20, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             subtitle: const Text("Be alone without being lonely"),
            //             leading: const Icon(Icons.task_rounded),
            //             trailing: Container(
            //                 width: 30,
            //                 height: 30,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(8),
            //                     color: Colors.white),
            //                 child: const Icon(
            //                   Icons.arrow_forward_ios_outlined,
            //                   size: 15,
            //                   color: Colors.black,
            //                 ))),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('GAD')),
          content: Container(
            height: 150,
            width: width,
            child: Column(
              children: const [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    child: Icon(Icons.check),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('You finish this task already Completed'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
