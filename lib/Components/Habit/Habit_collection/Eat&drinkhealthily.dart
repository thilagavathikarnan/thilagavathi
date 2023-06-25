import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class Eatdrinkhealthily {
  String title;
  String Subtitle;
  bool isselected = false;

  Eatdrinkhealthily(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Eatdrinkhealthily> Eatdrinkhealthilylist = [
  Eatdrinkhealthily(
      title: "Go sugar-free",
      Subtitle: "See your body change with being sugar-free",
      isselected: false),
  Eatdrinkhealthily(
      title: "Limit caffeine intake",
      Subtitle: "Replace with other healthy choices",
      isselected: false),
  Eatdrinkhealthily(
      title: "No alcohol",
      Subtitle: "Life is way better without alcohol",
      isselected: false),
  Eatdrinkhealthily(
      title: "No fried food",
      Subtitle: "An easy way to lose fat",
      isselected: false),
  Eatdrinkhealthily(
      title: "Intermittent fasting",
      Subtitle: "Your stomach needs a little rest",
      isselected: false),
  Eatdrinkhealthily(
      title: "Taks greens & fruits",
      Subtitle: "Don't forget the natural snacks",
      isselected: false),
  Eatdrinkhealthily(
      title: "Have breakfast",
      Subtitle: "Wake up your body with energys",
      isselected: false),
  Eatdrinkhealthily(
      title: "Drink 8 cups of water",
      Subtitle: "Keep your body hydrated",
      isselected: false),
  Eatdrinkhealthily(
      title: "Floss after eating",
      Subtitle: "Look presentable and smaile confidently",
      isselected: false),
  Eatdrinkhealthily(
      title: "Take vitamins",
      Subtitle: "Supplement with some 'magic bullets'",
      isselected: false),
  Eatdrinkhealthily(
      title: "Have a healthy meal",
      Subtitle: "The right mix of foods for optimal nutrition",
      isselected: false),
];

class Eatdrinkhealthilypage extends StatefulWidget {
  @override
  State<Eatdrinkhealthilypage> createState() => _EatdrinkhealthilypageState();
}

class _EatdrinkhealthilypageState extends State<Eatdrinkhealthilypage> {
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
                  'Eat & drink healthily',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'Stay healthy with daily intakes',
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
                  itemCount: Eatdrinkhealthilylist.length,
                  itemBuilder: (context, index) {
                    Eatdrinkhealthily eatdrinkhealthily =
                        Eatdrinkhealthilylist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              "2",
                              Eatdrinkhealthilylist[index].title,
                              Eatdrinkhealthilylist[index].Subtitle,
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
                                  Eatdrinkhealthilylist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle:
                                  Text(Eatdrinkhealthilylist[index].Subtitle),
                              leading: IconButton(
                                icon: Eatdrinkhealthilylist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (Eatdrinkhealthilylist[index]
                                        .isselected) {
                                      Eatdrinkhealthilylist[index].isselected =
                                          false;
                                    } else {
                                      Eatdrinkhealthilylist[index].isselected =
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
