import 'package:animated_horizontal_calendar/utils/color.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class Taskpageprogress extends StatefulWidget {
  String? Taskname;
  String? Subtask;
  String? Taskdescription;
  String? Date;
  String? Status;
  String? Priority;
  String? Weekdays;

  Taskpageprogress(
      {this.Taskname,
      this.Subtask,
      this.Taskdescription,
      this.Date,
      this.Status,
      this.Priority,
      this.Weekdays});

  @override
  State<Taskpageprogress> createState() => _TaskpageprogressState();
}

class _TaskpageprogressState extends State<Taskpageprogress> {
  double? height;
  double? width;
  bool isselected = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  final List<String> names = <String>[];
  final List<String> Subtask = <String>[];
  final List<int> msgCount = <int>[];

  TextEditingController nameController2 = TextEditingController();
  TextEditingController SubtaskController1 = TextEditingController();
  bool taskisVisible = false;

  void addItemToListSubtask() {
    setState(() {
      Subtask.insert(
        0,
        SubtaskController1.text,
      );

      SubtaskController1.clear();
      // msgCount.insert(0, 0);
    });
  }

  void addItemToList() {
    setState(() {
      names.insert(
        0,
        nameController2.text,
      );

      nameController2.clear();
      // msgCount.insert(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              child: Icon(Icons.arrow_back_ios_new_outlined)),
                          Text("Task detail",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Icon(Icons.edit)
                        ],
                      )),
                )),
            Text(
              widget.Taskname.toString(),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: TASKPAGEVIEWTEXTCOLOR),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfffffffff)),
                        child: Image.asset(PROJECTICON),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Project"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Gad",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: TASKPAGEVIEWTEXTCOLOR),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfffffffff)),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/icons/dateicon.png",
                            color: TASKPAGEVIEWBUTTONCOLOR,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Deadline"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.Date.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: TASKPAGEVIEWTEXTCOLOR),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Description",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: TASKPAGEVIEWTEXTCOLOR),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sollicitudin lorem metus, vel eleifend arcu pellentesque in. Sed commodo nunc tempor orci euismod iaculis.Mauris bibendum eget est ut posuere.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        "assets/icons/prioritize.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Priority",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: TASKPAGEVIEWTEXTCOLOR)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(widget.Priority.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    ASSIGNTOYOU,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Members",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: TASKPAGEVIEWTEXTCOLOR),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      radius: 48, // Image radius
                      backgroundImage: AssetImage(
                        "assets/images/assignemen1.jpeg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Created by Gad",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: TASKPAGEVIEWTEXTCOLOR)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Project manager"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Pranav Flutter",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Bhive team",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Vicky b",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 20,
                            height: 20,
                            child: const Icon(Icons.add,
                                color: TASKPAGEVIEWTEXTCOLOR),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.notifications, color: BLACKCOLOR),
                ),
                Text(
                  "Notify",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: TASKPAGEVIEWTEXTCOLOR),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      radius: 48, // Image radius
                      backgroundImage: AssetImage(
                        "assets/images/assignemen1.jpeg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Created by Gad",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: TASKPAGEVIEWTEXTCOLOR)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Project manager"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Bulut peker",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Pranav royal",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: TextAvatar(
                        textColor: Colors.white,
                        shape: Shape.Circular,
                        text: "Vicky b",
                        fontSize: 14,
                        numberLetters: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 20,
                            height: 20,
                            child: const Icon(Icons.add,
                                color: TASKPAGEVIEWTEXTCOLOR),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: width! - 50,
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0XFFd0a1d2),
                      Color(0XFF3b4682),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Text(widget.Status.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: BUTTONTEXTCOLOR))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Subtask",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: TASKPAGEVIEWTEXTCOLOR),
                ),
                // Card(
                //   elevation: 2,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8)),
                //   child: Container(
                //     decoration:
                //         BoxDecoration(borderRadius: BorderRadius.circular(8)),
                //     width: 30,
                //     height: 30,
                //     child: const Icon(Icons.add, color: TASKPAGEVIEWTEXTCOLOR),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: SubtaskController1,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      addItemToListSubtask();
                    },
                    child: const Icon(Icons.send)),
                labelText: "Add subtask",
                filled: true,
                fillColor: const Color(0xfff2f2f2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Loginpage",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: TASKPAGEVIEWTEXTCOLOR),
                ),
                // Checkbox(
                //   value: this.value1,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       this.value1 = value!;
                //     });
                //   },
                // ), //,
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Home page",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: TASKPAGEVIEWTEXTCOLOR),
                ),
                // Checkbox(
                //   value: this.value2,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       this.value2 = value!;
                //     });
                //   },
                // ), //,
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemCount: Subtask.length,
                        controller: ScrollController(),
                        separatorBuilder: (_, __) => const SizedBox(height: 25),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${Subtask[index]}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: TASKPAGEVIEWTEXTCOLOR),
                                ),
                                // Checkbox(
                                //   value: this.value3,
                                //   onChanged: (bool? value) {
                                //     setState(() {
                                //       this.value3 = value!;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              // onTap: () => Navigator.pop(context),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: width! - 300,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0XFFd0a1d2),
                        Color(0XFF3b4682),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text("Submit",
                          style: const TextStyle(
                              fontSize: 16, color: BUTTONTEXTCOLOR))),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Comments",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: TASKPAGEVIEWTEXTCOLOR),
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Card(
            //       elevation: 2,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12)),
            //       child: Container(
            //         decoration:
            //             BoxDecoration(borderRadius: BorderRadius.circular(12)),
            //         width: 150,
            //         height: 50,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(right: 15),
            //               child: SizedBox(
            //                 width: 20,
            //                 height: 20,
            //                 child: Image.asset(
            //                   COMMENTSICON,
            //                 ),
            //               ),
            //             ),
            //             const Text("Comments",
            //                 style: TextStyle(
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w500,
            //                     color: TASKPAGEVIEWTEXTCOLOR))
            //           ],
            //         ),
            //       ),
            //     ),
            //     Card(
            //       elevation: 2,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12)),
            //       child: Container(
            //         decoration:
            //             BoxDecoration(borderRadius: BorderRadius.circular(12)),
            //         width: 50,
            //         height: 50,
            //         child: InkWell(
            //             onTap: () {
            //               setState(() {
            //                 taskisVisible = !taskisVisible;
            //               });
            //             },
            //             child: const Icon(Icons.add,
            //                 color: TASKPAGEVIEWTEXTCOLOR)),
            //       ),
            //     )
            //   ],
            // ),

            TextFormField(
              controller: nameController2,
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      addItemToList();
                    },
                    child: const Icon(Icons.send)),
                labelText: "Add a comments",
                filled: true,
                fillColor: const Color(0xfff2f2f2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            radius: 48, // Image radius
                            backgroundImage: AssetImage(
                              "assets/images/assignemen1.jpeg",
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Naveenraj",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              '${names[index]}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
