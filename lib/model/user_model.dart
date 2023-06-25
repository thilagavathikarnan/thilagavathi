class UserModel {
  late final String email;
  late final String name;
  late final String lastName;
  final int verify;
  final String image;
  final int status;
  final DateTime updatedAt;
  final DateTime createdAt;
  late final int id;
  final String token;
  final String fullImage;

  UserModel({
    required this.email,
    required this.name,
    required this.lastName,
    required this.verify,
    required this.image,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.token,
    required this.fullImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      lastName: json['last_name'],
      verify: json['verify'],
      image: json['image'],
      status: json['status'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
      token: json['token'],
      fullImage: json['fullImage'],
    );
  }
}
