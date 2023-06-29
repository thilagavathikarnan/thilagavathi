class TaskStatusModel {
  int assigned;
  int completed;
  int inProgress;
  int overDue;

  TaskStatusModel({
    required this.assigned,
    required this.completed,
    required this.inProgress,
    required this.overDue,
  });

  factory TaskStatusModel.fromJson(Map<String, dynamic> json) {
    return TaskStatusModel(
      assigned: json['assigned'],
      completed: json['completed'],
      inProgress: json['in_progress'],
      overDue: json['over_due'],
    );
  }
}
