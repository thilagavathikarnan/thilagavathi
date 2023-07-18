class AcoountCategoryModel {
  String id;
  String name;
  String createdAt;
  String updatedAt;

  AcoountCategoryModel({required this.id, required this.name, required this.createdAt, required this.updatedAt});

  factory AcoountCategoryModel.fromJson(Map<String, dynamic> json) {
    return AcoountCategoryModel(
      id: json['id']??"",
      name: json['name']??"",
      createdAt: json['created_at']??"",
      updatedAt: json['updated_at']??"",
    );
  }
}
