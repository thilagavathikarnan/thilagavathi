import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/profile/edit_profile.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
class ProfileApi extends StatefulWidget {
  const ProfileApi({Key? key}) : super(key: key);

  @override
  State<ProfileApi> createState() => _ProfileApiState();
}

class _ProfileApiState extends State<ProfileApi> {
  @override
  UserController userController = Get.put(UserController());

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
              return Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey.shade100,
                      padding: EdgeInsets.all(20),
                      // height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width:  90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200
                            ),
                            child: Center(child: Icon(Icons.person,size:40,color: Colors.black.withOpacity(0.4),)),
                          ),
                          SizedBox(height: 10,),
                          // Text(userController.firstNameController.text.toString().toUpperCase()+" "+userController.lasstNameController.text .toString().toUpperCase()),
                          Text(userController.userName!.value.toString().toUpperCase()+" "+userController.lastName.value.toString().toUpperCase()),
                          SizedBox(height: 10,),
                          Text(userController.emailText.value.toString()),

                        ],
                      ),
                    ),

                  ],
                ),
              );
            }
          ),
          SizedBox(height: 8,),

          ListTile(
            onTap: ()
            {
              Get.to(EditProfile());

            },
            minLeadingWidth: 1,
            minVerticalPadding:1,
                horizontalTitleGap:6,

            leading: Icon(Icons.edit,color: Colors.black.withOpacity(0.4),size: 20,),
            title: Text("Edit Profile",style: TextStyle(fontSize: 15),),
          ),


        ],
      ),

    );
  }
}
