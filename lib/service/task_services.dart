// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:ht_re/model/team_model.dart';
// import 'package:ht_re/service/common_var.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
//
// class TaskServices
// {
//   Future teamAdd(name,designation, email,phone) async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // var usId = await prefs.getString('userId');
//
//     var body = {
//       "name":name,
//       "designation":designation,
//       "email":email,
//       "phone":phone, "user_id": "148"
//     };
//     var dataJs = json.encode(body);
//     try {
//       print("POSTAPI");
//       var url = Uri.parse('https://habitseveryday.com/public/api/teams-create');
//       print(url);
//       print(body);
//
//       http.Response response = await http.post(url,
//           headers: {
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: dataJs);
//       print(response.statusCode);
//       var resp = json.decode(response.body);
//       if (resp['success'] == true) {
//         Fluttertoast.showToast(
//           msg: 'Team add successfully',
//           textColor: Colors.white,
//           backgroundColor: Colors.green,
//         );
//
//       }
//       else
//       {
//         Fluttertoast.showToast(
//           msg: '${resp['message']}',
//           textColor: Colors.white,
//           backgroundColor: Colors.black.withOpacity(0.8),
//         );
//       }
//       print(resp);
//
//       return resp;
//     } catch (e) {
//       print("errror");
//       print("----------${e}");
//     }
//   }
//   Future getTeamList() async {
//     // var usId = await prefs.getString('userId');
//
//     try {
//
//       print("GETAPI");
//       var url = Uri.parse(
//           'https://habitseveryday.com/api/teams-get/148');
//       print(url);
//
//       http.Response response = await http.get(url);
//       print(response.statusCode);
//       final parsedResponse = json.decode(response.body);
//       print(parsedResponse);
//       final dataList = parsedResponse['data'] as List<dynamic>;
//       CommonVariable().teamList = dataList.map((teamData) => TeamModel.fromJson(teamData)).toList();
//
//       return CommonVariable().teamList;
//
//     } catch (e) {
//       print("errror");
//       print("----------${e}");
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ht_re/model/project_model.dart';
import 'package:ht_re/model/team_model.dart';
import 'package:ht_re/urls/all_urls.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';


class TeamController extends GetxController {
  GetSnackBar snackbarController = Get.put(GetSnackBar());
  RxList<TeamModel> teams = <TeamModel>[].obs;
  //Loaders
  final taskStatusLoader = false.obs;
  final isProjectSaveLoaders = false.obs;
  final isTeamSaveLoaders = false.obs;
  final isTeamLoaders = false.obs;
  final isLoaderProjectGet = false.obs;
  final selectTeamList = [].obs;
  final projects = <ProjectModel>[].obs;
  RxString selectProjectName = "".obs;
  TextEditingController projectName = TextEditingController();
  final selectTeamForProject = [].obs;
  final selectTeamForWholeProject = [].obs;
  RxString selectProject = "".obs;

  @override
  void onInit() {
    super.onInit();

    getTeamList();
    getProjectList();
  }

  void teamAdd(name,designation, email,phone) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var usId = await prefs.getString('userId');

    var body = {
      "name":name,
      "designation":designation,
      "email":email,
      "phone":phone,
      "user_id": "152"
      // "user_id": usId
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
        Get.snackbar("Success", "Team add successfully",
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
  void getTeamList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var usId = await prefs.getString('userId');

    try {

      isTeamLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse('https://habitseveryday.com/api/teams-get/152');
      print(url);

      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);
      teams.value.clear();
      final dataList = parsedResponse['data'] as List<dynamic>;
      final List<TeamModel> teamList = dataList.map((teamData) => TeamModel.fromJson(teamData)).toList();

      teams.value = teamList;


    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamLoaders.value = false;
    }
  }
  void getProjectList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var usId = await prefs.getString('userId');

    try {

      isLoaderProjectGet.value = true;
      print("Get Project");
      var url = Uri.parse('${mainUrl}${getProjectUrl}/152');
      print(url);

      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);
      final jsonData = json.decode(response.body);
      projects.value = List<ProjectModel>.from(
        jsonData["data"].map((x) => ProjectModel(
          id: x["id"]??"",
          userId: x["user_id"]??"",
          projectName: x["project_name"]??"",
          teamList: List<TeamMember>.from(
            x["team_list"].map((t) => TeamMember(
              id: t["id"]??"",
              userId: t["user_id"]??"",
              user: t["user"]??"",
              name: t["name"]??'',
              designation: t["designation"]??"",
              email: t["email"]??"",
              phone: t["phone"]??"",
              // createdAt: t["created_at"] == null?"": DateTime.parse(t["created_at"]),
              // updatedAt: DateTime.parse(t["updated_at"]),
            )),
          ),
          // createdAt: DateTime.parse(x["created_at"]),
          // updatedAt: DateTime.parse(x["updated_at"])
        )),
      );
      print("GETPROJECTS");
      print(projects.value);



    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isLoaderProjectGet.value = false;
    }
  }
  void addProject(project_name) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var usId = await prefs.getString('userId');

    var body = {
      "user_id": "152",
      "project_name":"${project_name}",
      "team_list":selectTeamForWholeProject
    };
    print("ADDPROJECTS");
    var url = Uri.parse('${mainUrl+addProjectUrl}');
    print(url);
    print(body);
    var dataJs = json.encode(body);
    try {
      isProjectSaveLoaders.value = true;
      print("ADDPROJECTS");
      var url = Uri.parse('${mainUrl+addProjectUrl}');
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['status'] == 200 || resp['status'] == 201)
      {
        projects.clear();
        // getProjectList();
        Get.back();
        Get.snackbar("Success", "Project save successfully",
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
      selectTeamForWholeProject.clear();
      projectName.clear();
      isProjectSaveLoaders.value = false;
    }
  }
}
