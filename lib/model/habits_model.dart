class Habits {
  final int id;
  final String name;
  final String date;
  final String? durationFrom;
  final String? durationTo;
  final String? slotsType;
  final String? slots;
  final String category;
  final String description;
  final String image;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullImage;

  Habits({
    required this.id,
    required this.name,
    required this.date,
    this.durationFrom,
    this.durationTo,
    this.slotsType,
    this.slots,
    required this.category,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
  });

  factory Habits.fromJson(Map<String, dynamic> json) {
    return Habits(
      id: json['id']??"",
      name: json['name']??"",
      date: json['date']??"",
      durationFrom: json['duration_from']??"",
      durationTo: json['duration_to']??"",
      slotsType: json['slots_type']??"",
      slots: json['slots']??"",
      category: json['category']??"",
      description: json['description']??"",
      image: json['image']??"",
      status: json['status']??"",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      fullImage: json['fullImage']??"",
    );
  }
}
