import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class Beforesleeproutine {
  String title;
  String Subtitle;
  bool isselected = false;

  Beforesleeproutine(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Beforesleeproutine> Beforesleeproutinelist = [
  Beforesleeproutine(
      title: "Stop eating before bed",
      Subtitle: "Your Stomach also needs a good sleep",
      isselected: false),
  Beforesleeproutine(
      title: "Go to bed early",
      Subtitle: "Early to bed,early to rise",
      isselected: false),
  Beforesleeproutine(
      title: "Stretching",
      Subtitle: "Release tension & stress",
      isselected: false),
  Beforesleeproutine(
      title: "Practice meditationr",
      Subtitle: "Connect with your inner peace",
      isselected: false),
  Beforesleeproutine(
      title: "Practice breathing",
      Subtitle: "Calm yourself from every in and out",
      isselected: false),
  Beforesleeproutine(
      title: "Keep a journal",
      Subtitle: "Know yourself better through writing",
      isselected: false),
  Beforesleeproutine(
      title: "Reading", Subtitle: "Never enough books", isselected: false),
  Beforesleeproutine(
      title: "Take a bath",
      Subtitle: "Feel the healing power of a warm bath",
      isselected: false),
  Beforesleeproutine(
      title: "Drink hot milk",
      Subtitle: "The catalyst for sweet dreams",
      isselected: false),
  Beforesleeproutine(
      title: "Sleep sound & music",
      Subtitle: "Help brain to hit its inner snooze button",
      isselected: false),
];

class Beforesleeproutinepage extends StatefulWidget {
  @override
  State<Beforesleeproutinepage> createState() => _BeforesleeproutinepageState();
}

class _BeforesleeproutinepageState extends State<Beforesleeproutinepage> {
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
                  top: 20,
                  left: 20,
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Before sleep routine',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'May your dream be sweet tonight',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: BLACKCOLOR),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height = 100 * 14,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Beforesleeproutinelist.length,
                  itemBuilder: (context, index) {
                    Beforesleeproutine beforesleeproutine =
                        Beforesleeproutinelist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                             "1",
                              Beforesleeproutinelist[index].title,
                              Beforesleeproutinelist[index].Subtitle,
                            ),
                          ),
                        ),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getColor(),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  Beforesleeproutinelist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle:
                                  Text(Beforesleeproutinelist[index].Subtitle),
                              leading: IconButton(
                                icon: Beforesleeproutinelist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (Beforesleeproutinelist[index]
                                        .isselected) {
                                      Beforesleeproutinelist[index].isselected =
                                          false;
                                    } else {
                                      Beforesleeproutinelist[index].isselected =
                                          true;
                                    }
                                  });
                                }),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
