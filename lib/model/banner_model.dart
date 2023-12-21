class BannerModel {
  final bool success;
  final List<DataItem> data;

  BannerModel({
    required this.success,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      success: json['success'],
      data: (json['data'] as List<dynamic>)
          .map((item) => DataItem.fromJson(item))
          .toList(),
    );
  }
}

class DataItem {
  final int id;
  final String image;
  final String link;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullImage;

  DataItem({
    required this.id,
    required this.image,
    required this.link,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'],
      image: json['image'],
      link: json['link'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      fullImage: json['fullImage'],
    );
  }
}
