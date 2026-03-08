import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/feed/feed_controller.dart';

class FeedView extends GetView<FeedController> {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ana Sayfa'));
  }
}
