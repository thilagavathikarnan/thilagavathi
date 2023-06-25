class StudyEvent {
  final int id;
  final String userId;
  final String name;
  final String date;
  final String durationFrom;
  final String durationTo;
  final String slotsType;
  final String slots;
  final String description;
  final String image;
  final String categoryId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullImage;
  final String shift;

  StudyEvent({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.durationFrom,
    required this.durationTo,
    required this.slotsType,
    required this.slots,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
    required this.shift,
  });

  factory StudyEvent.fromJson(Map<String, dynamic> json) {
    return StudyEvent(
      id: json['id']??"",
      userId: json['user_id']??"",
      name: json['name']??"",
      date: json['date']??"",
      durationFrom: json['duration_from']??"",
      durationTo: json['duration_to']??"",
      slotsType: json['slots_type']??"",
      slots: json['slots']??"",
      description: json['description']??"",
      image: json['image']??"",
      categoryId: json['category_id']??"",
      status: json['status']??"",
      createdAt: DateTime.parse(json['created_at']??""),
      updatedAt: DateTime.parse(json['updated_at']??""),
      fullImage: json['fullImage']??"",
      shift: json['shift']??"",
    );
  }
}
