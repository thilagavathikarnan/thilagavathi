import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Loginpage/Login.dart';
import 'package:habittrackergad/Components/Task/AssignTask/Assigned_By_You.dart';
import 'package:habittrackergad/Components/Habit/Custom_habitpage.dart';
import 'package:habittrackergad/Components/Task/Addtask.dart';
import 'package:habittrackergad/Components/Task/Taskpage.dart';
import 'package:habittrackergad/Components/profile/profile.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/accountController.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/controller/auth_service.dart';
import 'package:habittrackergad/controller/teamController.dart';
import 'package:habittrackergad/model/assign_model.dart';
import 'package:habittrackergad/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/habit_controller.dart';
import '../../model/task_model.dart';
import '../Accounts/Automatic/AutomaticAccountspage.dart';
import '../Accounts/Manual/ManualAccountpage.dart';
import '../Task/AssignTask/Assigned_To_You.dart';
import '../Habit/Habit_report.dart';
import '../Habit/Habitpage.dart';
import '../Task/Taskdetails.dart';

class Morningtask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Weekdays;
  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;

  bool isselected = false;

  Morningtask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Morningtask> Morningtasklist = [
  Morningtask(
      Taskname: "Functionality",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
  Morningtask(
      Taskname: "Habit Tracker",
      Status: "To-do",
      Priority: "Medium",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "09:35.am   -",
      TimeScheduleTotime: "  10:55.am",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thesday"),
  Morningtask(
      Taskname: "Figma design",
      Status: "Resolved",
      Priority: "High",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "11:35.am   -",
      TimeScheduleTotime: "  11:40.am",
      AssignedTo: "Prasana",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Wednesday"),
  Morningtask(
      Taskname: "Gad Seo",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "10:35.am   -",
      TimeScheduleTotime: "  11:55.amm",
      AssignedTo: "Prabu",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thursday"),
];

class Afternoontask {
  final String Taskname;
  String Taskdescription;
  String Date;

  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;
  String Weekdays;

  bool isselected = false;

  Afternoontask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Afternoontask> Afternoontasklist = [
  Afternoontask(
      Taskname: "Api integration",
      Status: "Resolved",
      Priority: "Medium",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
  Afternoontask(
      Taskname: "Habit Tracker",
      Status: "To-do",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "09:35.am   -",
      TimeScheduleTotime: "  10:55.am",
      AssignedTo: "Vicky",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thesday"),
  Afternoontask(
      Taskname: "Figma design",
      Status: "Resolved",
      Priority: "High",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "11:35.am   -",
      TimeScheduleTotime: "  11:40.am",
      AssignedTo: "Prasana",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Wednesday"),
  Afternoontask(
      Taskname: "Gad Seo",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "10:35.am   -",
      TimeScheduleTotime: "  11:55.amm",
      AssignedTo: "Prabu",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Thursday"),
];

class Eveningtask {
  final String Taskname;
  String Taskdescription;
  String Date;
  String Weekdays;

  String TimeScheduleFromtime;
  String TimeScheduleTotime;
  String AssignedTo;
  String Notifiy;
  String Status;
  String Priority;

  bool isselected = false;

  Eveningtask(
      {required this.Taskname,
      required this.Taskdescription,
      required this.Date,
      required this.TimeScheduleFromtime,
      required this.TimeScheduleTotime,
      required this.AssignedTo,
      required this.Notifiy,
      required this.Status,
      required this.Priority,
      required this.isselected,
      required this.Weekdays});
}

List<Eveningtask> Eveningtasklist = [
  Eveningtask(
      Taskname: "Functionality",
      Status: "In-progress",
      Priority: "Low",
      Taskdescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce",
      Date: "26/06/2022 - 30/06/2022",
      TimeScheduleFromtime: "08:35.am   -",
      TimeScheduleTotime: "  9:55.am",
      AssignedTo: "Pranav",
      Notifiy: "Naveenraj , Pranav",
      isselected: false,
      Weekdays: "Monday"),
];

///////////////////////////////////////////////////

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

List<Widget> generateCarouselItems() {
  List<Widget> items = [];
  for (int i = 0; i < Get.find<HabitController>().bannerData.length; i++) {
    items.add(
      Container(
        color: Colors.blue,
        child: Center(
            child: Image.network(Get.find<HabitController>().bannerData[i])),
      ),
    );
  }
  return items;
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  UserController userController = Get.put(UserController());
  AccountController accountController = Get.put(AccountController());
  HabitController habitController = Get.put(HabitController());
  TeamController taskController = Get.put(TeamController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  late TabController _tabController2;

  @override
  void initState() {
    super.initState();

    // habitController.getUserHabit();
    _tabController = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);

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

  Color chooseCardColor(String data) {
    switch (data) {
      case "Low":
        return const Color(0xff82AAE3);
      case 'Medium':
        return const Color(0xffFEF9A7);
      case 'High':
        return const Color(0xffFFA8A8);
      default:
        return const Color(0xffB3FFAE);
    }
  }

  final List Task1 = ["Write", "Yoga", "Food"];
  final List Task2 = ["Work", "Class", "Dinner"];

  double? height;
  double? width;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _tabController2.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom = AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "Confirm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                "Close",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
               accountController.amountController.clear();
               accountController.remarkController.clear();
               accountController.selectCatController.clear();
               accountController.selectPayment.value = false;
               accountController.selectCate.value = "";
               accountController.selectDate.value = "";
               accountController.amountController.clear();
               accountController.remarkController.clear();
               accountController.amountController.clear();
               accountController.accountHistoryList.clear();
               accountController.newtCatController.clear();
               accountController.selectCate.value = "";
               accountController.selectDate.value = '';
               accountController.cashType.value = '';
               accountController.incomeValue.value = 0.0;
               accountController.expensesValue.value = 0.0;                // AuthSection().getLogout();
               await Get.put(TeamController);
               await Get.put(AccountController);
               Get.put(AccountController()).amountController.clear();
               Get.put(AccountController()).remarkController.clear();
               Get.put(AccountController()).selectCatController.clear();
               Get.put(AccountController()).selectPayment.value = false;
               Get.put(AccountController()).selectCate.value = "";
               Get.put(AccountController()).selectDate.value = "";
               Get.put(AccountController()).amountController.clear();
               Get.put(AccountController()).remarkController.clear();
               Get.put(AccountController()).amountController.clear();
               Get.put(AccountController()).accountHistoryList.clear();
               Get.put(AccountController()).newtCatController.clear();
               Get.put(AccountController()).selectCate.value = "";
               Get.put(AccountController()).selectDate.value = '';
               Get.put(AccountController()).cashType.value = '';
               Get.put(AccountController()).incomeValue.value = 0.0;
               Get.put(AccountController()).expensesValue.value = 0.0;
               Get.put(TeamController()).getTaskStatusToMe();
               Get.put(TeamController()).getTaskStatusByU();
               Get.put(TeamController()).fetchMyTasks();
               Get.put(TeamController()).getTaskStatusNotify();
               Get.put(TeamController()).getTeamList();
               Get.put(TeamController()).fetchTasks();
               Get.put(TeamController()).fetchNotifyTasks();
               Get.put(TeamController()).fetchByTasks();
               Get.put(TeamController()).teams.value.clear();
               Get.put(TeamController()).taskStatus = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;
               Get.put(TeamController()).taskStatusByU = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;
               Get.put(TeamController()).taskStatusNotify = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;



               Navigator.pop(context);

              },
            ),

            TextButton(
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
                final prefs = await _prefs;
                await prefs.remove('userId');
                await prefs.setBool('userLoggedIn', false);
                print("LOGOUTRes");
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => LoginPage()),
              // );
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 140,
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return Container(
                      height: 130,
                      color: Colors.grey.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 48, // Image radius
                              child:Icon(Icons.person,color: Colors.black.withOpacity(0.3),size: 40,)
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Text(userController.userName.value.toString().toUpperCase() +" "+userController.lastName.value.toString().toUpperCase()),
                          SizedBox(
                            height: 8,
                          ),

                          Text(userController.emailText.value.toString()),

                          // Text(userController.userModel!.name.toString()+" "+userController.userModel!.lastName.toString(),style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    );
                  }
                  ),
                  // Text(userController.userModel!.name.toString()+" "+userController.userModel!.lastName.toString(),style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () async {
                await userController.profile();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileApi()));
              },
              leading: Icon(
                Icons.person,
                color: Colors.pink.shade100,
              ),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: () {
                _showDialog();
              },
              leading: Icon(
                Icons.logout,
                color: Colors.pink.shade100,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: [
            Card(
              child: Container(
                width: width!,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(width: 19,),

                    InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                            child: Icon(
                          Icons.dashboard,
                          color: Colors.pink,
                          size: 30,
                        ))),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 10, right: 15),
                    //   child: SizedBox(
                    //     width: 35,
                    //     height: 35,
                    //     child: CircleAvatar(
                    //       radius: 48, // Image radius
                    //       backgroundImage:
                    //           AssetImage("assets/images/personimage1.webp"),
                    //     ),
                    //   ),
                    SizedBox(width: 19,),
                    Obx(() {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              userController.userName.value.toString() +
                                  " " +
                                  userController.lastName.value..toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        );
                      }
                    )
                  ],
                ),
              ),
            ),

            Obx(() {
              return CarouselSlider(
                items: [
                  for (int i = 0; i < habitController.banners.length; i++)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                              habitController.banners[i].fullImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
                // items: [
                //   //1st Image of Slider
                //   Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       image: const DecorationImage(
                //         image: AssetImage('assets/images/meditaion2.webp'),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //
                //   //2nd Image of Slider
                //   Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       image: const DecorationImage(
                //         image: AssetImage('assets/images/meditaion1.jpeg'),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //
                //   //3rd Image of Slider
                //   Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       image: const DecorationImage(
                //         image: AssetImage('assets/images/meditaion3.webp'),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
              );
            }),
        SizedBox(height: 10,),

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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AutomaticAccountpage()),
                                ),
                                child: const ListTile(
                                  leading: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image(
                                        image: AssetImage(
                                      "assets/icons/automatic.png",
                                    )),
                                  ),
                                  title: Text('Automatic'),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManualAccountpage()),
                                ),
                                child: const ListTile(
                                  leading: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/icons/Manual.png")),
                                  ),
                                  title: Text('Manual'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
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
                    child: const Center(
                      child: Text('Add Account',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BUTTONTEXTCOLOR)),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
              child: Text(
                'Today Habits',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: BLACKCOLOR),
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
            SizedBox(
              height: habitController.studyEvents.length == 0
                  ? 140
                  : 140 * habitController.studyEvents.length.toDouble(),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Obx(() {
                    if (habitController.isHabituser.isTrue) {
                      return Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        ),
                      );
                    } else {
                      if (habitController.morningSlot.isNotEmpty) {
                        return Container(
                            height: 140 *
                                habitController.morningSlot.length.toDouble(),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: habitController.morningSlot.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
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
                                                              habitController
                                                                  .morningSlot[
                                                                      index]
                                                                  .name,
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
                                                                      habitController
                                                                              .morningSlot[
                                                                                  index]
                                                                              .durationFrom +
                                                                          " - " +
                                                                          habitController
                                                                              .morningSlot[
                                                                                  index]
                                                                              .durationTo,
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
                                                                habitController
                                                                    .morningSlot[
                                                                        index]
                                                                    .date,
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
                      } else {
                        return Container(
                          height: 200,
                          child: Center(child: Text("No habits")),
                        );
                      }
                    }
                  }),

                  // second tab bar view widget
                  Obx(() {
                    if (habitController.afterNoonSlot.isNotEmpty) {
                      return Container(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: habitController.afterNoonSlot.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                                              habitController
                                                                  .afterNoonSlot[
                                                                      index]
                                                                  .name,
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
                                                                      habitController
                                                                              .afterNoonSlot[
                                                                                  index]
                                                                              .durationFrom +
                                                                          " - " +
                                                                          habitController
                                                                              .afterNoonSlot[
                                                                                  index]
                                                                              .durationTo,
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
                                                                habitController
                                                                    .afterNoonSlot[
                                                                        index]
                                                                    .date
                                                                    .toString(),
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
                    } else {
                      return Container(
                        height: 150,
                        child: Center(child: Text("No habits")),
                      );
                    }
                  }),

                  Obx(() {
                    if (habitController.eveningNoonSlot.value.isNotEmpty) {
                      return Container(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  habitController.eveningNoonSlot.value.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                                            habitController
                                                                .eveningNoonSlot[
                                                                    index]
                                                                .name,
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
                                                                    habitController
                                                                            .eveningNoonSlot[
                                                                                index]
                                                                            .durationFrom +
                                                                        " - " +
                                                                        habitController
                                                                            .eveningNoonSlot[
                                                                                index]
                                                                            .durationTo,
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
                                                              habitController
                                                                  .eveningNoonSlot[
                                                                      index]
                                                                  .date,
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
                    } else {
                      return Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Text("No habits")),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                      Text('Add habit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BUTTONTEXTCOLOR)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
              child: Text(
                'Today Task',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: BLACKCOLOR),
              ),
            ),
            Obx(
                    () {
                  if(taskController.myTaskList.isEmpty)
                  {
                    return Container(
                      height: 300,
                      child: Center(child: Text("Task is empty")),
                    );
                  }
                  else
                  {
                    return SizedBox(
                      height: taskController.myTaskList.length * 350,
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: taskController.myTaskList.length,
                              itemBuilder: ((context, index) {

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          taskController.selectedItemstatus.value = "";

                                          TaskModel task = await TaskModel(
                                            id: taskController.myTaskList[index].id,
                                            userId: taskController.myTaskList[index].userId,
                                            taskName: taskController.myTaskList[index].taskName,
                                            task_owner: taskController.myTaskList[index].task_owner,
                                            description:taskController.myTaskList[index].description,
                                            status:taskController.myTaskList[index].status,
                                            projectId:taskController.myTaskList[index].projectId,
                                            projectName:taskController.myTaskList[index].projectName,
                                            subTask:taskController.myTaskList[index].subTask,
                                            priority:taskController.myTaskList[index].priority,
                                            startDate:taskController.myTaskList[index].startDate,
                                            endDate:taskController.myTaskList[index].endDate,
                                            assignId: taskController.myTaskList[index].assignId,
                                            notifyId: taskController.myTaskList[index].notifyId,
                                            createdAt:  taskController.myTaskList[index].createdAt,
                                            updatedAt:  taskController.myTaskList[index].updatedAt,
                                            userName: taskController.myTaskList[index].userName,
                                            notify_names: taskController.myTaskList[index].notify_names,
                                          );
                                          taskController.fetchComments(task.id);


                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      Taskpageprogress(
                                                          task:task
                                                      ))));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(12.0),
                                                topLeft: Radius.circular(12.0),
                                              ),
                                              color:
                                              Morningtasklist[index].isselected
                                                  ? const Color(0xFF68B984)
                                                  : chooseCardColor(
                                                  Morningtasklist[index]
                                                      .Priority)),
                                          width: width! - 30,
                                          height: 260,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 10, right: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        taskController.myTaskList[index].taskName,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            overflow: TextOverflow.ellipsis,

                                                            color: BLACKCOLOR,
                                                            fontSize: 24,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      // onTap: (() => Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: ((context) =>
                                                      //             Taskpageprogress())
                                                      //             )
                                                      //             )
                                                      //             ),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(12),
                                                          color: taskController.myTaskList[index].status == "In-progress"
                                                              ? Colors.blue
                                                              : taskController.myTaskList[index].status  == "To-do"
                                                              ? Colors.amber
                                                              : taskController.myTaskList[index].status == "Resolved" ? Colors.pink : Colors.lime,
                                                        ),
                                                        width: 90,
                                                        height: 40,
                                                        child: Center(
                                                            child: Text(
                                                              taskController.myTaskList[index].status ,
                                                              style: const TextStyle(
                                                                  color:
                                                                  BUTTONTEXTCOLOR),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  taskController.myTaskList[index].description,
                                                  style: const TextStyle(
                                                      color: BLACKCOLOR,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     Icon(
                                                //       Icons.alarm,
                                                //       color: BLACKCOLOR,
                                                //     ),
                                                //     SizedBox(
                                                //       width: 10,
                                                //     ),
                                                //     Text(
                                                //       Morningtasklist[index]
                                                //           .TimeScheduleFromtime,
                                                //       style: TextStyle(
                                                //           color: BLACKCOLOR,
                                                //           fontSize: 16,
                                                //           fontWeight:
                                                //               FontWeight.w400),
                                                //     ),
                                                //     Text(
                                                //       Morningtasklist[index]
                                                //           .TimeScheduleTotime,
                                                //       style: TextStyle(
                                                //           color: BLACKCOLOR,
                                                //           fontSize: 16,
                                                //           fontWeight:
                                                //               FontWeight.w400),
                                                //     ),
                                                //   ],
                                                // ),

                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child: Image.asset(
                                                        ASSIGNTOYOU,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          for(int i=0;i<taskController.myTaskList[index].userName.length;i++)
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                Colors.white,
                                                                shape: Shape.Circular,
                                                                text:
                                                                "${taskController.myTaskList[index].userName[i].firstName} ${taskController.myTaskList[index].userName[i].lastName}",
                                                                fontSize: 14,
                                                                numberLetters: 2,
                                                              ),
                                                            ),
                                                          // const SizedBox(
                                                          //   width: 1,
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 35,
                                                          //   width: 35,
                                                          //   child: TextAvatar(
                                                          //     textColor:
                                                          //     Colors.white,
                                                          //     shape: Shape.Circular,
                                                          //     text: "Bhive team",
                                                          //     fontSize: 14,
                                                          //     numberLetters: 2,
                                                          //   ),
                                                          // ),
                                                          // const SizedBox(
                                                          //   width: 1,
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 35,
                                                          //   width: 35,
                                                          //   child: TextAvatar(
                                                          //     textColor:
                                                          //     Colors.white,
                                                          //     shape: Shape.Circular,
                                                          //     text: "Vicky b",
                                                          //     fontSize: 14,
                                                          //     numberLetters: 2,
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.notifications,
                                                        color: BLACKCOLOR),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          for(int i=0;i<taskController.myTaskList[index].notify_names.length;i++)
                                                            SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: TextAvatar(
                                                                textColor:
                                                                Colors.white,
                                                                shape: Shape.Circular,
                                                                text:
                                                                "${taskController.myTaskList[index].notify_names[i].firstName} ${taskController.myTaskList[index].notify_names[i].lastName}",
                                                                fontSize: 14,
                                                                numberLetters: 2,
                                                              ),
                                                            ),
                                                          // const SizedBox(
                                                          //   width: 1,
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 35,
                                                          //   width: 35,
                                                          //   child: TextAvatar(
                                                          //     textColor:
                                                          //     Colors.white,
                                                          //     shape: Shape.Circular,
                                                          //     text: "Bhive team",
                                                          //     fontSize: 14,
                                                          //     numberLetters: 2,
                                                          //   ),
                                                          // ),
                                                          // const SizedBox(
                                                          //   width: 1,
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 35,
                                                          //   width: 35,
                                                          //   child: TextAvatar(
                                                          //     textColor:
                                                          //     Colors.white,
                                                          //     shape: Shape.Circular,
                                                          //     text: "Vicky b",
                                                          //     fontSize: 14,
                                                          //     numberLetters: 2,
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.calendar_today,
                                                        color: BLACKCOLOR),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      taskController.myTaskList[index].startDate +"  -  "+taskController.myTaskList[index].endDate,
                                                      style: const TextStyle(
                                                          color: BLACKCOLOR,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12.0),
                                              bottomLeft: Radius.circular(12.0)),
                                          color: Color.fromARGB(179, 208, 208, 208),
                                        ),
                                        width: width! - 30,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(taskController.myTaskList[index].priority,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 60),
                                                    child: index % 1 == 1
                                                        ? Container()
                                                        : Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              30),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffe94c89))),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.all(
                                                            8.0),
                                                        child: Text(
                                                         "${taskController.myTaskList[index].status}"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                icon:   taskController.myTaskList[index].status == "completed"
                                                    ?  const Icon(
                                                  Icons.check_box,
                                                  color: Colors.green,
                                                )
                                                    : const Icon(
                                                  Icons
                                                      .check_box_outline_blank,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: (() {
                                                  setState(() {
                                                    taskController.selectedItemstatus.value = "completed";

                                                    taskController.taskUpdate(taskController.myTaskList[index].id, "completed");

                                                    // Morningtasklist[index].isselected = !Morningtasklist[index].isselected;
                                                    taskController.fetchTasks();
                                                  });
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }))
                        ],
                      ),
                    );
                  }

                }
            ),
            // Obx(
            // () {
            //     return SizedBox(
            //       height: taskController.myTaskList.length * 350,
            //       child: Column(
            //         children: [
            //           Expanded(
            //               child: ListView.builder(
            //                 shrinkWrap: true,
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: taskController.myTaskList.length,
            //                   itemBuilder: ((context, index) {
            //                     Color colorstatus;
            //                     switch (Morningtasklist[index].Status) {
            //                       case "In-progress":
            //                         colorstatus = Colors.red;
            //                         break;
            //                       case "To-do":
            //                         colorstatus = Colors.blue;
            //                         break;
            //                       case "Resolved":
            //                         colorstatus = Colors.yellow;
            //                         break;
            //
            //                       default:
            //                         colorstatus = Colors.black;
            //                     }
            //
            //                     return Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 10, horizontal: 20),
            //                       child: Column(
            //                         children: [
            //                           InkWell(
            //                             onTap: () {},
            //                             // onTap: () => Navigator.push(
            //                             //     context,
            //                             //     MaterialPageRoute(
            //                             //         builder: ((context) =>
            //                             //             Taskpageprogress(
            //                             //               Taskname:
            //                             //                   taskController.myTaskList[index].taskName,
            //                             //               Taskdescription:
            //                             //               taskController.myTaskList[index].description,
            //                             //               Date: Morningtasklist[index].Date,
            //                             //               Status: taskController.myTaskList[index].status,
            //                             //               Priority: taskController.myTaskList[index].priority,
            //                             //               Weekdays:
            //                             //                   Morningtasklist[index]
            //                             //                       .Weekdays,
            //                             //             )))),
            //                             child: Container(
            //                               decoration: BoxDecoration(
            //                                   borderRadius: const BorderRadius.only(
            //                                     topRight: Radius.circular(12.0),
            //                                     topLeft: Radius.circular(12.0),
            //                                   ),
            //                                   color:
            //                                       Morningtasklist[index].isselected
            //                                           ? const Color(0xFF68B984)
            //                                           : chooseCardColor(
            //                                               Morningtasklist[index]
            //                                                   .Priority)),
            //                               width: width! - 30,
            //                               height: 260,
            //                               child: Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 20, top: 10, right: 20),
            //                                 child: Column(
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   children: [
            //                                     Row(
            //                                       mainAxisAlignment:
            //                                           MainAxisAlignment
            //                                               .spaceBetween,
            //                                       children: [
            //                                         Text(
            //                                           taskController
            //                                               .myTaskList[index]
            //                                               .taskName,
            //                                           style: const TextStyle(
            //                                               color: BLACKCOLOR,
            //                                               fontSize: 24,
            //                                               fontWeight:
            //                                                   FontWeight.w800),
            //                                         ),
            //                                         InkWell(
            //                                           // onTap: (() => Navigator.push(
            //                                           //     context,
            //                                           //     MaterialPageRoute(
            //                                           //         builder: ((context) =>
            //                                           //             Taskpageprogress())
            //                                           //             )
            //                                           //             )
            //                                           //             ),
            //                                           child: Container(
            //                                             decoration: BoxDecoration(
            //                                               borderRadius:
            //                                                   BorderRadius.circular(12),
            //                                               color: taskController.myTaskList[index].status == "In-progress"
            //                                                   ? Colors.blue
            //                                                   : taskController.myTaskList[index].status  == "To-do"
            //                                                       ? Colors.amber
            //                                                       : taskController.myTaskList[index].status == "Resolved" ? Colors.pink : Colors.lime,
            //                                             ),
            //                                             width: 90,
            //                                             height: 40,
            //                                             child: Center(
            //                                                 child: Text(
            //                                               Morningtasklist[index].isselected
            //                                                   ? "Done"
            //                                                   : Morningtasklist[
            //                                                           index]
            //                                                       .Status,
            //                                               style: const TextStyle(
            //                                                   color:
            //                                                       BUTTONTEXTCOLOR),
            //                                             )),
            //                                           ),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 10,
            //                                     ),
            //                                     Text(
            //                                       taskController.myTaskList[index].description,
            //                                       style: const TextStyle(
            //                                           color: BLACKCOLOR,
            //                                           fontSize: 18,
            //                                           fontWeight: FontWeight.w400),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 15,
            //                                     ),
            //                                     // Row(
            //                                     //   children: [
            //                                     //     Icon(
            //                                     //       Icons.alarm,
            //                                     //       color: BLACKCOLOR,
            //                                     //     ),
            //                                     //     SizedBox(
            //                                     //       width: 10,
            //                                     //     ),
            //                                     //     Text(
            //                                     //       Morningtasklist[index]
            //                                     //           .TimeScheduleFromtime,
            //                                     //       style: TextStyle(
            //                                     //           color: BLACKCOLOR,
            //                                     //           fontSize: 16,
            //                                     //           fontWeight:
            //                                     //               FontWeight.w400),
            //                                     //     ),
            //                                     //     Text(
            //                                     //       Morningtasklist[index]
            //                                     //           .TimeScheduleTotime,
            //                                     //       style: TextStyle(
            //                                     //           color: BLACKCOLOR,
            //                                     //           fontSize: 16,
            //                                     //           fontWeight:
            //                                     //               FontWeight.w400),
            //                                     //     ),
            //                                     //   ],
            //                                     // ),
            //
            //                                     // SizedBox(
            //                                     //   height: 10,
            //                                     // ),
            //                                     Row(
            //                                       children: [
            //                                         SizedBox(
            //                                           width: 25,
            //                                           height: 25,
            //                                           child: Image.asset(
            //                                             ASSIGNTOYOU,
            //                                           ),
            //                                         ),
            //                                         Padding(
            //                                           padding:
            //                                               const EdgeInsets.only(
            //                                                   left: 10),
            //                                           child: Row(
            //                                             crossAxisAlignment:
            //                                                 CrossAxisAlignment
            //                                                     .center,
            //                                             mainAxisAlignment:
            //                                                 MainAxisAlignment
            //                                                     .center,
            //                                             children: [
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text:
            //                                                       "Pranav Flutter",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                               const SizedBox(
            //                                                 width: 1,
            //                                               ),
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text: "Bhive team",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                               const SizedBox(
            //                                                 width: 1,
            //                                               ),
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text: "Vicky b",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                             ],
            //                                           ),
            //                                           // Text(
            //                                           //   Morningtasklist[index]
            //                                           //       .AssignedTo,
            //                                           //   style: TextStyle(
            //                                           //       color: BLACKCOLOR,
            //                                           //       fontSize: 16,
            //                                           //       fontWeight:
            //                                           //           FontWeight.w400),
            //                                           // ),
            //                                         ),
            //                                       ],
            //                                     ),
            //
            //                                     const SizedBox(
            //                                       height: 15,
            //                                     ),
            //                                     Row(
            //                                       children: [
            //                                         const Icon(Icons.notifications,
            //                                             color: BLACKCOLOR),
            //                                         Padding(
            //                                           padding:
            //                                               const EdgeInsets.only(
            //                                                   left: 10),
            //                                           child: Row(
            //                                             crossAxisAlignment:
            //                                                 CrossAxisAlignment
            //                                                     .center,
            //                                             mainAxisAlignment:
            //                                                 MainAxisAlignment
            //                                                     .center,
            //                                             children: [
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text: "Bulut peker",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                               const SizedBox(
            //                                                 width: 1,
            //                                               ),
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text: "Pranav royal",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                               const SizedBox(
            //                                                 width: 1,
            //                                               ),
            //                                               SizedBox(
            //                                                 height: 35,
            //                                                 width: 35,
            //                                                 child: TextAvatar(
            //                                                   textColor:
            //                                                       Colors.white,
            //                                                   shape: Shape.Circular,
            //                                                   text: "Vicky b",
            //                                                   fontSize: 14,
            //                                                   numberLetters: 2,
            //                                                 ),
            //                                               ),
            //                                             ],
            //                                           ),
            //
            //                                           // Text(
            //                                           //   Morningtasklist[index]
            //                                           //       .Notifiy,
            //                                           //   style: TextStyle(
            //                                           //       color: BLACKCOLOR,
            //                                           //       fontSize: 16,
            //                                           //       fontWeight:
            //                                           //           FontWeight.w300),
            //                                           // ),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 15,
            //                                     ),
            //                                     Row(
            //                                       children: [
            //                                         const Icon(Icons.calendar_today,
            //                                             color: BLACKCOLOR),
            //                                         const SizedBox(
            //                                           width: 10,
            //                                         ),
            //                                         Text(
            //                                           taskController.myTaskList[index].startDate +"  -  "+taskController.myTaskList[index].endDate,
            //                                           style: const TextStyle(
            //                                               color: BLACKCOLOR,
            //                                               fontSize: 16,
            //                                               fontWeight:
            //                                                   FontWeight.w400),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           Container(
            //                             decoration: const BoxDecoration(
            //                               borderRadius: BorderRadius.only(
            //                                   bottomRight: Radius.circular(12.0),
            //                                   bottomLeft: Radius.circular(12.0)),
            //                               color: Color.fromARGB(179, 208, 208, 208),
            //                             ),
            //                             width: width! - 30,
            //                             height: 50,
            //                             child: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 10, right: 10),
            //                               child: Row(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.spaceBetween,
            //                                 children: [
            //                                   Row(
            //                                     children: [
            //                                       Text(
            //                                         Morningtasklist[index]
            //                                                 .isselected
            //                                             ? 'Done'
            //                                             : taskController.myTaskList[index].priority,
            //                                         style: const TextStyle(
            //                                           fontSize: 18,
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding: const EdgeInsets.only(
            //                                             left: 60),
            //                                         child: index % 1 == 1
            //                                             ? Container()
            //                                             : Container(
            //                                                 decoration: BoxDecoration(
            //                                                     borderRadius:
            //                                                         BorderRadius
            //                                                             .circular(
            //                                                                 30),
            //                                                     border: Border.all(
            //                                                         color: const Color(
            //                                                             0xffe94c89))),
            //                                                 child: Padding(
            //                                                   padding:
            //                                                       EdgeInsets.all(
            //                                                           8.0),
            //                                                   child: Text(
            //                                                       Morningtasklist[
            //                                                                   index]
            //                                                               .isselected
            //                                                           ? "Done"
            //                                                           : "Overdue"),
            //                                                 ),
            //                                               ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                   IconButton(
            //                                     icon: Morningtasklist[index]
            //                                             .isselected
            //                                         ? const Icon(
            //                                             Icons.check_box,
            //                                             color: Colors.green,
            //                                           )
            //                                         : const Icon(
            //                                             Icons
            //                                                 .check_box_outline_blank,
            //                                             color: Colors.blue,
            //                                           ),
            //                                     onPressed: (() {
            //                                       setState(() {
            //                                         Morningtasklist[index]
            //                                                 .isselected =
            //                                             !Morningtasklist[index]
            //                                                 .isselected;
            //                                       });
            //                                     }),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     );
            //                   })))
            //         ],
            //       ),
            //     );
            //   }
            // ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Addtasknew())),
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
                      Text('Add task',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BUTTONTEXTCOLOR)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
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
