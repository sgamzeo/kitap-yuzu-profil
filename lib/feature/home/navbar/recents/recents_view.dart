import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/recents/recents_controller.dart';

class RecentsView extends GetView<RecentsController> {
  const RecentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Son Okunanlar'));
  }
}
