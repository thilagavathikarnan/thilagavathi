import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habittrackergad/controller/auth_controller.dart';
import 'package:habittrackergad/model/TaskNotifyModel.dart';
import 'package:habittrackergad/model/comment_model.dart';
import 'package:habittrackergad/model/project_model.dart';
import 'package:habittrackergad/model/task_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/Bottombar/Bottombarpage.dart';
import '../Components/Loginpage/Login.dart';
import '../constant/constant.dart';
import '../model/assign_model.dart';
import '../model/habit_model.dart';
import '../model/habits_model.dart';
import '../model/team_model.dart';
import '../model/user_habit_model.dart';
import '../model/user_model.dart';

class TeamController extends GetxController {
  GetSnackBar snackbarController = Get.put(GetSnackBar());
  RxList<TeamModel> teams = <TeamModel>[].obs;
  // TaskStatusModel? taskStatus;
  final myTaskList = <TaskModel>[].obs;
  final myNotifyTaskList = <TaskModel>[].obs;
  // RxList<TaskModel> myTaskList = <TaskModel>[].obs;
  var taskStatus = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;
  var taskStatusByU = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;
  var taskStatusNotify = TaskStatusModel(assigned: 0, completed: 0, inProgress: 0, overDue: 0).obs;
  final commentList = <CommentModel>[].obs;

  final notifyInprogress = <TaskModel>[].obs;
  final notifyCompleted = <TaskModel>[].obs;
  final notifyOverdue = <TaskModel>[].obs;
  final assignMyTaskAll = <TaskNotify>[].obs;

  final assignTaskInprogress = <TaskNotify>[].obs;
  final assignTaskCompleted = <TaskNotify>[].obs;
  final assignTaskOverDue = <TaskNotify>[].obs;

  final assignByTaskAll = <TaskModel>[].obs;
  final assignByTaskInprogress = <TaskModel>[].obs;
  final assignByTaskCompleted = <TaskModel>[].obs;
  final assignByTaskOverDue = <TaskModel>[].obs;

  RxString selectedItemstatus = "".obs;

  //projects
  TextEditingController projectName = TextEditingController();
  final selectTeamForProject = [].obs;
  final selectTeamForWholeProject = [].obs;
  var projects = <ProjectModel>[].obs;


  //Loaders
  final taskStatusLoader = false.obs;
  final isProjectSaveLoaders = false.obs;
  final isTeamSaveLoaders = false.obs;
  final isTeamLoaders = false.obs;
  final isLoaderProjectGet = false.obs;
  RxString selectProject = "".obs;
  RxString selectProjectName = "".obs;
  final selectTeamList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getTaskStatusToMe();
    getTaskStatusByU();
    fetchMyTasks();
    getTaskStatusNotify();
    getTeamList();
    fetchTasks();
    fetchNotifyTasks();
    fetchByTasks();
    getProjectList();
  }
  //  fetchTasks() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // var usId = await prefs.getString('userId');
  // try
  //     {
  //       http.Response response  = await http.get(Uri.parse(mainUrl+taskUserUrl+"?user_id=${usId}"));
  //       print("UserTASK");
  //       print(mainUrl+taskUserUrl+"/${usId}");
  //
  //       if (response.statusCode == 200)
  //       {
  //         final jsonData = json.decode(response.body);
  //         if(jsonData['data'].length == 0)
  //         {
  //           myTaskList.value = [];
  //         }
  //         else
  //         {
  //           final jsonData = json.decode(response.body);
  //           final tasks = (jsonData['data'] as List).map((taskData) => TaskModel.fromJson(taskData)).toList();
  //           myTaskList.value = tasks;
  //           print(myTaskList.value);
  //           print("-----------------");
  //         }
  //
  //       }
  //       else
  //       {
  //         throw Exception('Failed to fetch tasks');
  //       }
  //     }
  //     catch(e)
  //    {
  //      throw Exception(e.toString()+"kfkkflkk");
  //
  //    }
  //
  //
  // }
  void fetchComments(taskId) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
        var usId = await prefs.getString('userId');
 var url = Uri.parse(mainUrl+taskCommentGet+"/${usId}/${taskId}");
    try {
      http.Response response = await http.get(url);
      print("GETCOMMENTS");
      print(url);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        commentList.clear();
        List<dynamic> commentData  = parsedResponse['data'];
        List<CommentModel> comment = commentData .map((json) => CommentModel.fromJson(json)).toList();
        commentList.assignAll(comment);
        print("GETXCOMMENT");
        print(commentList);
      }
      else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
  void fetchNotifyTasks() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
        var usId = await prefs.getString('userId');
 var url = Uri.parse(mainUrl+taskUserNotifyUrl+"/${usId}");
    try {
      http.Response response = await http.get(url);
      print("GETTASKKNOTIFY");
      print(url);
      final parsedResponse = jsonDecode(response.body);
      print(parsedResponse['data']);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);

        List<dynamic> taskData = parsedResponse['data'];
        List<TaskModel> tasks = taskData.map((json) => TaskModel.fromJson(json)).toList();
        myNotifyTaskList.assignAll(tasks);
        notifyInprogress.clear();
        notifyCompleted.clear();
        notifyOverdue.clear();
        for(int i = 0; i<myNotifyTaskList.length; i++)
          {
            if(myNotifyTaskList[i].status == "in_progress")
              {
                notifyInprogress.add(myNotifyTaskList[i]);
              }
            else if(myNotifyTaskList[i].status  == "completed")
              {
                notifyCompleted.add(myNotifyTaskList[i]);

              }
            else if(myNotifyTaskList[i].status  == "over_due")
              {
                notifyOverdue.add(myNotifyTaskList[i]);
              }
          }
        print("GETXDESSIER");
        print(myNotifyTaskList);
      }
      else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
  void fetchMyTasks() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
        var usId = await prefs.getString('userId');
 var url = Uri.parse(mainUrl+taskByUrl+"/${usId}");
    try {
      http.Response response = await http.get(url);
      print("GETTASKKALL");
      print(url);
      final parsedResponse = jsonDecode(response.body);
      print(parsedResponse['data']);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);

        List<dynamic> taskData = parsedResponse['data'];
        List<TaskModel> tasks = taskData.map((json) => TaskModel.fromJson(json)).toList();
        assignByTaskAll.assignAll(tasks);
        assignByTaskInprogress.clear();
        assignByTaskCompleted.clear();
        assignByTaskOverDue.clear();
        for(int i = 0; i<assignByTaskAll.length; i++)
          {
            if(assignByTaskAll[i].status == "in_progress")
              {
                assignByTaskInprogress.add(assignByTaskAll[i]);
              }
            else if(assignByTaskAll[i].status  == "completed")
              {
                assignByTaskCompleted.add(assignByTaskAll[i]);

              }
            else if(assignByTaskAll[i].status  == "over_due")
              {
                assignByTaskOverDue.add(assignByTaskAll[i]);
              }
          }
        print("GETXDESSIERffff");
        print(assignByTaskAll);
      }
      else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
  void fetchByTasks() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
        var usId = await prefs.getString('userId');
 var url = Uri.parse(mainUrl+taskMyUrl+"?user_id=${usId}");
    try {
      http.Response response = await http.get(url);
      print("GETTASKKALLBy");
      print(url);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        List<dynamic> taskData = parsedResponse['data'];
        List<TaskNotify> tasks = taskData.map((json) => TaskNotify.fromJson(json)).toList();
        assignMyTaskAll.clear();
        assignMyTaskAll.assignAll(tasks);
        assignTaskInprogress.clear();
        assignTaskCompleted.clear();
        assignTaskOverDue.clear();
        for(int i = 0; i<assignMyTaskAll.length; i++)
          {
            if(assignMyTaskAll[i].status == "in_progress")
              {
                assignTaskInprogress.add(assignMyTaskAll[i]);
              }
            else if(assignMyTaskAll[i].status  == "completed")
              {
                assignTaskCompleted.add(assignMyTaskAll[i]);

              }
            else if(assignMyTaskAll[i].status  == "over_due")
              {
                assignTaskOverDue.add(assignMyTaskAll[i]);
              }
          }
        print("GETXDESSIER");
        print(assignMyTaskAll);
      }
      else
      {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e)
    {
      throw Exception('$e');
    }
  }
  void fetchTasks() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
        var usId = await prefs.getString('userId');
 var url = Uri.parse(mainUrl+taskUserUrl+"/${usId}");
    try {
      http.Response response = await http.get(url);
      print("GETTASKK");
      print(url);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);

        List<dynamic> taskData = parsedResponse['data'];
        List<TaskModel> tasks = taskData.map((json) => TaskModel.fromJson(json)).toList();
        myTaskList.assignAll(tasks);

        print("GETXDESSIER");
        print(myTaskList.length);
        print(myTaskList);
      }
      else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
  void taskUpdate(taskId,taskSatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    var body = {
    "task_id":taskId,
    "user_id":usId,
    "status":selectedItemstatus.value.toString()
    };
    var dataJs = jsonEncode(body);
    print("STATUSUPDATE");
    print(dataJs);
    try {
      taskStatusLoader.value = true;
      final response = await http.post(
        Uri.parse(mainUrl+taskUpdateUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: dataJs,
      );
      print(response.body);
      var res = json.decode(response.body);
      print("GETUPDATE");
      print(mainUrl+taskUpdateUrl);
      print(res);
      print(res['data']);
      if (res['data'] == true)
      {
        selectedItemstatus.value = '';
        Get.snackbar("Success", "Status changed successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);

        fetchNotifyTasks();
        fetchByTasks();
        fetchMyTasks();
        fetchTasks();
        getTaskStatusByU();
        getTaskStatusToMe();
        getTaskStatusNotify();
        getTeamList();
      }
      else
        {

          selectedItemstatus.value = '';
          Get.snackbar("Alert", "Already in same status",
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
              icon: Icon(
                Icons.warning,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.BOTTOM);


        }

    } catch (e) {
      // Handle network or other exceptions
      print('Error occurred: $e');
    }finally {
      taskStatusLoader.value = false;
    }
  }
  void teamAdd(name,designation, email,phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    var body = {
    "name":name,
    "designation":designation,
    "email":email,
    "phone":phone, "user_id": usId
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
  void commentAdd(comment,taskId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    var body = {
    "comments":comment,

    };
    var dataJs = json.encode(body);
    try {
      isTeamSaveLoaders.value = true;
      print("POSTAPI");
      var url = Uri.parse('https://habitseveryday.com/public/api/task-comments-post/${usId}/${taskId}');
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['status'] == 200 || resp['status'] == 201) {

        Get.snackbar("Success", "Comment successfully",
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
  void taskAdd(taskName, description,subTaskName,selectTeams,selectTeamsNotify,startDate,endDate,_selectedItempriority,_selectedItemstatus)
  async {
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
      "project_id":selectProject.isEmpty?"": int.parse(selectProject.toString()),
      "project_name":selectProjectName.isEmpty?"":selectProjectName.toString(),
    };
    var dataJs = json.encode(body);
    try {
      isTeamSaveLoaders.value = true;
      print("TaskSAVE");
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
        fetchNotifyTasks();
        fetchByTasks();
        fetchMyTasks();
        fetchTasks();
        getTaskStatusByU();
        getTaskStatusToMe();
        getTaskStatusNotify();
        getTeamList();
        Get.back();
        Get.snackbar("Success", "Task assigned successfully",
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
  void getTaskStatusByU() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    try {

      isTeamLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse('https://habitseveryday.com/api/assignedByYou-count/${usId}');
      // var url = Uri.parse('https://habitseveryday.com/api/assignedToYou-count/${usId}');
      print(url);
      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);

      // final dataList = parsedResponse['data'] as List<dynamic>;
      taskStatusByU.value = TaskStatusModel.fromJson(parsedResponse['data']);

      print("GEtVALUETASKSTATUS");
      print(taskStatus.value.assigned);
      print(taskStatus.value.completed.toString());
      print(taskStatus.value.inProgress.toString());
      print(taskStatus.value.overDue);

    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamLoaders.value = false;
    }
  }
  void getTaskStatusToMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    try {

      isTeamLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse('https://habitseveryday.com/api/assignedToYou-count/${usId}');
      // var url = Uri.parse('https://habitseveryday.com/api/assignedToYou-count/${usId}');
      print(url);
      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);

      // final dataList = parsedResponse['data'] as List<dynamic>;
      taskStatus.value = TaskStatusModel.fromJson(parsedResponse['data']);

      print("GEtVALUETASKSTATUS");
      print(taskStatus.value.assigned);
      print(taskStatus.value.completed.toString());
      print(taskStatus.value.inProgress.toString());
      print(taskStatus.value.overDue);

    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamLoaders.value = false;
    }
  }
  void getTaskStatusNotify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    try {

      isTeamLoaders.value = true;
      print("GETAPI");
      var url = Uri.parse('https://habitseveryday.com/api/notify-counts/${usId}');
      // var url = Uri.parse('https://habitseveryday.com/api/assignedToYou-count/${usId}');
      print(url);
      http.Response response = await http.get(url);
      print(response.statusCode);
      final parsedResponse = json.decode(response.body);
      print(parsedResponse);

      // final dataList = parsedResponse['data'] as List<dynamic>;
      taskStatusNotify.value = TaskStatusModel.fromJson(parsedResponse['data']);

      print("GEtVALUETASKSTATUS");
      print(taskStatus.value.assigned);
      print(taskStatus.value.completed.toString());
      print(taskStatus.value.inProgress.toString());
      print(taskStatus.value.overDue);

    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      isTeamLoaders.value = false;
    }
  }
  void getTeamList() async {
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
  void getProjectList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    try {

      isLoaderProjectGet.value = true;
      print("Get Project");
      var url = Uri.parse('${mainUrl}${getProjectUrl}/${usId}');
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

  void addProject(project_name)
 async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');

    var body = {
      "user_id": usId,
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
        getProjectList();
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
