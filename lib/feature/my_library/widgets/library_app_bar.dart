import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';

class LibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LibraryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Kitaplığım'),
      leading: const BackButton(),
      actions: [
        IconButton(
          icon: SvgPicture.asset(IconConstants.export),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(IconConstants.options),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
