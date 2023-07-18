import 'package:animated_horizontal_calendar/utils/color.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/teamController.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/task_model.dart';

class Taskpageprogress extends StatefulWidget {

  TaskModel task;
  Taskpageprogress(
      {required this.task});

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
  String? _selectedItemstatus;
  TextEditingController nameController2 = TextEditingController();
  TextEditingController SubtaskController1 = TextEditingController();
  bool taskisVisible = false;
  TeamController taskController = Get.put(TeamController());


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
      taskController.commentAdd(nameController2.text, widget.task.id);
      taskController.fetchComments(widget.task.id);
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

            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: const [
                          CircleAvatar(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              child: Icon(Icons.arrow_back_ios_new_outlined)),
                          SizedBox(width: 30,),
                          Text("Task detail",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          // Icon(Icons.edit)
                        ],
                      )),
                )),
            Text(
              widget.task.taskName.toString(),
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


              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
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
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Deadline"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.task.startDate.toString() +" - "+widget.task.endDate.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: TASKPAGEVIEWTEXTCOLOR),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
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
             Text(
              "${widget.task.description}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
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
              height: 10,
            ),
            Text(
              "${widget.task.subTask}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            // const Text(
            //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sollicitudin lorem metus, vel eleifend arcu pellentesque in. Sed commodo nunc tempor orci euismod iaculis.Mauris bibendum eget est ut posuere.",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            // ),
             SizedBox(
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
                    Text(widget.task.priority.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700))
                  ],
                ),
              ],
            ),
             SizedBox(
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
             SizedBox(
              height: 20,
            ),
            Row(
              children: [
                 Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor:Color(0xFFE0E0E0), // Image radius
                      child: Icon(Icons.person,color: Colors.grey,)
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Created by ${widget.task.task_owner}",
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
             SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          for(int i=0;i<widget.task.userName.length;i++)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: TextAvatar(
                                  textColor:
                                  Colors.white,
                                  shape: Shape.Circular,
                                  text:
                                  "${widget.task.userName[i].firstName} ${widget.task.userName[i].lastName}",
                                  fontSize: 14,
                                  numberLetters: 2,
                                ),
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
                    // SizedBox(
                    //     height: 45,
                    //     width: 45,
                    //     child: Card(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30)),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //         width: 20,
                    //         height: 20,
                    //         child: const Icon(Icons.add,
                    //             color: TASKPAGEVIEWTEXTCOLOR),
                    //       ),
                    //     )),
                  ],
                ),
              ],
            ),
             SizedBox(
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
             SizedBox(
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
                        radius: 48,
                        backgroundColor:Color(0xFFE0E0E0), // Image radius
                        child: Icon(Icons.person,color: Colors.grey,)
                    )
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Created by ${widget.task.task_owner}",
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
             SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<widget.task.notify_names.length;i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: TextAvatar(
                            textColor:
                            Colors.white,
                            shape: Shape.Circular,
                            text:
                            "${widget.task.notify_names[i].firstName} ${widget.task.notify_names[i].lastName}",
                            fontSize: 14,
                            numberLetters: 2,
                          ),
                        ),
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
             SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: ()
              {
                _onButtonPressed();
              },
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
                    child: _selectedItemstatus == null?
                    Text(widget.task.status.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: BUTTONTEXTCOLOR)):Text(_selectedItemstatus.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: BUTTONTEXTCOLOR))
                ),
              ),
            ),
             SizedBox(
              height: 30,
            ),
            // TextFormField(
            //   controller: SubtaskController1,
            //   minLines: 1,
            //   maxLines: 5,
            //   keyboardType: TextInputType.multiline,
            //   decoration: InputDecoration(
            //     suffixIcon: InkWell(
            //         onTap: () {
            //           addItemToListSubtask();
            //         },
            //         child: const Icon(Icons.send)),
            //     labelText: "Add subtask",
            //     filled: true,
            //     fillColor: const Color(0xfff2f2f2),
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text(
            //       "Loginpage",
            //       style: TextStyle(
            //           fontSize: 17,
            //           fontWeight: FontWeight.w400,
            //           color: TASKPAGEVIEWTEXTCOLOR),
            //     ),
            //     // Checkbox(
            //     //   value: this.value1,
            //     //   onChanged: (bool? value) {
            //     //     setState(() {
            //     //       this.value1 = value!;
            //     //     });
            //     //   },
            //     // ), //,
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text(
            //       "Home page",
            //       style: TextStyle(
            //           fontSize: 17,
            //           fontWeight: FontWeight.w400,
            //           color: TASKPAGEVIEWTEXTCOLOR),
            //     ),
            //     // Checkbox(
            //     //   value: this.value2,
            //     //   onChanged: (bool? value) {
            //     //     setState(() {
            //     //       this.value2 = value!;
            //     //     });
            //     //   },
            //     // ), //,
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: 60,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: ListView.separated(
            //             itemCount: Subtask.length,
            //             controller: ScrollController(),
            //             separatorBuilder: (_, __) => const SizedBox(height: 25),
            //             itemBuilder: (context, index) {
            //               return Container(
            //                 height: 20,
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       '${Subtask[index]}',
            //                       style: TextStyle(
            //                           fontSize: 17,
            //                           fontWeight: FontWeight.w400,
            //                           color: TASKPAGEVIEWTEXTCOLOR),
            //                     ),
            //                     // Checkbox(
            //                     //   value: this.value3,
            //                     //   onChanged: (bool? value) {
            //                     //     setState(() {
            //                     //       this.value3 = value!;
            //                     //     });
            //                     //   },
            //                     // ),
            //                   ],
            //                 ),
            //               );
            //             }),
            //       ),
            //     ],
            //   ),
            // ),

            // InkWell(
            //   // onTap: () => Navigator.pop(context),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Container(
            //       width: width! - 300,
            //       height: 45,
            //       decoration: BoxDecoration(
            //         gradient: const LinearGradient(
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //           colors: [
            //             Color(0XFFd0a1d2),
            //             Color(0XFF3b4682),
            //           ],
            //         ),
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: Center(
            //           child: Text("Submit",
            //               style: const TextStyle(
            //                   fontSize: 16, color: BUTTONTEXTCOLOR))),
            //     ),
            //   ),
            // ),

             Text(
              "Comments",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: TASKPAGEVIEWTEXTCOLOR),
            ),
             SizedBox(
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
              minLines: 1,
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
            Obx(() {
                return SizedBox(
                  height: taskController.commentList.length * 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: taskController.commentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const SizedBox(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundColor:Color(0xFFE0E0E0),
                                child: Icon(Icons.person,color: Colors.grey,),// Image radius

                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      "${taskController.commentList[index].user_name}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      DateFormat('EEE d MMM').format(DateTime.parse(taskController.commentList[index].createdAt)),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${taskController.commentList[index].comments}',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
  void _onButtonPressed() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 260,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                          ),
                          width: 200,
                          height: 10,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff59d6f9),
                                Color(0xff7f85f1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 30,
                          height: 30,
                          child: const Center(
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => _selectItemstatus("In-progress"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffBFEAF5),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff5CB8E4),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "In-progress",
                            style: TextStyle(
                                color: Color(0xff5CB8E4),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItemstatus("Completed"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFE5F1),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE98EAD),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Completed",
                            style: TextStyle(
                                color: Color(0xffE98EAD),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _selectItemstatus("Over due"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDEF5E5),
                    ),
                    width: width! - 10,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff4FA095),
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          const Text(
                            "Over due",
                            style: TextStyle(
                                color: Color(0xff4FA095),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _selectItemstatus(String name) {
    Navigator.pop(context);
    {
      setState(() {
        _selectedItemstatus = name == "Completed"? "completed":  name == "In-progress"?"in_progress":"over_due";
        print("TASKSTAUS");
        print(_selectedItemstatus);

        taskController.taskUpdate(widget.task.id, _selectedItemstatus);
        taskController.fetchTasks();

      });
    }
  }
}
