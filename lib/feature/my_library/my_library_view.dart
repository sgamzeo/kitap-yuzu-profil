import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_tab_bar.dart';
import 'package:kitap_yuzu_profil/feature/my_library/library_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_books_tab/my_books_tab.dart';
import 'package:kitap_yuzu_profil/feature/my_library/widgets/add_button.dart';
import 'package:kitap_yuzu_profil/feature/my_library/widgets/library_app_bar.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_lists_tab.dart/my_lists_tab.dart';

class MyLibraryView extends GetView<LibraryController> {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const LibraryAppBar(),
        body: Column(
          children: [
            const CustomTabBar(tabs: ['Kitaplarım', 'Listelerim']),
            Expanded(
              child: TabBarView(
                children: [const MyBooksTab(), const MyListsTab()],
              ),
            ),
          ],
        ),
        floatingActionButton: const AddButton(),
      ),
    );
  }
}
