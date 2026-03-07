import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottom;
  final bool showBack;

  const AuthScaffold({
    required this.child,
    this.bottom,
    this.showBack = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBack
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                iconSize: 30,
                onPressed: Get.back,
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: AppDimens.defaultPagePadding,
          child: Column(
            children: [
              Expanded(child: child),
              if (bottom != null) bottom!,
              SizedBox(height: AppDimens.l),
            ],
          ),
        ),
      ),
    );
  }
}
