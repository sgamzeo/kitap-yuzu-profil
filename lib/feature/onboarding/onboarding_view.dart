import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_button.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      AssetConstants.onboardingWallpaper,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 84),
                      child: Text(
                        'Kitap Yüzü',
                        style: Theme.of(context).textTheme.osH1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signIn);
                      },
                      text: 'Giriş Yap',
                      textStyle: Theme.of(
                        context,
                      ).textTheme.osP.copyWith(color: AppColors.wireframe6),
                    ),
                  ),
                  SizedBox(height: AppDimens.m),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                      text: 'Kayıt Ol',
                      textStyle: Theme.of(context).textTheme.osP,
                      color: AppColors.transparent,
                    ),
                  ),
                  SizedBox(height: AppDimens.m),
                  CustomTextButton(
                    text: 'Misafir olarak Dene',
                    onPressed: () {
                      Get.offNamed(AppRoutes.home);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
