import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/home_repository.dart';
import 'package:bizne_fonda_app/app/data/core/profile/profile_repository.dart';
import 'package:bizne_fonda_app/app/models/home/home.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends LayoutRouteController {
  final HomeRepository repository;
  final ProfileRepository profileRepository;

  HomeController({required this.repository, required this.profileRepository});

  Rx<Home> data = Home(
          userName: '',
          establishmentName: '',
          establishmentPic: '',
          establishmentStatus: 0,
          newOrders: 0,
          newBookings: 0,
          rating: 0)
      .obs;

  @override
  void onInit() {
    super.onInit();
    load();
    refreshToken();
  }

  void refreshToken() {
    repository.refreshToken();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getHome();
    final profileResponse = UserService.service.user == null
        ? await profileRepository.getProfile()
        : null;
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    data.value = response.data!;
    Get.find<LayoutController>().inService.value =
        response.data!.establishmentStatus == 1;

    if (profileResponse != null) {
      if (!profileResponse.success) {
        await Get.dialog(BizneResponseErrorDialog(response: profileResponse));
        return;
      }

      UserService.service.user = profileResponse.data!;
    }
  }
}
