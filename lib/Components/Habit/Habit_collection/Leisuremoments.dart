import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Habit/Addhabits.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Utils/Constants.dart';

class LeisureMoments {
  String title;
  String Subtitle;
  bool isselected = false;

  LeisureMoments(
      {required this.title, required this.Subtitle, required this.isselected});
}

List<LeisureMoments> LeisureMomentslist = [
  LeisureMoments(
      title: "Watch a movie",
      Subtitle: "Get yourself a film therapy",
      isselected: false),
  LeisureMoments(
      title: "Practice a hobby",
      Subtitle: "Full your time,life won't pass you by",
      isselected: false),
  LeisureMoments(
      title: "Learn a new language",
      Subtitle: "Deepen your connection to other cultures",
      isselected: false),
  LeisureMoments(
      title: "Learn a new musical instrument",
      Subtitle: "Run your fingers through your soul",
      isselected: false),
  LeisureMoments(
      title: "Board games with friends",
      Subtitle: "More then just fun and games",
      isselected: false),
  LeisureMoments(
      title: "Draw/paint something",
      Subtitle: "Find your inner van Gogh",
      isselected: false),
  LeisureMoments(
      title: "Take a photo",
      Subtitle: "Record it as lifetime memories",
      isselected: false),
  LeisureMoments(
      title: "Time for self-care",
      Subtitle: "Take time to nourish your body properly",
      isselected: false),
  LeisureMoments(
      title: "Diy", Subtitle: "Boost your creativity", isselected: false),
  LeisureMoments(
      title: "Enjoy podcasts",
      Subtitle: "Pick an episode you get hooked",
      isselected: false),
  LeisureMoments(
      title: "Reading", Subtitle: "Never enough books", isselected: false),
  LeisureMoments(
      title: "Publish a new post",
      Subtitle: "Each moment is worth sharing",
      isselected: false),
  LeisureMoments(
      title: "Video call'",
      Subtitle: "Face-to-face regardless of distance",
      isselected: false),
  LeisureMoments(
      title: "Karaoke'",
      Subtitle: "Singing time is bonding time",
      isselected: false),
];

class LeisureMomentspage extends StatefulWidget {
  @override
  State<LeisureMomentspage> createState() => _LeisureMomentspageState();
}

class _LeisureMomentspageState extends State<LeisureMomentspage> {
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
                  'Leisure moments',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: BLACKCOLOR),
                ),
                Text(
                  'Live your life to the max',
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
                  itemCount: LeisureMomentslist.length,
                  itemBuilder: (context, index) {
                    LeisureMoments leisureMoments = LeisureMomentslist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addhabitsintrent(
                              "1",
                              LeisureMomentslist[index].title,
                              LeisureMomentslist[index].Subtitle,
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
                                  LeisureMomentslist[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle:
                                  Text(LeisureMomentslist[index].Subtitle),
                              leading: IconButton(
                                icon: LeisureMomentslist[index].isselected
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: (() {
                                  setState(() {
                                    if (LeisureMomentslist[index].isselected) {
                                      LeisureMomentslist[index].isselected =
                                          false;
                                    } else {
                                      LeisureMomentslist[index].isselected =
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
