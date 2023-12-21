import 'package:flutter/material.dart';
import 'package:ht_re/service/common_var.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TeamAdd extends StatefulWidget {
  const TeamAdd({Key? key}) : super(key: key);

  @override
  State<TeamAdd> createState() => _TeamAddState();
}

class _TeamAddState extends State<TeamAdd> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TeamController teamController = Get.put(TeamController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.pink,
        title: Text("Add Team",style: TextStyle(fontSize: 16,color:Colors.white),),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: ()
          {

            String name = nameController.text.toString();
            String designation = designationController.text.toString();
            String phone = phoneController.text.toString();
            String email = emailController.text.toString();
            if(name.isNotEmpty && designation.isNotEmpty && phone.isNotEmpty && email.isNotEmpty)
              {
                teamController.teamAdd(name,designation, email,phone);

              }
            else
              {
                Fluttertoast.showToast(
                  msg: 'Please enter all th fields',
                  textColor: Colors.white,
                  backgroundColor: Colors.red,
                );
              }

          },
          child:Obx(()
          {
            if(teamController.isTeamSaveLoaders.isTrue)
              {
              return Container(
                  padding: EdgeInsets.all(8),
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
                  width: 100,
                  height: 45,
                  child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      )
                  ),
                );
              }
            else
              {
               return Container(
                  padding: EdgeInsets.all(8),
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
                  width: 100,
                  height: 40,
                  child: Center(
                    child: Text("Add Team"),
                  ),
                );
              }
          })



        ),
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text("Enter the name"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Designation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: designationController,
              decoration: InputDecoration(
                label: const Text("Enter the designation"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: const Text("Enter the email"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Phone',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                label: const Text("Enter the phone number "),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
              keyboardType: TextInputType.number,
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
