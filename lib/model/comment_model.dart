class CommentModel {
  int id;
  String userId;
  String taskId;
  String comments;
  String user_name;
  String createdAt;
  String updatedAt;

  CommentModel({
    required this.id,
    required this.userId,
    required this.taskId,
    required this.comments,
    required this.user_name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id']??"",
      userId: json['user_id']??"",
      taskId: json['task_id']??"",
      comments: json['comments']??"",
      user_name: json['user_name']??"",
      createdAt: json['created_at']??"",
      updatedAt: json['updated_at']??"",
    );
  }
}
