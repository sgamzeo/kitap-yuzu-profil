import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

import 'package:kitap_yuzu_profil/feature/my_library/my_books_tab/widgets/continue_reading_header.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_books_tab/widgets/library_grid_widget.dart';
import 'package:kitap_yuzu_profil/feature/my_library/widgets/library_filter_row.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/my_libray_controller.dart';

class MyBooksTab extends GetView<MyLibraryController> {
  const MyBooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ContinueReadingCard(),
            SizedBox(height: AppDimens.xl),
            LibraryFilterRow(),
            SizedBox(height: AppDimens.xl),
            LibraryGrid(),
          ],
        ),
      ),
    );
  }
}
