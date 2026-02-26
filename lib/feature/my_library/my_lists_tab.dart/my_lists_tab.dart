import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_lists_tab.dart/widgets/import_banner.dart';
import 'package:kitap_yuzu_profil/feature/my_library/widgets/library_content.dart';
import 'package:kitap_yuzu_profil/feature/my_library/widgets/library_filter_row.dart';

class MyListsTab extends StatelessWidget {
  const MyListsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimens.s),
        ImportBanner(),

        Padding(
          padding: AppDimens.defaultPagePadding,
          child: LibraryFilterRow(),
        ),
        Expanded(child: LibraryContent()),
      ],
    );
  }
}
