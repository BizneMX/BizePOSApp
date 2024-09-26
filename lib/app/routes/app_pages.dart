import 'package:bizne_fonda_app/app/modules/auth/bindings/banner_binding.dart';
import 'package:bizne_fonda_app/app/modules/auth/bindings/complete_profile_binding.dart';
import 'package:bizne_fonda_app/app/modules/auth/bindings/login_binding.dart';
import 'package:bizne_fonda_app/app/modules/auth/bindings/recover_password_binding.dart';
import 'package:bizne_fonda_app/app/modules/auth/bindings/splash_binding.dart';
import 'package:bizne_fonda_app/app/modules/auth/views/banner_view.dart';
import 'package:bizne_fonda_app/app/modules/auth/views/login_view.dart';
import 'package:bizne_fonda_app/app/modules/auth/views/recover_password_view.dart';
import 'package:bizne_fonda_app/app/modules/auth/views/splash_view.dart';
import 'package:bizne_fonda_app/app/modules/auth/views/complete_profile_view.dart';
import 'package:bizne_fonda_app/app/modules/layout/bindings/layout_binding.dart';
import 'package:bizne_fonda_app/app/modules/layout/views/layout_view.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.splash;

  static final authRoutes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.banner,
      page: () => const BannerView(),
      binding: BannerBinding(),
    ),
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.recoverPassword,
        page: () => const RecoverPasswordView(),
        binding: RecoverPasswordBinding()),
    GetPage(
        name: Routes.completeProfile,
        page: () => const CompleteProfileView(),
        binding: CompleteProfileBinding())
  ];

  static final layoutRoutes = [
    GetPage(
        name: Routes.layout,
        page: () => const LayoutView(),
        binding: LayoutBinding()),
  ];

  static final routes = [...authRoutes, ...layoutRoutes];
}
