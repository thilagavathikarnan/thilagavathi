class TeamModel {
  final int id;
  final int userId;
  final String name;
  final String designation;
  final String email;
  final int user;
  final int phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  TeamModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.designation,
    required this.email,
    required this.user,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id']??"",
      userId: json['user_id']??"",
      name: json['name']??"",
      designation: json['designation']??"",
      email: json['email']??"",
      user: json['user']??"",
      phone: json['phone']??"",
      createdAt: DateTime.parse(json['created_at']??""),
      updatedAt: DateTime.parse(json['updated_at']??""),
    );
  }
}
