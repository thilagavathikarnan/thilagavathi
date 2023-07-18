import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habittrackergad/controller/teamController.dart';
import 'package:habittrackergad/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/Bottombar/Bottombarpage.dart';
import '../Components/Loginpage/Login.dart';
import '../constant/constant.dart';
import '../model/user_model.dart';
import 'auth_service.dart';

class UserController extends GetxController {

  GetSnackBar snackbarController = Get.put(GetSnackBar());
  GetStorage _box = GetStorage();
  UserModel? userModel;
  ProfileModel? profelModel;
  RxBool isLoaderReg = false.obs;
  RxString userName = "".obs;
  RxString lastName = "".obs;
  RxString emailText = "".obs;
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<UserModel> userList = [];
  List<UserModel> profileList = [];
  var uId;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void onInit()
  {
    profile();
    super.onInit();
  }
  Future<void> registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (first_name.text.isNotEmpty && last_name.text.isNotEmpty &&
        email.text.isNotEmpty && password.text.isNotEmpty) {
      var body = {
        "name": first_name.text,
        "email": email.text,
        "last_name": last_name.text,
        "password": password.text
      };
      var dataJs = json.encode(body);

      try {
        isLoaderReg.value = true;
        print("POSTAPI");
        var url = Uri.parse(mainUrl + registerUrl);
        print(url);
        print(isLoaderReg.value);
        print(body);
        http.Response response = await http.post(url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: dataJs);
        Map<String, dynamic> resp = json.decode(response.body);
        // Check if the API call was successful
        if (resp['success'] == true) {
          userModel = UserModel.fromJson(resp['data']);
          userId = userModel!.id;
          profile();
          await prefs.setString('userId', userModel!.id.toString());

          print("getuaers");
          print(uId);
          print(json.decode(response.body));
          print(resp['data']);
          print(userModel);
          // setUser(userModel!);
          first_name.clear();
          last_name.clear();
          email.clear();
          password.clear();
          Get.snackbar("Success", resp['msg'].toString(),
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(Icons.check, color: Colors.white,),
              snackPosition: SnackPosition.BOTTOM
          );
          Get.to(Login());
        }
        else {
          Get.snackbar("Alert", resp['msg'].toString(),
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(Icons.warning, color: Colors.white,),
              snackPosition: SnackPosition.BOTTOM
          );
        }
      }
      catch (e) {

      }
      finally {
        isLoaderReg.value = false;
      }
    }
    else {
      Get.snackbar("Alert", "Please enter all the fields",
          backgroundColor: Colors.black.withOpacity(0.8),
          colorText: Colors.white,
          icon: Icon(Icons.warning, color: Colors.white,),
          snackPosition: SnackPosition.BOTTOM

      );
    }
  }

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     final fcm =  await FirebaseMessaging.instance.getToken();
    if (email.text.isNotEmpty && password.text.isNotEmpty)
    {
      var body = {
        "email": email.text,
        "password": password.text,
         "device_token":fcm
      };
      var dataJs = json.encode(body);

      try {
        isLoaderReg.value = true;
        print("POSTAPI");
        var url = Uri.parse(mainUrl + loginUrl);
        print(url);
        print(isLoaderReg.value);
        print(body);
        http.Response response = await http.post(url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: dataJs);
        Map<String, dynamic> resp = json.decode(response.body);
        print(resp['data']);

         // await prefs.setString('userDetails', resp['data']);
        // String? userJson = prefs.getString('userDetails');
        //
        // print("USRMODEL");z
        // print(userJson);
        // Check if the API call was successful
        if (resp['success'] == true)
        {
               userModel = await UserModel.fromJson(resp['data']);
             await prefs.setString('userId', userModel!.id.toString());
             var uid = prefs.getString('userId');
             await prefs.setBool('userLoggedIn', true);
             await Get.put(TeamController);
             await profile();
             Get.snackbar("Success", resp['msg'].toString(),
                 backgroundColor: Colors.green.withOpacity(0.8),
                 colorText: Colors.white,
                 icon: Icon(Icons.check, color: Colors.white,),
                 snackPosition: SnackPosition.BOTTOM
             );
             Get.to(() => Bottombar());



        }
        else {
          Get.snackbar("Alert", resp['msg'].toString(),
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(Icons.warning, color: Colors.white,),
              snackPosition: SnackPosition.BOTTOM
          );
        }
      }
      catch (e) {
        Get.snackbar("Alert", e.toString(),
            backgroundColor: Colors.black.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(Icons.warning, color: Colors.white,),
            snackPosition: SnackPosition.BOTTOM
        );
      }
      finally {
        isLoaderReg.value = false;
      }
    }
    else
    {
      Get.snackbar("Alert", "Please enter all the fields",
          backgroundColor: Colors.black.withOpacity(0.8),
          colorText: Colors.white,
          icon: Icon(Icons.warning, color: Colors.white,),
          snackPosition: SnackPosition.BOTTOM

      );
    }
  }


  Future<void> profile()
  async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
  var usId = await prefs.getString('userId');
    try {
      isLoaderReg.value = true;
      print("GETPROFILEAPI");
      var url = Uri.parse(mainUrl + profileUrl+"/${usId}");
      print(url);
      http.Response response = await http.get(url);
      print(response.statusCode);
      print("GETSDDDDDDDDDDDDD");
      Map<String, dynamic> resp = json.decode(response.body);
      print(resp);
      profelModel = await ProfileModel.fromJson(resp['data']);

      userName.value = profelModel!.name.toString();
      lastName.value = profelModel!.lastName.toString();
      emailText.value = profelModel!.email.toString();

      if (resp['status'] == "200") {
        userName.value = profelModel!.name.toString();
        lastName.value = profelModel!.lastName.toString();
        emailText.value = profelModel!.email.toString();
        firstNameController.text = profelModel!.name.toString();
        lasstNameController.text = profelModel!.lastName.toString();
        emailController.text = profelModel!.email.toString();

        print("getuaers");
        print(userName.value);
        print(lastName.value);
        print(emailText.value);

        // Get.snackbar("Success", resp['message'].toString(),
        //     backgroundColor: Colors.green.withOpacity(0.8),
        //     colorText: Colors.white,
        //     icon: Icon(Icons.check, color: Colors.white,),
        //     snackPosition: SnackPosition.BOTTOM
        // );
      }
      else {
        // Get.snackbar("Alert", resp['message'].toString(),
        //     backgroundColor: Colors.black.withOpacity(0.8),
        //     colorText: Colors.white,
        //     icon: Icon(Icons.warning, color: Colors.white,),
        //     snackPosition: SnackPosition.BOTTOM
        // );
      }
    }
    catch (e) {

    }
    finally {
      isLoaderReg.value = false;
    }
  }
  Future<void> editProfile()
  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final fcm =  await FirebaseMessaging.instance.getToken();

    var usId = await prefs.getString('userId');
      var body = {
        "name":firstNameController.text.toString(),
        "lastName":lasstNameController.text.toString(),
        "email": emailController.text.toString(),
        "password": passwordController.text.toString(),
      };
      var dataJs = json.encode(body);

      try {
        isLoaderReg.value = true;
        print("POSTAPI");
        var url = Uri.parse(mainUrl + editProfiles+"/${usId}");
        print(url);
        print(isLoaderReg.value);
        print(body);
        http.Response response = await http.put(url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: dataJs);
        Map<String, dynamic> resp = json.decode(response.body);
        print(resp['data']);


        if (resp['data'] == 1) {
          await  profile();
           Get.back();
          Get.snackbar("Success", "Profile update sucessfully",
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(Icons.check, color: Colors.white,),
              snackPosition: SnackPosition.BOTTOM
          );
        }
        else {
          Get.snackbar("Alert", resp['msg'].toString(),
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(Icons.warning, color: Colors.white,),
              snackPosition: SnackPosition.BOTTOM
          );
        }
      }
      catch (e) {
        Get.snackbar("Alert", e.toString(),
            backgroundColor: Colors.black.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(Icons.warning, color: Colors.white,),
            snackPosition: SnackPosition.BOTTOM
        );
      }
      finally {
        isLoaderReg.value = false;
      }
    }


}
