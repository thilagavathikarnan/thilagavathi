class ProfileModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String? emailVerifiedAt;
  final String? phone;
  final String? phoneCode;
  final String verify;
  final String? otp;
  final String? dob;
  final String? gender;
  final String image;
  final String status;
  final String? doctorId;
  final String deviceToken;
  final String? language;
  final String? channelName;
  final String? agoraToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullImage;

  ProfileModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.phoneCode,
    required this.verify,
    required this.otp,
    required this.dob,
    required this.gender,
    required this.image,
    required this.status,
    required this.doctorId,
    required this.deviceToken,
    required this.language,
    required this.channelName,
    required this.agoraToken,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phone: json['phone'],
      phoneCode: json['phone_code'],
      verify: json['verify'],
      otp: json['otp'],
      dob: json['dob'],
      gender: json['gender'],
      image: json['image'],
      status: json['status'],
      doctorId: json['doctor_id'],
      deviceToken: json['device_token'],
      language: json['language'],
      channelName: json['channel_name'],
      agoraToken: json['agora_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      fullImage: json['fullImage'],
    );
  }
}
