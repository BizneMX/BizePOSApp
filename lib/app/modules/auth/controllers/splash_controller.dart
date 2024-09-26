// import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/auth/splash_repository.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
// import 'package:bizne_fonda_app/app/services/connectivity_service.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SplashRepository repository;

  SplashController({required this.repository});

  @override
  void onReady() {
    super.onReady();
    checkConnectivity();
  }

  void checkConnectivity() async {
    checkOnboarding();
    // if (!ConnectivityService.service.isOnline) {
    //   final connectionNotifier = ConnectivityService.service.connectivityStatus;
    //   connectionNotifier.addListener(() {
    //     if (ConnectivityService.service.isOnline) {
    //       connectionNotifier.removeListener(() {});
    //       checkOnboarding();
    //     }
    //   });
    //   Get.dialog(const NoConnectionDialog());
    // } else {
    //   checkOnboarding();
    // }
  }

  void checkOnboarding() {
    if (UserService.service.showBanner) {
      delaySplashView(() => Get.offNamed(Routes.banner, arguments: true));
    } else {
      checkToken();
    }
  }

  void checkToken() async {
    final token = UserService.service.token;

    if (token != null) {
      final response = await repository.validateToken(token);

      if (response.success) {
        UserService.service.login(response.data ?? token);
        delaySplashView(() => Get.offNamed(Routes.layout));
      } else {
        delaySplashView(() => Get.offNamed(Routes.login));
      }
    } else {
      delaySplashView(() => Get.offNamed(Routes.login));
    }
  }

  void delaySplashView(Function action) =>
      Future.delayed(const Duration(seconds: 2), () => action());
}
