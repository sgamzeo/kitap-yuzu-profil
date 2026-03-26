import 'package:get/get.dart';

class MessagesController extends GetxController {
  final messages = <Map<String, dynamic>>[
    {
      'username': '@Kullanıcı adı',
      'message': 'Mesaj içeriği',
      'time': '10.56',
      'unreadCount': 3,
    },
    {
      'username': '@Kullanıcı adı',
      'message': 'Mesaj içeriği',
      'time': 'Dün',
      'unreadCount': 1,
    },
    {
      'username': '@Kullanıcı adı',
      'message': 'Mesaj içeriği',
      'time': 'Salı',
      'unreadCount': 5,
    },
  ].obs;
}
