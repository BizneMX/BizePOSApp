import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/auth/banner_repository.dart';
import 'package:bizne_fonda_app/app/models/auth/banner.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final BannerRepository repository;
  final bool fistLogin;

  BannerController({required this.repository, required this.fistLogin});

  RxList<BannerModel> banners = <BannerModel>[].obs;
  final step = 0.obs;
  final pageController = PageController();

  @override
  void onInit() {
    super.onInit();

    load();

    pageController.addListener(changePage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    pageController.removeListener(changePage);
    super.onClose();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getBanners();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    banners.value = response.data!;
  }

  void changePage() {
    if (pageController.page == null) return;
    if (pageController.page!.round() != step.value) {
      step.value = pageController.page!.toInt();
    }
  }

  void finish() {
    UserService.service.setShowBanner(false);
    if (fistLogin) {
      Get.offNamed(Routes.login);
    } else {
      Get.back();
    }
  }
}
