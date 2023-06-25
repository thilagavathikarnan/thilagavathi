class BannerModel {
  final int id;
  final String image;
  final String link;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String fullImage;

  BannerModel({
    required this.id,
    required this.image,
    required this.link,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fullImage,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      link: json['link'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      fullImage: json['fullImage'],
    );
  }
}
