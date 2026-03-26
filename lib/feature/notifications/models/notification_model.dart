enum NotificationType { follower, article, like, save, tag }

class NotificationModel {
  final String id;
  final NotificationType type;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final List<String>? avatars;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    this.avatars,
  });

  NotificationModel copyWith({
    String? id,
    NotificationType? type,
    String? title,
    String? message,
    String? time,
    bool? isRead,
    List<String>? avatars,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
      avatars: avatars ?? this.avatars,
    );
  }
}
