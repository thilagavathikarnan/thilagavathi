import 'package:habittrackergad/model/task_model.dart';

class TaskNotify {
  int id;
  String userId;
  String taskName;
  String task_owner;
  String description;
  String status;
  String projectId;
  String projectName;
  String subTask;
  String priority;
  String assignId;
  String notifyId;
  String startDate;
  String endDate;
  String createdAt;
  String updatedAt;
  List<UserNameModel> userName;
  List<NotifyNameModel> notify_names;

  TaskNotify({
    required this.id,
    required this.userId,
    required this.taskName,
    required this.task_owner,
    required this.description,
    required this.status,
    required this.projectId,
    required this.projectName,
    required this.subTask,
    required this.priority,
    required this.assignId,
    required this.notifyId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.notify_names,
  });

  factory TaskNotify.fromJson(Map<String, dynamic> json) {
    return TaskNotify(
      id: json['id'],
      userId: json['user_id']??"",
      taskName: json['task_name']??"",
      task_owner: json['task_owner']??"",
      description: json['description']??"",
      status: json['status']??"",
      projectId: json['project_id']??"",
      projectName: json['project_name']??"",
      subTask: json['sub_task']??"",
      priority: json['priority']??"",
      assignId: json['assign_id']??"",
      notifyId: json['notify_id']??'',
      startDate: json['start_date']??"",
      endDate: json['end_date']??"",
      createdAt: json['created_at']??"",
      updatedAt: json['updated_at']??"",
      userName: List<UserNameModel>.from(
        json['user_name'].map((x) => UserNameModel.fromJson(x)),
      ),
      notify_names: List<NotifyNameModel>.from(
        json['notify_names'].map((x) => NotifyNameModel.fromJson(x)),
      ),
    );
  }
}
// class UserNameModel {
//   String firstName;
//   String lastName;
//
//   UserNameModel({required this.firstName, required this.lastName});
//
//   factory UserNameModel.fromJson(Map<String, dynamic> json) {
//     return UserNameModel(
//       firstName: json['first_name']??"",
//       lastName: json['last_name']??"",
//     );
//   }
// }
// class NotifyNameModel {
//   String firstName;
//   String lastName;
//
//   NotifyNameModel({required this.firstName, required this.lastName});
//
//   factory NotifyNameModel.fromJson(Map<String, dynamic> json) {
//     return NotifyNameModel(
//       firstName: json['first_name']??"",
//       lastName: json['last_name']??"",
//     );
//   }
// }
