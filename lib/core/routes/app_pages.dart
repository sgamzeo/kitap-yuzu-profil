import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_binding.dart';
import 'package:kitap_yuzu_profil/feature/onboarding/onboarding_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/forgot_password/forgot_password_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/reset_password/reset_password_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/sign_in/sign_in_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/sign_in/sign_in_view_controller.dart';
import 'package:kitap_yuzu_profil/feature/auth/sign_up/sign_up_view.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/add_quotation_view.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_view.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader.page.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_binding.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_selector_page.dart';
import 'package:kitap_yuzu_profil/feature/splash/splash_view.dart';

class AppPages {
  static String initial = AppRoutes.splash;

  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),

    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingView()),

    GetPage(name: AppRoutes.signUp, page: () => const SignUpView()),

    GetPage(name: AppRoutes.signIn, page: () => const SignInView()),

    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(name: AppRoutes.pdfSelector, page: () => const PdfSelectorPage()),

    GetPage(
      name: AppRoutes.reader,
      page: () => const PdfReaderPage(),
      binding: PdfReaderBinding(),
    ),
    GetPage(name: AppRoutes.addQquotation, page: () => AddQuotationView()),
    GetPage(
      name: AppRoutes.myLibrary,
      page: () => MyLibraryView(),
      binding: MyLibraryBinding(),
    ),
  ];
}
