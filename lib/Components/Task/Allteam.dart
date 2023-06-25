import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/model/user_model.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../controller/teamController.dart';
import 'Addteam.dart';

class gad {
  String PersonName;
  String PersonDesignation;
  String PersonEmail;
  String PersonPhoneNumber;

  gad(
      {required this.PersonName,
      required this.PersonDesignation,
      required this.PersonEmail,
      required this.PersonPhoneNumber});
}

List<gad> gadlist = [
  gad(
      PersonName: "Naveenraj",
      PersonDesignation: "Manager",
      PersonEmail: "Naveenraj@gmail.com",
      PersonPhoneNumber: "7645678488"),
  gad(
      PersonName: "Pranav",
      PersonDesignation: "Lead",
      PersonEmail: "Pranav@gmail.com",
      PersonPhoneNumber: "8845678488"),
  gad(
      PersonName: "Rajesh",
      PersonDesignation: "Associate",
      PersonEmail: "Rajesh@gmail.com",
      PersonPhoneNumber: "9945678488"),
  gad(
      PersonName: "vicky",
      PersonDesignation: "Juinor",
      PersonEmail: "vicky@gmail.com",
      PersonPhoneNumber: "8645678488"),
  gad(
      PersonName: "Naveenraj",
      PersonDesignation: "Manager",
      PersonEmail: "Naveenraj@gmail.com",
      PersonPhoneNumber: "7645678488"),
  gad(
      PersonName: "Pranav",
      PersonDesignation: "Lead",
      PersonEmail: "Pranav@gmail.com",
      PersonPhoneNumber: "8845678488"),
  gad(
      PersonName: "Rajesh",
      PersonDesignation: "Associate",
      PersonEmail: "Rajesh@gmail.com",
      PersonPhoneNumber: "9945678488"),
  gad(
      PersonName: "vicky",
      PersonDesignation: "Juinor",
      PersonEmail: "vicky@gmail.com",
      PersonPhoneNumber: "8645678488"),
  gad(
      PersonName: "Naveenraj",
      PersonDesignation: "Manager",
      PersonEmail: "Naveenraj@gmail.com",
      PersonPhoneNumber: "7645678488"),
  gad(
      PersonName: "Pranav",
      PersonDesignation: "Lead",
      PersonEmail: "Pranav@gmail.com",
      PersonPhoneNumber: "8845678488"),
  gad(
      PersonName: "Rajesh",
      PersonDesignation: "Associate",
      PersonEmail: "Rajesh@gmail.com",
      PersonPhoneNumber: "9945678488"),
  gad(
      PersonName: "vicky",
      PersonDesignation: "Juinor",
      PersonEmail: "vicky@gmail.com",
      PersonPhoneNumber: "8645678488"),
];

class Bhive {
  String PersonName;
  String PersonDesignation;
  String PersonEmail;
  String PersonPhoneNumber;

  Bhive(
      {required this.PersonName,
      required this.PersonDesignation,
      required this.PersonEmail,
      required this.PersonPhoneNumber});
}

List<Bhive> Bhivelist = [
  Bhive(
      PersonName: "Pranav",
      PersonDesignation: "Manager",
      PersonEmail: "Pranav@gmail.com",
      PersonPhoneNumber: "7645678488"),
  Bhive(
      PersonName: "Prasana",
      PersonDesignation: "Lead",
      PersonEmail: "Prasana@gmail.com",
      PersonPhoneNumber: "8845678488"),
  Bhive(
      PersonName: "Prabu",
      PersonDesignation: "Associate",
      PersonEmail: "Prabu@gmail.com",
      PersonPhoneNumber: "9945678488"),
  Bhive(
      PersonName: "Akash",
      PersonDesignation: "Juinor",
      PersonEmail: "Akash@gmail.com",
      PersonPhoneNumber: "8645678488"),
];

class Asian {
  String PersonName;
  String PersonDesignation;
  String PersonEmail;
  String PersonPhoneNumber;

  Asian(
      {required this.PersonName,
      required this.PersonDesignation,
      required this.PersonEmail,
      required this.PersonPhoneNumber});
}

List<Asian> Asianlist = [
  Asian(
      PersonName: "Pranav",
      PersonDesignation: "Manager",
      PersonEmail: "Pranav@gmail.com",
      PersonPhoneNumber: "7645678488"),
  Asian(
      PersonName: "Prasana",
      PersonDesignation: "Lead",
      PersonEmail: "Prasana@gmail.com",
      PersonPhoneNumber: "8845678488"),
  Asian(
      PersonName: "Prabu",
      PersonDesignation: "Associate",
      PersonEmail: "Prabu@gmail.com",
      PersonPhoneNumber: "9945678488"),
  Asian(
      PersonName: "Akash",
      PersonDesignation: "Juinor",
      PersonEmail: "Akash@gmail.com",
      PersonPhoneNumber: "8645678488"),
];

class Allteam extends StatefulWidget {
  const Allteam({super.key});

  @override
  State<Allteam> createState() => _AllteamState();
}

class _AllteamState extends State<Allteam> {
  final random = Random();
  TeamController teamController = Get.put(TeamController());

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
  void initState()
  {
    super.initState();
    // teamController.getTeamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
                height: 45,
                width: 120,
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  heroTag: "google",
                  backgroundColor: const Color(0xff3b4682),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addteam()),
                  ),
                  child: const Text("Add team"),
                )),
          ),

          // button third

          // Add more buttons here
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 0, bottom: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            //  Text(
            //   Get.find<UserController>().userModel!.name,
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            // ),
            const SizedBox(
              height: 10,
            ),


            Obx(
              () {
                if(teamController.isTeamLoaders.isTrue)
                  {
                    return Container(
                      height: 300,
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
                    if(teamController.teams.isNotEmpty)
                      {
                        return Container(
                          // padding: EdgeInsets.all(10),
                          // height: 110 * teamController.teams.length.toDouble(),
                          child: ListView.builder(
                              shrinkWrap: true,

                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teamController.teams.length,
                              itemBuilder: ((context, index) {

                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: getColor().withOpacity(.4),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                child: Text(
                                                  teamController.teams[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 21,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 1,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(teamController.teams[index].designation,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(teamController.teams[index].phone),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 12),
                                                      child: Image.asset(
                                                        MAIL_ICON,
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 03),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            teamController.teams[index].email,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              })),
                        );
                      }
                    else
                      {
                        return Container(
                          height: 300,
                          child: Center(child: Text("No teams")),
                        );
                      }

                  }

              }
            ),
            // const Divider(
            //   color: Colors.black,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text(
            //   "Bhive",
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // SizedBox(
            //   height: 370,
            //   child: ListView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: Bhivelist.length,
            //       itemBuilder: ((context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 5),
            //           child: Container(
            //               decoration: BoxDecoration(
            //                   color: getColor(),
            //                   borderRadius: BorderRadius.circular(8)),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 10, vertical: 10),
            //                     child: Text(
            //                       Bhivelist[index].PersonName,
            //                       style: const TextStyle(
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 10, vertical: 10),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Row(
            //                           children: [
            //                             Padding(
            //                               padding:
            //                                   const EdgeInsets.only(right: 20),
            //                               child: Text(
            //                                 Bhivelist[index].PersonEmail,
            //                                 style: const TextStyle(
            //                                     fontSize: 16,
            //                                     fontWeight: FontWeight.w400),
            //                               ),
            //                             ),
            //                             Text(
            //                                 Bhivelist[index].PersonPhoneNumber),
            //                           ],
            //                         ),
            //                         Text(Bhivelist[index].PersonDesignation,
            //                             style: const TextStyle(
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.w400)),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               )),
            //         );
            //       })),
            // ),
            // const Divider(
            //   color: Colors.black,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text(
            //   "Asian",
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // SizedBox(
            //   height: 370,
            //   child: ListView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: Asianlist.length,
            //       itemBuilder: ((context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 5),
            //           child: Container(
            //               decoration: BoxDecoration(
            //                   color: getColor(),
            //                   borderRadius: BorderRadius.circular(8)),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 10, vertical: 10),
            //                     child: Text(
            //                       Asianlist[index].PersonName,
            //                       style: const TextStyle(
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 10, vertical: 10),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Row(
            //                           children: [
            //                             Padding(
            //                               padding:
            //                                   const EdgeInsets.only(right: 20),
            //                               child: Text(
            //                                 Asianlist[index].PersonEmail,
            //                                 style: const TextStyle(
            //                                     fontSize: 16,
            //                                     fontWeight: FontWeight.w400),
            //                               ),
            //                             ),
            //                             Text(
            //                                 Asianlist[index].PersonPhoneNumber),
            //                           ],
            //                         ),
            //                         Text(Asianlist[index].PersonDesignation,
            //                             style: const TextStyle(
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.w400)),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               )),
            //         );
            //       })),
            // ),
            // const Divider(
            //   color: Colors.black,
            // ),
            // const SizedBox(
            //   height: 40,
            // ),
          ],
        ),
      ),
    );
  }
}
