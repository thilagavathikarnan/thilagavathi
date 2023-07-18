import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/model/bannerModel.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import '../Components/Bottombar/Bottombarpage.dart';
import '../Components/Loginpage/Login.dart';
import '../constant/constant.dart';
import '../model/habit_model.dart';
import '../model/habits_model.dart';
import '../model/user_habit_model.dart';
import '../model/user_model.dart';

class HabitController extends GetxController {
  GetSnackBar snackbarController = Get.put(GetSnackBar());
  final isLoaders = false.obs;
  final isHabitLoaders = false.obs;
  final isHabituser = false.obs;
  final isHabitcat = false.obs;
  final isHabituserList = false.obs;
  RxList<Habit> habits = <Habit>[].obs;
  RxList<Habits> habit = <Habits>[].obs;

  final bannerData = [].obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;


  final morningSlot = <StudyEvent>[].obs;
  final afterNoonSlot = <StudyEvent>[].obs;
  final eveningNoonSlot = <StudyEvent>[].obs;
  final nightNoonSlot = <StudyEvent>[].obs;

  final morningHabitSlot = <StudyEvent>[].obs;
  final afterNoonHabitSlot = <StudyEvent>[].obs;
  final eveningNoonHabitSlot = <StudyEvent>[].obs;
  final nightNoonHabitSlot = <StudyEvent>[].obs;

  final nightSlot = [].obs;
  RxList<StudyEvent> studyEvents = <StudyEvent>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHabit();
    getUserHabit();
    getUserHabitList();
    bannerList();
  }
  bannerList() async{
    var url = Uri.parse(mainUrl+bannerUrl);
    var response = await http.get(url);
    print(response.body);
    print("GETURL");
    print(url);
    var res = json.decode(response.body);
    final bannerDatas = res['data'] as List<dynamic>;
    banners.value = bannerDatas.map((json) => BannerModel.fromJson(json)).toList();
    // for(int i = 0; i<res['data'].length; i++)
    //   {
    //     bannerData.value.add(res['data'][i]['fullImage']);
    //
    //   }
    print("GETBANNER");
    print(bannerDatas);

  }

  habitRequest(habitName, duration_start, duration_to, selectDays, slots,
      slotType, dateInput, shift) async {
    var body = {
      "name": habitName,
      "date": dateInput,
      "duration_from": duration_start,
      "duration_to": duration_to,
      "slots_type": slotType,
      "slots": selectDays,
      "description": "test",
      "image": "test",
      "user_id": Get.find<UserController>().userModel!.id,
      "shift": shift
    };
    var dataJs = json.encode(body);
    try {
      isHabitLoaders.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/api/habit-request-save');
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
        Get.snackbar("Success", "Habit request send successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
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
      isHabitLoaders.value = false;
    }
  }

  habitUserSave(habitName, duration_start, duration_to, selectDays, slots,
      slotType, dateInput, shift) async {
    var body = {
      "user_id":userId,
      // "user_id":Get.find<UserController>().userModel!.id,
      "name": habitName,
      "date": dateInput,
      "duration_from": duration_start,
      "duration_to": duration_to,
      "slots_type": slotType,
      "slots": selectDays,
      "description": "test",
      "image": "test",
      "shift": shift
    };
    var dataJs = json.encode(body);
    try {
      isLoaders.value = true;
      print("POSTAPI");
      var url = Uri.parse(
          'https://habitseveryday.com/api/customer-habits-save');
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      print(resp);
      if (resp['success'] == true)
        {
          Get.snackbar("Success", "Habit save successfully",
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.BOTTOM);

        }
      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isLoaders.value = false;
    }
  }

  getHabit() async {
    try {
      isHabitcat.value = true;
      print("GETAPI");
      var url = Uri.parse('https://habitseveryday.com/api/habit-category-get');
      print(url);

      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);

      if (parsedResponse['success']) {
        final habitsData = parsedResponse['data'] as List<dynamic>;
        habits.value = habitsData.map((json) => Habit.fromJson(json)).toList();
      } else {
        habits.value = [];
      }
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isHabitcat.value = false;
    }
  }

  getHabitByCat(id) async {
    try {
      isLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse(
          'https://habitseveryday.com/api/habit-against-category?category_id=${id}');
      print(url);

      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);

      if (parsedResponse['success']) {
        final habitsData = parsedResponse['data'] as List<dynamic>;
        habit.value = habitsData.map((json) => Habits.fromJson(json)).toList();
        print(habit.value.length.toString());
        print(habit.value[0].name);
      } else {
        habit.value = [];
      }
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isLoaders.value = false;
    }
  }

  getUserHabit() async {
    var body = {
      "user_id": userId
      // "user_id": Get.find<UserController>().userModel!.id,
    };
    var dataJs = json.encode(body);
    try {
      isHabituser.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/api/habit-request-get');
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
        final List<dynamic> data = resp['data'];
        final List<StudyEvent> events =
            data.map((item) => StudyEvent.fromJson(item)).toList();
        studyEvents.value = events;
        morningSlot.value.clear();
        afterNoonSlot.value.clear();
        eveningNoonSlot.value.clear();
        nightNoonSlot.value.clear();
        for (int i = 0; i < studyEvents.value.length; i++) {
          if (studyEvents.value[i].shift == "Morning") {
            morningSlot.value.add(studyEvents.value[i]);
          } else if (studyEvents.value[i].shift == "Afternoon") {
            afterNoonSlot.value.add(studyEvents.value[i]);
          } else if (studyEvents.value[i].shift == "Evening") {
            eveningNoonSlot.value.add(studyEvents.value[i]);
          } else {
            nightNoonSlot.value.add(studyEvents.value[i]);
          }
        }

        print("GETSLOTSS");
        print(morningSlot.value.toString()+" "+morningSlot.value.length.toString());
        print(afterNoonSlot.value.toString()+" "+afterNoonSlot.value.length.toString());
        print(eveningNoonSlot.value.toString()+" "+eveningNoonSlot.value.length.toString());
        print(nightNoonSlot.value.toString()+" "+nightNoonSlot.value.length.toString());

        // Get.snackbar("Success", "Habit request send successfully",
        //     backgroundColor: Colors.green.withOpacity(0.8),
        //     colorText: Colors.white,
        //     icon: Icon(
        //       Icons.check,
        //       color: Colors.white,
        //     ),
        //     snackPosition: SnackPosition.BOTTOM);
      }
      else
        {
          morningSlot.value = [];
          afterNoonSlot.value = [];
          eveningNoonSlot.value = [];
          nightNoonSlot.value = [];

        }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isHabituser.value = false;
    }
  }
  getUserHabitList() async {
    var body = {
      "user_id": Get.find<UserController>().userModel!.id,
    };
    var dataJs = json.encode(body);
    try {
      isHabituserList.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/api/customer-habits-get?user_id=${userId}');
      // var url = Uri.parse('https://habitseveryday.com/api/customer-habits-get?user_id=${Get.find<UserController>().userModel!.id}');
      print(url);
      print(body);

      http.Response response = await http.get(url);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['success'] == true) {
        final List<dynamic> data = resp['data'];
        final List<StudyEvent> events =
            data.map((item) => StudyEvent.fromJson(item)).toList();
        studyEvents.value = events;
        morningHabitSlot.value.clear();
        afterNoonHabitSlot.value.clear();
        eveningNoonHabitSlot.value.clear();
        nightNoonHabitSlot.value.clear();
        for (int i = 0; i < studyEvents.value.length; i++) {
          if (studyEvents.value[i].shift == "Morning") {
            morningHabitSlot.value.add(studyEvents.value[i]);
          } else if (studyEvents.value[i].shift == "Afternoon") {
            afterNoonHabitSlot.value.add(studyEvents.value[i]);
          } else if (studyEvents.value[i].shift == "Evening") {
            eveningNoonHabitSlot.value.add(studyEvents.value[i]);
          } else {
            nightNoonHabitSlot.value.add(studyEvents.value[i]);
          }
        }

        print("GETSLOTSS22");
        print(morningHabitSlot.value.toString()+" "+morningHabitSlot.value.length.toString());
        print(afterNoonHabitSlot.value.toString()+" "+afterNoonHabitSlot.value.length.toString());
        print(eveningNoonHabitSlot.value.toString()+" "+eveningNoonHabitSlot.value.length.toString());
        print(nightNoonHabitSlot.value.toString()+" "+nightNoonHabitSlot.value.length.toString());

        // Get.snackbar("Success", "Habit request send successfully",
        //     backgroundColor: Colors.green.withOpacity(0.8),
        //     colorText: Colors.white,
        //     icon: Icon(
        //       Icons.check,
        //       color: Colors.white,
        //     ),
        //     snackPosition: SnackPosition.BOTTOM);
      }
      else
        {
          morningSlot.value = [];
          afterNoonSlot.value = [];
          eveningNoonSlot.value = [];
          nightNoonSlot.value = [];

        }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isHabituserList.value = false;
    }
  }
}
