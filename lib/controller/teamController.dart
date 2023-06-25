import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/model/task_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/Bottombar/Bottombarpage.dart';
import '../Components/Loginpage/Login.dart';
import '../constant/constant.dart';
import '../model/habit_model.dart';
import '../model/habits_model.dart';
import '../model/team_model.dart';
import '../model/user_habit_model.dart';
import '../model/user_model.dart';

class TeamController extends GetxController {
  GetSnackBar snackbarController = Get.put(GetSnackBar());
  RxList<TeamModel> teams = <TeamModel>[].obs;
  final isTeamLoaders = false.obs;
  RxList<Task> myTaskList = <Task>[].obs;
  final isTeamSaveLoaders = false.obs;
   final assigned_by_you_count = 0.obs;
   final assigned_me_count = 0.obs;
   final notify_me_count = 0.obs;
  GetStorage _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getTeamList();
    fetchTasks();
  }
fetchTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var usId = await prefs.getString('userId');
    final response = await http.get(Uri.parse(mainUrl+taskUserUrl+"?user_id=${usId}"));
    print("UserTASK");
    print(mainUrl+taskUserUrl+"/${usId}");

    if (response.statusCode == 200)
    {
      final jsonData = json.decode(response.body);
      final tasks = (jsonData['data'] as List).map((taskData) => Task.fromJson(taskData)).toList();
      myTaskList.value = tasks;
      print(myTaskList.value);
      print("-----------------");
    }
    else
    {
      throw Exception('Failed to fetch tasks');
    }
  }



  teamAdd(name,designation, email,phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    var body = {
    "name":name,
    "designation":designation,
    "email":email,
    "phone":phone,
      "user_id": usId
    };
    var dataJs = json.encode(body);
    try {
      isTeamSaveLoaders.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/public/api/teams-create');
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['success'] == true) {
        getTeamList();
        Get.back();
        Get.snackbar("Success", "Habit request send successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      else
        {
          Get.snackbar("Alert", "${resp['message']}",
              backgroundColor: Colors.black.withOpacity(0.7),
              colorText: Colors.white,
              icon: Icon(
                Icons.warning,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.BOTTOM);
        }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamSaveLoaders.value = false;
    }
  }


  taskAdd(taskName, description,subTaskName,selectTeams,selectTeamsNotify,startDate,endDate,_selectedItempriority,_selectedItemstatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    var body = {
    "task_name":taskName,
    "description":description,
    "status":_selectedItemstatus,
    "sub_task":description,
    "priority":_selectedItempriority,
    "assign_id":selectTeams,
    "notify_id":selectTeamsNotify,
    "start_date":DateFormat('yyyy-MM-dd').format(startDate),
    "end_date":DateFormat('yyyy-MM-dd').format(endDate),
      "user_id": usId,
    };
    var dataJs = json.encode(body);
    try {
      isTeamSaveLoaders.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/public/api/task_assign');
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['success'] == true) {
        // getTeamList();
        // Get.back();
        Get.snackbar("Success", "Habit request send successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      else
        {
          Get.snackbar("Alert", "${resp['message']}",
              backgroundColor: Colors.black.withOpacity(0.4),
              colorText: Colors.white,
              icon: Icon(
                Icons.warning,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.BOTTOM);
        }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamSaveLoaders.value = false;
    }
  }


  getTeamList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    try {

      isTeamLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse(
          'https://habitseveryday.com/api/teams-get/${usId}');
      print(url);

      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);
      teams.value.clear();
      final dataList = parsedResponse['data'] as List<dynamic>;
      final List<TeamModel> teamList = dataList
          .map((teamData) => TeamModel.fromJson(teamData))
          .toList();

      teams.value = teamList;
      // if (parsedResponse['success']) {
      //   final habitsData = parsedResponse['data'] as List<dynamic>;
      //   habit.value = habitsData.map((json) => Habits.fromJson(json)).toList();
      //   print(habit.value.length.toString());
      //   print(habit.value[0].name);
      // }

    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamLoaders.value = false;
    }
  }




}
