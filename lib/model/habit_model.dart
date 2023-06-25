class Habit {
  final int id;
  final String name;
  final String description;
  final String image;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullImage;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id']??"",
      name: json['name']??"",
      description: json['description']??"",
      image: json['image']??"",
      status: json['status']??"",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      fullImage: json['fullImage']??"",
    );
  }
}
