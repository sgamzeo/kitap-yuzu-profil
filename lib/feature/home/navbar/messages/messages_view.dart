import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/messages/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mesajlar'));
  }
}
