import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/feature/home/home_binding.dart';
import 'package:kitap_yuzu_profil/feature/home/home_page.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_binding.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/bindings/pdf_reader_binding.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/bindings/quotation_binding.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/pages/pdf_reader_page.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/pages/quotation_page.dart';
import 'package:kitap_yuzu_profil/feature/onboarding/onboarding_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/forgot_password/forgot_password_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/reset_password/reset_password_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/sign_in/sign_in_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/sign_up/sign_up_view.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/profile_page.dart';
import 'package:kitap_yuzu_profil/feature/splash/splash_view.dart';

class AppPages {
  static String initial = AppRoutes.splash;

  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingView()),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
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
    GetPage(
      name: AppRoutes.addQquotation,
      page: () => const QuotationPage(),
      binding: QuotationBinding(),
    ),
    GetPage(
      name: AppRoutes.myLibrary,
      page: () => MyLibraryView(),
      binding: MyLibraryBinding(),
    ),
    GetPage(
      name: AppRoutes.pdfTextTest,
      page: () => const PdfReaderPage(),
      binding: PdfReaderBinding(),
    ),
  ];
}
