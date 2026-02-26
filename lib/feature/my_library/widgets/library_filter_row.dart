import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_outlined_button.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class LibraryFilterRow extends StatelessWidget {
  const LibraryFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOutlinedButton(
          text: 'Sırala',
          icon: IconConstants.down,
          onPressed: () {},
        ),

        SizedBox(width: AppDimens.s),

        CustomOutlinedButton(
          text: 'Ara',
          icon: IconConstants.search,
          onPressed: () {},
        ),
      ],
    );
  }
}
