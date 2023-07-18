class NotificationModel {
  final String isRead;
  final String image;
  final String sound;
  final String icon;
  final String title;
  final String body;
  final String type;
  final String androidChannelId;

  NotificationModel({
    required this.isRead,
    required this.image,
    required this.sound,
    required this.icon,
    required this.title,
    required this.body,
    required this.type,
    required this.androidChannelId,
  });
}
