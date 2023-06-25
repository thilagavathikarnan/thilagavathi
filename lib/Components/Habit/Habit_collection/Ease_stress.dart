import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class Easestress {
  String title;
  String Subtitle;
  bool isselected = false;

  Easestress(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Easestress> Easestresslist = [
  Easestress(
      title: "Practice breathing",
      Subtitle: "Connect with your inner peace",
      isselected: false),
  Easestress(
      title: "Practice breathing",
      Subtitle: "Calm yourself from every in and out",
      isselected: false),
  Easestress(
      title: "Reading", Subtitle: "Never enough books", isselected: false),
  Easestress(
      title: "Keep a journal",
      Subtitle: "Know yourself better through writing",
      isselected: false),
  Easestress(
      title: "Stretching",
      Subtitle: "Relese tension & Stress",
      isselected: false),
  Easestress(
      title: "Yoga", Subtitle: "Calming and smoothing", isselected: false),
  Easestress(
      title: "Sleep over 8h",
      Subtitle: "Enough time for sweet dreams",
      isselected: false),
  Easestress(
      title: "Enjoy outdoors",
      Subtitle: "Embrace nature in your busy life",
      isselected: false),
  Easestress(
      title: "Allow a moment to cry",
      Subtitle: "No hesitation for the release",
      isselected: false),
  Easestress(
      title: "Pick a smell that eases you",
      Subtitle: "Seek fancy scents for stress relief",
      isselected: false),
  Easestress(
      title: "Brain dump",
      Subtitle: "Manage anxiety and 'over thinking'",
      isselected: false),
];

class Easestresspage extends StatefulWidget {
  @override
  State<Easestresspage> createState() => _EasestresspageState();
}

class _EasestresspageState extends State<Easestresspage> {
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
                  'Ease stress',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'Your efforts deserve a break',
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
            height: height = 100 * 12,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Easestresslist.length,
                  itemBuilder: (context, index) {
                    Easestress easestress = Easestresslist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              "2",
                              Easestresslist[index].title,
                              Easestresslist[index].Subtitle,
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
                                  Easestresslist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle: Text(Easestresslist[index].Subtitle),
                              leading: IconButton(
                                icon: Easestresslist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (Easestresslist[index].isselected) {
                                      Easestresslist[index].isselected = false;
                                    } else {
                                      Easestresslist[index].isselected = true;
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
