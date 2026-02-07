import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Padding(
        padding: AppDimens.defaultPagePadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetConstants.kitapYuzuLogo,
                height: AppDimens.splashLogoSize,
              ),
              SizedBox(height: 37), // TODO: not divisible by 8
              Text(
                'Kitap Yüzü',
                style: Theme.of(
                  context,
                ).textTheme.osH1.copyWith(color: AppColors.primary),
              ),
              SizedBox(height: AppDimens.m),
              Text(
                '''Okuduklarınla Sadece Sen Değil,
      Herkes Konuşsun''',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.osH6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(AppRoutes.onboarding);
    });
  }
}
