import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class Masterproductivity {
  String title;
  String Subtitle;
  bool isselected = false;

  Masterproductivity(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Masterproductivity> Masterproductivitylist = [
  Masterproductivity(
      title: "Set small goals",
      Subtitle: "Make goals more specific",
      isselected: false),
  Masterproductivity(
      title: "Prepare tomorrow's to-do list",
      Subtitle: "Make your time visible and countable",
      isselected: false),
  Masterproductivity(
      title: "Take greens & fruits",
      Subtitle: "Don't forget the natural snacks",
      isselected: false),
  Masterproductivity(
      title: "Drink 8 cups of water",
      Subtitle: "Keep your body hydrated",
      isselected: false),
  Masterproductivity(
      title: "Walking",
      Subtitle: "Strngthen muscles and lighten the mood",
      isselected: false),
  Masterproductivity(
      title: "Workout",
      Subtitle: "Move your body and enjoy burning fat",
      isselected: false),
  Masterproductivity(
      title: "Sleep over 8h",
      Subtitle: "Enough time for sweet dreams",
      isselected: false),
  Masterproductivity(
      title: "Spend one-on-one time",
      Subtitle: "Quality time deepens love",
      isselected: false),
  Masterproductivity(
      title: "Track spending",
      Subtitle: "Know where your money goes",
      isselected: false),
  Masterproductivity(
      title: "Clean as you go",
      Subtitle: "Make it as part of your daily routine",
      isselected: false),
  Masterproductivity(
      title: "Clean & disinfect",
      Subtitle: "Protect your family from dart and germs",
      isselected: false),
  Masterproductivity(
      title: "Monitor daily temperature",
      Subtitle: "Make sure your temperature is normal",
      isselected: false),
  Masterproductivity(
      title: "Have a healthy meal'",
      Subtitle: "The right mix of foods for optimal",
      isselected: false),
];

class Masterproductivitypage extends StatefulWidget {
  @override
  State<Masterproductivitypage> createState() => _MasterproductivitypageState();
}

class _MasterproductivitypageState extends State<Masterproductivitypage> {
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
                  'Master productivity',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'Be strategic with your efforts and time',
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
                  itemCount: Masterproductivitylist.length,
                  itemBuilder: (context, index) {
                    Masterproductivity masterproductivity =
                        Masterproductivitylist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              "1",
                              Masterproductivitylist[index].title,
                              Masterproductivitylist[index].Subtitle,
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
                                  Masterproductivitylist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle:
                                  Text(Masterproductivitylist[index].Subtitle),
                              leading: IconButton(
                                icon: Masterproductivitylist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (Masterproductivitylist[index]
                                        .isselected) {
                                      Masterproductivitylist[index].isselected =
                                          false;
                                    } else {
                                      Masterproductivitylist[index].isselected =
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
