import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class Exploreyournewself {
  String title;
  String Subtitle;
  bool isselected = false;

  Exploreyournewself(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<Exploreyournewself> Exploreyournewselflist = [
  Exploreyournewself(
      title: "Practice Meditation",
      Subtitle: "Connect with your inner peace",
      isselected: false),
  Exploreyournewself(
      title: "Keep a journal",
      Subtitle: "Know yourself better through writing",
      isselected: false),
  Exploreyournewself(
      title: "Get out of your comfort zone",
      Subtitle: "Set yourself a challenge and achieve it",
      isselected: false),
  Exploreyournewself(
      title: '"Your the best"',
      Subtitle: "Say it to yourself when waking up",
      isselected: false),
  Exploreyournewself(
      title: "Share moments",
      Subtitle: "Happiness is only real when shared",
      isselected: false),
  Exploreyournewself(
      title: "Learn a new language",
      Subtitle: "Deepen your connection to other cultures",
      isselected: false),
  Exploreyournewself(
      title: "Learn a new musical instrument",
      Subtitle: "Run your fingers through your soul",
      isselected: false),
  Exploreyournewself(
      title: "Draw/paint something",
      Subtitle: "Find your inner van Gogh",
      isselected: false),
  Exploreyournewself(
      title: "Home cooking",
      Subtitle: "Eat healthy while saving money",
      isselected: false),
  Exploreyournewself(
      title: "Make a vlog",
      Subtitle: "Press the start button to record your true life",
      isselected: false),
  Exploreyournewself(
      title: "Plan to travel",
      Subtitle: "See the world and reboot your life",
      isselected: false),
  Exploreyournewself(
      title: "Meet new people",
      Subtitle: "Get out of your shell and fill your mind with new ideas",
      isselected: false),
];

class Exploreyournewselfpage extends StatefulWidget {
  @override
  State<Exploreyournewselfpage> createState() => _ExploreyournewselfpageState();
}

class _ExploreyournewselfpageState extends State<Exploreyournewselfpage> {
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
                  'Explore your new self',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'Discover your inner peace',
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
                  itemCount: Exploreyournewselflist.length,
                  itemBuilder: (context, index) {
                    Exploreyournewself essentialhabits =
                        Exploreyournewselflist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              "1",
                              Exploreyournewselflist[index].title,
                              Exploreyournewselflist[index].Subtitle,
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
                                  Exploreyournewselflist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle:
                                  Text(Exploreyournewselflist[index].Subtitle),
                              leading: IconButton(
                                icon: Exploreyournewselflist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (Exploreyournewselflist[index]
                                        .isselected) {
                                      Exploreyournewselflist[index].isselected =
                                          false;
                                    } else {
                                      Exploreyournewselflist[index].isselected =
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
