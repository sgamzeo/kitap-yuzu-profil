import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitap_yuzu_profil/feature/library/imported_pdfs_tab.dart';
import 'package:kitap_yuzu_profil/feature/library/widgets/add_button.dart';
import 'package:kitap_yuzu_profil/feature/library/widgets/import_banner.dart';
import 'package:kitap_yuzu_profil/feature/library/widgets/library_app_bar.dart';
import 'package:kitap_yuzu_profil/feature/library/widgets/library_content.dart';
import 'package:kitap_yuzu_profil/feature/library/widgets/library_filter_row.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/my_libray_controller.dart';

class MyLibraryView extends StatelessWidget {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyLibraryController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const LibraryAppBar(),
        body: Column(
          children: [
            const _LibraryTabBar(),

            Expanded(
              child: TabBarView(
                children: [
                  const _MyBooksTab(), // Kitaplarım
                  const ImportedPdfsTab(), // Listelerim
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const AddButton(),
      ),
    );
  }
}

class _LibraryTabBar extends StatelessWidget {
  const _LibraryTabBar();

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: 'Kitaplarım'),
        Tab(text: 'Listelerim'),
      ],
    );
  }
}

class _MyBooksTab extends StatelessWidget {
  const _MyBooksTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImportBanner(),
        LibraryFilterRow(),
        Expanded(child: LibraryContent()),
      ],
    );
  }
}
