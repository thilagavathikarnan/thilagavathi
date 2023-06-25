import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth_controller.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  UserController  profileController = Get.put(UserController());
  void initState()
  {
    super.initState();
    setState(() {
      profileController.firstNameController.text = profileController.profelModel!.name;
      profileController.lasstNameController.text = profileController.profelModel!.lastName;
      profileController.emailController.text = profileController.profelModel!.email;

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: ()
          async{
            await profileController.editProfile();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.shade300
            ),
            child: Center(child: Text("Update",style: TextStyle(fontSize: 16,color: Colors.white),)),

          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("First Name",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                SizedBox(height: 8,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200
                  ),
                  child: TextField(
                    controller: profileController.firstNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person,color: Colors.black.withOpacity(0.4),),

                    ),
                  ),
                ),
                SizedBox(height: 8,),

                Text("Last Name",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                SizedBox(height: 8,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200
                  ),
                  child: TextField(
                    controller: profileController.lasstNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person,color: Colors.black.withOpacity(0.4),),

                    ),
                  ),
                ),
                SizedBox(height: 8,),

                Text("Email",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                SizedBox(height: 8,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200
                  ),
                  child: TextField(
                    controller: profileController.emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.4),),

                    ),
                  ),
                ),
                SizedBox(height: 8,),
              ],
            ),
          ),

          Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200
            ),
            child: Center(child: Text("Change Password",style: TextStyle(fontSize: 16,color: Colors.black),))
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 8,),

                Text("Password",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                SizedBox(height: 8,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200
                  ),
                  child: TextField(
                    controller: profileController.passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Colors.black.withOpacity(0.4),),

                    ),
                  ),
                ),
                SizedBox(height: 8,),

                Text("Confirm Password",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                SizedBox(height: 8,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200
                  ),
                  child: TextField(

                    controller: profileController.confirmPasswordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Colors.black.withOpacity(0.4),),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
