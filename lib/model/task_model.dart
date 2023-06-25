class Task {
  final int id;
  final String userId;
  final String taskName;
  final String description;
  final String status;
  final String subTask;
  final String priority;
  final String assignId;
  final String notifyId;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String updatedAt;

  Task({
    required this.id,
    required this.userId,
    required this.taskName,
    required this.description,
    required this.status,
    required this.subTask,
    required this.priority,
    required this.assignId,
    required this.notifyId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      userId: json['user_id'],
      taskName: json['task_name'],
      description: json['description'],
      status: json['status'],
      subTask: json['sub_task'],
      priority: json['priority'],
      assignId: json['assign_id'],
      notifyId: json['notify_id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
