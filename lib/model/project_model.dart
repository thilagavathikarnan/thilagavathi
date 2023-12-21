// project_model.dart
class ProjectModel {
  final int id;
  final int userId;
  final String projectName;
  final List<TeamMember> teamList;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  ProjectModel({
    required this.id,
    required this.userId,
    required this.projectName,
    required this.teamList,
    // required this.createdAt,
    // required this.updatedAt,
  });
}

class TeamMember {
  final int id;
  final String userId;
  final String user;
  final String name;
  final String designation;
  final String email;
  final String phone;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  TeamMember({
    required this.id,
    required this.userId,
    required this.user,
    required this.name,
    required this.designation,
    required this.email,
    required this.phone,
    // required this.createdAt,
    // required this.updatedAt,
  });
}
