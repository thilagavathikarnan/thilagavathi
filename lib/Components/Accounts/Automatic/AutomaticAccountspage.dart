import 'dart:math';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:habittrackergad/Components/Accounts/Automatic/chart_Automatic_account.dart';


import '../../../Utils/Constants.dart';
import '../Account_All_History.dart';
import 'AutomaticAccountyearreport.dart';
import '../Manual/Chart_Manual_account.dart';

class PaymentMethod {
  String Paymentlogo = "";
  String Paymentname;
  String Paymenticon;
  String Paymentamount;
  String Paymentdate;
  String Paymenttime;
  bool isselected = false;

  PaymentMethod({
    this.Paymentlogo = "",
    required this.Paymentname,
    required this.Paymenticon,
    required this.Paymentamount,
    required this.Paymentdate,
    required this.Paymenttime,
    required this.isselected,
  });
}

List<PaymentMethod> PaymentMethodList = [
  PaymentMethod(
    Paymentlogo: 'assets/icons/Creditlogo.png',
    Paymentname: 'Credit',
    Paymenticon: 'assets/icons/Incomearrow.icon.png',
    Paymentamount: '₹1,00,000',
    Paymentdate: '15-12-22',
    Paymenttime: '11:55 am',
    isselected: false,
  ),
  PaymentMethod(
    Paymentlogo: 'assets/icons/upi.logo.png',
    Paymentname: 'Upi funds \ntransfer',
    Paymenticon: 'assets/icons/Expansesarrow.logo.png',
    Paymentamount: '₹300',
    Paymentdate: '15-12-22',
    Paymenttime: '02:55 pm',
    isselected: true,
  ),
  PaymentMethod(
    Paymentlogo: 'assets/icons/Atm.logo.png',
    Paymentname: 'Atm',
    Paymenticon: 'assets/icons/Expansesarrow.logo.png',
    Paymentamount: '₹4000',
    Paymentdate: '15-12-22',
    Paymenttime: '04:30 pm',
    isselected: true,
  ),
  PaymentMethod(
    Paymentlogo: 'assets/icons/Netbanking.logo.png',
    Paymentname: 'Net \nbanking',
    Paymenticon: 'assets/icons/Expansesarrow.logo.png',
    Paymentamount: '₹2400',
    Paymentdate: '15-12-22',
    Paymenttime: '08:55 pm',
    isselected: true,
  ),
];

/////////////////////

class Income {
  String Transactionname = "";
  String Transactiondate;
  String Transactiontime;
  String Transactionamount;

  Income({
    this.Transactionname = "",
    required this.Transactiondate,
    required this.Transactiontime,
    required this.Transactionamount,
  });
}

List<Income> IncomeList = [
  Income(
    Transactionname: 'salary',
    Transactiondate: "27-08-2022",
    Transactiontime: "01:50 pm",
    Transactionamount: '+ 50,000',
  ),
  Income(
    Transactionname: 'salary',
    Transactiondate: "27-08-2022",
    Transactiontime: "01:50 pm",
    Transactionamount: '+ 50,000',
  ),
];

class AutomaticAccountpage extends StatefulWidget {
  const AutomaticAccountpage({super.key});

  @override
  State<AutomaticAccountpage> createState() => _AutomaticAccountpageState();
}

class _AutomaticAccountpageState extends State<AutomaticAccountpage> {
  final List CreditCardName = ["CreditCardName"];
  final List CreditCardBankLogo = ["assets/icons/Hdfc.png"];
  final List CreditCardBankName = ["HTFC BANK"];
  final List CreditCardChipIcon = ["assets/icons/sim-card-chip.png"];
  final List CreditCardValidFrom = ["VALID\nFROM"];
  final List CreditCardValidFromDate = [" 07/21"];
  final List CreditCardValidThru = ["VALID\nTHRU"];
  final List CreditCardValidThruDate = [" 07/24"];
  final List CreditCardHolderName = ["NAVEEN RAJ"];
  final List CreditCardVisaIcon = ["assets/icons/sim-card-chip.png"];

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
    "₹1000",
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
  late DateTime _selectedDate;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

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
    Color(0xff850000),
    Color(0xff472183),
    Color(0xffCB1C8D),
    Color(0xff181D31),
    Color(0xff10A19D),
    Color(0xff0014FF),
    Color(0xff00BEBED),
    Color(0xffE97777),
    Color(0xff372948),
    Color(0xff84DFFF),
  ];

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: BUTTONTEXTCOLOR,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_back_ios_new_outlined)),
                            Row(
                              children: const [
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 0),
                                //   child: InkWell(
                                //     onTap: () => Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               const ChartAutomaticaccount()),
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
                                //         builder: (context) =>
                                //             Automatic_Accountyear_report()),
                                //   ),
                                //   child: Image.asset(
                                //     BARCHARTICON,
                                //     width: 30,
                                //     height: 30,
                                //   ),
                                // ),
                              ],
                            ),
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
                        builder: ((context) => ChartAutomaticaccount()))),
                child: Container(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
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
                      )
                    ],
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Align(
              //         alignment: Alignment.topLeft,
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //             top: 10,
              //             left: 10,
              //           ),
              //           child: InkWell(
              //             onTap: () => Navigator.pop(context),
              //             child: CircleAvatar(
              //                 backgroundColor: Colors.grey,
              //                 foregroundColor: Colors.white,
              //                 child: Icon(Icons.arrow_back_ios_new_outlined)),
              //           ),
              //         )),
              //     Padding(
              //       padding: const EdgeInsets.only(top: 10, right: 15),
              //       child: InkWell(
              //         onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => ChartAutomaticaccount()),
              //         ),
              //         child: Image.asset(
              //           "assets/icons/pie-chart.png",
              //           width: 35,
              //           height: 35,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 15,
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
              //   dayColor: Color(0xFF704a9f),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
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
                height: 15,
              ),
              SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: PaymentMethodList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5,
                                    top: 10,
                                  ),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Account_All_History()),
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: const BorderSide(
                                              color: Colors.black)),
                                      elevation: 2,
                                      child: Container(
                                        width: width! - 250,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 15, right: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Image.asset(
                                                      PaymentMethodList[index]
                                                          .Paymentlogo,
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    PaymentMethodList[index]
                                                        .Paymentname,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 20,
                                                    ),
                                                    child: Text(
                                                        PaymentMethodList[index]
                                                            .Paymentamount,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ),

                                                  // Icon(
                                                  //   PaymentMethodList[index]
                                                  //           .isselected
                                                  //       ? Icons.arrow_upward
                                                  //       : Icons.arrow_downward,
                                                  // ),

                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                        PaymentMethodList[index]
                                                            .Paymenticon,
                                                        color:
                                                            PaymentMethodList[
                                                                        index]
                                                                    .isselected
                                                                ? Colors
                                                                    .deepOrange
                                                                : Colors.green),
                                                  ),

                                                  //                      leading: IconButton(
                                                  //   icon: Habitintrendlist[index].isselected
                                                  //       ? Icon(Icons.check)
                                                  //       : Icon(Icons.check_box_outline_blank),
                                                  //   onPressed: (() {
                                                  //     setState(() {
                                                  //       if (Habitintrendlist[index].isselected) {
                                                  //         Habitintrendlist[index].isselected =
                                                  //             false;
                                                  //       } else {
                                                  //         Habitintrendlist[index].isselected = true;
                                                  //       }
                                                  //     });
                                                  //   }),
                                                  // ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                    PaymentMethodList[index]
                                                        .Paymentdate),
                                              ),
                                              Text(PaymentMethodList[index]
                                                  .Paymenttime),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Account History',
                      style: TextStyle(fontSize: 22, color: BLACKCOLOR),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Account_All_History()),
                      ),
                      child: Row(
                        children: const [
                          Text("View all"),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 450,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: AccountHolderName.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Container(
                                    width: width! - 10,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: getColor()),
                                        color: BUTTONTEXTCOLOR),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: CircleAvatar(
                                                  radius: 48, // Image radius
                                                  backgroundImage: AssetImage(
                                                      AccountHolderImages[
                                                          index]),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Text(
                                                        AccountHolderName[
                                                            index],
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Text(
                                                        AccountPaymentName[
                                                            index],
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AccountTransationMonth[
                                                              index],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5,
                                                                  right: 5),
                                                          child: Text(
                                                              AccountTransationDate[
                                                                  index]),
                                                        ),
                                                        Text(
                                                            AccountTransationTime[
                                                                index]),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(AccountTransationAmount[index],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    )),
                              );
                            }))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
