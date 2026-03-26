import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/notifications/models/notification_model.dart';

class NotificationsController extends GetxController {
  final notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockNotifications();
  }

  void _loadMockNotifications() {
    notifications.value = [
      NotificationModel(
        id: '1',
        type: NotificationType.follower,
        title: '1 yeni takipçi',
        message: '@kerem_aktuerk seni takip etti',
        time: '5 dk önce',
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        type: NotificationType.follower,
        title: '1 yeni takipçi',
        message: '@sude_naz_reads seni takip etti',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '3',
        type: NotificationType.follower,
        title: '1 yeni takipçi',
        message: '@kafka_okuru_1915 seni takip etti',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '4',
        type: NotificationType.article,
        title: 'Yeni makale',
        message: 'Takip ettiğin @kullanici_1 "makale ismi" paylaştı',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '5',
        type: NotificationType.like,
        title: '423 Beğeni',
        message:
            'Metni berk_demir, selin_y ve 423 diğer kişi "Dijital Minimalizm: Telefondan Nasıl Kurtulrum?" makaleni beğendi',
        time: '5 dk önce',
        isRead: true,
        avatars: ['mock_avatar.png', 'mock_avatar.png'],
      ),
      NotificationModel(
        id: '6',
        type: NotificationType.save,
        title: '1 yeni kaydetme',
        message:
            'Dijital Minimalizm: Telefondan Nasıl Kurtulrum?" ayse_yilmaz kullanıcı bu makaleyi "Hafta Sonu Okumaları" listesine kaydetti.',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '7',
        type: NotificationType.save,
        title: '1 yeni kaydetme',
        message:
            'Dijital Minimalizm: Telefondan Nasıl Kurtulrum?" elif_design kullanıcı bu makaleyi "İlham Verenler" listesine kaydetti.',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '8',
        type: NotificationType.article,
        title: 'Yeni makale',
        message:
            'Takip ettiğin @gezgin_ruhlu "İstanbul\'un En İyi 10 Sahaf ve Gizli Rotalar" paylaştı',
        time: '5 dk önce',
        isRead: true,
      ),
      NotificationModel(
        id: '9',
        type: NotificationType.tag,
        title: 'Topluluk Etiketlenmesi',
        message:
            '"Topluluk Adı Polisiye Roman Severler" @arda_sen seni "Polisiye Romanlardan" topluluğunda bir gönderiye etiketledi: "@luna bu kitap tam senlik, Agatha Christie sevenler baylır!"',
        time: '5 dk önce',
        isRead: true,
      ),
    ];
  }

  void clearNotifications() {
    notifications.clear();
  }

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);
      notifications.refresh();
    }
  }
}
